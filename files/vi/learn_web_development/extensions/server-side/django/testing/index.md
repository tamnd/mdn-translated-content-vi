---
title: "Django Tutorial Part 10: Testing a Django web application"
short-title: "10: Testing"
slug: Learn_web_development/Extensions/Server-side/Django/Testing
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Forms", "Learn_web_development/Extensions/Server-side/Django/Deployment", "Learn_web_development/Extensions/Server-side/Django")}}

Khi các trang web phát triển, chúng trở nên khó kiểm thử thủ công hơn. Không chỉ có nhiều thứ hơn để kiểm thử, mà khi các tương tác giữa các thành phần trở nên phức tạp hơn, một thay đổi nhỏ ở một khu vực có thể ảnh hưởng đến các khu vực khác, vì vậy sẽ cần nhiều thay đổi hơn để đảm bảo mọi thứ tiếp tục hoạt động và không có lỗi nào được đưa vào khi thực hiện nhiều thay đổi hơn. Một cách để giảm thiểu các vấn đề này là viết các kiểm thử tự động, có thể dễ dàng và đáng tin cậy chạy mỗi khi bạn thực hiện thay đổi. Hướng dẫn này trình bày cách tự động hóa _kiểm thử đơn vị_ trang web của bạn bằng cách sử dụng framework kiểm thử của Django.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hoàn thành tất cả các chủ đề hướng dẫn trước, bao gồm <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Forms">Django Tutorial Part 9: Working with forms</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Hiểu cách viết các kiểm thử đơn vị cho các trang web dựa trên Django.</td>
    </tr>
  </tbody>
</table>

## Tổng quan

[Local Library](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website) hiện có các trang để hiển thị danh sách tất cả sách và tác giả, các khung nhìn chi tiết cho các mục `Book` và `Author`, một trang để gia hạn các mục `BookInstance`, và các trang để tạo, cập nhật và xóa các mục `Author` (và các bản ghi `Book` nếu bạn đã hoàn thành _thách thức_ trong [hướng dẫn biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Forms)). Ngay cả với trang web tương đối nhỏ này, việc điều hướng thủ công đến từng trang và _kiểm tra bề mặt_ rằng mọi thứ hoạt động như mong đợi có thể mất vài phút. Khi chúng ta thực hiện các thay đổi và phát triển trang web, thời gian cần thiết để kiểm tra thủ công rằng mọi thứ hoạt động "đúng cách" sẽ chỉ tăng lên. Nếu chúng ta tiếp tục như chúng ta đang làm, cuối cùng chúng ta sẽ dành hầu hết thời gian để kiểm thử, và rất ít thời gian để cải thiện code.

Các kiểm thử tự động thực sự có thể giúp giải quyết vấn đề này! Những lợi ích rõ ràng là chúng có thể chạy nhanh hơn nhiều so với kiểm thử thủ công, có thể kiểm thử đến mức độ chi tiết thấp hơn nhiều, và kiểm thử chính xác cùng một chức năng mỗi lần (người kiểm thử con người không đáng tin cậy gần bằng!) Vì chúng nhanh, các kiểm thử tự động có thể được thực thi thường xuyên hơn, và nếu một kiểm thử thất bại, chúng chỉ ra chính xác nơi code không hoạt động như mong đợi.

