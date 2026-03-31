---
title: Giới thiệu về Django
slug: Learn_web_development/Extensions/Server-side/Django/Introduction
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Server-side/Django/development_environment", "Learn_web_development/Extensions/Server-side/Django")}}

Trong bài Django đầu tiên này, chúng tôi trả lời câu hỏi "Django là gì?" và cung cấp cho bạn cái nhìn tổng quan về những gì làm cho web framework này đặc biệt.

Chúng tôi sẽ phác thảo các tính năng chính, bao gồm một số chức năng nâng cao mà chúng tôi sẽ không có thời gian để đề cập chi tiết trong module này. Chúng tôi cũng sẽ chỉ cho bạn thấy một số thành phần xây dựng chính của ứng dụng Django (mặc dù tại thời điểm này bạn chưa có môi trường phát triển để kiểm tra nó).

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết chung về <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps">lập trình website phía máy chủ</a>, và đặc biệt là cơ chế <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Client-Server_overview">tương tác client-server trong các website</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Làm quen với Django là gì, chức năng mà nó cung cấp, và các thành phần xây dựng chính của ứng dụng Django.
      </td>
    </tr>
  </tbody>
</table>

## Django là gì?

Django là một web framework Python cấp cao cho phép phát triển nhanh các website an toàn và dễ bảo trì. Được xây dựng bởi các nhà phát triển có kinh nghiệm, Django đảm nhận phần lớn những rắc rối của phát triển web, vì vậy bạn có thể tập trung vào việc viết ứng dụng mà không cần phải phát minh lại bánh xe. Nó miễn phí và mã nguồn mở, có cộng đồng phát triển năng động, tài liệu tuyệt vời, và nhiều tùy chọn hỗ trợ miễn phí và có trả phí.

Django giúp bạn viết phần mềm có các đặc tính:

