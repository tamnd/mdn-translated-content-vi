---
title: "Hướng dẫn Django Phần 3: Sử dụng mô hình"
short-title: "3: Mô hình"
slug: Learn_web_development/Extensions/Server-side/Django/Models
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/skeleton_website", "Learn_web_development/Extensions/Server-side/Django/Admin_site", "Learn_web_development/Extensions/Server-side/Django")}}

Bài viết này chỉ cách định nghĩa các mô hình cho website LocalLibrary. Nó giải thích mô hình là gì, cách khai báo và một số loại trường chính. Nó cũng giới thiệu ngắn gọn một vài cách chính bạn có thể truy cập dữ liệu mô hình.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/skeleton_website">Hướng dẫn Django Phần 2: Tạo website khung sườn</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        <p>
          Có thể thiết kế và tạo các mô hình của riêng bạn, chọn các trường một cách phù hợp.
        </p>
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Các ứng dụng web Django truy cập và quản lý dữ liệu thông qua các đối tượng Python được gọi là mô hình. Mô hình xác định _cấu trúc_ dữ liệu được lưu trữ, bao gồm _các loại_ trường và có thể cả kích thước tối đa của chúng, giá trị mặc định, tùy chọn danh sách lựa chọn, văn bản trợ giúp cho tài liệu, văn bản nhãn cho biểu mẫu, v.v. Định nghĩa của mô hình độc lập với cơ sở dữ liệu bên dưới — bạn có thể chọn một trong số nhiều loại như một phần của cài đặt dự án của bạn. Khi bạn đã chọn cơ sở dữ liệu muốn sử dụng, bạn hoàn toàn không cần phải nói chuyện trực tiếp với nó — bạn chỉ cần viết cấu trúc mô hình và các code khác, và Django xử lý tất cả công việc bẩn của việc giao tiếp với cơ sở dữ liệu cho bạn.

Hướng dẫn này chỉ cách định nghĩa và truy cập các mô hình cho ví dụ [website LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website).

## Thiết kế các mô hình LocalLibrary

Trước khi bạn bắt đầu viết code mô hình, đáng để dành vài phút để suy nghĩ về dữ liệu chúng ta cần lưu trữ và mối quan hệ giữa các đối tượng khác nhau.

Chúng ta biết rằng chúng ta cần lưu thông tin về sách (tiêu đề, tóm tắt, tác giả, ngôn ngữ viết, thể loại, ISBN) và chúng ta có thể có nhiều bản sao sẵn có (với id duy nhất toàn cục, trạng thái sẵn có, v.v.). Chúng ta có thể cần lưu thêm thông tin về tác giả hơn chỉ tên của họ, và có thể có nhiều tác giả cùng tên hoặc tên tương tự. Chúng ta muốn có thể sắp xếp thông tin dựa trên tiêu đề sách, tác giả, ngôn ngữ viết và thể loại.

Khi thiết kế mô hình của bạn, việc có các mô hình riêng biệt cho mỗi "đối tượng" (nhóm thông tin liên quan) là hợp lý. Trong trường hợp này, các đối tượng rõ ràng là sách, phiên bản sách và tác giả.

Bạn cũng có thể muốn sử dụng các mô hình để đại diện cho các tùy chọn danh sách lựa chọn (ví dụ: như danh sách thả xuống các lựa chọn), thay vì mã hóa cứng các lựa chọn vào chính website — điều này được khuyến nghị khi tất cả các tùy chọn không được biết trước hoặc có thể thay đổi. Các ứng viên rõ ràng cho mô hình, trong trường hợp này, bao gồm thể loại sách (ví dụ: Khoa học Viễn tưởng, Thơ Pháp, v.v.) và ngôn ngữ (Tiếng Anh, Pháp, Nhật).

Khi chúng ta đã quyết định về mô hình và trường, chúng ta cần nghĩ về các mối quan hệ. Django cho phép bạn định nghĩa các mối quan hệ một-một (`OneToOneField`), một-nhiều (`ForeignKey`) và nhiều-nhiều (`ManyToManyField`).

Với điều đó trong tâm trí, sơ đồ liên kết UML bên dưới hiển thị các mô hình chúng ta sẽ định nghĩa trong trường hợp này (dưới dạng hộp).

![LocalLibrary Model UML with fixed Author multiplicity inside the Book class](local_library_model_uml.svg)

Chúng tôi đã tạo mô hình cho sách (chi tiết chung của sách), phiên bản sách (trạng thái bản sao vật lý cụ thể của sách có sẵn trong hệ thống), và tác giả. Chúng tôi cũng quyết định có mô hình cho thể loại để các giá trị có thể được tạo/chọn thông qua giao diện quản trị. Chúng tôi quyết định không có mô hình cho `BookInstance:status` — chúng tôi đã mã hóa cứng các giá trị (`LOAN_STATUS`) vì chúng tôi không mong đợi những thứ này thay đổi. Trong mỗi hộp, bạn có thể thấy tên mô hình, tên trường và loại, và cả các phương thức và kiểu trả về của chúng.

Sơ đồ cũng hiển thị các mối quan hệ giữa các mô hình, bao gồm _bội số_ của chúng. Bội số là các số trên sơ đồ hiển thị các số (tối đa và tối thiểu) của mỗi mô hình có thể có mặt trong mối quan hệ. Ví dụ, đường kết nối giữa các hộp cho thấy Book và Genre có liên quan. Các số gần mô hình Genre cho thấy một sách phải có một hoặc nhiều Genre (tùy ý), trong khi các số ở đầu kia của đường gần mô hình Book cho thấy một Genre có thể có không hoặc nhiều sách liên quan.

