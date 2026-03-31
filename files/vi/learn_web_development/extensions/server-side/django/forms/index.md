---
title: "Hướng dẫn Django Phần 9: Làm việc với biểu mẫu"
short-title: "9: Biểu mẫu"
slug: Learn_web_development/Extensions/Server-side/Django/Forms
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Sessions", "Learn_web_development/Extensions/Server-side/Django/Testing", "Learn_web_development/Extensions/Server-side/Django")}}

Trong hướng dẫn này, chúng ta sẽ trình bày cách làm việc với các Biểu mẫu HTML trong Django, và đặc biệt là cách dễ nhất để viết biểu mẫu để tạo, cập nhật và xóa các thể hiện mô hình. Là một phần của bài trình diễn này, chúng ta sẽ mở rộng trang web [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website) để thủ thư có thể gia hạn sách, và tạo, cập nhật, xóa tác giả bằng cách sử dụng các biểu mẫu của riêng chúng ta (thay vì sử dụng ứng dụng admin).

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hoàn thành tất cả các chủ đề hướng dẫn trước, bao gồm
        <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Authentication">Django Tutorial Part 8: User authentication and permissions</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu cách viết biểu mẫu để lấy thông tin từ người dùng và cập nhật cơ sở dữ liệu.
        Hiểu cách các khung nhìn chỉnh sửa tổng quát dựa trên lớp có thể đơn giản hóa đáng kể việc tạo biểu mẫu để làm việc với một mô hình đơn.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Một [Biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms) là một nhóm một hoặc nhiều trường/widget trên một trang web, có thể được sử dụng để thu thập thông tin từ người dùng để gửi đến máy chủ. Biểu mẫu là một cơ chế linh hoạt để thu thập đầu vào của người dùng vì có các widget phù hợp để nhập nhiều loại dữ liệu khác nhau, bao gồm hộp văn bản, hộp kiểm, nút radio, bộ chọn ngày, v.v. Biểu mẫu cũng là một cách tương đối an toàn để chia sẻ dữ liệu với máy chủ, vì chúng cho phép chúng ta gửi dữ liệu trong các yêu cầu `POST` với bảo vệ giả mạo yêu cầu xuyên trang.

Trong khi chúng ta chưa tạo bất kỳ biểu mẫu nào trong hướng dẫn này cho đến nay, chúng ta đã gặp chúng trong trang admin Django — ví dụ, ảnh chụp màn hình bên dưới cho thấy một biểu mẫu để chỉnh sửa một trong các mô hình [Book](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Models) của chúng ta, bao gồm một số danh sách lựa chọn và trình soạn thảo văn bản.

![Admin Site - Book Add](admin_book_add.png)

Làm việc với biểu mẫu có thể phức tạp! Các nhà phát triển cần viết HTML cho biểu mẫu, xác thực và làm sạch đúng cách dữ liệu được nhập trên máy chủ (và có thể cả trong trình duyệt), đăng lại biểu mẫu với thông báo lỗi để thông báo cho người dùng về bất kỳ trường không hợp lệ nào, xử lý dữ liệu khi đã gửi thành công, và cuối cùng phản hồi người dùng theo một cách nào đó để chỉ ra thành công. _Django Forms_ thực hiện nhiều công việc ra khỏi tất cả các bước này, bằng cách cung cấp một framework cho phép bạn định nghĩa biểu mẫu và các trường của chúng theo lập trình, và sau đó sử dụng các đối tượng này để vừa tạo code HTML biểu mẫu vừa xử lý phần lớn việc xác thực và tương tác người dùng.

Trong hướng dẫn này, chúng ta sẽ trình bày cho bạn một vài cách bạn có thể tạo và làm việc với biểu mẫu, và đặc biệt là cách các khung nhìn chỉnh sửa tổng quát có thể giảm đáng kể lượng công việc bạn cần làm để tạo biểu mẫu để thao tác với các mô hình của mình. Trong quá trình đó, chúng ta sẽ mở rộng ứng dụng _LocalLibrary_ của mình bằng cách thêm một biểu mẫu để cho phép thủ thư gia hạn sách thư viện, và chúng ta sẽ tạo các trang để tạo, chỉnh sửa và xóa sách và tác giả (tái tạo một phiên bản cơ bản của biểu mẫu được hiển thị ở trên để chỉnh sửa sách).

## Biểu mẫu HTML

Đầu tiên, một tổng quan ngắn gọn về [Biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms). Hãy xem xét một biểu mẫu HTML đơn giản, với một trường văn bản đơn để nhập tên của một số "đội", và nhãn liên quan:

![Simple name field example in HTML form](form_example_name_field.png)

Biểu mẫu được định nghĩa trong HTML như một tập hợp các phần tử bên trong các thẻ `<form>…</form>`, chứa ít nhất một phần tử `input` của `type="submit"`.

```html
<form action="/team_name_url/" method="post">
  <label for="team_name">Enter name: </label>
  <input
    id="team_name"
    type="text"
    name="name_field"
    value="Default name for team." />
  <input type="submit" value="OK" />
</form>
```

Trong khi ở đây chúng ta chỉ có một trường văn bản để nhập tên đội, một biểu mẫu _có thể_ có bất kỳ số lượng phần tử đầu vào nào khác và các nhãn liên quan. Thuộc tính `type` của trường xác định loại widget nào sẽ được hiển thị. `name` và `id` của trường được sử dụng để xác định trường trong JavaScript/CSS/HTML, trong khi `value` định nghĩa giá trị ban đầu cho trường khi nó được hiển thị lần đầu. Nhãn đội khớp được chỉ định bằng thẻ `label` (xem "Enter name" ở trên), với trường `for` chứa giá trị `id` của `input` liên quan.

Đầu vào `submit` sẽ được hiển thị như một nút theo mặc định.
Nút này có thể được nhấn để tải lên dữ liệu trong tất cả các phần tử đầu vào khác trong biểu mẫu đến máy chủ (trong trường hợp này, chỉ là trường `team_name`).
Các thuộc tính biểu mẫu định nghĩa phương thức HTTP `method` được sử dụng để gửi dữ liệu và đích của dữ liệu trên máy chủ (`action`):

- `action`: Tài nguyên/URL nơi dữ liệu sẽ được gửi để xử lý khi biểu mẫu được gửi. Nếu điều này không được đặt (hoặc đặt thành chuỗi trống), thì biểu mẫu sẽ được gửi trở lại URL trang hiện tại.
- `method`: Phương thức HTTP được sử dụng để gửi dữ liệu: _post_ hoặc _get_.
  - Phương thức `POST` nên luôn được sử dụng nếu dữ liệu sẽ dẫn đến thay đổi cơ sở dữ liệu của máy chủ, vì nó có thể được làm cho chống lại các cuộc tấn công giả mạo yêu cầu xuyên trang hơn.
  - Phương thức `GET` chỉ nên được sử dụng cho các biểu mẫu không thay đổi dữ liệu người dùng (ví dụ: biểu mẫu tìm kiếm). Được khuyến nghị khi bạn muốn có thể đặt bookmark hoặc chia sẻ URL.

Vai trò của máy chủ đầu tiên là hiển thị trạng thái biểu mẫu ban đầu — chứa các trường trống hoặc được điền trước với các giá trị ban đầu. Sau khi người dùng nhấn nút gửi, máy chủ sẽ nhận dữ liệu biểu mẫu với các giá trị từ trình duyệt web và phải xác thực thông tin. Nếu biểu mẫu chứa dữ liệu không hợp lệ, máy chủ sẽ hiển thị lại biểu mẫu, lần này với dữ liệu người dùng nhập trong các trường "hợp lệ" và thông báo để mô tả vấn đề cho các trường không hợp lệ. Khi máy chủ nhận được yêu cầu với tất cả dữ liệu biểu mẫu hợp lệ, nó có thể thực hiện hành động thích hợp (chẳng hạn: lưu dữ liệu, trả về kết quả tìm kiếm, tải lên tệp, v.v.) và sau đó thông báo cho người dùng.