Ngoài ra, các kiểm thử tự động có thể đóng vai trò là "người dùng" thực tế đầu tiên của code của bạn, buộc bạn phải nghiêm ngặt trong việc định nghĩa và ghi lại cách trang web của bạn nên hoạt động. Thường thì chúng là cơ sở cho các ví dụ code và tài liệu của bạn. Vì những lý do này, một số quy trình phát triển phần mềm bắt đầu bằng định nghĩa và triển khai kiểm thử, sau đó code được viết để khớp với hành vi yêu cầu (ví dụ: [phát triển hướng kiểm thử](https://en.wikipedia.org/wiki/Test-driven_development) và [phát triển hướng hành vi](https://en.wikipedia.org/wiki/Behavior-driven_development)).

Hướng dẫn này trình bày cách viết các kiểm thử tự động cho Django, bằng cách thêm một số kiểm thử vào trang web _LocalLibrary_.

### Các loại kiểm thử

Có nhiều loại, mức độ và phân loại kiểm thử và các cách tiếp cận kiểm thử. Các kiểm thử tự động quan trọng nhất là:

- Kiểm thử đơn vị
  - : Xác minh hành vi chức năng của các thành phần riêng lẻ, thường đến cấp độ lớp và hàm.
- Kiểm thử hồi quy
  - : Các kiểm thử tái tạo các lỗi lịch sử. Mỗi kiểm thử được chạy ban đầu để xác minh rằng lỗi đã được sửa, và sau đó chạy lại để đảm bảo rằng nó không được tái xuất hiện theo các thay đổi sau đó của code.
- Kiểm thử tích hợp
  - : Xác minh cách các nhóm thành phần hoạt động khi được sử dụng cùng nhau. Các kiểm thử tích hợp nhận thức được các tương tác cần thiết giữa các thành phần, nhưng không nhất thiết phải biết về các hoạt động nội bộ của từng thành phần. Chúng có thể bao gồm các nhóm đơn giản của các thành phần thông qua toàn bộ trang web.

> [!NOTE]
> Các loại kiểm thử phổ biến khác bao gồm kiểm thử hộp đen, hộp trắng, thủ công, tự động, canary, khói, tuân thủ, chấp nhận, chức năng, hệ thống, hiệu suất, tải và căng thẳng. Hãy tra cứu chúng để biết thêm thông tin.

### Django cung cấp những gì cho kiểm thử?

Kiểm thử một trang web là một tác vụ phức tạp, vì nó được tạo thành từ nhiều lớp logic — từ xử lý yêu cầu cấp HTTP, đến các truy vấn mô hình, đến xác thực và xử lý biểu mẫu, và hiển thị mẫu.

Django cung cấp một framework kiểm thử với một hệ thống phân cấp nhỏ của các lớp được xây dựng trên thư viện Python tiêu chuẩn [`unittest`](https://docs.python.org/3/library/unittest.html#module-unittest). Bất chấp cái tên, framework kiểm thử này phù hợp cho cả kiểm thử đơn vị và tích hợp. Framework Django thêm các phương thức API và công cụ để giúp kiểm thử hành vi web và Django cụ thể. Chúng cho phép bạn mô phỏng các yêu cầu, chèn dữ liệu kiểm thử và kiểm tra đầu ra của ứng dụng của bạn. Django cũng cung cấp API ([LiveServerTestCase](https://docs.djangoproject.com/en/5.0/topics/testing/tools/#liveservertestcase)) và công cụ để [sử dụng các framework kiểm thử khác nhau](https://docs.djangoproject.com/en/5.0/topics/testing/advanced/#other-testing-frameworks), ví dụ bạn có thể tích hợp với framework [Selenium](/en-US/docs/Learn_web_development/Extensions/Testing/Your_own_automation_environment) phổ biến để mô phỏng người dùng tương tác với trình duyệt thực.

Để viết một kiểm thử, bạn kế thừa từ bất kỳ lớp cơ sở kiểm thử Django (hoặc _unittest_) nào ([SimpleTestCase](https://docs.djangoproject.com/en/5.0/topics/testing/tools/#simpletestcase), [TransactionTestCase](https://docs.djangoproject.com/en/5.0/topics/testing/tools/#transactiontestcase), [TestCase](https://docs.djangoproject.com/en/5.0/topics/testing/tools/#testcase), [LiveServerTestCase](https://docs.djangoproject.com/en/5.0/topics/testing/tools/#liveservertestcase)) và sau đó viết các phương thức riêng biệt để kiểm tra rằng chức năng cụ thể hoạt động như mong đợi (các kiểm thử sử dụng các phương thức "assert" để kiểm thử rằng các biểu thức dẫn đến các giá trị `True` hoặc `False`, hoặc hai giá trị bằng nhau, v.v.) Khi bạn bắt đầu chạy kiểm thử, framework thực thi các phương thức kiểm thử đã chọn trong các lớp kế thừa của bạn. Các phương thức kiểm thử được chạy độc lập, với hành vi thiết lập và/hoặc dọn dẹp chung được định nghĩa trong lớp, như được hiển thị bên dưới.

```python
class YourTestClass(TestCase):
    def setUp(self):
        # Setup run before every test method.
        pass

    def tearDown(self):
        # Clean up run after every test method.
        pass

    def test_something_that_will_pass(self):
        self.assertFalse(False)

    def test_something_that_will_fail(self):
        self.assertTrue(False)
```

Lớp cơ sở tốt nhất cho hầu hết các kiểm thử là [django.test.TestCase](https://docs.djangoproject.com/en/5.0/topics/testing/tools/#testcase). Lớp kiểm thử này tạo một cơ sở dữ liệu sạch trước khi kiểm thử của nó được chạy, và chạy mỗi hàm kiểm thử trong giao dịch của riêng nó. Lớp cũng sở hữu một máy khách kiểm thử [Client](https://docs.djangoproject.com/en/5.0/topics/testing/tools/#django.test.Client) mà bạn có thể sử dụng để mô phỏng người dùng tương tác với code ở cấp độ khung nhìn. Trong các phần sau, chúng ta sẽ tập trung vào các kiểm thử đơn vị, được tạo bằng cách sử dụng lớp cơ sở [TestCase](https://docs.djangoproject.com/en/5.0/topics/testing/tools/#testcase) này.

> [!NOTE]
> Lớp [django.test.TestCase](https://docs.djangoproject.com/en/5.0/topics/testing/tools/#testcase) rất thuận tiện, nhưng có thể dẫn đến một số kiểm thử chậm hơn mức cần thiết (không phải mọi kiểm thử đều cần thiết lập cơ sở dữ liệu của riêng nó hoặc mô phỏng tương tác khung nhìn). Khi bạn đã quen với những gì bạn có thể làm với lớp này, bạn có thể muốn thay thế một số kiểm thử của mình bằng các lớp kiểm thử đơn giản hơn có sẵn.

### Bạn nên kiểm thử những gì?

Bạn nên kiểm thử tất cả các khía cạnh của code của riêng mình, nhưng không phải bất kỳ thư viện hoặc chức năng nào được cung cấp như một phần của Python hoặc Django.

Vì vậy, ví dụ, hãy xem xét mô hình `Author` được định nghĩa bên dưới. Bạn không cần kiểm thử rõ ràng rằng `first_name` và `last_name` đã được lưu trữ đúng cách như `CharField` trong cơ sở dữ liệu vì đó là điều được định nghĩa bởi Django (mặc dù tất nhiên trong thực tế bạn sẽ không thể tránh kiểm thử chức năng này trong quá trình phát triển). Bạn cũng không cần kiểm thử rằng `date_of_birth` đã được xác thực là trường ngày, vì đó lại là điều được triển khai trong Django.

Tuy nhiên, bạn nên kiểm tra văn bản được sử dụng cho nhãn (_First name, Last name, Date of birth, Died_), và kích thước của trường được phân bổ cho văn bản (_100 ký tự_), vì đây là một phần thiết kế của bạn và có thể bị phá vỡ/thay đổi trong tương lai.

```python
class Author(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    date_of_birth = models.DateField(null=True, blank=True)
    date_of_death = models.DateField('Died', null=True, blank=True)

    def get_absolute_url(self):
        return reverse('author-detail', args=[str(self.id)])

    def __str__(self):
        return '%s, %s' % (self.last_name, self.first_name)
```

Tương tự, bạn nên kiểm tra rằng các phương thức tùy chỉnh `get_absolute_url()` và `__str__()` hoạt động như yêu cầu vì đây là code/logic kinh doanh của bạn. Trong trường hợp `get_absolute_url()`, bạn có thể tin tưởng rằng phương thức `reverse()` của Django đã được triển khai đúng cách, vì vậy những gì bạn đang kiểm thử là khung nhìn liên quan đã thực sự được định nghĩa.

> [!NOTE]
> Những người đọc tinh tế có thể nhận ra rằng chúng ta cũng muốn giới hạn ngày sinh và tử với các giá trị hợp lý, và kiểm tra rằng cái chết đến sau khi sinh.
> Trong Django, ràng buộc này sẽ được thêm vào các lớp biểu mẫu của bạn (mặc dù bạn có thể định nghĩa trình xác thực cho các trường mô hình và trình xác thực mô hình, chúng chỉ được sử dụng ở cấp độ biểu mẫu nếu chúng được gọi bởi phương thức `clean()` của mô hình. Điều này yêu cầu một `ModelForm`, hoặc phương thức `clean()` của mô hình cần được gọi cụ thể.)

Với điều đó trong tâm trí, hãy bắt đầu xem xét cách định nghĩa và chạy các kiểm thử.

## Tổng quan về cấu trúc kiểm thử

Trước khi đi vào chi tiết "cần kiểm thử gì", trước tiên hãy xem ngắn gọn về _nơi_ và _cách_ các kiểm thử được định nghĩa.

Django sử dụng [khám phá kiểm thử tích hợp](https://docs.python.org/3/library/unittest.html#unittest-test-discovery) của mô-đun unittest, sẽ khám phá các kiểm thử trong thư mục làm việc hiện tại trong bất kỳ tệp nào được đặt tên với mẫu **test\*.py**. Miễn là bạn đặt tên tệp phù hợp, bạn có thể sử dụng bất kỳ cấu trúc nào bạn muốn. Chúng tôi khuyến nghị bạn tạo một mô-đun cho code kiểm thử của mình, và có các tệp riêng biệt cho các mô hình, khung nhìn, biểu mẫu và bất kỳ loại code nào khác bạn cần kiểm thử. Ví dụ:

```plain
catalog/
  /tests/
    __init__.py
    test_models.py
    test_forms.py
    test_views.py
```

Tạo cấu trúc tệp như được hiển thị ở trên trong dự án _LocalLibrary_ của bạn. **\_\_init\_\_.py** nên là một tệp trống (điều này cho Python biết rằng thư mục là một gói). Bạn có thể tạo ba tệp kiểm thử bằng cách sao chép và đổi tên tệp kiểm thử khung **/catalog/tests.py**.

> [!NOTE]
> Tệp kiểm thử khung **/catalog/tests.py** được tạo tự động khi chúng ta [xây dựng trang web khung Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/skeleton_website). Hoàn toàn "hợp pháp" để đặt tất cả các kiểm thử của bạn bên trong đó, nhưng nếu bạn kiểm thử đúng cách, bạn sẽ nhanh chóng kết thúc với một tệp kiểm thử rất lớn và không thể quản lý.
>
> Xóa tệp khung vì chúng ta sẽ không cần đến nó.

Mở **/catalog/tests/test_models.py**. Tệp nên import `django.test.TestCase`, như được hiển thị:

```python
from django.test import TestCase

# Create your tests here.
```

Thường thì bạn sẽ thêm một lớp kiểm thử cho mỗi mô hình/khung nhìn/biểu mẫu bạn muốn kiểm thử, với các phương thức riêng lẻ để kiểm thử chức năng cụ thể. Trong các trường hợp khác, bạn có thể muốn có một lớp riêng biệt để kiểm thử một trường hợp sử dụng cụ thể, với các hàm kiểm thử riêng lẻ kiểm thử các khía cạnh của trường hợp sử dụng đó (ví dụ: một lớp để kiểm thử rằng một trường mô hình được xác thực đúng cách, với các hàm để kiểm thử từng trường hợp thất bại có thể). Một lần nữa, cấu trúc phụ thuộc nhiều vào bạn, nhưng tốt nhất là nếu bạn nhất quán.

Thêm lớp kiểm thử bên dưới vào cuối tệp. Lớp minh họa cách xây dựng một lớp kiểm thử bằng cách kế thừa từ `TestCase`.

```python
class YourTestClass(TestCase):
    @classmethod
    def setUpTestData(cls):
        print("setUpTestData: Run once to set up non-modified data for all class methods.")
        pass

    def setUp(self):
        print("setUp: Run once for every test method to set up clean data.")
        pass

    def test_false_is_false(self):
        print("Method: test_false_is_false.")
        self.assertFalse(False)

    def test_false_is_true(self):
        print("Method: test_false_is_true.")
        self.assertTrue(False)

    def test_one_plus_one_equals_two(self):
        print("Method: test_one_plus_one_equals_two.")
        self.assertEqual(1 + 1, 2)
```

Lớp mới định nghĩa hai phương thức mà bạn có thể sử dụng để cấu hình trước kiểm thử (ví dụ: để tạo bất kỳ mô hình hoặc đối tượng nào khác mà bạn sẽ cần cho kiểm thử):

- `setUpTestData()` được gọi một lần ở đầu chạy kiểm thử để thiết lập cấp độ lớp. Bạn sẽ sử dụng điều này để tạo các đối tượng sẽ không bị sửa đổi hoặc thay đổi trong bất kỳ phương thức kiểm thử nào.
- `setUp()` được gọi trước mỗi hàm kiểm thử để thiết lập bất kỳ đối tượng nào có thể bị sửa đổi bởi kiểm thử (mỗi hàm kiểm thử sẽ nhận được phiên bản "mới" của các đối tượng này).

> [!NOTE]
> Các lớp kiểm thử cũng có phương thức `tearDown()` mà chúng ta chưa sử dụng. Phương thức này không đặc biệt hữu ích cho các kiểm thử cơ sở dữ liệu, vì lớp cơ sở `TestCase` đảm nhận việc dọn dẹp cơ sở dữ liệu cho bạn.

Bên dưới những thứ đó, chúng ta có một số phương thức kiểm thử, sử dụng các hàm `Assert` để kiểm thử xem các điều kiện có đúng, sai hoặc bằng nhau không (`AssertTrue`, `AssertFalse`, `AssertEqual`). Nếu điều kiện không đánh giá như mong đợi thì kiểm thử sẽ thất bại và báo cáo lỗi cho bảng điều khiển.

`AssertTrue`, `AssertFalse`, `AssertEqual` là các assertion tiêu chuẩn được cung cấp bởi **unittest**. Có các assertion tiêu chuẩn khác trong framework, và cũng [các assertion dành riêng cho Django](https://docs.djangoproject.com/en/5.0/topics/testing/tools/#assertions) để kiểm thử xem một khung nhìn có chuyển hướng không (`assertRedirects`), để kiểm thử xem một mẫu cụ thể có được sử dụng không (`assertTemplateUsed`), v.v.

> [!NOTE]
> Bạn thường **không** nên bao gồm các hàm **print()** trong các kiểm thử như được hiển thị ở trên. Chúng ta làm điều đó ở đây chỉ để bạn có thể thấy thứ tự mà các hàm thiết lập được gọi trong bảng điều khiển (trong phần sau).

## Cách chạy các kiểm thử

Cách dễ nhất để chạy tất cả các kiểm thử là sử dụng lệnh:

```bash
python3 manage.py test
```

Điều này sẽ khám phá tất cả các tệp được đặt tên với mẫu **test\*.py** trong thư mục hiện tại và chạy tất cả các kiểm thử được định nghĩa bằng cách sử dụng các lớp cơ sở thích hợp (ở đây chúng ta có một số tệp kiểm thử, nhưng chỉ **/catalog/tests/test_models.py** hiện tại chứa bất kỳ kiểm thử nào.) Theo mặc định các kiểm thử sẽ chỉ báo cáo riêng lẻ về các thất bại kiểm thử, theo sau là tóm tắt kiểm thử.

> [!NOTE]
> Nếu bạn gặp lỗi tương tự như: `ValueError: Missing staticfiles manifest entry...` điều này có thể là vì kiểm thử không chạy _collectstatic_ theo mặc định, và ứng dụng của bạn đang sử dụng lớp lưu trữ yêu cầu điều đó (xem [manifest_strict](https://docs.djangoproject.com/en/5.0/ref/contrib/staticfiles/#django.contrib.staticfiles.storage.ManifestStaticFilesStorage.manifest_strict) để biết thêm thông tin). Có một số cách bạn có thể khắc phục vấn đề này - cách dễ nhất là chạy _collectstatic_ trước khi chạy các kiểm thử:
>
> ```bash
> python3 manage.py collectstatic
> ```

Chạy các kiểm thử trong thư mục gốc của _LocalLibrary_. Bạn sẽ thấy đầu ra như dưới đây.

```bash
> python3 manage.py test

Creating test database for alias 'default'...
setUpTestData: Run once to set up non-modified data for all class methods.
setUp: Run once for every test method to set up clean data.
Method: test_false_is_false.
setUp: Run once for every test method to set up clean data.
Method: test_false_is_true.
setUp: Run once for every test method to set up clean data.
Method: test_one_plus_one_equals_two.
.
======================================================================
FAIL: test_false_is_true (catalog.tests.tests_models.YourTestClass)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "D:\GitHub\django_tmp\library_w_t_2\locallibrary\catalog\tests\tests_models.py", line 22, in test_false_is_true
    self.assertTrue(False)
AssertionError: False is not true

----------------------------------------------------------------------
Ran 3 tests in 0.075s

FAILED (failures=1)
Destroying test database for alias 'default'...
```

Ở đây, chúng ta thấy rằng chúng ta có một kiểm thử thất bại, và chúng ta có thể thấy chính xác hàm nào thất bại và tại sao (thất bại này được mong đợi, vì `False` không phải là `True`!).

> [!NOTE]
> Điều quan trọng nhất để học từ đầu ra kiểm thử ở trên là nó có giá trị hơn nhiều nếu bạn sử dụng tên mô tả/thông tin cho các đối tượng và phương thức của bạn.

Đầu ra của các hàm `print()` cho thấy cách phương thức `setUpTestData()` được gọi một lần cho lớp và `setUp()` được gọi trước mỗi phương thức.
Một lần nữa, hãy nhớ rằng thông thường bạn sẽ không thêm loại `print()` này vào các kiểm thử của mình.

Các phần tiếp theo cho thấy cách bạn có thể chạy các kiểm thử cụ thể, và cách kiểm soát lượng thông tin mà các kiểm thử hiển thị.

### Hiển thị thêm thông tin kiểm thử

Nếu bạn muốn nhận thêm thông tin về lần chạy kiểm thử, bạn có thể thay đổi _verbosity_ (mức độ chi tiết). Ví dụ, để liệt kê các thành công kiểm thử cũng như thất bại (và toàn bộ thông tin về cách cơ sở dữ liệu kiểm thử được thiết lập), bạn có thể đặt verbosity thành "2" như được hiển thị:

```bash
python3 manage.py test --verbosity 2
```

Các mức verbosity được phép là 0, 1, 2 và 3, với mặc định là "1".

### Tăng tốc độ

Nếu các kiểm thử của bạn độc lập, trên máy đa xử lý bạn có thể tăng tốc chúng đáng kể bằng cách chạy song song.
Việc sử dụng `--parallel auto` bên dưới chạy một tiến trình kiểm thử cho mỗi lõi có sẵn.
`auto` là tùy chọn, và bạn cũng có thể chỉ định một số lõi cụ thể để sử dụng.

```bash
python3 manage.py test --parallel auto
```

Để biết thêm thông tin, bao gồm những gì cần làm nếu các kiểm thử của bạn không độc lập, xem [DJANGO_TEST_PROCESSES](https://docs.djangoproject.com/en/5.0/ref/django-admin/#envvar-DJANGO_TEST_PROCESSES).

### Chạy các kiểm thử cụ thể

Nếu bạn muốn chạy một tập hợp con các kiểm thử, bạn có thể làm như vậy bằng cách chỉ định đường dẫn dấu chấm đầy đủ đến gói, mô-đun, lớp con `TestCase` hoặc phương thức:

```bash
# Run the specified module
python3 manage.py test catalog.tests

# Run the specified module
python3 manage.py test catalog.tests.test_models

# Run the specified class
python3 manage.py test catalog.tests.test_models.YourTestClass

# Run the specified method
python3 manage.py test catalog.tests.test_models.YourTestClass.test_one_plus_one_equals_two
```

### Các tùy chọn trình chạy kiểm thử khác

Trình chạy kiểm thử cung cấp nhiều tùy chọn khác, bao gồm khả năng xáo trộn kiểm thử (`--shuffle`), chạy chúng ở chế độ gỡ lỗi (`--debug-mode`), và sử dụng Python logger để nắm bắt kết quả.
Để biết thêm thông tin, xem tài liệu [test runner](https://docs.djangoproject.com/en/5.0/ref/django-admin/#test) của Django.

## Các kiểm thử LocalLibrary

Bây giờ chúng ta biết cách chạy các kiểm thử và những loại thứ chúng ta cần kiểm thử, hãy xem xét một số ví dụ thực tế.

> [!NOTE]
> Chúng ta sẽ không viết mọi kiểm thử có thể, nhưng điều này sẽ cho bạn ý tưởng về cách các kiểm thử hoạt động và những gì nữa bạn có thể làm.

### Mô hình

Như đã thảo luận ở trên, chúng ta nên kiểm thử bất kỳ điều gì là một phần thiết kế của chúng ta hoặc được định nghĩa bởi code mà chúng ta đã viết, nhưng không phải thư viện/code đã được kiểm thử bởi Django hoặc nhóm phát triển Python.

Ví dụ, hãy xem xét mô hình `Author` bên dưới. Ở đây chúng ta nên kiểm thử nhãn cho tất cả các trường, vì mặc dù chúng ta chưa chỉ định rõ ràng hầu hết trong số chúng, chúng ta có một thiết kế nói về những giá trị này nên là gì. Nếu chúng ta không kiểm thử các giá trị, thì chúng ta không biết rằng nhãn trường có các giá trị dự kiến. Tương tự trong khi chúng ta tin tưởng Django sẽ tạo một trường có độ dài chỉ định, đáng để chỉ định một kiểm thử cho độ dài này để đảm bảo rằng nó được triển khai như được lên kế hoạch.

```python
class Author(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    date_of_birth = models.DateField(null=True, blank=True)
    date_of_death = models.DateField('Died', null=True, blank=True)

    def get_absolute_url(self):
        return reverse('author-detail', args=[str(self.id)])

    def __str__(self):
        return f'{self.last_name}, {self.first_name}'
```

Mở **/catalog/tests/test_models.py** của chúng ta, và thay thế bất kỳ code hiện có nào bằng code kiểm thử sau cho mô hình `Author`.

Ở đây bạn sẽ thấy rằng đầu tiên chúng ta import `TestCase` và kế thừa lớp kiểm thử của chúng ta (`AuthorModelTest`) từ đó, sử dụng tên mô tả để chúng ta có thể dễ dàng xác định bất kỳ kiểm thử nào thất bại trong đầu ra kiểm thử. Sau đó chúng ta gọi `setUpTestData()` để tạo một đối tượng tác giả mà chúng ta sẽ sử dụng nhưng không sửa đổi trong bất kỳ kiểm thử nào.

```python
from django.test import TestCase

from catalog.models import Author

class AuthorModelTest(TestCase):
    @classmethod
    def setUpTestData(cls):
        # Set up non-modified objects used by all test methods
        Author.objects.create(first_name='Big', last_name='Bob')

    def test_first_name_label(self):
        author = Author.objects.get(id=1)
        field_label = author._meta.get_field('first_name').verbose_name
        self.assertEqual(field_label, 'first name')

    def test_date_of_death_label(self):
        author = Author.objects.get(id=1)
        field_label = author._meta.get_field('date_of_death').verbose_name
        self.assertEqual(field_label, 'died')

    def test_first_name_max_length(self):
        author = Author.objects.get(id=1)
        max_length = author._meta.get_field('first_name').max_length
        self.assertEqual(max_length, 100)

    def test_object_name_is_last_name_comma_first_name(self):
        author = Author.objects.get(id=1)
        expected_object_name = f'{author.last_name}, {author.first_name}'
        self.assertEqual(str(author), expected_object_name)

    def test_get_absolute_url(self):
        author = Author.objects.get(id=1)
        # This will also fail if the URLConf is not defined.
        self.assertEqual(author.get_absolute_url(), '/catalog/author/1')
```

Các kiểm thử trường kiểm tra xem các giá trị nhãn trường (`verbose_name`) và kích thước của các trường ký tự có như mong đợi không. Tất cả các phương thức này đều có tên mô tả và tuân theo cùng một mẫu:

```python
# Get an author object to test
author = Author.objects.get(id=1)

# Get the metadata for the required field and use it to query the required field data
field_label = author._meta.get_field('first_name').verbose_name

# Compare the value to the expected result
self.assertEqual(field_label, 'first name')
```

Những điều thú vị cần lưu ý là:

- Chúng ta không thể lấy `verbose_name` trực tiếp bằng cách sử dụng `author.first_name.verbose_name`, vì `author.first_name` là một _chuỗi_ (không phải là handle đến đối tượng `first_name` mà chúng ta có thể sử dụng để truy cập thuộc tính của nó). Thay vào đó, chúng ta cần sử dụng thuộc tính `_meta` của tác giả để lấy một thể hiện của trường và sử dụng nó để truy vấn thông tin bổ sung.
- Chúng ta chọn sử dụng `assertEqual(field_label,'first name')` thay vì `assertTrue(field_label == 'first name')`. Lý do là nếu kiểm thử thất bại, đầu ra cho phần trước sẽ cho bạn biết nhãn thực sự là gì, điều này làm cho việc gỡ lỗi vấn đề dễ dàng hơn một chút.

> [!NOTE]
> Các kiểm thử cho nhãn `last_name` và `date_of_birth`, và cũng kiểm thử độ dài của trường `last_name` đã bị bỏ qua. Thêm các phiên bản của riêng bạn bây giờ, tuân theo các quy ước đặt tên và cách tiếp cận được hiển thị ở trên.

Chúng ta cũng cần kiểm thử các phương thức tùy chỉnh của mình. Về cơ bản chúng chỉ kiểm tra rằng tên đối tượng được xây dựng như chúng ta mong đợi sử dụng định dạng "Last Name", "First Name", và rằng URL chúng ta nhận được cho một mục `Author` là như chúng ta mong đợi.

```python
def test_object_name_is_last_name_comma_first_name(self):
    author = Author.objects.get(id=1)
    expected_object_name = f'{author.last_name}, {author.first_name}'
    self.assertEqual(str(author), expected_object_name)

def test_get_absolute_url(self):
    author = Author.objects.get(id=1)
    # This will also fail if the URLConf is not defined.
    self.assertEqual(author.get_absolute_url(), '/catalog/author/1')
```

Chạy các kiểm thử ngay bây giờ. Nếu bạn đã tạo mô hình Author như chúng ta mô tả trong hướng dẫn mô hình, rất có thể bạn sẽ nhận được lỗi cho nhãn `date_of_death` như được hiển thị bên dưới. Kiểm thử đang thất bại vì nó được viết với mong đợi định nghĩa nhãn tuân theo quy ước Django không viết hoa chữ cái đầu tiên của nhãn (Django làm điều này cho bạn).

```bash
======================================================================
FAIL: test_date_of_death_label (catalog.tests.test_models.AuthorModelTest)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "D:\...\locallibrary\catalog\tests\test_models.py", line 32, in test_date_of_death_label
    self.assertEqual(field_label,'died')
AssertionError: 'Died' != 'died'
- Died
? ^
+ died
? ^
```

Đây là một lỗi rất nhỏ, nhưng nó làm nổi bật cách viết kiểm thử có thể kiểm tra kỹ hơn bất kỳ giả định nào bạn có thể đã thực hiện.

> [!NOTE]
> Thay đổi nhãn cho trường `date_of_death` (**/catalog/models.py**) thành "died" và chạy lại các kiểm thử.

Các mẫu để kiểm thử các mô hình khác tương tự, vì vậy chúng ta sẽ không tiếp tục thảo luận thêm về những điều này. Hãy tự tạo các kiểm thử của riêng bạn cho các mô hình khác của chúng ta.

### Biểu mẫu

Triết lý để kiểm thử biểu mẫu của bạn giống như để kiểm thử mô hình của bạn; bạn cần kiểm thử bất kỳ điều gì bạn đã code hoặc thiết kế của bạn chỉ định, nhưng không phải hành vi của framework cơ bản và các thư viện bên thứ ba khác.

Thông thường điều này có nghĩa là bạn nên kiểm thử rằng các biểu mẫu có các trường mà bạn muốn, và rằng chúng được hiển thị với nhãn và văn bản trợ giúp thích hợp. Bạn không cần xác minh rằng Django xác thực đúng loại trường (trừ khi bạn đã tạo trường và xác thực tùy chỉnh của riêng mình) — tức là bạn không cần kiểm thử rằng trường email chỉ chấp nhận email. Tuy nhiên, bạn sẽ cần kiểm thử bất kỳ xác thực bổ sung nào mà bạn mong đợi được thực hiện trên các trường và bất kỳ thông báo nào mà code của bạn sẽ tạo ra cho các lỗi.

Hãy xem xét biểu mẫu gia hạn sách của chúng ta. Biểu mẫu này chỉ có một trường cho ngày gia hạn, sẽ có nhãn và văn bản trợ giúp mà chúng ta sẽ cần xác minh.

```python
class RenewBookForm(forms.Form):
    """Form for a librarian to renew books."""
    renewal_date = forms.DateField(help_text="Enter a date between now and 4 weeks (default 3).")

    def clean_renewal_date(self):
        data = self.cleaned_data['renewal_date']

        # Check if a date is not in the past.
        if data < datetime.date.today():
            raise ValidationError(_('Invalid date - renewal in past'))

        # Check if date is in the allowed range (+4 weeks from today).
        if data > datetime.date.today() + datetime.timedelta(weeks=4):
            raise ValidationError(_('Invalid date - renewal more than 4 weeks ahead'))

        # Remember to always return the cleaned data.
        return data
```

Mở tệp **/catalog/tests/test_forms.py** của chúng ta và thay thế bất kỳ code hiện có nào bằng code kiểm thử sau cho biểu mẫu `RenewBookForm`. Chúng ta bắt đầu bằng cách import biểu mẫu và một số thư viện Python và Django để giúp kiểm thử chức năng liên quan đến thời gian. Sau đó chúng ta khai báo lớp kiểm thử biểu mẫu theo cách tương tự như chúng ta đã làm cho các mô hình, sử dụng tên mô tả cho lớp kiểm thử dẫn xuất từ `TestCase`.

```python
import datetime

from django.test import TestCase
from django.utils import timezone

from catalog.forms import RenewBookForm

class RenewBookFormTest(TestCase):
    def test_renew_form_date_field_label(self):
        form = RenewBookForm()
        self.assertTrue(form.fields['renewal_date'].label is None or form.fields['renewal_date'].label == 'renewal date')

    def test_renew_form_date_field_help_text(self):
        form = RenewBookForm()
        self.assertEqual(form.fields['renewal_date'].help_text, 'Enter a date between now and 4 weeks (default 3).')

    def test_renew_form_date_in_past(self):
        date = datetime.date.today() - datetime.timedelta(days=1)
        form = RenewBookForm(data={'renewal_date': date})
        self.assertFalse(form.is_valid())

    def test_renew_form_date_too_far_in_future(self):
        date = datetime.date.today() + datetime.timedelta(weeks=4) + datetime.timedelta(days=1)
        form = RenewBookForm(data={'renewal_date': date})
        self.assertFalse(form.is_valid())

    def test_renew_form_date_today(self):
        date = datetime.date.today()
        form = RenewBookForm(data={'renewal_date': date})
        self.assertTrue(form.is_valid())

    def test_renew_form_date_max(self):
        date = timezone.localtime() + datetime.timedelta(weeks=4)
        form = RenewBookForm(data={'renewal_date': date})
        self.assertTrue(form.is_valid())
```

Hai hàm đầu tiên kiểm tra rằng `label` và `help_text` của trường là như mong đợi. Chúng ta phải truy cập trường bằng cách sử dụng từ điển trường (ví dụ: `form.fields['renewal_date']`). Lưu ý ở đây rằng chúng ta cũng phải kiểm tra xem giá trị nhãn có phải là `None` không, vì mặc dù Django sẽ hiển thị nhãn đúng, nhưng nó trả về `None` nếu giá trị không được đặt _một cách rõ ràng_.

Phần còn lại của các hàm kiểm thử rằng biểu mẫu hợp lệ cho các ngày gia hạn vừa nằm trong phạm vi chấp nhận được và không hợp lệ cho các giá trị nằm ngoài phạm vi. Lưu ý cách chúng ta xây dựng các giá trị ngày kiểm thử xung quanh ngày hiện tại (`datetime.date.today()`) bằng cách sử dụng `datetime.timedelta()` (trong trường hợp này chỉ định số ngày hoặc tuần). Sau đó chúng ta chỉ tạo biểu mẫu, truyền dữ liệu của chúng ta, và kiểm thử xem nó có hợp lệ không.

> [!NOTE]
> Ở đây chúng ta thực sự không sử dụng cơ sở dữ liệu hoặc máy khách kiểm thử. Hãy xem xét sửa đổi các kiểm thử này để sử dụng [SimpleTestCase](https://docs.djangoproject.com/en/5.0/topics/testing/tools/#django.test.SimpleTestCase).
>
> Chúng ta cũng cần xác thực rằng các lỗi đúng được tạo ra nếu biểu mẫu không hợp lệ, tuy nhiên điều này thường được thực hiện như một phần của xử lý khung nhìn, vì vậy chúng ta sẽ xử lý điều đó trong phần tiếp theo.

> [!WARNING]
> Nếu bạn sử dụng lớp [ModelForm](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Forms#modelforms) `RenewBookModelForm(forms.ModelForm)` thay vì lớp `RenewBookForm(forms.Form)`, thì tên trường biểu mẫu sẽ là **'due_back'** thay vì **'renewal_date'**.

Đó là tất cả cho các biểu mẫu; chúng ta có một số biểu mẫu khác, nhưng chúng được tạo tự động bởi các khung nhìn chỉnh sửa tổng quát dựa trên lớp, và nên được kiểm thử ở đó! Chạy các kiểm thử và xác nhận rằng code của chúng ta vẫn đang vượt qua!

### Khung nhìn

Để xác thực hành vi khung nhìn của chúng ta, chúng ta sử dụng máy khách kiểm thử Django [Client](https://docs.djangoproject.com/en/5.0/topics/testing/tools/#django.test.Client). Lớp này hoạt động như một trình duyệt web giả mà chúng ta có thể sử dụng để mô phỏng các yêu cầu `GET` và `POST` trên URL và quan sát phản hồi. Chúng ta có thể thấy hầu hết mọi thứ về phản hồi, từ HTTP cấp thấp (tiêu đề kết quả và mã trạng thái) đến mẫu chúng ta đang sử dụng để hiển thị HTML và dữ liệu ngữ cảnh chúng ta đang truyền vào đó. Chúng ta cũng có thể thấy chuỗi chuyển hướng (nếu có) và kiểm tra URL và mã trạng thái tại mỗi bước. Điều này cho phép chúng ta xác minh rằng mỗi khung nhìn đang thực hiện những gì được mong đợi.

Hãy bắt đầu với một trong những khung nhìn đơn giản nhất của chúng ta, cung cấp danh sách tất cả Tác giả. Điều này được hiển thị tại URL **/catalog/authors/** (một URL có tên 'authors' trong cấu hình URL).

```python
class AuthorListView(generic.ListView):
    model = Author
    paginate_by = 10
```

Vì đây là một khung nhìn danh sách tổng quát, hầu hết mọi thứ được thực hiện cho chúng ta bởi Django. Có thể nói nếu bạn tin tưởng Django thì điều duy nhất bạn cần kiểm thử là khung nhìn có thể truy cập tại URL đúng và có thể được truy cập bằng tên của nó. Tuy nhiên nếu bạn đang sử dụng quy trình phát triển hướng kiểm thử, bạn sẽ bắt đầu bằng cách viết các kiểm thử xác nhận rằng khung nhìn hiển thị tất cả Tác giả, phân trang chúng theo lô 10.

Mở tệp **/catalog/tests/test_views.py** và thay thế bất kỳ văn bản hiện có nào bằng code kiểm thử sau cho `AuthorListView`. Như trước, chúng ta import mô hình và một số lớp hữu ích. Trong phương thức `setUpTestData()`, chúng ta thiết lập một số đối tượng `Author` để chúng ta có thể kiểm thử phân trang.

```python
from django.test import TestCase
from django.urls import reverse

from catalog.models import Author

class AuthorListViewTest(TestCase):
    @classmethod
    def setUpTestData(cls):
        # Create 13 authors for pagination tests
        number_of_authors = 13

        for author_id in range(number_of_authors):
            Author.objects.create(
                first_name=f'Dominique {author_id}',
                last_name=f'Surname {author_id}',
            )

    def test_view_url_exists_at_desired_location(self):
        response = self.client.get('/catalog/authors/')
        self.assertEqual(response.status_code, 200)

    def test_view_url_accessible_by_name(self):
        response = self.client.get(reverse('authors'))
        self.assertEqual(response.status_code, 200)

    def test_view_uses_correct_template(self):
        response = self.client.get(reverse('authors'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'catalog/author_list.html')

    def test_pagination_is_ten(self):
        response = self.client.get(reverse('authors'))
        self.assertEqual(response.status_code, 200)
        self.assertTrue('is_paginated' in response.context)
        self.assertTrue(response.context['is_paginated'] == True)
        self.assertEqual(len(response.context['author_list']), 10)

    def test_lists_all_authors(self):
        # Get second page and confirm it has (exactly) remaining 3 items
        response = self.client.get(reverse('authors')+'?page=2')
        self.assertEqual(response.status_code, 200)
        self.assertTrue('is_paginated' in response.context)
        self.assertTrue(response.context['is_paginated'] == True)
        self.assertEqual(len(response.context['author_list']), 3)
```

Tất cả các kiểm thử sử dụng máy khách (thuộc lớp kế thừa `TestCase` của chúng ta) để mô phỏng yêu cầu `GET` và nhận phản hồi. Phiên bản đầu tiên kiểm tra một URL cụ thể (lưu ý, chỉ là đường dẫn cụ thể không có tên miền) trong khi phiên bản thứ hai tạo URL từ tên của nó trong cấu hình URL.

```python
response = self.client.get('/catalog/authors/')
response = self.client.get(reverse('authors'))
```

Sau khi chúng ta có phản hồi, chúng ta truy vấn nó về mã trạng thái, mẫu được sử dụng, liệu phản hồi có được phân trang hay không, số lượng mục được trả về, và tổng số mục.

> [!NOTE]
> Nếu bạn đặt biến `paginate_by` trong tệp **/catalog/views.py** thành một số khác 10, hãy đảm bảo cập nhật các dòng kiểm thử rằng số lượng mục đúng được hiển thị trong các mẫu phân trang ở trên và trong các phần sau. Ví dụ, nếu bạn đặt biến cho trang danh sách tác giả thành 5, hãy cập nhật dòng ở trên thành:
>
> ```python
> self.assertTrue(len(response.context['author_list']) == 5)
> ```

Biến thú vị nhất mà chúng ta trình bày ở trên là `response.context`, đây là biến ngữ cảnh được truyền đến mẫu bởi khung nhìn.
Điều này cực kỳ hữu ích cho kiểm thử, vì nó cho phép chúng ta xác nhận rằng mẫu đang nhận tất cả dữ liệu cần thiết. Nói cách khác, chúng ta có thể kiểm tra xem chúng ta đang sử dụng mẫu dự kiến và dữ liệu mà mẫu đang nhận, điều này giúp xác minh rằng bất kỳ vấn đề hiển thị nào đều chỉ do mẫu.

#### Các khung nhìn bị hạn chế đối với người dùng đã đăng nhập

Trong một số trường hợp bạn sẽ muốn kiểm thử một khung nhìn bị hạn chế chỉ dành cho người dùng đã đăng nhập. Ví dụ `LoanedBooksByUserListView` rất giống với khung nhìn trước của chúng ta nhưng chỉ có sẵn cho người dùng đã đăng nhập, và chỉ hiển thị các bản ghi `BookInstance` được mượn bởi người dùng hiện tại, có trạng thái 'on loan', và được sắp xếp "cũ nhất trước".

```python
from django.contrib.auth.mixins import LoginRequiredMixin

class LoanedBooksByUserListView(LoginRequiredMixin, generic.ListView):
    """Generic class-based view listing books on loan to current user."""
    model = BookInstance
    template_name ='catalog/bookinstance_list_borrowed_user.html'
    paginate_by = 10

    def get_queryset(self):
        return BookInstance.objects.filter(borrower=self.request.user).filter(status__exact='o').order_by('due_back')
```

Thêm code kiểm thử sau vào **/catalog/tests/test_views.py**. Ở đây đầu tiên chúng ta sử dụng `SetUp()` để tạo một số tài khoản đăng nhập người dùng và các đối tượng `BookInstance` (cùng với các sách liên quan và các bản ghi khác) mà chúng ta sẽ sử dụng sau trong các kiểm thử. Một nửa số sách được mượn bởi mỗi người dùng kiểm thử, nhưng ban đầu chúng ta đặt trạng thái của tất cả sách thành "maintenance". Chúng ta đã sử dụng `SetUp()` thay vì `setUpTestData()` vì chúng ta sẽ sửa đổi một số đối tượng này sau.

> [!NOTE]
> Code `setUp()` bên dưới tạo một cuốn sách với `Language` được chỉ định, nhưng _code của bạn_ có thể không bao gồm mô hình `Language` vì đây được tạo ra như một _thách thức_. Nếu đây là trường hợp, hãy chú thích ra các phần của code tạo hoặc import các đối tượng Language. Bạn cũng nên làm điều này trong phần `RenewBookInstancesViewTest` theo sau.

```python
import datetime

from django.utils import timezone

# Get user model from settings
from django.contrib.auth import get_user_model
User = get_user_model()

from catalog.models import BookInstance, Book, Genre, Language

class LoanedBookInstancesByUserListViewTest(TestCase):
    def setUp(self):
        # Create two users
        test_user1 = User.objects.create_user(username='testuser1', password='1X<ISRUkw+tuK')
        test_user2 = User.objects.create_user(username='testuser2', password='2HJ1vRV0Z&3iD')

        test_user1.save()
        test_user2.save()

        # Create a book
        test_author = Author.objects.create(first_name='Dominique', last_name='Rousseau')
        test_genre = Genre.objects.create(name='Fantasy')
        test_language = Language.objects.create(name='English')
        test_book = Book.objects.create(
            title='Book Title',
            summary='My book summary',
            isbn='ABCDEFG',
            author=test_author,
            language=test_language,
        )

        # Create genre as a post-step
        genre_objects_for_book = Genre.objects.all()
        test_book.genre.set(genre_objects_for_book) # Direct assignment of many-to-many types not allowed.
        test_book.save()

        # Create 30 BookInstance objects
        number_of_book_copies = 30
        for book_copy in range(number_of_book_copies):
            return_date = timezone.localtime() + datetime.timedelta(days=book_copy%5)
            the_borrower = test_user1 if book_copy % 2 else test_user2
            status = 'm'
            BookInstance.objects.create(
                book=test_book,
                imprint='Unlikely Imprint, 2016',
                due_back=return_date,
                borrower=the_borrower,
                status=status,
            )

    def test_redirect_if_not_logged_in(self):
        response = self.client.get(reverse('my-borrowed'))
        self.assertRedirects(response, '/accounts/login/?next=/catalog/mybooks/')

    def test_logged_in_uses_correct_template(self):
        login = self.client.login(username='testuser1', password='1X<ISRUkw+tuK')
        response = self.client.get(reverse('my-borrowed'))

        # Check our user is logged in
        self.assertEqual(str(response.context['user']), 'testuser1')
        # Check that we got a response "success"
        self.assertEqual(response.status_code, 200)

        # Check we used correct template
        self.assertTemplateUsed(response, 'catalog/bookinstance_list_borrowed_user.html')
```

Để xác minh rằng khung nhìn sẽ chuyển hướng đến trang đăng nhập nếu người dùng chưa đăng nhập, chúng ta sử dụng `assertRedirects`, như được minh họa trong `test_redirect_if_not_logged_in()`. Để xác minh rằng trang được hiển thị cho người dùng đã đăng nhập, trước tiên chúng ta đăng nhập người dùng kiểm thử, và sau đó truy cập trang lần nữa và kiểm tra xem chúng ta có nhận được `status_code` là 200 (thành công) không.

Phần còn lại của các kiểm thử xác minh rằng khung nhìn của chúng ta chỉ trả về sách đang được cho mượn cho người mượn hiện tại của chúng ta. Sao chép code bên dưới và dán nó vào cuối lớp kiểm thử ở trên.

```python
    def test_only_borrowed_books_in_list(self):
        login = self.client.login(username='testuser1', password='1X<ISRUkw+tuK')
        response = self.client.get(reverse('my-borrowed'))

        # Check our user is logged in
        self.assertEqual(str(response.context['user']), 'testuser1')
        # Check that we got a response "success"
        self.assertEqual(response.status_code, 200)

        # Check that initially we don't have any books in list (none on loan)
        self.assertTrue('bookinstance_list' in response.context)
        self.assertEqual(len(response.context['bookinstance_list']), 0)

        # Now change all books to be on loan
        books = BookInstance.objects.all()[:10]

        for book in books:
            book.status = 'o'
            book.save()

        # Check that now we have borrowed books in the list
        response = self.client.get(reverse('my-borrowed'))
        # Check our user is logged in
        self.assertEqual(str(response.context['user']), 'testuser1')
        # Check that we got a response "success"
        self.assertEqual(response.status_code, 200)

        self.assertTrue('bookinstance_list' in response.context)

        # Confirm all books belong to testuser1 and are on loan
        for book_item in response.context['bookinstance_list']:
            self.assertEqual(response.context['user'], book_item.borrower)
            self.assertEqual(book_item.status, 'o')

    def test_pages_ordered_by_due_date(self):
        # Change all books to be on loan
        for book in BookInstance.objects.all():
            book.status='o'
            book.save()

        login = self.client.login(username='testuser1', password='1X<ISRUkw+tuK')
        response = self.client.get(reverse('my-borrowed'))

        # Check our user is logged in
        self.assertEqual(str(response.context['user']), 'testuser1')
        # Check that we got a response "success"
        self.assertEqual(response.status_code, 200)

        # Confirm that of the items, only 10 are displayed due to pagination.
        self.assertEqual(len(response.context['bookinstance_list']), 10)

        last_date = 0
        for book in response.context['bookinstance_list']:
            if last_date == 0:
                last_date = book.due_back
            else:
                self.assertTrue(last_date <= book.due_back)
                last_date = book.due_back
```

Bạn cũng có thể thêm các kiểm thử phân trang, nếu bạn muốn!

#### Kiểm thử các khung nhìn có biểu mẫu

Kiểm thử các khung nhìn có biểu mẫu phức tạp hơn một chút so với các trường hợp trên, vì bạn cần kiểm thử nhiều đường dẫn code hơn: hiển thị ban đầu, hiển thị sau khi xác thực dữ liệu thất bại, và hiển thị sau khi xác thực thành công. Tin tốt là chúng ta sử dụng máy khách để kiểm thử gần như theo cùng cách mà chúng ta đã làm cho các khung nhìn chỉ hiển thị.

Để minh họa, hãy viết một số kiểm thử cho khung nhìn được sử dụng để gia hạn sách (`renew_book_librarian()`):

```python
from catalog.forms import RenewBookForm

@permission_required('catalog.can_mark_returned')
def renew_book_librarian(request, pk):
    """View function for renewing a specific BookInstance by librarian."""
    book_instance = get_object_or_404(BookInstance, pk=pk)

    # If this is a POST request then process the Form data
    if request.method == 'POST':

        # Create a form instance and populate it with data from the request (binding):
        book_renewal_form = RenewBookForm(request.POST)

        # Check if the form is valid:
        if form.is_valid():
            # process the data in form.cleaned_data as required (here we just write it to the model due_back field)
            book_instance.due_back = form.cleaned_data['renewal_date']
            book_instance.save()

            # redirect to a new URL:
            return HttpResponseRedirect(reverse('all-borrowed'))

    # If this is a GET (or any other method) create the default form
    else:
        proposed_renewal_date = datetime.date.today() + datetime.timedelta(weeks=3)
        book_renewal_form = RenewBookForm(initial={'renewal_date': proposed_renewal_date})

    context = {
        'book_renewal_form': book_renewal_form,
        'book_instance': book_instance,
    }

    return render(request, 'catalog/book_renew_librarian.html', context)
```

Chúng ta sẽ cần kiểm thử rằng khung nhìn chỉ có sẵn cho những người dùng có quyền `can_mark_returned`, và rằng người dùng được chuyển hướng đến trang lỗi HTTP 404 nếu họ cố gắng gia hạn `BookInstance` không tồn tại. Chúng ta nên kiểm tra rằng giá trị ban đầu của biểu mẫu được cung cấp bằng ngày ba tuần trong tương lai, và rằng nếu xác thực thành công, chúng ta được chuyển hướng đến khung nhìn "tất cả sách đã mượn". Là một phần của việc kiểm tra các kiểm thử xác thực thất bại, chúng ta cũng sẽ kiểm tra rằng biểu mẫu của chúng ta đang gửi các thông báo lỗi thích hợp.

Thêm phần đầu tiên của lớp kiểm thử (được hiển thị bên dưới) vào cuối **/catalog/tests/test_views.py**.
Điều này tạo hai người dùng và hai thể hiện sách, nhưng chỉ cấp cho một người dùng quyền cần thiết để truy cập khung nhìn.

```python
import uuid

from django.contrib.auth.models import Permission # Required to grant the permission needed to set a book as returned.

class RenewBookInstancesViewTest(TestCase):
    def setUp(self):
        # Create a user
        test_user1 = User.objects.create_user(username='testuser1', password='1X<ISRUkw+tuK')
        test_user2 = User.objects.create_user(username='testuser2', password='2HJ1vRV0Z&3iD')

        test_user1.save()
        test_user2.save()

        # Give test_user2 permission to renew books.
        permission = Permission.objects.get(name='Set book as returned')
        test_user2.user_permissions.add(permission)
        test_user2.save()

        # Create a book
        test_author = Author.objects.create(first_name='Dominique', last_name='Rousseau')
        test_genre = Genre.objects.create(name='Fantasy')
        test_language = Language.objects.create(name='English')
        test_book = Book.objects.create(
            title='Book Title',
            summary='My book summary',
            isbn='ABCDEFG',
            author=test_author,
            language=test_language,
        )

        # Create genre as a post-step
        genre_objects_for_book = Genre.objects.all()
        test_book.genre.set(genre_objects_for_book) # Direct assignment of many-to-many types not allowed.
        test_book.save()

        # Create a BookInstance object for test_user1
        return_date = datetime.date.today() + datetime.timedelta(days=5)
        self.test_bookinstance1 = BookInstance.objects.create(
            book=test_book,
            imprint='Unlikely Imprint, 2016',
            due_back=return_date,
            borrower=test_user1,
            status='o',
        )

        # Create a BookInstance object for test_user2
        return_date = datetime.date.today() + datetime.timedelta(days=5)
        self.test_bookinstance2 = BookInstance.objects.create(
            book=test_book,
            imprint='Unlikely Imprint, 2016',
            due_back=return_date,
            borrower=test_user2,
            status='o',
        )
```

Thêm các kiểm thử sau vào cuối lớp kiểm thử. Chúng kiểm tra rằng chỉ người dùng có các quyền đúng (_testuser2_) mới có thể truy cập khung nhìn. Chúng ta kiểm tra tất cả các trường hợp: khi người dùng chưa đăng nhập, khi người dùng đã đăng nhập nhưng không có các quyền đúng, khi người dùng có quyền nhưng không phải là người mượn (nên thành công), và những gì xảy ra khi họ cố gắng truy cập một `BookInstance` không tồn tại. Chúng ta cũng kiểm tra rằng mẫu đúng được sử dụng.

```python
   def test_redirect_if_not_logged_in(self):
        response = self.client.get(reverse('renew-book-librarian', kwargs={'pk': self.test_bookinstance1.pk}))
        # Manually check redirect (Can't use assertRedirect, because the redirect URL is unpredictable)
        self.assertEqual(response.status_code, 302)
        self.assertTrue(response.url.startswith('/accounts/login/'))

    def test_forbidden_if_logged_in_but_not_correct_permission(self):
        login = self.client.login(username='testuser1', password='1X<ISRUkw+tuK')
        response = self.client.get(reverse('renew-book-librarian', kwargs={'pk': self.test_bookinstance1.pk}))
        self.assertEqual(response.status_code, 403)

    def test_logged_in_with_permission_borrowed_book(self):
        login = self.client.login(username='testuser2', password='2HJ1vRV0Z&3iD')
        response = self.client.get(reverse('renew-book-librarian', kwargs={'pk': self.test_bookinstance2.pk}))

        # Check that it lets us login - this is our book and we have the right permissions.
        self.assertEqual(response.status_code, 200)

    def test_logged_in_with_permission_another_users_borrowed_book(self):
        login = self.client.login(username='testuser2', password='2HJ1vRV0Z&3iD')
        response = self.client.get(reverse('renew-book-librarian', kwargs={'pk': self.test_bookinstance1.pk}))

        # Check that it lets us login. We're a librarian, so we can view any users book
        self.assertEqual(response.status_code, 200)

    def test_HTTP404_for_invalid_book_if_logged_in(self):
        # unlikely UID to match our bookinstance!
        test_uid = uuid.uuid4()
        login = self.client.login(username='testuser2', password='2HJ1vRV0Z&3iD')
        response = self.client.get(reverse('renew-book-librarian', kwargs={'pk':test_uid}))
        self.assertEqual(response.status_code, 404)

    def test_uses_correct_template(self):
        login = self.client.login(username='testuser2', password='2HJ1vRV0Z&3iD')
        response = self.client.get(reverse('renew-book-librarian', kwargs={'pk': self.test_bookinstance1.pk}))
        self.assertEqual(response.status_code, 200)

        # Check we used correct template
        self.assertTemplateUsed(response, 'catalog/book_renew_librarian.html')
```

Thêm phương thức kiểm thử tiếp theo, như được hiển thị bên dưới. Điều này kiểm tra rằng ngày ban đầu cho biểu mẫu là ba tuần trong tương lai. Lưu ý cách chúng ta có thể truy cập giá trị của giá trị ban đầu của trường biểu mẫu (`response.context['form'].initial['renewal_date'])`.

```python
    def test_form_renewal_date_initially_has_date_three_weeks_in_future(self):
        login = self.client.login(username='testuser2', password='2HJ1vRV0Z&3iD')
        response = self.client.get(reverse('renew-book-librarian', kwargs={'pk': self.test_bookinstance1.pk}))
        self.assertEqual(response.status_code, 200)

        date_3_weeks_in_future = datetime.date.today() + datetime.timedelta(weeks=3)
        self.assertEqual(response.context['form'].initial['renewal_date'], date_3_weeks_in_future)
```

Kiểm thử tiếp theo (cũng thêm điều này vào lớp) kiểm tra rằng khung nhìn chuyển hướng đến danh sách tất cả sách đã mượn nếu gia hạn thành công. Điều khác biệt ở đây là lần đầu tiên chúng ta trình bày cách bạn có thể `POST` dữ liệu bằng cách sử dụng máy khách. Dữ liệu _post_ là đối số thứ hai cho hàm post, và được chỉ định dưới dạng từ điển khóa/giá trị.

```python
    def test_redirects_to_all_borrowed_book_list_on_success(self):
        login = self.client.login(username='testuser2', password='2HJ1vRV0Z&3iD')
        valid_date_in_future = datetime.date.today() + datetime.timedelta(weeks=2)
        response = self.client.post(reverse('renew-book-librarian', kwargs={'pk':self.test_bookinstance1.pk,}), {'renewal_date':valid_date_in_future})
        self.assertRedirects(response, reverse('all-borrowed'))
```

> [!WARNING]
> Khung nhìn _all-borrowed_ được thêm như một _thách thức_, và code của bạn có thể thay vào đó chuyển hướng đến trang chủ '/'. Nếu vậy, hãy sửa đổi hai dòng cuối của code kiểm thử để giống với code bên dưới. `follow=True` trong yêu cầu đảm bảo rằng yêu cầu trả về URL đích cuối cùng (do đó kiểm tra `/catalog/` thay vì `/`).
>
> ```python
>  response = self.client.post(reverse('renew-book-librarian', kwargs={'pk':self.test_bookinstance1.pk,}), {'renewal_date':valid_date_in_future}, follow=True)
>  self.assertRedirects(response, '/catalog/')
> ```

Sao chép hai hàm cuối vào lớp, như được thấy bên dưới. Chúng kiểm tra lại các yêu cầu `POST`, nhưng trong trường hợp này với các ngày gia hạn không hợp lệ. Chúng ta sử dụng `assertFormError()` để xác minh rằng các thông báo lỗi là như mong đợi.

```python
    def test_form_invalid_renewal_date_past(self):
        login = self.client.login(username='testuser2', password='2HJ1vRV0Z&3iD')
        date_in_past = datetime.date.today() - datetime.timedelta(weeks=1)
        response = self.client.post(reverse('renew-book-librarian', kwargs={'pk': self.test_bookinstance1.pk}), {'renewal_date': date_in_past})
        self.assertEqual(response.status_code, 200)
        self.assertFormError(response.context['form'], 'renewal_date', 'Invalid date - renewal in past')

    def test_form_invalid_renewal_date_future(self):
        login = self.client.login(username='testuser2', password='2HJ1vRV0Z&3iD')
        invalid_date_in_future = datetime.date.today() + datetime.timedelta(weeks=5)
        response = self.client.post(reverse('renew-book-librarian', kwargs={'pk': self.test_bookinstance1.pk}), {'renewal_date': invalid_date_in_future})
        self.assertEqual(response.status_code, 200)
        self.assertFormError(response.context['form'], 'renewal_date', 'Invalid date - renewal more than 4 weeks ahead')
```

Có thể sử dụng các kỹ thuật tương tự để kiểm thử các khung nhìn khác.

### Mẫu

Django cung cấp các API kiểm thử để kiểm tra rằng mẫu đúng đang được gọi bởi các khung nhìn của bạn, và để cho phép bạn xác minh rằng thông tin đúng đang được gửi. Tuy nhiên không có hỗ trợ API cụ thể để kiểm thử trong Django rằng đầu ra HTML của bạn được hiển thị như mong đợi.

## Các công cụ kiểm thử được khuyến nghị khác

Framework kiểm thử của Django có thể giúp bạn viết các kiểm thử đơn vị và tích hợp hiệu quả — chúng ta chỉ mới làm trầy xước bề mặt của những gì framework **unittest** cơ bản có thể làm, chứ chưa nói đến các bổ sung của Django (ví dụ: hãy xem cách bạn có thể sử dụng [unittest.mock](https://docs.python.org/3/library/unittest.mock-examples.html) để vá các thư viện bên thứ ba để bạn có thể kiểm thử code của riêng mình kỹ hơn).

Trong khi có nhiều công cụ kiểm thử khác mà bạn có thể sử dụng, chúng ta sẽ chỉ nêu bật hai:

- [Coverage](https://coverage.readthedocs.io/en/latest/): Công cụ Python này báo cáo về lượng code của bạn thực sự được thực thi bởi các kiểm thử. Nó đặc biệt hữu ích khi bạn mới bắt đầu, và bạn đang cố gắng tìm hiểu chính xác những gì bạn nên kiểm thử.
- [Selenium](/en-US/docs/Learn_web_development/Extensions/Testing/Your_own_automation_environment) là một framework để tự động hóa kiểm thử trong trình duyệt thực. Nó cho phép bạn mô phỏng người dùng thực tế tương tác với trang web, và cung cấp một framework tuyệt vời để kiểm thử hệ thống trang web của bạn (bước tiếp theo từ kiểm thử tích hợp).

## Thách thức bản thân

Có rất nhiều mô hình và khung nhìn khác mà chúng ta có thể kiểm thử. Như một thách thức, hãy thử tạo một trường hợp kiểm thử cho khung nhìn `AuthorCreate`.

```python
class AuthorCreate(PermissionRequiredMixin, CreateView):
    model = Author
    fields = ['first_name', 'last_name', 'date_of_birth', 'date_of_death']
    initial = {'date_of_death': '11/11/2023'}
    permission_required = 'catalog.add_author'
```

Hãy nhớ rằng bạn cần kiểm tra bất kỳ điều gì bạn chỉ định hoặc là một phần thiết kế.
Điều này sẽ bao gồm ai có quyền truy cập, ngày ban đầu, mẫu được sử dụng và nơi khung nhìn chuyển hướng khi thành công.

Bạn có thể sử dụng code sau để thiết lập kiểm thử và gán cho người dùng của bạn quyền thích hợp

```python
class AuthorCreateViewTest(TestCase):
    """Test case for the AuthorCreate view (Created as Challenge)."""

    def setUp(self):
        # Create a user
        test_user = User.objects.create_user(
            username='test_user', password='some_password')

        content_typeAuthor = ContentType.objects.get_for_model(Author)
        permAddAuthor = Permission.objects.get(
            codename="add_author",
            content_type=content_typeAuthor,
        )

        test_user.user_permissions.add(permAddAuthor)
        test_user.save()
```

## Tóm tắt

Viết code kiểm thử không thú vị cũng không hào nhoáng, và do đó thường bị để đến cuối (hoặc không làm gì cả) khi tạo một trang web. Tuy nhiên, đây là một phần thiết yếu để đảm bảo rằng code của bạn an toàn để phát hành sau khi thực hiện các thay đổi, và chi phí hiệu quả để bảo trì.

Trong hướng dẫn này, chúng ta đã trình bày cách viết và chạy các kiểm thử cho các mô hình, biểu mẫu và khung nhìn của bạn. Quan trọng nhất là chúng ta đã cung cấp một tóm tắt ngắn gọn về những gì bạn nên kiểm thử, điều này thường là điều khó nhất cần tìm ra khi bạn mới bắt đầu. Có rất nhiều điều cần biết thêm, nhưng ngay cả với những gì bạn đã học, bạn sẽ có thể tạo ra các kiểm thử đơn vị hiệu quả cho các trang web của mình.

Hướng dẫn tiếp theo và cuối cùng trình bày cách bạn có thể triển khai trang web Django tuyệt vời (và được kiểm thử đầy đủ!) của mình.

## Xem thêm

- [Writing and running tests](https://docs.djangoproject.com/en/5.0/topics/testing/overview/) (Tài liệu Django)
- [Writing your first Django app, part 5 > Introducing automated testing](https://docs.djangoproject.com/en/5.0/intro/tutorial05/) (Tài liệu Django)
- [Testing tools reference](https://docs.djangoproject.com/en/5.0/topics/testing/tools/) (Tài liệu Django)
- [Advanced testing topics](https://docs.djangoproject.com/en/5.0/topics/testing/advanced/) (Tài liệu Django)
- [A Guide to Testing in Django](https://toastdriven.com/blog/2011/apr/09/guide-to-testing-in-django/) (Toast Driven Blog, 2011)
- [Workshop: Test-Driven Web Development with Django](https://test-driven-django-development.readthedocs.io/en/latest/index.html) (San Diego Python, 2014)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Forms", "Learn_web_development/Extensions/Server-side/Django/Deployment", "Learn_web_development/Extensions/Server-side/Django")}}