> [!NOTE]
> Phần tiếp theo cung cấp phần đầu cơ bản giải thích cách mô hình được định nghĩa và sử dụng. Khi bạn đọc nó, hãy xem xét cách chúng ta sẽ xây dựng mỗi mô hình trong sơ đồ ở trên.

## Phần đầu về mô hình

Phần này cung cấp cái nhìn tổng quan ngắn gọn về cách định nghĩa mô hình và một số trường và đối số trường quan trọng hơn.

### Định nghĩa mô hình

Mô hình thường được định nghĩa trong tệp **models.py** của ứng dụng. Chúng được triển khai như các lớp con của `django.db.models.Model`, và có thể bao gồm các trường, phương thức và metadata. Đoạn code dưới đây hiển thị mô hình "điển hình", được đặt tên là `MyModelName`:

```python
from django.db import models
from django.urls import reverse

class MyModelName(models.Model):
    """A typical class defining a model, derived from the Model class."""

    # Fields
    my_field_name = models.CharField(max_length=20, help_text='Enter field documentation')
    # …

    # Metadata
    class Meta:
        ordering = ['-my_field_name']

    # Methods
    def get_absolute_url(self):
        """Returns the URL to access a particular instance of MyModelName."""
        return reverse('model-detail-view', args=[str(self.id)])

    def __str__(self):
        """String for representing the MyModelName object (in Admin site etc.)."""
        return self.my_field_name
```

Trong các phần dưới đây, chúng ta sẽ khám phá từng tính năng bên trong mô hình một cách chi tiết:

#### Các trường

Mô hình có thể có số lượng trường bất kỳ, thuộc bất kỳ loại nào — mỗi trường đại diện cho một cột dữ liệu mà chúng ta muốn lưu trữ trong một trong các bảng cơ sở dữ liệu của chúng ta. Mỗi bản ghi cơ sở dữ liệu (hàng) sẽ bao gồm một trong mỗi giá trị trường. Hãy xem ví dụ bên dưới:

```python
my_field_name = models.CharField(max_length=20, help_text='Enter field documentation')
```

Ví dụ trên của chúng ta có một trường duy nhất gọi là `my_field_name`, thuộc loại `models.CharField` — có nghĩa là trường này sẽ chứa các chuỗi ký tự chữ số. Các loại trường được gán bằng cách sử dụng các lớp cụ thể, xác định loại bản ghi được sử dụng để lưu trữ dữ liệu trong cơ sở dữ liệu, cùng với các tiêu chí xác thực để được sử dụng khi nhận giá trị từ biểu mẫu HTML (tức là những gì tạo thành giá trị hợp lệ). Các loại trường cũng có thể nhận đối số chỉ định thêm cách trường được lưu trữ hoặc có thể sử dụng. Trong trường hợp này chúng ta đang đưa hai đối số cho trường:

- `max_length=20` — Nêu rằng độ dài tối đa của giá trị trong trường này là 20 ký tự.
- `help_text='Enter field documentation'` — văn bản trợ giúp có thể được hiển thị trong biểu mẫu để giúp người dùng hiểu cách sử dụng trường.

Tên trường được sử dụng để tham chiếu đến nó trong các truy vấn và mẫu.
Các trường cũng có nhãn, được chỉ định bằng đối số `verbose_name` (với giá trị mặc định là `None`).
Nếu `verbose_name` không được đặt, nhãn được tạo từ tên trường bằng cách thay thế bất kỳ dấu gạch dưới nào bằng khoảng trắng, và viết hoa chữ cái đầu tiên (ví dụ, trường `my_field_name` sẽ có nhãn mặc định là _My field name_ khi được sử dụng trong biểu mẫu).

Thứ tự mà các trường được khai báo sẽ ảnh hưởng đến thứ tự mặc định của chúng nếu mô hình được hiển thị trong biểu mẫu (ví dụ trong trang Quản trị), mặc dù điều này có thể bị ghi đè.

##### Các đối số trường phổ biến

Các đối số phổ biến sau đây có thể được sử dụng khi khai báo nhiều/hầu hết các loại trường khác nhau:

- [help_text](https://docs.djangoproject.com/en/5.0/ref/models/fields/#help-text): Cung cấp nhãn văn bản cho biểu mẫu HTML (ví dụ trong trang quản trị), như mô tả ở trên.
- [verbose_name](https://docs.djangoproject.com/en/5.0/ref/models/fields/#verbose-name): Tên có thể đọc được cho con người cho trường được sử dụng trong nhãn trường. Nếu không được chỉ định, Django sẽ suy ra verbose name mặc định từ tên trường.
- [default](https://docs.djangoproject.com/en/5.0/ref/models/fields/#default): Giá trị mặc định cho trường. Đây có thể là một giá trị hoặc đối tượng có thể gọi, trong trường hợp đó đối tượng sẽ được gọi mỗi khi một bản ghi mới được tạo.
- [null](https://docs.djangoproject.com/en/5.0/ref/models/fields/#null): Nếu là `True`, Django sẽ lưu trữ các giá trị trống như `NULL` trong cơ sở dữ liệu cho các trường phù hợp (một `CharField` thay vào đó sẽ lưu trữ chuỗi rỗng). Mặc định là `False`.
- [blank](https://docs.djangoproject.com/en/5.0/ref/models/fields/#blank): Nếu là `True`, trường được phép để trống trong biểu mẫu của bạn. Mặc định là `False`, có nghĩa là xác thực biểu mẫu của Django sẽ buộc bạn nhập giá trị. Điều này thường được sử dụng với `null=True`, vì nếu bạn sẽ cho phép các giá trị trống, bạn cũng muốn cơ sở dữ liệu có thể đại diện chúng một cách phù hợp.
- [choices](https://docs.djangoproject.com/en/5.0/ref/models/fields/#choices): Một nhóm lựa chọn cho trường này. Nếu điều này được cung cấp, widget biểu mẫu mặc định tương ứng sẽ là hộp chọn với các lựa chọn này thay vì trường văn bản chuẩn.
- [unique](https://docs.djangoproject.com/en/5.0/ref/models/fields/#unique):
  Nếu là `True`, đảm bảo rằng giá trị trường là duy nhất trên toàn cơ sở dữ liệu.
  Điều này có thể được sử dụng để ngăn chặn sự trùng lặp của các trường không thể có cùng giá trị.
  Mặc định là `False`.
- [primary_key](https://docs.djangoproject.com/en/5.0/ref/models/fields/#primary-key):
  Nếu là `True`, đặt trường hiện tại làm khóa chính cho mô hình (Khóa chính là cột cơ sở dữ liệu đặc biệt được chỉ định để xác định duy nhất tất cả các bản ghi bảng khác nhau).
  Nếu không có trường nào được chỉ định là khóa chính, Django sẽ tự động thêm trường cho mục đích này.
  Loại trường khóa chính được tạo tự động có thể được chỉ định cho mỗi ứng dụng trong [`AppConfig.default_auto_field`](https://docs.djangoproject.com/en/5.0/ref/applications/#django.apps.AppConfig.default_auto_field) hoặc toàn cục trong cài đặt [`DEFAULT_AUTO_FIELD`](https://docs.djangoproject.com/en/5.0/ref/settings/#std:setting-DEFAULT_AUTO_FIELD).

  > [!NOTE]
  > Các ứng dụng được tạo bằng **manage.py** đặt loại khóa chính thành [BigAutoField](https://docs.djangoproject.com/en/5.0/ref/models/fields/#bigautofield).
  > Bạn có thể thấy điều này trong tệp **catalog/apps.py** thư viện cục bộ:
  >
  > ```python
  > class CatalogConfig(AppConfig):
  >   default_auto_field = 'django.db.models.BigAutoField'
  > ```

Có nhiều tùy chọn khác — bạn có thể xem [danh sách đầy đủ tùy chọn trường tại đây](https://docs.djangoproject.com/en/5.0/ref/models/fields/#field-options).

##### Các loại trường phổ biến

Danh sách sau mô tả một số loại trường phổ biến hơn.

- [CharField](https://docs.djangoproject.com/en/5.0/ref/models/fields/#django.db.models.CharField) được sử dụng để định nghĩa các chuỗi có độ dài cố định ngắn đến trung bình. Bạn phải chỉ định `max_length` của dữ liệu được lưu trữ.
- [TextField](https://docs.djangoproject.com/en/5.0/ref/models/fields/#django.db.models.TextField) được sử dụng cho các chuỗi có độ dài tùy ý lớn. Bạn có thể chỉ định `max_length` cho trường, nhưng điều này chỉ được sử dụng khi trường được hiển thị trong biểu mẫu (nó không được thực thi ở cấp độ cơ sở dữ liệu).
- [IntegerField](https://docs.djangoproject.com/en/5.0/ref/models/fields/#django.db.models.IntegerField) là trường để lưu trữ các giá trị số nguyên (số nguyên), và để xác thực các giá trị đã nhập là số nguyên trong biểu mẫu.
- [DateField](https://docs.djangoproject.com/en/5.0/ref/models/fields/#datefield) và [DateTimeField](https://docs.djangoproject.com/en/5.0/ref/models/fields/#datetimefield) được sử dụng để lưu trữ/đại diện cho ngày và thông tin ngày/giờ (là các đối tượng Python `datetime.date` và `datetime.datetime`, tương ứng). Các trường này có thể khai báo thêm các tham số (loại trừ lẫn nhau) `auto_now=True` (để đặt trường thành ngày hiện tại mỗi khi mô hình được lưu), `auto_now_add` (để chỉ đặt ngày khi mô hình được tạo lần đầu), và `default` (để đặt ngày mặc định có thể bị ghi đè bởi người dùng).
- [EmailField](https://docs.djangoproject.com/en/5.0/ref/models/fields/#emailfield) được sử dụng để lưu trữ và xác thực địa chỉ email.
- [FileField](https://docs.djangoproject.com/en/5.0/ref/models/fields/#filefield) và [ImageField](https://docs.djangoproject.com/en/5.0/ref/models/fields/#imagefield) được sử dụng để tải lên tệp và hình ảnh tương ứng (`ImageField` thêm xác thực bổ sung rằng tệp tải lên là hình ảnh). Chúng có các tham số để xác định cách thức và nơi các tệp tải lên được lưu trữ.
- [AutoField](https://docs.djangoproject.com/en/5.0/ref/models/fields/#autofield) là loại `IntegerField` đặc biệt tự động tăng. Khóa chính của loại này được tự động thêm vào mô hình của bạn nếu bạn không chỉ định rõ ràng một khóa.
- [ForeignKey](https://docs.djangoproject.com/en/5.0/ref/models/fields/#foreignkey) được sử dụng để chỉ định mối quan hệ một-nhiều với mô hình cơ sở dữ liệu khác (ví dụ: một chiếc xe có một nhà sản xuất, nhưng một nhà sản xuất có thể làm nhiều xe). Phía "một" của mối quan hệ là mô hình chứa "khóa" (các mô hình chứa "khóa ngoại" tham chiếu đến "khóa" đó, ở phía "nhiều" của mối quan hệ như vậy).
- [ManyToManyField](https://docs.djangoproject.com/en/5.0/ref/models/fields/#manytomanyfield) được sử dụng để chỉ định mối quan hệ nhiều-nhiều (ví dụ: một quyển sách có thể có nhiều thể loại, và mỗi thể loại có thể chứa nhiều sách). Trong ứng dụng thư viện, chúng tôi sẽ sử dụng chúng rất giống với `ForeignKeys`, nhưng chúng có thể được sử dụng theo những cách phức tạp hơn để mô tả các mối quan hệ giữa các nhóm. Chúng có tham số `on_delete` để xác định điều gì xảy ra khi bản ghi liên quan bị xóa (ví dụ: giá trị `models.SET_NULL` sẽ đặt giá trị thành `NULL`).

Có nhiều loại trường khác, bao gồm các trường cho các loại số khác nhau (số nguyên lớn, số nguyên nhỏ, số thực dấu chấm động), booleans, URL, slugs, id duy nhất, và thông tin "liên quan đến thời gian" khác (thời gian chờ, giờ, v.v.). Bạn có thể xem [danh sách đầy đủ tại đây](https://docs.djangoproject.com/en/5.0/ref/models/fields/#field-types).

#### Metadata

Bạn có thể khai báo metadata cấp mô hình cho Mô hình của mình bằng cách khai báo `class Meta`, như được hiển thị.

```python
class Meta:
    ordering = ['-my_field_name']
```

Một trong những tính năng hữu ích nhất của metadata này là kiểm soát _thứ tự sắp xếp mặc định_ của các bản ghi được trả về khi bạn truy vấn loại mô hình. Bạn làm điều này bằng cách chỉ định thứ tự khớp trong danh sách tên trường cho thuộc tính `ordering`, như được hiển thị ở trên. Thứ tự sắp xếp sẽ phụ thuộc vào loại trường (các trường ký tự được sắp xếp theo bảng chữ cái, trong khi các trường ngày được sắp xếp theo thứ tự thời gian). Như được hiển thị ở trên, bạn có thể thêm tiền tố tên trường bằng ký hiệu trừ (-) để đảo ngược thứ tự sắp xếp.

Vì vậy, ví dụ, nếu chúng ta chọn sắp xếp sách như thế này theo mặc định:

```python
ordering = ['title', '-publish_date']
```

các sách sẽ được sắp xếp theo bảng chữ cái theo tiêu đề, từ A-Z, và sau đó theo ngày xuất bản bên trong mỗi tiêu đề, từ mới nhất đến cũ nhất.

Một thuộc tính phổ biến khác là `verbose_name`, tên chi tiết cho lớp ở dạng đơn và số:

```python
verbose_name = 'BetterName'
```

Metadata lớp có thể được sử dụng để tạo và áp dụng "quyền truy cập" mới cho mô hình (quyền mặc định được áp dụng tự động), cho phép sắp xếp dựa trên trường khác, xác định [ràng buộc](https://docs.djangoproject.com/en/5.0/ref/models/constraints/) trên các giá trị có thể của dữ liệu có thể được lưu trữ, hoặc để khai báo rằng lớp là "abstract" (lớp cơ sở mà bạn không thể tạo bản ghi, và thay vào đó sẽ được kế thừa để tạo các mô hình khác).

Nhiều tùy chọn metadata khác kiểm soát cơ sở dữ liệu nào phải được sử dụng cho mô hình và cách dữ liệu được lưu trữ (những điều này thực sự chỉ hữu ích nếu bạn cần ánh xạ mô hình vào cơ sở dữ liệu hiện có).

Danh sách đầy đủ các tùy chọn metadata có sẵn tại đây: [Tùy chọn metadata mô hình](https://docs.djangoproject.com/en/5.0/ref/models/options/) (Django docs).

#### Các phương thức

Mô hình cũng có thể có các phương thức.

**Ở mức tối thiểu, trong mỗi mô hình bạn nên định nghĩa phương thức lớp Python tiêu chuẩn `__str__()` để trả về chuỗi có thể đọc được cho con người cho mỗi đối tượng.** Chuỗi này được sử dụng để đại diện cho các bản ghi riêng lẻ trong trang quản trị (và bất kỳ nơi nào khác bạn cần tham chiếu đến phiên bản mô hình). Thường điều này sẽ trả về trường tiêu đề hoặc tên từ mô hình.

```python
def __str__(self):
    return self.my_field_name
```

Một phương thức phổ biến khác để bao gồm trong các mô hình Django là `get_absolute_url()`, trả về URL để hiển thị các bản ghi mô hình riêng lẻ trên website (nếu bạn định nghĩa phương thức này thì Django sẽ tự động thêm nút "View on Site" vào màn hình chỉnh sửa bản ghi của mô hình trong trang Quản trị). Một mẫu điển hình cho `get_absolute_url()` được hiển thị dưới đây.

```python
def get_absolute_url(self):
    """Returns the URL to access a particular instance of the model."""
    return reverse('model-detail-view', args=[str(self.id)])
```

> [!NOTE]
> Giả sử bạn sẽ sử dụng URL như `/my-application/my-model-name/2` để hiển thị các bản ghi riêng lẻ cho mô hình của bạn (trong đó "2" là `id` cho một bản ghi cụ thể), bạn sẽ cần tạo bộ ánh xạ URL để truyền phản hồi và id đến "khung nhìn chi tiết mô hình" (sẽ thực hiện công việc cần thiết để hiển thị bản ghi). Hàm `reverse()` ở trên có thể "đảo ngược" bộ ánh xạ URL của bạn (trong trường hợp trên được đặt tên là _'model-detail-view'_) để tạo URL theo đúng định dạng.
>
> Tất nhiên để làm cho điều này hoạt động, bạn vẫn phải viết ánh xạ URL, khung nhìn và mẫu!

Bạn cũng có thể định nghĩa bất kỳ phương thức nào bạn thích, và gọi chúng từ code hoặc mẫu (miễn là chúng không nhận bất kỳ tham số nào).

### Quản lý mô hình

Khi bạn đã định nghĩa các lớp mô hình, bạn có thể sử dụng chúng để tạo, cập nhật hoặc xóa các bản ghi, và để chạy truy vấn để lấy tất cả bản ghi hoặc tập hợp con cụ thể của bản ghi. Chúng tôi sẽ chỉ bạn cách làm điều đó trong hướng dẫn khi chúng ta định nghĩa các khung nhìn, nhưng đây là tóm tắt ngắn.

#### Tạo và sửa đổi bản ghi

Để tạo bản ghi bạn có thể định nghĩa phiên bản của mô hình và sau đó gọi `save()`.

```python
# Create a new record using the model's constructor.
record = MyModelName(my_field_name="Instance #1")

# Save the object into the database.
record.save()
```

> [!NOTE]
> Nếu bạn chưa khai báo bất kỳ trường nào là `primary_key`, bản ghi mới sẽ được tự động đặt một khóa, với tên trường `id`. Bạn có thể truy vấn trường này sau khi lưu bản ghi trên, và nó sẽ có giá trị 1.

Bạn có thể truy cập các trường trong bản ghi mới này bằng cú pháp dấu chấm, và thay đổi các giá trị. Bạn phải gọi `save()` để lưu các giá trị đã sửa đổi vào cơ sở dữ liệu.

```python
# Access model field values using Python attributes.
print(record.id) # should return 1 for the first record.
print(record.my_field_name) # should print 'Instance #1'

# Change record by modifying the fields, then calling save().
record.my_field_name = "New Instance Name"
record.save()
```

#### Tìm kiếm bản ghi

Bạn có thể tìm kiếm các bản ghi khớp với một số tiêu chí nhất định bằng thuộc tính `objects` của mô hình (được cung cấp bởi lớp cơ sở).

> [!NOTE]
> Giải thích cách tìm kiếm bản ghi bằng tên mô hình và trường "abstract" có thể hơi khó hiểu. Trong phần thảo luận dưới đây, chúng tôi sẽ tham chiếu đến mô hình `Book` với các trường `title` và `genre`, trong đó genre cũng là mô hình với một trường duy nhất `name`.

Chúng ta có thể lấy tất cả bản ghi cho một mô hình dưới dạng `QuerySet`, sử dụng `objects.all()`. `QuerySet` là đối tượng có thể lặp, có nghĩa là nó chứa một số đối tượng mà chúng ta có thể lặp/vòng qua.

```python
all_books = Book.objects.all()
```

Phương thức `filter()` của Django cho phép chúng ta lọc `QuerySet` được trả về để khớp với trường **văn bản** hoặc **số** được chỉ định theo một số tiêu chí cụ thể. Ví dụ, để lọc các sách có chứa "wild" trong tiêu đề và sau đó đếm chúng, chúng ta có thể làm như sau:

```python
wild_books = Book.objects.filter(title__contains='wild')
number_wild_books = wild_books.count()
```

Các trường để khớp và loại khớp được định nghĩa trong tên tham số bộ lọc, sử dụng định dạng: `field_name__match_type` (lưu ý _dấu gạch dưới kép_ giữa `title` và `contains` ở trên). Ở trên chúng ta đang lọc `title` với một khớp phân biệt chữ hoa chữ thường. Có nhiều loại khớp khác bạn có thể làm: `icontains` (không phân biệt chữ hoa chữ thường), `iexact` (khớp chính xác không phân biệt chữ hoa chữ thường), `exact` (khớp chính xác phân biệt chữ hoa chữ thường) và `in`, `gt` (lớn hơn), `startswith`, v.v. [Danh sách đầy đủ ở đây](https://docs.djangoproject.com/en/5.0/ref/models/querysets/#field-lookups).

Trong một số trường hợp, bạn cần lọc trên trường xác định mối quan hệ một-nhiều với mô hình khác (ví dụ, `ForeignKey`). Trong trường hợp này, bạn có thể "index" đến các trường trong mô hình liên quan bằng các dấu gạch dưới kép bổ sung.
Vì vậy, ví dụ để lọc sách với một mẫu thể loại cụ thể, bạn sẽ phải index đến `name` qua trường `genre`, như được hiển thị dưới đây:

```python
# Will match on: Fiction, Science fiction, non-fiction etc.
books_containing_genre = Book.objects.filter(genre__name__icontains='fiction')
```

> [!NOTE]
> Bạn có thể sử dụng dấu gạch dưới (`__`) để điều hướng nhiều cấp độ quan hệ (`ForeignKey`/`ManyToManyField`) tùy ý.
> Ví dụ, `Book` có các loại khác nhau, được định nghĩa bằng mối quan hệ "cover" thêm, có thể có tên tham số: `type__cover__name__exact='hard'`.

Có nhiều điều bạn có thể làm với truy vấn, bao gồm tìm kiếm ngược từ các mô hình liên quan, nối bộ lọc, trả về tập hợp giá trị nhỏ hơn, v.v. Để biết thêm thông tin, xem [Making queries](https://docs.djangoproject.com/en/5.0/topics/db/queries/) (Django Docs).

## Định nghĩa các mô hình LocalLibrary

Trong phần này chúng ta sẽ bắt đầu định nghĩa các mô hình cho thư viện. Mở `models.py` (trong /django-locallibrary-tutorial/catalog/). Boilerplate ở đầu trang nhập module _models_, chứa lớp cơ sở mô hình `models.Model` mà các mô hình của chúng ta sẽ kế thừa.

```python
from django.db import models

# Create your models here.
```

### Mô hình Genre

Sao chép code mô hình `Genre` được hiển thị dưới đây và dán vào cuối tệp `models.py` của bạn. Mô hình này được sử dụng để lưu trữ thông tin về thể loại sách — ví dụ như văn học hư cấu hay phi hư cấu, lãng mạn hay lịch sử quân sự, v.v.
Như đã đề cập ở trên, chúng tôi đã tạo thể loại như một mô hình thay vì văn bản tự do hoặc danh sách lựa chọn để các giá trị có thể được quản lý thông qua cơ sở dữ liệu thay vì được mã hóa cứng.

```python
from django.urls import reverse # Used in get_absolute_url() to get URL for specified ID

from django.db.models import UniqueConstraint # Constrains fields to unique values
from django.db.models.functions import Lower # Returns lower cased value of field

class Genre(models.Model):
    """Model representing a book genre."""
    name = models.CharField(
        max_length=200,
        unique=True,
        help_text="Enter a book genre (e.g. Science Fiction, French Poetry etc.)"
    )

    def __str__(self):
        """String for representing the Model object."""
        return self.name

    def get_absolute_url(self):
        """Returns the url to access a particular genre instance."""
        return reverse('genre-detail', args=[str(self.id)])

    class Meta:
        constraints = [
            UniqueConstraint(
                Lower('name'),
                name='genre_name_case_insensitive_unique',
                violation_error_message = "Genre already exists (case insensitive match)"
            ),
        ]
```

Mô hình có một trường `CharField` duy nhất (`name`), được sử dụng để mô tả thể loại (điều này được giới hạn 200 ký tự và có một số `help_text`).
Chúng tôi đã đặt trường này là duy nhất (`unique=True`) vì chỉ nên có một bản ghi cho mỗi thể loại.

Sau trường, chúng ta khai báo phương thức `__str__()`, trả về tên của thể loại được định nghĩa bởi một bản ghi cụ thể. Chưa có verbose name được định nghĩa, vì vậy nhãn trường sẽ là `Name` khi nó được sử dụng trong biểu mẫu.
Sau đó chúng ta khai báo phương thức `get_absolute_url()`, trả về URL có thể được sử dụng để truy cập bản ghi chi tiết cho mô hình này (để điều này hoạt động, chúng ta sẽ phải định nghĩa ánh xạ URL có tên `genre-detail`, và định nghĩa khung nhìn và mẫu liên quan).

Đặt `unique=True` trên trường ở trên ngăn các thể loại được tạo với _chính xác_ cùng tên, nhưng không phải các biến thể như "fantasy", "Fantasy", hay thậm chí "FaNtAsY".
Phần cuối của định nghĩa mô hình sử dụng tùy chọn [`constraints`](https://docs.djangoproject.com/en/5.0/ref/models/options/#constraints) trên [metadata](#metadata) của mô hình để chỉ định rằng chữ thường của giá trị trong trường `name` phải là duy nhất trong cơ sở dữ liệu, và hiển thị chuỗi `violation_error_message` nếu không phải.
Ở đây chúng ta không cần làm bất cứ điều gì khác, nhưng bạn có thể định nghĩa nhiều ràng buộc đối với một trường hoặc nhiều trường.
Để biết thêm thông tin xem [Tham chiếu Constraints](https://docs.djangoproject.com/en/5.0/ref/models/constraints/), bao gồm [`UniqueConstraint()`](https://docs.djangoproject.com/en/5.0/ref/models/constraints/#uniqueconstraint) (và [`Lower()`](https://docs.djangoproject.com/en/5.0/ref/models/database-functions/#lower)).

### Mô hình Book

Sao chép mô hình `Book` dưới đây và một lần nữa dán nó vào cuối tệp của bạn. Mô hình `Book` đại diện cho tất cả thông tin về sách có sẵn theo nghĩa chung, nhưng không phải là một "phiên bản" hoặc "bản sao" vật lý cụ thể có sẵn để cho mượn.

Mô hình sử dụng `CharField` để đại diện cho `title` và `isbn` của sách.
Đối với `isbn`, lưu ý cách tham số không có tên đầu tiên đặt nhãn rõ ràng là "ISBN" (nếu không, mặc định sẽ là "Isbn"). Chúng ta cũng đặt tham số `unique` là `true` để đảm bảo tất cả sách có ISBN duy nhất (tham số unique làm cho giá trị trường duy nhất toàn cầu trong bảng).
Không giống như `isbn` (và tên thể loại), `title` không được đặt là duy nhất vì có thể có các sách khác nhau có cùng tên.
Mô hình sử dụng `TextField` cho `summary`, vì văn bản này có thể cần khá dài.

```python
class Book(models.Model):
    """Model representing a book (but not a specific copy of a book)."""
    title = models.CharField(max_length=200)
    author = models.ForeignKey('Author', on_delete=models.RESTRICT, null=True)
    # Foreign Key used because book can only have one author, but authors can have multiple books.
    # Author as a string rather than object because it hasn't been declared yet in file.

    summary = models.TextField(
        max_length=1000, help_text="Enter a brief description of the book")
    isbn = models.CharField('ISBN', max_length=13,
                            unique=True,
                            help_text='13 Character <a href="https://www.isbn-international.org/content/what-isbn'
                                      '">ISBN number</a>')

    # ManyToManyField used because genre can contain many books. Books can cover many genres.
    # Genre class has already been defined so we can specify the object above.
    genre = models.ManyToManyField(
        Genre, help_text="Select a genre for this book")

    def __str__(self):
        """String for representing the Model object."""
        return self.title

    def get_absolute_url(self):
        """Returns the URL to access a detail record for this book."""
        return reverse('book-detail', args=[str(self.id)])
```

Thể loại là `ManyToManyField`, để một sách có thể có nhiều thể loại và một thể loại có thể có nhiều sách. Tác giả được khai báo là `ForeignKey`, vì vậy mỗi sách sẽ chỉ có một tác giả, nhưng một tác giả có thể có nhiều sách (trong thực tế một sách có thể có nhiều tác giả, nhưng không phải trong triển khai này!)

Trong cả hai loại trường, lớp mô hình liên quan được khai báo là tham số không có tên đầu tiên bằng cách sử dụng lớp mô hình hoặc chuỗi chứa tên của mô hình liên quan. Bạn phải sử dụng tên của mô hình dưới dạng chuỗi nếu lớp liên quan chưa được định nghĩa trong tệp này trước khi nó được tham chiếu! Các tham số khác quan tâm trong trường `author` là `null=True`, cho phép cơ sở dữ liệu lưu trữ giá trị `Null` nếu không có tác giả nào được chọn, và `on_delete=models.RESTRICT`, sẽ ngăn tác giả liên quan của sách bị xóa nếu nó được tham chiếu bởi bất kỳ sách nào.

> [!WARNING]
> Theo mặc định `on_delete=models.CASCADE`, có nghĩa là nếu tác giả bị xóa, sách này cũng sẽ bị xóa! Chúng tôi sử dụng `RESTRICT` ở đây, nhưng chúng tôi cũng có thể sử dụng `PROTECT` để ngăn tác giả bị xóa trong khi bất kỳ sách nào sử dụng nó hoặc `SET_NULL` để đặt tác giả của sách thành `Null` nếu bản ghi bị xóa.

Mô hình cũng xác định `__str__()`, sử dụng trường `title` của sách để đại diện cho bản ghi `Book`. Phương thức cuối cùng, `get_absolute_url()` trả về URL có thể được sử dụng để truy cập bản ghi chi tiết cho mô hình này (chúng ta sẽ phải định nghĩa ánh xạ URL có tên `book-detail`, và định nghĩa khung nhìn và mẫu liên quan).

### Mô hình BookInstance

Tiếp theo, sao chép mô hình `BookInstance` (hiển thị dưới đây) dưới các mô hình khác. `BookInstance` đại diện cho bản sao cụ thể của một sách mà ai đó có thể mượn, và bao gồm thông tin về bản sao có sẵn hay ngày dự kiến trả về, thông tin "imprint" hoặc phiên bản, và id duy nhất cho sách trong thư viện.

Một số trường và phương thức sẽ quen thuộc. Mô hình sử dụng:

- `ForeignKey` để xác định `Book` liên quan (mỗi sách có thể có nhiều bản sao, nhưng một bản sao chỉ có thể có một `Book`). Khóa chỉ định `on_delete=models.RESTRICT` để đảm bảo `Book` không thể bị xóa trong khi được tham chiếu bởi `BookInstance`.
- `CharField` để đại diện cho imprint (bản phát hành cụ thể) của sách.

```python
import uuid # Required for unique book instances

class BookInstance(models.Model):

    """Model representing a specific copy of a book (i.e. that can be borrowed from the library)."""
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          help_text="Unique ID for this particular book across whole library")
    book = models.ForeignKey('Book', on_delete=models.RESTRICT, null=True)
    imprint = models.CharField(max_length=200)
    due_back = models.DateField(null=True, blank=True)

    LOAN_STATUS = (
        ('m', 'Maintenance'),
        ('o', 'On loan'),
        ('a', 'Available'),
        ('r', 'Reserved'),
    )

    status = models.CharField(
        max_length=1,
        choices=LOAN_STATUS,
        blank=True,
        default='m',
        help_text='Book availability',
    )

    class Meta:
        ordering = ['due_back']

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.id} ({self.book.title})'
```

Chúng tôi cũng khai báo thêm một số loại trường mới:

- `UUIDField` được sử dụng cho trường `id` để đặt nó là `primary_key` cho mô hình này.
  Loại trường này phân bổ một giá trị duy nhất toàn cầu cho mỗi phiên bản (một cho mỗi sách bạn có thể tìm thấy trong thư viện).
- `DateField` được sử dụng cho ngày `due_back` (ngày mà sách dự kiến trở nên sẵn có sau khi được mượn hoặc đang bảo trì). Giá trị này có thể là `blank` hoặc `null` (cần thiết khi sách có sẵn). Metadata mô hình (`Class Meta`) sử dụng trường này để sắp xếp bản ghi khi chúng được trả về trong truy vấn.
- `status` là `CharField` định nghĩa danh sách lựa chọn/chọn. Như bạn có thể thấy, chúng ta định nghĩa một tuple chứa các tuple của cặp khóa-giá trị và truyền nó đến đối số choices. Giá trị trong cặp khóa/giá trị là giá trị hiển thị mà người dùng có thể chọn, trong khi các khóa là các giá trị thực sự được lưu nếu tùy chọn được chọn. Chúng ta cũng đặt giá trị mặc định là 'm' (maintenance) vì sách ban đầu sẽ được tạo không sẵn có trước khi chúng được xếp lên kệ.

Phương thức `__str__()` đại diện cho đối tượng `BookInstance` bằng cách sử dụng kết hợp id duy nhất của nó và tiêu đề `Book` liên quan.

> [!NOTE]
> Một chút Python:
>
> - Bắt đầu từ Python 3.6, bạn có thể sử dụng cú pháp nội suy chuỗi (còn được gọi là f-strings): `f'{self.id} ({self.book.title})'`.
> - Trong các phiên bản cũ hơn của hướng dẫn này, chúng tôi đã sử dụng cú pháp [chuỗi định dạng](https://peps.python.org/pep-3101/), cũng là cách hợp lệ để định dạng chuỗi trong Python (ví dụ: `'{0} ({1})'.format(self.id,self.book.title)`).

### Mô hình Author

Sao chép mô hình `Author` (hiển thị dưới đây) dưới code hiện có trong **models.py**.

```python
class Author(models.Model):
    """Model representing an author."""
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    date_of_birth = models.DateField(null=True, blank=True)
    date_of_death = models.DateField('Died', null=True, blank=True)

    class Meta:
        ordering = ['last_name', 'first_name']

    def get_absolute_url(self):
        """Returns the URL to access a particular author instance."""
        return reverse('author-detail', args=[str(self.id)])

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.last_name}, {self.first_name}'
```

Tất cả các trường/phương thức bây giờ sẽ quen thuộc. Mô hình định nghĩa một tác giả là có tên, họ và ngày sinh và tử (cả hai đều tùy chọn). Nó chỉ định rằng theo mặc định `__str__()` trả về tên theo thứ tự _họ_, _tên_. Phương thức `get_absolute_url()` đảo ngược ánh xạ URL `author-detail` để lấy URL để hiển thị một tác giả riêng lẻ.

## Chạy lại di chuyển cơ sở dữ liệu

Tất cả các mô hình của bạn đã được tạo. Bây giờ hãy chạy lại di chuyển cơ sở dữ liệu để thêm chúng vào cơ sở dữ liệu của bạn.

```bash
python3 manage.py makemigrations
python3 manage.py migrate
```

## Mô hình Language — thách thức

Hãy tưởng tượng một nhà hảo tâm cục bộ tặng một số sách mới được viết bằng ngôn ngữ khác (chẳng hạn, tiếng Farsi). Thách thức là tìm ra cách những cuốn sách này sẽ được đại diện tốt nhất trong website thư viện của chúng ta, và sau đó thêm chúng vào mô hình.

Một số điều cần xem xét:

- "Ngôn ngữ" có nên liên kết với `Book`, `BookInstance`, hay đối tượng khác không?
- Các ngôn ngữ khác nhau có nên được đại diện bằng mô hình, trường văn bản tự do hay danh sách lựa chọn cứng không?

Sau khi bạn đã quyết định, hãy thêm trường. Bạn có thể xem những gì chúng tôi quyết định [cho dự án của chúng tôi trên GitHub](https://github.com/mdn/django-locallibrary-tutorial/blob/main/catalog/models.py).

Đừng quên rằng sau khi thay đổi mô hình, bạn nên chạy lại di chuyển cơ sở dữ liệu để thêm các thay đổi.

```bash
python3 manage.py makemigrations
python3 manage.py migrate
```

## Tóm tắt

Trong bài viết này, chúng ta đã học cách định nghĩa mô hình, và sau đó sử dụng thông tin này để thiết kế và triển khai các mô hình phù hợp cho website _LocalLibrary_.

Tại thời điểm này, chúng ta sẽ tạm thời chuyển hướng khỏi việc tạo trang và kiểm tra _Trang quản trị Django_. Trang này sẽ cho phép chúng ta thêm một số dữ liệu vào thư viện, sau đó chúng ta có thể hiển thị bằng cách sử dụng các khung nhìn và mẫu (chưa được tạo).

## Xem thêm

- [Writing your first Django app, part 2](https://docs.djangoproject.com/en/5.0/intro/tutorial02/) (Django docs)
- [Making queries](https://docs.djangoproject.com/en/5.0/topics/db/queries/) (Django Docs)
- [QuerySet API Reference](https://docs.djangoproject.com/en/5.0/ref/models/querysets/) (Django Docs)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/skeleton_website", "Learn_web_development/Extensions/Server-side/Django/Admin_site", "Learn_web_development/Extensions/Server-side/Django")}}