Như bạn có thể tưởng tượng, tạo HTML, xác thực dữ liệu được trả về, hiển thị lại dữ liệu đã nhập với các báo cáo lỗi nếu cần, và thực hiện thao tác mong muốn trên dữ liệu hợp lệ đều có thể tốn khá nhiều nỗ lực. Django làm cho điều này dễ dàng hơn nhiều bằng cách giảm bớt một số công việc nặng nhọc và code lặp lại!

## Quy trình xử lý biểu mẫu Django

Xử lý biểu mẫu của Django sử dụng tất cả các kỹ thuật tương tự mà chúng ta đã học trong các hướng dẫn trước (để hiển thị thông tin về các mô hình của chúng ta): khung nhìn nhận yêu cầu, thực hiện bất kỳ hành động nào cần thiết bao gồm đọc dữ liệu từ các mô hình, sau đó tạo và trả về một trang HTML (từ một mẫu, chúng ta truyền một _ngữ cảnh_ chứa dữ liệu sẽ được hiển thị vào đó). Điều làm cho mọi thứ phức tạp hơn là máy chủ cũng cần có thể xử lý dữ liệu được cung cấp bởi người dùng, và hiển thị lại trang nếu có bất kỳ lỗi nào.

Sơ đồ luồng quy trình về cách Django xử lý các yêu cầu biểu mẫu được hiển thị bên dưới, bắt đầu với yêu cầu đến một trang chứa biểu mẫu (được hiển thị bằng màu xanh lá).

![Updated form handling process doc.](form_handling_-_standard.png)

Dựa trên sơ đồ trên, những điều chính mà việc xử lý biểu mẫu của Django thực hiện là:

1. Hiển thị biểu mẫu mặc định lần đầu tiên nó được yêu cầu bởi người dùng.
   - Biểu mẫu có thể chứa các trường trống nếu bạn đang tạo một bản ghi mới, hoặc nó có thể được điền trước với các giá trị ban đầu (ví dụ: nếu bạn đang thay đổi một bản ghi, hoặc có các giá trị ban đầu mặc định hữu ích).
   - Biểu mẫu được gọi là _không ràng buộc_ tại thời điểm này, vì nó không liên kết với bất kỳ dữ liệu người dùng nhập nào (mặc dù nó có thể có các giá trị ban đầu).

2. Nhận dữ liệu từ yêu cầu gửi và ràng buộc nó với biểu mẫu.
   - Ràng buộc dữ liệu với biểu mẫu có nghĩa là dữ liệu người dùng nhập và bất kỳ lỗi nào có sẵn khi chúng ta cần hiển thị lại biểu mẫu.

3. Làm sạch và xác thực dữ liệu.
   - Làm sạch dữ liệu thực hiện việc làm sạch các trường đầu vào, chẳng hạn như loại bỏ các ký tự không hợp lệ có thể được sử dụng để gửi nội dung độc hại đến máy chủ, và chuyển đổi chúng thành các kiểu Python nhất quán.
   - Xác thực kiểm tra xem các giá trị có phù hợp với trường không (ví dụ: chúng có trong phạm vi ngày đúng, không quá ngắn hoặc quá dài, v.v.)

4. Nếu bất kỳ dữ liệu nào không hợp lệ, hãy hiển thị lại biểu mẫu, lần này với bất kỳ giá trị người dùng điền và thông báo lỗi cho các trường có vấn đề.
5. Nếu tất cả dữ liệu hợp lệ, hãy thực hiện các hành động cần thiết (chẳng hạn như lưu dữ liệu, gửi email, trả về kết quả tìm kiếm, tải lên tệp, v.v.).
6. Khi tất cả các hành động hoàn tất, hãy chuyển hướng người dùng đến trang khác.

Django cung cấp một số công cụ và cách tiếp cận để giúp bạn với các tác vụ được chi tiết ở trên. Cơ bản nhất là lớp `Form`, đơn giản hóa cả việc tạo HTML biểu mẫu và làm sạch/xác thực dữ liệu. Trong phần tiếp theo, chúng ta mô tả cách biểu mẫu hoạt động bằng cách sử dụng ví dụ thực tế của một trang để cho phép thủ thư gia hạn sách.

> [!NOTE]
> Hiểu cách `Form` được sử dụng sẽ giúp bạn khi chúng ta thảo luận về các lớp framework biểu mẫu "cấp cao" hơn của Django.

## Biểu mẫu gia hạn sách sử dụng Form và khung nhìn hàm

Tiếp theo, chúng ta sẽ thêm một trang để cho phép thủ thư gia hạn sách đã mượn. Để làm điều này chúng ta sẽ tạo một biểu mẫu cho phép người dùng nhập giá trị ngày. Chúng ta sẽ cung cấp cho trường một giá trị ban đầu là 3 tuần kể từ ngày hiện tại (khoảng thời gian mượn thông thường), và thêm một số xác thực để đảm bảo rằng thủ thư không thể nhập ngày trong quá khứ hoặc ngày quá xa trong tương lai. Khi đã nhập ngày hợp lệ, chúng ta sẽ ghi nó vào trường `BookInstance.due_back` của bản ghi hiện tại.

Ví dụ này sẽ sử dụng một khung nhìn dựa trên hàm và một lớp `Form`. Các phần sau giải thích cách biểu mẫu hoạt động, và những thay đổi bạn cần thực hiện đối với dự án _LocalLibrary_ đang diễn ra của chúng ta.

### Biểu mẫu

Lớp `Form` là trung tâm của hệ thống xử lý biểu mẫu của Django. Nó chỉ định các trường trong biểu mẫu, bố cục của chúng, widget hiển thị, nhãn, giá trị ban đầu, các giá trị hợp lệ, và (một khi đã xác thực) các thông báo lỗi liên kết với các trường không hợp lệ. Lớp cũng cung cấp các phương thức để hiển thị chính nó trong các mẫu bằng cách sử dụng các định dạng được xác định trước (bảng, danh sách, v.v.) hoặc để lấy giá trị của bất kỳ phần tử nào (cho phép hiển thị thủ công chi tiết).

#### Khai báo một Form

Cú pháp khai báo cho một `Form` rất giống với khai báo một `Model`, và chia sẻ cùng các kiểu trường (và một số tham số tương tự). Điều này có lý vì trong cả hai trường hợp chúng ta cần đảm bảo rằng mỗi trường xử lý đúng loại dữ liệu, bị hạn chế đối với dữ liệu hợp lệ, và có mô tả để hiển thị/tài liệu.

Dữ liệu biểu mẫu được lưu trữ trong tệp forms.py của ứng dụng, bên trong thư mục ứng dụng. Tạo và mở tệp **django-locallibrary-tutorial/catalog/forms.py**. Để tạo một `Form`, chúng ta import thư viện `forms`, kế thừa từ lớp `Form`, và khai báo các trường của biểu mẫu. Một lớp biểu mẫu rất cơ bản cho biểu mẫu gia hạn sách thư viện của chúng ta được hiển thị bên dưới — thêm điều này vào tệp mới của bạn:

```python
from django import forms

class RenewBookForm(forms.Form):
    renewal_date = forms.DateField(help_text="Enter a date between now and 4 weeks (default 3).")
```

#### Các trường biểu mẫu