- Đầy đủ
  - : Django theo triết lý "Batteries included" và cung cấp gần như mọi thứ mà nhà phát triển có thể muốn làm "ngay từ đầu". Vì mọi thứ bạn cần đều là một phần của một "sản phẩm" duy nhất, tất cả đều hoạt động liền mạch với nhau, theo các nguyên tắc thiết kế nhất quán, và có tài liệu đầy đủ và [cập nhật](https://docs.djangoproject.com/en/stable/).
- Linh hoạt
  - : Django có thể (và đã được) sử dụng để xây dựng hầu hết mọi loại website — từ các hệ thống quản lý nội dung và wiki, đến các mạng xã hội và trang tin tức. Nó có thể hoạt động với bất kỳ framework phía client nào, và có thể cung cấp nội dung ở hầu hết mọi định dạng (bao gồm HTML, RSS feeds, JSON và XML).

    Về mặt nội bộ, trong khi nó cung cấp các lựa chọn cho hầu hết mọi chức năng bạn có thể muốn (ví dụ: một số cơ sở dữ liệu phổ biến, các công cụ mẫu, v.v.), nó cũng có thể được mở rộng để sử dụng các thành phần khác nếu cần.

- Bảo mật
  - : Django giúp các nhà phát triển tránh nhiều lỗi bảo mật phổ biến bằng cách cung cấp một framework đã được thiết kế để "làm đúng" để bảo vệ website tự động. Ví dụ, Django cung cấp cách quản lý tài khoản người dùng và mật khẩu an toàn, tránh các lỗi phổ biến như đặt thông tin phiên vào cookie nơi nó dễ bị tấn công (thay vào đó cookie chỉ chứa một khóa, và dữ liệu thực tế được lưu trữ trong cơ sở dữ liệu) hoặc lưu trữ trực tiếp mật khẩu thay vì một hash mật khẩu.

    _Hash mật khẩu là một giá trị có độ dài cố định được tạo bằng cách gửi mật khẩu qua [hàm băm mật mã](https://en.wikipedia.org/wiki/Cryptographic_hash_function). Django có thể kiểm tra xem mật khẩu đã nhập có đúng hay không bằng cách chạy nó qua hàm băm và so sánh đầu ra với giá trị hash đã lưu. Tuy nhiên do tính chất "một chiều" của hàm, ngay cả khi giá trị hash đã lưu bị xâm phạm, kẻ tấn công khó có thể tìm ra mật khẩu gốc._

    Django cho phép bảo vệ chống lại nhiều lỗ hổng bảo mật theo mặc định, bao gồm SQL injection, cross-site scripting, cross-site request forgery và [clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking) (xem [Bảo mật Website](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Website_security) để biết thêm chi tiết về các cuộc tấn công như vậy).

- Có khả năng mở rộng
  - : Django sử dụng kiến trúc dựa trên thành phần "[shared-nothing](https://en.wikipedia.org/wiki/Shared_nothing_architecture)" (mỗi phần của kiến trúc độc lập với các phần khác, và do đó có thể được thay thế hoặc thay đổi nếu cần). Có sự tách biệt rõ ràng giữa các phần khác nhau có nghĩa là nó có thể mở rộng để tăng lưu lượng truy cập bằng cách thêm phần cứng ở bất kỳ cấp độ nào: máy chủ caching, máy chủ cơ sở dữ liệu, hoặc máy chủ ứng dụng. Một số trang web bận rộn nhất đã mở rộng Django thành công để đáp ứng nhu cầu của họ (ví dụ: Instagram và Disqus, chỉ để kể hai cái tên).
- Dễ bảo trì
  - : Code Django được viết sử dụng các nguyên tắc và mẫu thiết kế khuyến khích tạo ra code có thể bảo trì và tái sử dụng. Đặc biệt, nó sử dụng nguyên tắc Don't Repeat Yourself (DRY) để không có sự trùng lặp không cần thiết, giảm lượng code. Django cũng thúc đẩy việc nhóm các chức năng liên quan thành các "ứng dụng" có thể tái sử dụng và ở cấp độ thấp hơn, nhóm code liên quan thành các module (theo dòng mẫu [Model View Controller (MVC)](/en-US/docs/Glossary/MVC)).
- Có tính di động
  - : Django được viết bằng Python, chạy trên nhiều nền tảng. Điều đó có nghĩa là bạn không bị ràng buộc với bất kỳ nền tảng máy chủ cụ thể nào, và có thể chạy ứng dụng của mình trên nhiều phiên bản Linux, Windows và macOS. Hơn nữa, Django được nhiều nhà cung cấp hosting web hỗ trợ tốt, những người thường cung cấp cơ sở hạ tầng và tài liệu cụ thể để lưu trữ các trang Django.

## Nó đến từ đâu?

Django ban đầu được phát triển từ năm 2003 đến 2005 bởi một nhóm web chịu trách nhiệm tạo ra và duy trì các website báo. Sau khi tạo ra một số trang, nhóm bắt đầu tách ra và tái sử dụng nhiều code và mẫu thiết kế chung. Code chung này đã phát triển thành một framework phát triển web chung, được mã nguồn mở hóa như dự án "Django" vào tháng 7 năm 2005.

Django tiếp tục phát triển và cải thiện, từ phiên bản milestone đầu tiên (1.0) vào tháng 9 năm 2008 cho đến phiên bản 5.0 vào cuối năm 2023. Mỗi phiên bản đã thêm chức năng mới và sửa lỗi, từ hỗ trợ cho các loại cơ sở dữ liệu mới, công cụ mẫu, và caching, đến việc thêm các hàm và lớp khung nhìn "chung" (làm giảm lượng code mà nhà phát triển phải viết cho một số nhiệm vụ lập trình).

> [!NOTE]
> Xem [ghi chú phát hành](https://docs.djangoproject.com/en/stable/releases/) trên website Django để xem những gì đã thay đổi trong các phiên bản gần đây, và bao nhiêu công việc đang được đưa vào làm cho Django tốt hơn.

Django hiện là một dự án mã nguồn mở hợp tác phát triển mạnh mẽ, với hàng nghìn người dùng và cộng tác viên. Mặc dù nó vẫn có một số tính năng phản ánh nguồn gốc của nó, Django đã phát triển thành một framework linh hoạt có khả năng phát triển bất kỳ loại website nào.

## Django phổ biến như thế nào?

Không có thước đo sẵn có và dứt khoát nào về độ phổ biến của các framework phía máy chủ (mặc dù bạn có thể ước tính độ phổ biến bằng các cơ chế như đếm số dự án GitHub và câu hỏi Stack Overflow cho từng nền tảng). Câu hỏi tốt hơn là liệu Django có "đủ phổ biến" để tránh các vấn đề của các nền tảng không phổ biến hay không. Liệu nó có tiếp tục phát triển không? Bạn có thể nhận được trợ giúp nếu cần không? Có cơ hội để bạn kiếm tiền nếu bạn học Django không?

Dựa trên số lượng trang web nổi tiếng sử dụng Django, số lượng người đóng góp vào codebase, và số lượng người cung cấp cả hỗ trợ miễn phí và có trả phí, thì có, Django là một framework phổ biến!

Các trang web nổi tiếng sử dụng Django bao gồm: Disqus, Instagram, Knight Foundation, MacArthur Foundation, Mozilla, National Geographic, Open Knowledge Foundation, Pinterest và Open Stack (nguồn: [trang tổng quan Django](https://www.djangoproject.com/start/overview/)).

## Django có opinionated không?

Các web framework thường tự mô tả là "opinionated" hoặc "unopinionated".

Framework opinionated là những framework có quan điểm về "cách đúng" để xử lý bất kỳ nhiệm vụ cụ thể nào. Chúng thường hỗ trợ phát triển nhanh _trong một lĩnh vực cụ thể_ (giải quyết các vấn đề của một loại cụ thể) vì cách đúng để làm bất cứ điều gì thường được hiểu rõ và được tài liệu hóa tốt. Tuy nhiên chúng có thể kém linh hoạt hơn trong việc giải quyết các vấn đề ngoài lĩnh vực chính của chúng, và có xu hướng cung cấp ít lựa chọn hơn về những thành phần và cách tiếp cận nào họ có thể sử dụng.

Framework unopinionated, ngược lại, có ít hạn chế hơn nhiều về cách tốt nhất để ghép các thành phần lại với nhau để đạt được mục tiêu, hoặc thậm chí những thành phần nào nên được sử dụng. Chúng giúp nhà phát triển dễ dàng sử dụng các công cụ phù hợp nhất để hoàn thành một nhiệm vụ cụ thể, mặc dù với chi phí là bạn cần tự tìm những thành phần đó.

Django "phần nào opinionated", và do đó cung cấp "điều tốt nhất của cả hai thế giới". Nó cung cấp một tập hợp các thành phần để xử lý hầu hết các nhiệm vụ phát triển web và một (hoặc hai) cách ưa thích để sử dụng chúng. Tuy nhiên, kiến trúc tách rời của Django có nghĩa là bạn thường có thể chọn lựa từ một số tùy chọn khác nhau, hoặc thêm hỗ trợ cho những tùy chọn hoàn toàn mới nếu muốn.

## Code Django trông như thế nào?

Trong một website theo hướng dữ liệu truyền thống, ứng dụng web chờ đợi các yêu cầu HTTP từ trình duyệt web (hoặc client khác). Khi nhận được yêu cầu, ứng dụng xác định những gì cần thiết dựa trên URL và có thể là thông tin trong dữ liệu `POST` hoặc dữ liệu `GET`. Tùy thuộc vào những gì được yêu cầu, nó có thể đọc hoặc ghi thông tin từ cơ sở dữ liệu hoặc thực hiện các nhiệm vụ khác cần thiết để thỏa mãn yêu cầu. Sau đó ứng dụng sẽ trả về phản hồi cho trình duyệt web, thường tạo động một trang HTML cho trình duyệt hiển thị bằng cách chèn dữ liệu đã truy xuất vào các vị trí trong mẫu HTML.

Các ứng dụng web Django thường nhóm code xử lý từng bước này vào các tệp riêng biệt:

![Django - files for views, model, URLs, template](basic-django.png)

- **URLs:** Mặc dù có thể xử lý các yêu cầu từ mọi URL đơn lẻ thông qua một hàm duy nhất, nhưng việc viết một hàm khung nhìn riêng để xử lý từng tài nguyên dễ bảo trì hơn nhiều. Bộ ánh xạ URL được sử dụng để chuyển hướng các yêu cầu HTTP đến khung nhìn phù hợp dựa trên URL yêu cầu. Bộ ánh xạ URL cũng có thể khớp các mẫu chuỗi hoặc chữ số cụ thể xuất hiện trong URL và truyền chúng đến hàm khung nhìn dưới dạng dữ liệu.
- **Khung nhìn:** Khung nhìn là một hàm xử lý yêu cầu, nhận các yêu cầu HTTP và trả về các phản hồi HTTP. Các khung nhìn truy cập dữ liệu cần thiết để thỏa mãn yêu cầu thông qua _mô hình_, và ủy thác định dạng phản hồi cho _mẫu_.
- **Mô hình:** Mô hình là các đối tượng Python xác định cấu trúc dữ liệu của ứng dụng, và cung cấp cơ chế để quản lý (thêm, sửa, xóa) và truy vấn các bản ghi trong cơ sở dữ liệu.
- **Mẫu:** Mẫu là một tệp văn bản xác định cấu trúc hoặc bố cục của một tệp (chẳng hạn như trang HTML), với các vị trí được sử dụng để đại diện cho nội dung thực tế. Một _khung nhìn_ có thể tạo động một trang HTML bằng cách sử dụng mẫu HTML, điền vào đó với dữ liệu từ _mô hình_. Mẫu có thể được sử dụng để định nghĩa cấu trúc của bất kỳ loại tệp nào; nó không nhất thiết phải là HTML!

> [!NOTE]
> Django gọi tổ chức này là kiến trúc "Model View Template (MVT)". Nó có nhiều điểm tương đồng với kiến trúc [Model View Controller](/en-US/docs/Glossary/MVC) quen thuộc hơn.

Các phần dưới đây sẽ cho bạn ý tưởng về những phần chính này của ứng dụng Django trông như thế nào (chúng tôi sẽ đi vào chi tiết hơn sau trong khóa học, khi chúng tôi đã thiết lập môi trường phát triển).

### Gửi yêu cầu đến khung nhìn đúng (urls.py)

Bộ ánh xạ URL thường được lưu trữ trong một tệp có tên **urls.py**.
Trong ví dụ dưới đây, bộ ánh xạ (`urlpatterns`) định nghĩa một danh sách ánh xạ giữa các _route_ (mẫu URL cụ thể*)* và các hàm khung nhìn tương ứng.
Nếu nhận được yêu cầu HTTP có URL khớp với một mẫu được chỉ định, thì hàm khung nhìn liên quan sẽ được gọi và truyền yêu cầu.

```python
urlpatterns = [
    path('admin/', admin.site.urls),
    path('book/<int:id>/', views.book_detail, name='book_detail'),
    path('catalog/', include('catalog.urls')),
    re_path(r'^([0-9]+)/$', views.best),
]
```

Đối tượng `urlpatterns` là danh sách các hàm `path()` và/hoặc `re_path()` (các danh sách Python được định nghĩa bằng dấu ngoặc vuông, trong đó các mục được phân tách bằng dấu phẩy và có thể có [dấu phẩy cuối tùy chọn](https://docs.python.org/3/faq/design.html#why-does-python-allow-commas-at-the-end-of-lists-and-tuples). Ví dụ: `[item1, item2, item3,]`).

Đối số đầu tiên của cả hai phương thức là một route (mẫu) sẽ được khớp. Phương thức `path()` sử dụng dấu ngoặc nhọn để xác định các phần của URL sẽ được thu thập và truyền đến hàm khung nhìn dưới dạng đối số có tên. Hàm `re_path()` sử dụng cách tiếp cận khớp mẫu linh hoạt được gọi là biểu thức chính quy. Chúng ta sẽ nói về những điều này trong bài viết sau!

Đối số thứ hai là một hàm khác sẽ được gọi khi mẫu được khớp. Ký hiệu `views.book_detail` chỉ ra rằng hàm được gọi là `book_detail()` và có thể được tìm thấy trong một module có tên là `views` (tức là bên trong một tệp có tên **views.py**)

### Xử lý yêu cầu (views.py)

Các khung nhìn là trái tim của ứng dụng web, nhận các yêu cầu HTTP từ client web và trả về các phản hồi HTTP. Ở giữa, chúng điều phối các tài nguyên khác của framework để truy cập cơ sở dữ liệu, hiển thị mẫu, v.v.

Ví dụ dưới đây cho thấy một hàm khung nhìn tối thiểu `index()`, có thể đã được gọi bởi bộ ánh xạ URL trong phần trước. Giống như tất cả các hàm khung nhìn, nó nhận đối tượng `HttpRequest` làm tham số (`request`) và trả về đối tượng `HttpResponse`. Trong trường hợp này, chúng ta không làm gì với yêu cầu, và phản hồi của chúng ta trả về một chuỗi được mã hóa cứng. Chúng tôi sẽ chỉ cho bạn một yêu cầu làm điều gì đó thú vị hơn trong phần sau.

```python
# filename: views.py (Django view functions)

from django.http import HttpResponse

def index(request):
    # Get an HttpRequest - the request parameter
    # perform operations using information from the request.
    # Return HttpResponse
    return HttpResponse('Hello from Django!')
```

> [!NOTE]
> Một chút về Python:
>
> - [Module Python](https://docs.python.org/3/tutorial/modules.html) là các "thư viện" của các hàm, được lưu trữ trong các tệp riêng biệt, mà chúng ta có thể muốn sử dụng trong code của mình. Ở đây chúng ta chỉ nhập đối tượng `HttpResponse` từ module `django.http` để chúng ta có thể sử dụng nó trong khung nhìn của mình: `from django.http import HttpResponse`. Có các cách khác để nhập một số hoặc tất cả các đối tượng từ một module.
> - Các hàm được khai báo bằng từ khóa `def` như được hiển thị ở trên, với các tham số có tên được liệt kê trong dấu ngoặc đơn sau tên hàm; toàn bộ dòng kết thúc bằng dấu hai chấm. Lưu ý cách các dòng tiếp theo đều được **thụt lề**. Thụt lề rất quan trọng, vì nó chỉ định rằng các dòng code nằm bên trong khối cụ thể đó (thụt lề bắt buộc là tính năng chính của Python, và là một lý do tại sao code Python dễ đọc).

Các khung nhìn thường được lưu trữ trong một tệp gọi là **views.py**.

### Định nghĩa mô hình dữ liệu (models.py)

Các ứng dụng web Django quản lý và truy vấn dữ liệu thông qua các đối tượng Python được gọi là mô hình. Mô hình xác định cấu trúc dữ liệu được lưu trữ, bao gồm _các loại_ trường và có thể cả kích thước tối đa của chúng, giá trị mặc định, tùy chọn danh sách lựa chọn, văn bản trợ giúp cho tài liệu, văn bản nhãn cho biểu mẫu, v.v. Định nghĩa của mô hình độc lập với cơ sở dữ liệu bên dưới — bạn có thể chọn một trong số nhiều loại như một phần của cài đặt dự án của bạn. Khi bạn đã chọn cơ sở dữ liệu muốn sử dụng, bạn hoàn toàn không cần phải nói chuyện trực tiếp với nó — bạn chỉ cần viết cấu trúc mô hình và các code khác, và Django xử lý tất cả "công việc bẩn" của việc giao tiếp với cơ sở dữ liệu cho bạn.

Đoạn code dưới đây hiển thị một mô hình Django rất đơn giản cho đối tượng `Team`. Lớp `Team` được kế thừa từ lớp Django `models.Model`. Nó xác định tên đội và cấp độ đội là các trường ký tự và chỉ định số ký tự tối đa được lưu trữ cho mỗi bản ghi. `team_level` có thể là một trong nhiều giá trị, vì vậy chúng ta định nghĩa nó là trường lựa chọn và cung cấp một ánh xạ giữa các lựa chọn được hiển thị và dữ liệu được lưu trữ, cùng với giá trị mặc định.

```python
# filename: models.py

from django.db import models

class Team(models.Model):
    team_name = models.CharField(max_length=40)

    TEAM_LEVELS = (
        ('U09', 'Under 09s'),
        ('U10', 'Under 10s'),
        ('U11', 'Under 11s'),
        # …
        # list other team levels
    )
    team_level = models.CharField(max_length=3, choices=TEAM_LEVELS, default='U11')
```

> [!NOTE]
> Một chút về Python:
>
> Python hỗ trợ "lập trình hướng đối tượng", một phong cách lập trình trong đó chúng ta tổ chức code thành các đối tượng, bao gồm dữ liệu liên quan và các hàm để vận hành trên dữ liệu đó. Các đối tượng cũng có thể kế thừa/mở rộng/phát sinh từ các đối tượng khác, cho phép chia sẻ hành vi chung giữa các đối tượng có liên quan. Trong Python chúng ta sử dụng từ khóa `class` để định nghĩa "bản thiết kế" cho một đối tượng. Chúng ta có thể tạo nhiều _phiên bản_ cụ thể của loại đối tượng dựa trên mô hình trong lớp.
>
> Vì vậy, ví dụ, ở đây chúng ta có lớp `Team`, phát sinh từ lớp `Model`. Điều này có nghĩa là nó là một mô hình, và sẽ chứa tất cả các phương thức của một mô hình, nhưng chúng ta cũng có thể cho nó các tính năng đặc biệt của riêng nó. Trong mô hình của chúng ta, chúng ta định nghĩa các trường mà cơ sở dữ liệu sẽ cần để lưu trữ dữ liệu của chúng ta, đặt cho chúng các tên cụ thể. Django sử dụng các định nghĩa này, bao gồm các tên trường, để tạo cơ sở dữ liệu bên dưới.

### Truy vấn dữ liệu (views.py)

Mô hình Django cung cấp API truy vấn đơn giản để tìm kiếm cơ sở dữ liệu liên quan. Điều này có thể khớp với nhiều trường cùng một lúc bằng cách sử dụng các tiêu chí khác nhau (ví dụ: exact, case-insensitive, lớn hơn, v.v.), và có thể hỗ trợ các câu lệnh phức tạp (ví dụ, bạn có thể chỉ định tìm kiếm các đội U11 có tên đội bắt đầu bằng "Fr" hoặc kết thúc bằng "al").

Đoạn code dưới đây hiển thị hàm khung nhìn (trình xử lý tài nguyên) để hiển thị tất cả các đội U09 của chúng ta. Dòng `list_teams = Team.objects.filter(team_level__exact="U09")` chỉ cách chúng ta có thể sử dụng API truy vấn mô hình để lọc tất cả các bản ghi trong đó trường `team_level` có chính xác văn bản `U09` (lưu ý cách tiêu chí này được truyền đến hàm `filter()` dưới dạng đối số, với tên trường và loại khớp được phân tách bằng dấu gạch dưới kép: **`team_level__exact`**).

```python
## filename: views.py

from django.shortcuts import render
from .models import Team

def index(request):
    list_teams = Team.objects.filter(team_level__exact="U09")
    context = {'youngest_teams': list_teams}
    return render(request, '/best/index.html', context)
```

Hàm này sử dụng hàm `render()` để tạo `HttpResponse` được gửi lại cho trình duyệt. Hàm này là một _shortcut_; nó tạo một tệp HTML bằng cách kết hợp mẫu HTML được chỉ định và một số dữ liệu để chèn vào mẫu (được cung cấp trong biến có tên `context`). Trong phần tiếp theo chúng ta chỉ ra cách mẫu có dữ liệu được chèn vào đó để tạo HTML.

### Hiển thị dữ liệu (các mẫu HTML)

Hệ thống mẫu cho phép bạn chỉ định cấu trúc của tài liệu đầu ra, sử dụng các vị trí cho dữ liệu sẽ được điền khi trang được tạo. Mẫu thường được sử dụng để tạo HTML, nhưng cũng có thể tạo các loại tài liệu khác. Django hỗ trợ cả hệ thống mẫu gốc của nó và một thư viện Python phổ biến khác có tên Jinja2 ngay từ đầu (nó cũng có thể được thực hiện để hỗ trợ các hệ thống khác nếu cần).

Đoạn code dưới đây hiển thị mẫu HTML được gọi bởi hàm `render()` trong phần trước có thể trông như thế nào. Mẫu này đã được viết dưới giả định rằng nó sẽ có quyền truy cập vào biến danh sách có tên `youngest_teams` khi nó được hiển thị (điều này được chứa trong biến `context` bên trong hàm `render()` ở trên). Bên trong khung xương HTML, chúng ta có một biểu thức đầu tiên kiểm tra xem biến `youngest_teams` có tồn tại không, và sau đó lặp qua nó trong vòng lặp `for`. Ở mỗi lần lặp, mẫu hiển thị giá trị `team_name` của mỗi đội trong phần tử {{htmlelement("li")}}.

```django
## filename: best/templates/best/index.html

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Home page</title>
</head>
<body>
  {% if youngest_teams %}
    <ul>
      {% for team in youngest_teams %}
        <li>\{{ team.team_name }}</li>
      {% endfor %}
    </ul>
  {% else %}
    <p>No teams are available.</p>
  {% endif %}
</body>
</html>
```

## Bạn còn có thể làm gì khác?

Các phần trước đây hiển thị các tính năng chính mà bạn sẽ sử dụng trong hầu hết mọi ứng dụng web: ánh xạ URL, khung nhìn, mô hình và mẫu. Chỉ một số những thứ khác được cung cấp bởi Django bao gồm:

- **Biểu mẫu**: Biểu mẫu HTML được sử dụng để thu thập dữ liệu người dùng để xử lý trên máy chủ. Django đơn giản hóa việc tạo biểu mẫu, xác thực và xử lý.
- **Xác thực người dùng và quyền hạn**: Django bao gồm một hệ thống xác thực người dùng và quyền hạn mạnh mẽ đã được xây dựng với bảo mật trong tâm trí.
- **Caching**: Tạo nội dung động là tốn nhiều tài nguyên tính toán (và chậm) hơn nhiều so với phục vụ nội dung tĩnh. Django cung cấp caching linh hoạt để bạn có thể lưu trữ toàn bộ hoặc một phần của trang đã được hiển thị để nó không cần được hiển thị lại trừ khi cần thiết.
- **Trang quản trị**: Trang quản trị Django được bao gồm theo mặc định khi bạn tạo ứng dụng bằng khung xương cơ bản. Nó làm cho việc cung cấp trang quản trị cho quản trị viên trang để tạo, chỉnh sửa và xem bất kỳ mô hình dữ liệu nào trong trang của bạn trở nên cực kỳ dễ dàng.
- **Tuần tự hóa dữ liệu**: Django giúp dễ dàng tuần tự hóa và phục vụ dữ liệu của bạn dưới dạng XML hoặc JSON. Điều này có thể hữu ích khi tạo dịch vụ web (một website chỉ phục vụ dữ liệu để các ứng dụng hoặc trang khác sử dụng, và không tự hiển thị bất cứ điều gì), hoặc khi tạo website trong đó code phía client xử lý tất cả việc hiển thị dữ liệu.

## Tóm tắt

Xin chúc mừng, bạn đã hoàn thành bước đầu tiên trong hành trình Django của mình! Bạn bây giờ nên hiểu những lợi ích chính của Django, một chút về lịch sử của nó, và sơ bộ về những gì mỗi phần chính của ứng dụng Django có thể trông như thế nào. Bạn cũng nên đã học được một vài điều về ngôn ngữ lập trình Python, bao gồm cú pháp cho danh sách, hàm và lớp.

Bạn đã thấy một số code Django thực sự ở trên, nhưng không giống như code phía client, bạn cần thiết lập môi trường phát triển để chạy nó. Đó là bước tiếp theo của chúng ta.

{{NextMenu("Learn_web_development/Extensions/Server-side/Django/development_environment", "Learn_web_development/Extensions/Server-side/Django")}}