Trong trường hợp này, chúng ta có một [`DateField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#datefield) duy nhất để nhập ngày gia hạn sẽ hiển thị trong HTML với giá trị trống, nhãn mặc định "_Renewal date:_", và một số văn bản sử dụng hữu ích: "_Enter a date between now and 4 weeks (default 3 weeks)._" Vì không có đối số tùy chọn nào khác được chỉ định, trường sẽ chấp nhận ngày bằng cách sử dụng [input_formats](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#django.forms.DateField.input_formats): YYYY-MM-DD (2024-11-06), MM/DD/YYYY (02/26/2024), MM/DD/YY (10/25/24), và sẽ được hiển thị bằng cách sử dụng [widget](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#widget) mặc định: [DateInput](https://docs.djangoproject.com/en/5.0/ref/forms/widgets/#django.forms.DateInput).

Có nhiều loại trường biểu mẫu khác, mà bạn phần lớn sẽ nhận ra từ sự tương đồng của chúng với các lớp trường mô hình tương đương:

- [`BooleanField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#booleanfield)
- [`CharField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#charfield)
- [`ChoiceField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#choicefield)
- [`TypedChoiceField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#typedchoicefield)
- [`DateField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#datefield)
- [`DateTimeField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#datetimefield)
- [`DecimalField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#decimalfield)
- [`DurationField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#durationfield)
- [`EmailField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#emailfield)
- [`FileField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#filefield)
- [`FilePathField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#filepathfield)
- [`FloatField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#floatfield)
- [`ImageField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#imagefield)
- [`IntegerField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#integerfield)
- [`GenericIPAddressField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#genericipaddressfield)
- [`MultipleChoiceField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#multiplechoicefield)
- [`TypedMultipleChoiceField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#typedmultiplechoicefield)
- [`NullBooleanField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#nullbooleanfield)
- [`RegexField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#regexfield)
- [`SlugField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#slugfield)
- [`TimeField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#timefield)
- [`URLField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#urlfield)
- [`UUIDField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#uuidfield)
- [`ComboField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#combofield)
- [`MultiValueField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#multivaluefield)
- [`SplitDateTimeField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#splitdatetimefield)
- [`ModelMultipleChoiceField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#modelmultiplechoicefield)
- [`ModelChoiceField`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#modelchoicefield)

Các đối số chung cho hầu hết các trường được liệt kê bên dưới (các đối số này có các giá trị mặc định hợp lý):

- [`required`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#required): Nếu `True`, trường không thể để trống hoặc được cấp giá trị `None`. Các trường được yêu cầu theo mặc định, vì vậy bạn sẽ đặt `required=False` để cho phép các giá trị trống trong biểu mẫu.
- [`label`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#label): Nhãn để sử dụng khi hiển thị trường trong HTML. Nếu [label](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#label) không được chỉ định, Django sẽ tạo một cái từ tên trường bằng cách viết hoa chữ cái đầu tiên và thay thế dấu gạch dưới bằng dấu cách (ví dụ: _Renewal date_).
- [`label_suffix`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#label-suffix): Theo mặc định, dấu hai chấm được hiển thị sau nhãn (ví dụ: Renewal date&ZeroWidthSpace;**:**). Đối số này cho phép bạn chỉ định một hậu tố khác chứa các ký tự khác.
- [`initial`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#initial): Giá trị ban đầu cho trường khi biểu mẫu được hiển thị.
- [`widget`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#widget): Widget hiển thị để sử dụng.
- [`help_text`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#help-text) (như được thấy trong ví dụ trên): Văn bản bổ sung có thể được hiển thị trong biểu mẫu để giải thích cách sử dụng trường.
- [`error_messages`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#error-messages): Danh sách thông báo lỗi cho trường. Bạn có thể ghi đè chúng bằng các thông báo của riêng bạn nếu cần.
- [`validators`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#validators): Danh sách các hàm sẽ được gọi trên trường khi nó được xác thực.
- [`localize`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#localize): Bật bản địa hóa đầu vào dữ liệu biểu mẫu (xem liên kết để biết thêm thông tin).
- [`disabled`](https://docs.djangoproject.com/en/5.0/ref/forms/fields/#disabled): Trường được hiển thị nhưng giá trị của nó không thể chỉnh sửa nếu điều này là `True`. Mặc định là `False`.

#### Xác thực

Django cung cấp nhiều nơi bạn có thể xác thực dữ liệu của mình. Cách dễ nhất để xác thực một trường duy nhất là ghi đè phương thức `clean_<field_name>()` cho trường bạn muốn kiểm tra. Vì vậy, ví dụ, chúng ta có thể xác thực rằng các giá trị `renewal_date` đã nhập là từ bây giờ đến 4 tuần bằng cách triển khai `clean_renewal_date()` như được hiển thị bên dưới.

Cập nhật tệp forms.py của bạn để trông như thế này:

```python
import datetime

from django import forms

from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

class RenewBookForm(forms.Form):
    renewal_date = forms.DateField(help_text="Enter a date between now and 4 weeks (default 3).")

    def clean_renewal_date(self):
        data = self.cleaned_data['renewal_date']

        # Check if a date is not in the past.
        if data < datetime.date.today():
            raise ValidationError(_('Invalid date - renewal in past'))

        # Check if a date is in the allowed range (+4 weeks from today).
        if data > datetime.date.today() + datetime.timedelta(weeks=4):
            raise ValidationError(_('Invalid date - renewal more than 4 weeks ahead'))

        # Remember to always return the cleaned data.
        return data
```

Có hai điều quan trọng cần lưu ý. Điều đầu tiên là chúng ta lấy dữ liệu của mình bằng cách sử dụng `self.cleaned_data['renewal_date']` và chúng ta trả về dữ liệu này cho dù chúng ta có thay đổi nó ở cuối hàm hay không.
Bước này giúp chúng ta lấy dữ liệu được "làm sạch" và khử nhiễm đầu vào có thể không an toàn bằng cách sử dụng các trình xác thực mặc định, và được chuyển đổi thành kiểu tiêu chuẩn đúng cho dữ liệu (trong trường hợp này là đối tượng Python `datetime.datetime`).

Điểm thứ hai là nếu một giá trị nằm ngoài phạm vi của chúng ta, chúng ta tạo ra một `ValidationError`, chỉ định văn bản lỗi mà chúng ta muốn hiển thị trong biểu mẫu nếu nhập giá trị không hợp lệ.
Ví dụ trên cũng bao quanh văn bản này trong một trong [các hàm dịch](https://docs.djangoproject.com/en/5.0/topics/i18n/translation/) của Django, `gettext_lazy()` (được import dưới dạng `_()`), đây là thực hành tốt nếu bạn muốn dịch trang web của mình sau này.

> [!NOTE]
> Có nhiều phương thức và ví dụ khác để xác thực biểu mẫu trong [Form and field validation](https://docs.djangoproject.com/en/5.0/ref/forms/validation/) (Tài liệu Django). Ví dụ, trong trường hợp bạn có nhiều trường phụ thuộc vào nhau, bạn có thể ghi đè hàm [Form.clean()](https://docs.djangoproject.com/en/5.0/ref/forms/api/#django.forms.Form.clean) và tạo ra `ValidationError` một lần nữa.

Đó là tất cả những gì chúng ta cần cho biểu mẫu trong ví dụ này!

### Cấu hình URL

Trước khi tạo khung nhìn, hãy thêm cấu hình URL cho trang _renew-books_. Sao chép cấu hình sau vào cuối **django-locallibrary-tutorial/catalog/urls.py**:

```python
urlpatterns += [
    path('book/<uuid:pk>/renew/', views.renew_book_librarian, name='renew-book-librarian'),
]
```

Cấu hình URL sẽ chuyển hướng URL có định dạng **/catalog/book/_\<bookinstance_id>_/renew/** đến hàm có tên `renew_book_librarian()` trong **views.py**, và gửi id `BookInstance` như tham số được đặt tên là `pk`. Mẫu chỉ khớp nếu `pk` là một `uuid` được định dạng đúng.

> [!NOTE]
> Chúng ta có thể đặt tên cho dữ liệu URL đã nắm bắt của mình bất kỳ điều gì chúng ta muốn, vì chúng ta có toàn quyền kiểm soát hàm khung nhìn (chúng ta không sử dụng lớp khung nhìn chi tiết tổng quát mong đợi các tham số có tên nhất định). Tuy nhiên, `pk` viết tắt của "khóa chính", là một quy ước hợp lý để sử dụng!

### Khung nhìn

Như đã thảo luận trong [Quy trình xử lý biểu mẫu Django](#django_form_handling_process) ở trên, khung nhìn phải hiển thị biểu mẫu mặc định khi nó được gọi lần đầu tiên và sau đó hiển thị lại nó với thông báo lỗi nếu dữ liệu không hợp lệ, hoặc xử lý dữ liệu và chuyển hướng đến một trang mới nếu dữ liệu hợp lệ. Để thực hiện các hành động khác nhau này, khung nhìn phải có thể biết liệu nó có được gọi lần đầu tiên để hiển thị biểu mẫu mặc định hay lần sau để xác thực dữ liệu.

Đối với các biểu mẫu sử dụng yêu cầu `POST` để gửi thông tin đến máy chủ, mẫu phổ biến nhất là để khung nhìn kiểm thử đối với loại yêu cầu `POST` (`if request.method == 'POST':`) để xác định các yêu cầu xác thực biểu mẫu và `GET` (sử dụng điều kiện `else`) để xác định yêu cầu tạo biểu mẫu ban đầu. Nếu bạn muốn gửi dữ liệu của mình bằng cách sử dụng yêu cầu `GET`, thì cách tiếp cận điển hình để xác định đây là lần gọi khung nhìn đầu tiên hay lần sau là đọc dữ liệu biểu mẫu (ví dụ: đọc giá trị ẩn trong biểu mẫu).

Quy trình gia hạn sách sẽ ghi vào cơ sở dữ liệu của chúng ta, vì vậy, theo quy ước, chúng ta sử dụng cách tiếp cận yêu cầu `POST`.
Đoạn code bên dưới hiển thị mẫu (rất tiêu chuẩn) cho loại khung nhìn hàm này.

```python
import datetime

from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from django.urls import reverse

from catalog.forms import RenewBookForm

def renew_book_librarian(request, pk):
    book_instance = get_object_or_404(BookInstance, pk=pk)

    # If this is a POST request then process the Form data
    if request.method == 'POST':

        # Create a form instance and populate it with data from the request (binding):
        form = RenewBookForm(request.POST)

        # Check if the form is valid:
        if form.is_valid():
            # process the data in form.cleaned_data as required (here we just write it to the model due_back field)
            book_instance.due_back = form.cleaned_data['renewal_date']
            book_instance.save()

            # redirect to a new URL:
            return HttpResponseRedirect(reverse('all-borrowed'))

    # If this is a GET (or any other method) create the default form.
    else:
        proposed_renewal_date = datetime.date.today() + datetime.timedelta(weeks=3)
        form = RenewBookForm(initial={'renewal_date': proposed_renewal_date})

    context = {
        'form': form,
        'book_instance': book_instance,
    }

    return render(request, 'catalog/book_renew_librarian.html', context)
```

Đầu tiên, chúng ta import biểu mẫu của mình (`RenewBookForm`) và một số đối tượng/phương thức hữu ích khác được sử dụng trong phần thân của hàm khung nhìn:

- [`get_object_or_404()`](https://docs.djangoproject.com/en/5.0/topics/http/shortcuts/#get-object-or-404): Trả về một đối tượng được chỉ định từ một mô hình dựa trên giá trị khóa chính của nó, và tạo ra ngoại lệ `Http404` (không tìm thấy) nếu bản ghi không tồn tại.
- [`HttpResponseRedirect`](https://docs.djangoproject.com/en/5.0/ref/request-response/#django.http.HttpResponseRedirect): Tạo ra một chuyển hướng đến một URL được chỉ định (mã trạng thái HTTP 302).
- [`reverse()`](https://docs.djangoproject.com/en/5.0/ref/urlresolvers/#django.urls.reverse): Tạo ra một URL từ tên cấu hình URL và một tập hợp đối số. Đây là tương đương Python của thẻ `url` mà chúng ta đã sử dụng trong các mẫu.
- [`datetime`](https://docs.python.org/3/library/datetime.html): Một thư viện Python để thao tác ngày và giờ.

Trong khung nhìn, trước tiên chúng ta sử dụng đối số `pk` trong `get_object_or_404()` để lấy `BookInstance` hiện tại (nếu không tồn tại, khung nhìn sẽ thoát ngay lập tức và trang sẽ hiển thị lỗi "không tìm thấy").
Nếu đây _không_ phải là yêu cầu `POST` (được xử lý bởi mệnh đề `else`), thì chúng ta tạo biểu mẫu mặc định truyền vào giá trị `initial` cho trường `renewal_date`, 3 tuần kể từ ngày hiện tại.

```python
book_instance = get_object_or_404(BookInstance, pk=pk)

# If this is a GET (or any other method) create the default form
else:
    proposed_renewal_date = datetime.date.today() + datetime.timedelta(weeks=3)
    form = RenewBookForm(initial={'renewal_date': proposed_renewal_date})

context = {
    'form': form,
    'book_instance': book_instance,
}

return render(request, 'catalog/book_renew_librarian.html', context)
```

Sau khi tạo biểu mẫu, chúng ta gọi `render()` để tạo trang HTML, chỉ định mẫu và ngữ cảnh chứa biểu mẫu của chúng ta. Trong trường hợp này, ngữ cảnh cũng chứa `BookInstance` của chúng ta, mà chúng ta sẽ sử dụng trong mẫu để cung cấp thông tin về cuốn sách chúng ta đang gia hạn.

Tuy nhiên, nếu đây là yêu cầu `POST`, thì chúng ta tạo đối tượng `form` và điền dữ liệu từ yêu cầu vào đó. Quá trình này được gọi là "ràng buộc" và cho phép chúng ta xác thực biểu mẫu.

Sau đó, chúng ta kiểm tra xem biểu mẫu có hợp lệ không, để chạy tất cả code xác thực trên tất cả các trường — bao gồm cả code chung để kiểm tra trường ngày của chúng ta thực sự là ngày hợp lệ và hàm `clean_renewal_date()` của biểu mẫu cụ thể của chúng ta để kiểm tra ngày có trong phạm vi đúng không.

```python
book_instance = get_object_or_404(BookInstance, pk=pk)

# If this is a POST request then process the Form data
if request.method == 'POST':

    # Create a form instance and populate it with data from the request (binding):
    form = RenewBookForm(request.POST)

    # Check if the form is valid:
    if form.is_valid():
        # process the data in form.cleaned_data as required (here we just write it to the model due_back field)
        book_instance.due_back = form.cleaned_data['renewal_date']
        book_instance.save()

        # redirect to a new URL:
        return HttpResponseRedirect(reverse('all-borrowed'))

context = {
    'form': form,
    'book_instance': book_instance,
}

return render(request, 'catalog/book_renew_librarian.html', context)
```

Nếu biểu mẫu không hợp lệ, chúng ta gọi `render()` lần nữa, nhưng lần này giá trị biểu mẫu được truyền trong ngữ cảnh sẽ bao gồm thông báo lỗi.

Nếu biểu mẫu hợp lệ, thì chúng ta có thể bắt đầu sử dụng dữ liệu, truy cập nó thông qua thuộc tính `form.cleaned_data` (ví dụ: `data = form.cleaned_data['renewal_date']`). Ở đây, chúng ta chỉ lưu dữ liệu vào giá trị `due_back` của đối tượng `BookInstance` liên quan.

> [!WARNING]
> Mặc dù bạn cũng có thể truy cập dữ liệu biểu mẫu trực tiếp thông qua yêu cầu (ví dụ: `request.POST['renewal_date']` hoặc `request.GET['renewal_date']` nếu sử dụng yêu cầu GET), điều này KHÔNG được khuyến nghị. Dữ liệu đã làm sạch được khử nhiễm, xác thực và chuyển đổi thành các kiểu thân thiện với Python.

Bước cuối cùng trong phần xử lý biểu mẫu của khung nhìn là chuyển hướng đến một trang khác, thường là trang "thành công". Trong trường hợp này, chúng ta sử dụng `HttpResponseRedirect` và `reverse()` để chuyển hướng đến khung nhìn có tên `'all-borrowed'` (điều này được tạo ra như "thách thức" trong [Django Tutorial Part 8: User authentication and permissions](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Authentication#challenge_yourself)). Nếu bạn không tạo trang đó, hãy xem xét chuyển hướng đến trang chủ tại URL `/`).

Đó là tất cả những gì cần thiết cho việc xử lý biểu mẫu, nhưng chúng ta vẫn cần hạn chế quyền truy cập vào khung nhìn chỉ dành cho thủ thư đã đăng nhập có quyền gia hạn sách. Chúng ta sử dụng `@login_required` để yêu cầu người dùng đã đăng nhập, và decorator hàm `@permission_required` với quyền `can_mark_returned` hiện có của chúng ta để cho phép truy cập (các decorator được xử lý theo thứ tự). Lưu ý rằng chúng ta có thể nên tạo một cài đặt quyền mới trong `BookInstance` (`can_renew`), nhưng chúng ta sẽ sử dụng lại cái hiện có để giữ ví dụ đơn giản.

Khung nhìn cuối cùng vì vậy được hiển thị bên dưới. Hãy sao chép điều này vào cuối **django-locallibrary-tutorial/catalog/views.py**.

```python
import datetime

from django.contrib.auth.decorators import login_required, permission_required
from django.shortcuts import get_object_or_404
from django.http import HttpResponseRedirect
from django.urls import reverse

from catalog.forms import RenewBookForm

@login_required
@permission_required('catalog.can_mark_returned', raise_exception=True)
def renew_book_librarian(request, pk):
    """View function for renewing a specific BookInstance by librarian."""
    book_instance = get_object_or_404(BookInstance, pk=pk)

    # If this is a POST request then process the Form data
    if request.method == 'POST':

        # Create a form instance and populate it with data from the request (binding):
        form = RenewBookForm(request.POST)

        # Check if the form is valid:
        if form.is_valid():
            # process the data in form.cleaned_data as required (here we just write it to the model due_back field)
            book_instance.due_back = form.cleaned_data['renewal_date']
            book_instance.save()

            # redirect to a new URL:
            return HttpResponseRedirect(reverse('all-borrowed'))

    # If this is a GET (or any other method) create the default form.
    else:
        proposed_renewal_date = datetime.date.today() + datetime.timedelta(weeks=3)
        form = RenewBookForm(initial={'renewal_date': proposed_renewal_date})

    context = {
        'form': form,
        'book_instance': book_instance,
    }

    return render(request, 'catalog/book_renew_librarian.html', context)
```

### Mẫu

Tạo mẫu được tham chiếu trong khung nhìn (**/catalog/templates/catalog/book_renew_librarian.html**) và sao chép code bên dưới vào đó:

```django
{% extends "base_generic.html" %}

{% block content %}
  <h1>Renew: \{{ book_instance.book.title }}</h1>
  <p>Borrower: \{{ book_instance.borrower }}</p>
  <p {% if book_instance.is_overdue %} class="text-danger"{% endif %} >Due date: \{{ book_instance.due_back }}</p>

  <form action="" method="post">
    {% csrf_token %}
    <table>
    \{{ form.as_table }}
    </table>
    <input type="submit" value="Submit">
  </form>
{% endblock %}
```

Hầu hết điều này sẽ hoàn toàn quen thuộc từ các hướng dẫn trước.

Chúng ta mở rộng mẫu cơ sở và sau đó định nghĩa lại khối nội dung. Chúng ta có thể tham chiếu `\{{ book_instance }}` (và các biến của nó) vì nó được truyền vào đối tượng ngữ cảnh trong hàm `render()`, và chúng ta sử dụng chúng để liệt kê tiêu đề sách, người mượn và ngày đến hạn gốc.

Code biểu mẫu tương đối đơn giản. Đầu tiên, chúng ta khai báo các thẻ `form`, chỉ định nơi biểu mẫu sẽ được gửi (`action`) và `method` để gửi dữ liệu (trong trường hợp này là `POST`) — nếu bạn nhớ lại tổng quan [Biểu mẫu HTML](#html_forms) ở đầu trang, một `action` trống như được hiển thị, có nghĩa là dữ liệu biểu mẫu sẽ được đăng trở lại URL hiện tại của trang (đây là những gì chúng ta muốn). Bên trong các thẻ, chúng ta định nghĩa đầu vào `submit`, mà người dùng có thể nhấn để gửi dữ liệu. `{% csrf_token %}` được thêm ngay bên trong các thẻ biểu mẫu là một phần của bảo vệ giả mạo xuyên trang của Django.

> [!NOTE]
> Thêm `{% csrf_token %}` vào mọi mẫu Django mà bạn tạo sử dụng `POST` để gửi dữ liệu. Điều này sẽ giảm khả năng biểu mẫu bị chiếm đoạt bởi người dùng độc hại.

Tất cả những gì còn lại là biến mẫu `\{{ form }}`, mà chúng ta đã truyền đến mẫu trong từ điển ngữ cảnh.
Có thể không ngạc nhiên, khi được sử dụng như được hiển thị, điều này cung cấp việc hiển thị mặc định của tất cả các trường biểu mẫu, bao gồm nhãn, widget và văn bản trợ giúp của chúng — việc hiển thị như được hiển thị bên dưới:

```html
<tr>
  <th><label for="id_renewal_date">Renewal date:</label></th>
  <td>
    <input
      id="id_renewal_date"
      name="renewal_date"
      type="text"
      value="2023-11-08"
      required />
    <br />
    <span class="helptext">
      Enter date between now and 4 weeks (default 3 weeks).
    </span>
  </td>
</tr>
```

> [!NOTE]
> Có thể không rõ ràng vì chúng ta chỉ có một trường, nhưng, theo mặc định, mỗi trường được định nghĩa trong hàng bảng của riêng nó. Hiển thị tương tự được cung cấp nếu bạn tham chiếu biến mẫu `\{{ form.as_table }}`.

Nếu bạn nhập ngày không hợp lệ, bạn cũng sẽ nhận được danh sách các lỗi được hiển thị trên trang (xem `error-list` bên dưới).

```html
<tr>
  <th><label for="id_renewal_date">Renewal date:</label></th>
  <td>
    <ul class="error-list">
      <li>Invalid date - renewal in past</li>
    </ul>
    <input
      id="id_renewal_date"
      name="renewal_date"
      type="text"
      value="2023-11-08"
      required />
    <br />
    <span class="helptext">
      Enter date between now and 4 weeks (default 3 weeks).
    </span>
  </td>
</tr>
```

#### Các cách khác để sử dụng biến mẫu biểu mẫu

Sử dụng `\{{ form.as_table }}` như được hiển thị ở trên, mỗi trường được hiển thị như một hàng bảng. Bạn cũng có thể hiển thị mỗi trường như một mục danh sách (sử dụng `\{{ form.as_ul }}`) hoặc như một đoạn văn (sử dụng `\{{ form.as_p }}`).

Cũng có thể có toàn quyền kiểm soát việc hiển thị mỗi phần của biểu mẫu, bằng cách chỉ số thuộc tính của nó bằng ký hiệu dấu chấm. Vì vậy, ví dụ, chúng ta có thể truy cập một số mục riêng biệt cho trường `renewal_date` của chúng ta:

- `\{{ form.renewal_date }}:` Toàn bộ trường.
- `\{{ form.renewal_date.errors }}`: Danh sách lỗi.
- `\{{ form.renewal_date.id_for_label }}`: Id của nhãn.
- `\{{ form.renewal_date.help_text }}`: Văn bản trợ giúp trường.

Để biết thêm ví dụ về cách hiển thị biểu mẫu thủ công trong các mẫu và lặp động qua các trường mẫu, xem [Working with forms > Rendering fields manually](https://docs.djangoproject.com/en/5.0/topics/forms/#rendering-fields-manually) (Tài liệu Django).

### Kiểm thử trang

Nếu bạn chấp nhận "thách thức" trong [Django Tutorial Part 8: User authentication and permissions](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Authentication#challenge_yourself), bạn sẽ có một khung nhìn hiển thị tất cả sách đang cho mượn trong thư viện, chỉ hiển thị với nhân viên thư viện.
Khung nhìn có thể trông tương tự như thế này:

```django
{% extends "base_generic.html" %}

{% block content %}
    <h1>All Borrowed Books</h1>

    {% if bookinstance_list %}
    <ul>

      {% for bookinst in bookinstance_list %}
      <li class="{% if bookinst.is_overdue %}text-danger{% endif %}">
        <a href="{% url 'book-detail' bookinst.book.pk %}">\{{ bookinst.book.title }}</a> (\{{ bookinst.due_back }}) {% if user.is_staff %}- \{{ bookinst.borrower }}{% endif %}
      </li>
      {% endfor %}
    </ul>

    {% else %}
      <p>There are no books borrowed.</p>
    {% endif %}
{% endblock %}
```

Chúng ta có thể thêm liên kết đến trang gia hạn sách bên cạnh mỗi mục bằng cách thêm code mẫu sau vào văn bản mục danh sách ở trên.
Lưu ý rằng code mẫu này chỉ có thể chạy bên trong vòng lặp `{% for %}`, vì đó là nơi giá trị `bookinst` được định nghĩa.

```django
{% if perms.catalog.can_mark_returned %}- <a href="{% url 'renew-book-librarian' bookinst.id %}">Renew</a>{% endif %}
```

> [!NOTE]
> Hãy nhớ rằng thông tin đăng nhập kiểm thử của bạn sẽ cần có quyền `catalog.can_mark_returned` để thấy liên kết "Renew" mới được thêm ở trên, và để truy cập trang được liên kết (có thể sử dụng tài khoản người dùng siêu cấp của bạn).

Bạn cũng có thể xây dựng thủ công URL kiểm thử như thế này — `http://127.0.0.1:8000/catalog/book/<bookinstance_id>/renew/` (một `bookinstance_id` hợp lệ có thể được lấy bằng cách điều hướng đến trang chi tiết sách trong thư viện của bạn, và sao chép trường `id`).

### Nó trông như thế nào?

Nếu bạn thành công, biểu mẫu mặc định sẽ trông như thế này:

![Default form which displays the book details, due date, renewal date and a submit button appears in case the link works successfully](forms_example_renew_default.png)

Biểu mẫu với giá trị không hợp lệ được nhập sẽ trông như thế này:

![Same form as above with an error message: invalid date - renewal in the past](forms_example_renew_invalid.png)

Danh sách tất cả sách có liên kết gia hạn sẽ trông như thế này:

![Displays list of all renewed books along with their details. Past due is in red.](forms_example_renew_allbooks.png)

## ModelForms

Tạo một lớp `Form` sử dụng cách tiếp cận được mô tả ở trên rất linh hoạt, cho phép bạn tạo bất kỳ loại trang biểu mẫu nào bạn muốn và liên kết nó với bất kỳ mô hình hoặc mô hình nào.

Tuy nhiên, nếu bạn chỉ cần một biểu mẫu để ánh xạ các trường của một mô hình _đơn_, thì mô hình của bạn sẽ đã định nghĩa hầu hết thông tin bạn cần trong biểu mẫu: trường, nhãn, văn bản trợ giúp, v.v. Thay vì tạo lại các định nghĩa mô hình trong biểu mẫu, sẽ dễ dàng hơn khi sử dụng lớp trợ giúp [ModelForm](https://docs.djangoproject.com/en/5.0/topics/forms/modelforms/) để tạo biểu mẫu từ mô hình của bạn. `ModelForm` này sau đó có thể được sử dụng trong các khung nhìn của bạn theo cùng cách như một `Form` thông thường.

Một `ModelForm` cơ bản chứa cùng trường như `RenewBookForm` ban đầu của chúng ta được hiển thị bên dưới. Tất cả những gì bạn cần làm để tạo biểu mẫu là thêm `class Meta` với `model` liên quan (`BookInstance`) và danh sách `fields` của mô hình để đưa vào biểu mẫu.

```python
from django.forms import ModelForm

from catalog.models import BookInstance

class RenewBookModelForm(ModelForm):
    class Meta:
        model = BookInstance
        fields = ['due_back']
```

> [!NOTE]
> Bạn cũng có thể bao gồm tất cả các trường trong biểu mẫu bằng cách sử dụng `fields = '__all__'`, hoặc bạn có thể sử dụng `exclude` (thay vì `fields`) để chỉ định các trường _không_ được bao gồm từ mô hình).
>
> Cả hai cách tiếp cận đều không được khuyến nghị vì các trường mới được thêm vào mô hình sau đó sẽ tự động được bao gồm trong biểu mẫu (mà không cần nhà phát triển nhất thiết xem xét các tác động bảo mật có thể xảy ra).

> [!NOTE]
> Điều này có thể không đơn giản hơn nhiều so với chỉ sử dụng `Form` (và không phải trong trường hợp này, vì chúng ta chỉ có một trường). Tuy nhiên, nếu bạn có nhiều trường, nó có thể giảm đáng kể lượng code cần thiết!

Phần còn lại của thông tin đến từ các định nghĩa trường mô hình (ví dụ: nhãn, widget, văn bản trợ giúp, thông báo lỗi). Nếu những thứ này không hoàn toàn đúng, thì chúng ta có thể ghi đè chúng trong `class Meta` của chúng ta, chỉ định một từ điển chứa trường cần thay đổi và giá trị mới của nó. Ví dụ, trong biểu mẫu này, chúng ta có thể muốn một nhãn cho trường của mình là "_Renewal date_" (thay vì mặc định dựa trên tên trường: _Due Back_), và chúng ta cũng muốn văn bản trợ giúp của mình cụ thể với trường hợp sử dụng này.
`Meta` bên dưới cho thấy cách ghi đè các trường này, và bạn có thể tương tự đặt `widgets` và `error_messages` nếu các giá trị mặc định không đủ.

```python
class Meta:
    model = BookInstance
    fields = ['due_back']
    labels = {'due_back': _('New renewal date')}
    help_texts = {'due_back': _('Enter a date between now and 4 weeks (default 3).')}
```

Để thêm xác thực, bạn có thể sử dụng cùng cách tiếp cận như đối với `Form` thông thường — bạn định nghĩa một hàm có tên `clean_<field_name>()` và tạo ra ngoại lệ `ValidationError` cho các giá trị không hợp lệ.
Sự khác biệt duy nhất đối với biểu mẫu ban đầu của chúng ta là trường mô hình được đặt tên là `due_back` và không phải là `renewal_date`.
Thay đổi này là cần thiết vì trường tương ứng trong `BookInstance` được gọi là `due_back`.

```python
from django.forms import ModelForm

from catalog.models import BookInstance

class RenewBookModelForm(ModelForm):
    def clean_due_back(self):
       data = self.cleaned_data['due_back']

       # Check if a date is not in the past.
       if data < datetime.date.today():
           raise ValidationError(_('Invalid date - renewal in past'))

       # Check if a date is in the allowed range (+4 weeks from today).
       if data > datetime.date.today() + datetime.timedelta(weeks=4):
           raise ValidationError(_('Invalid date - renewal more than 4 weeks ahead'))

       # Remember to always return the cleaned data.
       return data

    class Meta:
        model = BookInstance
        fields = ['due_back']
        labels = {'due_back': _('Renewal date')}
        help_texts = {'due_back': _('Enter a date between now and 4 weeks (default 3).')}
```

Lớp `RenewBookModelForm` ở trên bây giờ tương đương về mặt chức năng với `RenewBookForm` ban đầu của chúng ta. Bạn có thể import và sử dụng nó bất cứ nơi nào bạn hiện đang sử dụng `RenewBookForm` miễn là bạn cũng cập nhật tên biến biểu mẫu tương ứng từ `renewal_date` thành `due_back` như trong khai báo biểu mẫu thứ hai: `RenewBookModelForm(initial={'due_back': proposed_renewal_date}`.

## Các khung nhìn chỉnh sửa tổng quát

Thuật toán xử lý biểu mẫu chúng ta đã sử dụng trong ví dụ khung nhìn hàm ở trên đại diện cho một mẫu cực kỳ phổ biến trong các khung nhìn chỉnh sửa biểu mẫu. Django trừu tượng hóa phần lớn "boilerplate" này cho bạn, bằng cách tạo [các khung nhìn chỉnh sửa tổng quát](https://docs.djangoproject.com/en/5.0/ref/class-based-views/generic-editing/) để tạo, chỉnh sửa và xóa các khung nhìn dựa trên mô hình. Các khung nhìn này không chỉ xử lý hành vi "khung nhìn", mà chúng còn tự động tạo lớp biểu mẫu (một `ModelForm`) cho bạn từ mô hình.

> [!NOTE]
> Ngoài các khung nhìn chỉnh sửa được mô tả ở đây, còn có lớp [FormView](https://docs.djangoproject.com/en/5.0/ref/class-based-views/generic-editing/#formview), nằm ở đâu đó giữa khung nhìn hàm và các khung nhìn tổng quát khác về "tính linh hoạt" so với "công sức lập trình". Sử dụng `FormView`, bạn vẫn cần tạo `Form` của mình, nhưng bạn không phải triển khai tất cả các mẫu xử lý biểu mẫu tiêu chuẩn. Thay vào đó, bạn chỉ cần cung cấp một triển khai của hàm sẽ được gọi một khi việc gửi được biết là hợp lệ.

Trong phần này, chúng ta sẽ sử dụng các khung nhìn chỉnh sửa tổng quát để tạo các trang để thêm chức năng tạo, chỉnh sửa và xóa các bản ghi `Author` từ thư viện của chúng ta — một cách hiệu quả cung cấp một triển khai lại cơ bản của các phần của trang Admin (điều này có thể hữu ích nếu bạn cần cung cấp chức năng admin theo cách linh hoạt hơn so với trang admin có thể cung cấp).

### Khung nhìn

Mở tệp khung nhìn (**django-locallibrary-tutorial/catalog/views.py**) và thêm khối code sau vào cuối của nó:

```python
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .models import Author

class AuthorCreate(PermissionRequiredMixin, CreateView):
    model = Author
    fields = ['first_name', 'last_name', 'date_of_birth', 'date_of_death']
    initial = {'date_of_death': '11/11/2023'}
    permission_required = 'catalog.add_author'

class AuthorUpdate(PermissionRequiredMixin, UpdateView):
    model = Author
    # Not recommended (potential security issue if more fields added)
    fields = '__all__'
    permission_required = 'catalog.change_author'

class AuthorDelete(PermissionRequiredMixin, DeleteView):
    model = Author
    success_url = reverse_lazy('authors')
    permission_required = 'catalog.delete_author'

    def form_valid(self, form):
        try:
            self.object.delete()
            return HttpResponseRedirect(self.success_url)
        except Exception as e:
            return HttpResponseRedirect(
                reverse("author-delete", kwargs={"pk": self.object.pk})
            )
```

Như bạn có thể thấy, để tạo, cập nhật hoặc xóa các khung nhìn, bạn cần kế thừa từ `CreateView`, `UpdateView` và `DeleteView` (tương ứng) và sau đó định nghĩa mô hình liên quan.
Chúng ta cũng hạn chế việc gọi các khung nhìn này chỉ cho người dùng đã đăng nhập có quyền `add_author`, `change_author` và `delete_author` tương ứng.

Đối với các trường hợp "tạo" và "cập nhật", bạn cũng cần chỉ định các trường để hiển thị trong biểu mẫu (sử dụng cú pháp giống như cho `ModelForm`). Trong trường hợp này, chúng ta cho thấy cách liệt kê chúng riêng lẻ và cú pháp để liệt kê "tất cả" các trường. Bạn cũng có thể chỉ định các giá trị ban đầu cho mỗi trường bằng cách sử dụng từ điển các cặp _field_name_/_value_ (ở đây chúng ta tùy ý đặt ngày tử vong cho mục đích trình diễn — bạn có thể muốn loại bỏ điều đó). Theo mặc định, các khung nhìn này sẽ chuyển hướng khi thành công đến một trang hiển thị mục mô hình mới được tạo/chỉnh sửa, trong trường hợp của chúng ta sẽ là khung nhìn chi tiết tác giả mà chúng ta đã tạo trong hướng dẫn trước. Bạn có thể chỉ định một vị trí chuyển hướng thay thế bằng cách khai báo rõ ràng tham số `success_url`.

Lớp `AuthorDelete` không cần hiển thị bất kỳ trường nào, vì vậy những thứ này không cần được chỉ định.
Chúng ta cũng đặt một `success_url` (như được hiển thị ở trên), vì không có URL mặc định rõ ràng để Django điều hướng đến sau khi xóa thành công `Author`. Ở trên chúng ta sử dụng hàm [`reverse_lazy()`](https://docs.djangoproject.com/en/5.0/ref/urlresolvers/#reverse-lazy) để chuyển hướng đến danh sách tác giả sau khi một tác giả đã bị xóa — `reverse_lazy()` là phiên bản được thực thi một cách lười biếng của `reverse()`, được sử dụng ở đây vì chúng ta đang cung cấp URL cho một thuộc tính khung nhìn dựa trên lớp.

Nếu việc xóa tác giả luôn thành công thì điều đó là xong.
Thật không may, việc xóa một `Author` sẽ gây ra ngoại lệ nếu tác giả có một cuốn sách liên quan, vì mô hình [`Book`](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Models#book_model) của chúng ta chỉ định `on_delete=models.RESTRICT` cho trường `ForeignKey` của tác giả.
Để xử lý trường hợp này, khung nhìn ghi đè phương thức [`form_valid()`](https://docs.djangoproject.com/en/5.0/ref/class-based-views/mixins-editing/#django.views.generic.edit.FormMixin.form_valid) để nếu việc xóa `Author` thành công thì nó chuyển hướng đến `success_url`, nhưng nếu không, nó chỉ chuyển hướng trở lại cùng biểu mẫu.
Chúng ta sẽ cập nhật mẫu bên dưới để làm rõ rằng bạn không thể xóa thể hiện `Author` được sử dụng trong bất kỳ `Book` nào.

### Cấu hình URL

Mở tệp cấu hình URL của bạn (**django-locallibrary-tutorial/catalog/urls.py**) và thêm cấu hình sau vào cuối tệp:

```python
urlpatterns += [
    path('author/create/', views.AuthorCreate.as_view(), name='author-create'),
    path('author/<int:pk>/update/', views.AuthorUpdate.as_view(), name='author-update'),
    path('author/<int:pk>/delete/', views.AuthorDelete.as_view(), name='author-delete'),
]
```

Không có gì đặc biệt mới ở đây! Bạn có thể thấy rằng các khung nhìn là các lớp, và do đó phải được gọi qua `.as_view()`, và bạn có thể nhận ra các mẫu URL trong mỗi trường hợp. Chúng ta phải sử dụng `pk` làm tên cho giá trị khóa chính đã nắm bắt của chúng ta, vì đây là tên tham số được mong đợi bởi các lớp khung nhìn.

### Mẫu

Các khung nhìn "tạo" và "cập nhật" sử dụng cùng mẫu theo mặc định, được đặt tên sau mô hình của bạn: `model_name_form.html` (bạn có thể thay đổi hậu tố thành một thứ khác ngoài **\_form** bằng cách sử dụng trường `template_name_suffix` trong khung nhìn của bạn, ví dụ: `template_name_suffix = '_other_suffix'`)

Tạo tệp mẫu `django-locallibrary-tutorial/catalog/templates/catalog/author_form.html` và sao chép văn bản bên dưới.

```django
{% extends "base_generic.html" %}

{% block content %}
<form action="" method="post">
  {% csrf_token %}
  <table>
    \{{ form.as_table }}
  </table>
  <input type="submit" value="Submit" />
</form>
{% endblock %}
```

Điều này tương tự như các biểu mẫu trước của chúng ta và hiển thị các trường bằng cách sử dụng bảng. Cũng lưu ý cách chúng ta lại khai báo `{% csrf_token %}` để đảm bảo rằng các biểu mẫu của chúng ta chống lại các cuộc tấn công CSRF.

Khung nhìn "xóa" mong đợi tìm thấy mẫu được đặt tên với định dạng `[model_name]_confirm_delete.html` (một lần nữa, bạn có thể thay đổi hậu tố bằng cách sử dụng `template_name_suffix` trong khung nhìn của bạn).
Tạo tệp mẫu `django-locallibrary-tutorial/catalog/templates/catalog/author_confirm_delete.html` và sao chép văn bản bên dưới.

```django
{% extends "base_generic.html" %}

{% block content %}

<h1>Delete Author: \{{ author }}</h1>

{% if author.book_set.all %}

<p>You can't delete this author until all their books have been deleted:</p>
<ul>
  {% for book in author.book_set.all %}
    <li><a href="{% url 'book-detail' book.pk %}">\{{book}}</a> (\{{book.bookinstance_set.all.count}})</li>
  {% endfor %}
</ul>

{% else %}
<p>Are you sure you want to delete the author?</p>

<form action="" method="POST">
  {% csrf_token %}
  <input type="submit" action="" value="Yes, delete.">
</form>
{% endif %}

{% endblock %}
```

Mẫu nên quen thuộc.
Nó đầu tiên kiểm tra xem tác giả có được sử dụng trong bất kỳ sách nào không, và nếu vậy hiển thị danh sách sách phải được xóa trước khi bản ghi tác giả có thể được xóa.
Nếu không, nó hiển thị một biểu mẫu hỏi người dùng xác nhận họ muốn xóa bản ghi tác giả.

Bước cuối cùng là kết nối các trang vào thanh bên.
Đầu tiên chúng ta sẽ thêm liên kết để tạo tác giả vào _mẫu cơ sở_, để nó hiển thị trong tất cả các trang cho người dùng đã đăng nhập được coi là "nhân viên" và có quyền tạo tác giả (`catalog.add_author`).
Mở **/django-locallibrary-tutorial/catalog/templates/base_generic.html** và thêm các dòng cho phép người dùng có quyền tạo tác giả (trong cùng khối với liên kết hiển thị sách "All Borrowed").
Hãy nhớ tham chiếu URL bằng tên của nó `'author-create'` như được hiển thị bên dưới.

```django
{% if user.is_staff %}
<hr>
<ul class="sidebar-nav">
<li>Staff</li>
   <li><a href="{% url 'all-borrowed' %}">All borrowed</a></li>
{% if perms.catalog.add_author %}
   <li><a href="{% url 'author-create' %}">Create author</a></li>
{% endif %}
</ul>
{% endif %}
```

Chúng ta sẽ thêm các liên kết để cập nhật và xóa tác giả vào trang chi tiết tác giả.
Mở **catalog/templates/catalog/author_detail.html** và thêm code sau:

```django
{% block sidebar %}
  \{{ block.super }}

  {% if perms.catalog.change_author or perms.catalog.delete_author %}
  <hr>
  <ul class="sidebar-nav">
    {% if perms.catalog.change_author %}
      <li><a href="{% url 'author-update' author.id %}">Update author</a></li>
    {% endif %}
    {% if not author.book_set.all and perms.catalog.delete_author %}
      <li><a href="{% url 'author-delete' author.id %}">Delete author</a></li>
    {% endif %}
    </ul>
  {% endif %}

{% endblock %}
```

Khối này ghi đè khối `sidebar` trong mẫu cơ sở và sau đó kéo nội dung gốc vào bằng cách sử dụng `\{{ block.super }}`.
Sau đó nó thêm các liên kết để cập nhật hoặc xóa tác giả, nhưng khi người dùng có các quyền đúng và bản ghi tác giả không liên quan đến bất kỳ sách nào.

Các trang bây giờ đã sẵn sàng để kiểm thử!

### Kiểm thử trang

Đầu tiên, đăng nhập vào trang với tài khoản có quyền thêm, thay đổi và xóa tác giả.

Điều hướng đến bất kỳ trang nào, và chọn "Create author" trong thanh bên (với URL `http://127.0.0.1:8000/catalog/author/create/`).
Trang sẽ trông như ảnh chụp màn hình bên dưới.

![Form Example: Create Author](forms_example_create_author.png)

Nhập các giá trị cho các trường và sau đó nhấn **Submit** để lưu bản ghi tác giả.
Bây giờ bạn sẽ được đưa đến khung nhìn chi tiết cho tác giả mới của mình, với URL như `http://127.0.0.1:8000/catalog/author/10`.

![Form Example: Author Detail showing Update and Delete links](forms_example_detail_author_update.png)

Bạn có thể kiểm thử chỉnh sửa bản ghi bằng cách chọn liên kết "Update author" (với URL như `http://127.0.0.1:8000/catalog/author/10/update/`) — chúng ta không hiển thị ảnh chụp màn hình vì nó trông giống hệt trang "tạo"!

Cuối cùng, chúng ta có thể xóa trang bằng cách chọn "Delete author" từ thanh bên trên trang chi tiết.
Django sẽ hiển thị trang xóa như được hiển thị bên dưới nếu bản ghi tác giả không được sử dụng trong bất kỳ sách nào.
Nhấn "**Yes, delete.**" để xóa bản ghi và được đưa đến danh sách tất cả tác giả.

![Form with option to delete author](forms_example_delete_author.png)

## Thách thức bản thân

Tạo một số biểu mẫu để tạo, chỉnh sửa và xóa các bản ghi `Book`. Bạn có thể sử dụng chính xác cùng cấu trúc như đối với `Authors` (đối với việc xóa, hãy nhớ rằng bạn không thể xóa một `Book` cho đến khi tất cả các bản ghi `BookInstance` liên quan của nó đã được xóa) và bạn phải sử dụng các quyền đúng.
Nếu mẫu **book_form.html** của bạn chỉ là một phiên bản được đổi tên sao chép của mẫu **author_form.html**, thì trang "tạo sách" mới sẽ trông như ảnh chụp màn hình bên dưới:

![Screenshot displaying various fields in the form like title, author, summary, ISBN, genre and language](forms_example_create_book.png)

## Tóm tắt

Tạo và xử lý biểu mẫu có thể là một quá trình phức tạp! Django làm cho nó dễ dàng hơn nhiều bằng cách cung cấp các cơ chế lập trình để khai báo, hiển thị và xác thực biểu mẫu. Hơn nữa, Django cung cấp các khung nhìn chỉnh sửa biểu mẫu tổng quát có thể thực hiện _gần như tất cả_ công việc để định nghĩa các trang có thể tạo, chỉnh sửa và xóa các bản ghi liên kết với một thể hiện mô hình đơn.

Có rất nhiều thứ có thể làm với biểu mẫu (xem danh sách [Xem thêm](#see_also) bên dưới), nhưng bây giờ bạn nên hiểu cách thêm biểu mẫu cơ bản và code xử lý biểu mẫu vào các trang web của riêng mình.

## Xem thêm

- [Working with forms](https://docs.djangoproject.com/en/5.0/topics/forms/) (Tài liệu Django)
- [Writing your first Django app, part 4 > Writing a simple form](https://docs.djangoproject.com/en/5.0/intro/tutorial04/#write-a-simple-form) (Tài liệu Django)
- [The Forms API](https://docs.djangoproject.com/en/5.0/ref/forms/api/) (Tài liệu Django)
- [Form fields](https://docs.djangoproject.com/en/5.0/ref/forms/fields/) (Tài liệu Django)
- [Form and field validation](https://docs.djangoproject.com/en/5.0/ref/forms/validation/) (Tài liệu Django)
- [Form handling with class-based views](https://docs.djangoproject.com/en/5.0/topics/class-based-views/generic-editing/) (Tài liệu Django)
- [Creating forms from models](https://docs.djangoproject.com/en/5.0/topics/forms/modelforms/) (Tài liệu Django)
- [Generic editing views](https://docs.djangoproject.com/en/5.0/ref/class-based-views/generic-editing/) (Tài liệu Django)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/authentication_and_sessions", "Learn_web_development/Extensions/Server-side/Django/Testing", "Learn_web_development/Extensions/Server-side/Django")}}
