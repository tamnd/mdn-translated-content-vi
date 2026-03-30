---
title: Các framework web phía máy chủ
short-title: Các framework phía máy chủ
slug: Learn_web_development/Extensions/Server-side/First_steps/Web_frameworks
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/First_steps/Client-Server_overview", "Learn_web_development/Extensions/Server-side/First_steps/Website_security", "Learn_web_development/Extensions/Server-side/First_steps")}}

Bài viết trước cho bạn thấy giao tiếp giữa máy khách web và máy chủ trông như thế nào, bản chất của các yêu cầu và phản hồi HTTP, và những gì ứng dụng web phía máy chủ cần làm để phản hồi các yêu cầu từ trình duyệt web. Với kiến thức này, đã đến lúc khám phá cách các framework web có thể đơn giản hóa các tác vụ này, và cho bạn ý tưởng về cách bạn sẽ chọn một framework cho ứng dụng web phía máy chủ đầu tiên của mình.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết cơ bản về cách mã phía máy chủ
        xử lý và phản hồi các yêu cầu HTTP (xem <a
          href="/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Client-Server_overview"
          >Tổng quan về Client-Server</a
        >).
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Để hiểu cách các framework web có thể đơn giản hóa việc phát triển/bảo trì
        mã phía máy chủ và giúp độc giả suy nghĩ về việc chọn framework
        cho phát triển của riêng họ.
      </td>
    </tr>
  </tbody>
</table>

Các phần tiếp theo minh họa một số điểm bằng cách sử dụng các đoạn mã lấy từ các framework web thực. Đừng lo lắng nếu nó không **tất cả** có ý nghĩa ngay bây giờ; chúng ta sẽ làm việc với bạn thông qua mã trong các mô-đun dành riêng cho framework.

## Tổng quan

Các framework web phía máy chủ (còn được gọi là "framework ứng dụng web") là các framework phần mềm giúp việc viết, duy trì và mở rộng các ứng dụng web dễ dàng hơn. Chúng cung cấp các công cụ và thư viện đơn giản hóa các tác vụ phát triển web thông thường, bao gồm định tuyến URL đến các trình xử lý thích hợp, tương tác với cơ sở dữ liệu, hỗ trợ phiên làm việc và phân quyền người dùng, định dạng đầu ra (ví dụ: HTML, JSON, XML), và cải thiện bảo mật chống lại các cuộc tấn công web.

Phần tiếp theo cung cấp thêm chi tiết về cách các framework web có thể hỗ trợ phát triển ứng dụng web. Sau đó chúng ta giải thích một số tiêu chí bạn có thể sử dụng để chọn framework web, và sau đó liệt kê một số lựa chọn của bạn.

## Một framework web có thể làm gì cho bạn?

Các framework web cung cấp các công cụ và thư viện để đơn giản hóa các thao tác phát triển web thông thường. Bạn _không_ phải sử dụng framework web phía máy chủ, nhưng được khuyến khích mạnh mẽ — nó sẽ làm cho cuộc sống của bạn dễ dàng hơn nhiều.

Phần này thảo luận về một số chức năng thường được cung cấp bởi các framework web (không phải mọi framework đều nhất thiết cung cấp tất cả các tính năng này!).

### Làm việc trực tiếp với các yêu cầu và phản hồi HTTP

Như chúng ta đã thấy trong bài viết cuối, các máy chủ web và trình duyệt giao tiếp qua giao thức HTTP — máy chủ chờ các yêu cầu HTTP từ trình duyệt và sau đó trả về thông tin trong các phản hồi HTTP. Các framework web cho phép bạn viết cú pháp đơn giản hóa sẽ tạo mã phía máy chủ để làm việc với các yêu cầu và phản hồi này. Điều này có nghĩa là bạn sẽ có công việc dễ dàng hơn, tương tác với mã cấp cao hơn, dễ dàng hơn thay vì các nguyên thủy mạng cấp thấp hơn.

Ví dụ dưới đây cho thấy điều này hoạt động như thế nào trong framework web Django (Python). Mỗi hàm "xem" (trình xử lý yêu cầu) nhận một đối tượng `HttpRequest` chứa thông tin yêu cầu, và được yêu cầu trả về một đối tượng `HttpResponse` với đầu ra được định dạng (trong trường hợp này là một chuỗi).

```python
# Django view function
from django.http import HttpResponse

def index(request):
    # Get an HttpRequest (request)
    # perform operations using information from the request.
    # Return HttpResponse
    return HttpResponse('Output string to return')
```

### Định tuyến các yêu cầu đến trình xử lý thích hợp

Hầu hết các trang web sẽ cung cấp một số tài nguyên khác nhau, có thể truy cập thông qua các URL khác biệt. Xử lý tất cả các điều này trong một hàm sẽ khó duy trì, vì vậy các framework web cung cấp các cơ chế đơn giản để ánh xạ các mẫu URL đến các hàm xử lý cụ thể. Cách tiếp cận này cũng có lợi ích về bảo trì, vì bạn có thể thay đổi URL được sử dụng để cung cấp một tính năng cụ thể mà không phải thay đổi mã bên dưới.

Các framework khác nhau sử dụng các cơ chế khác nhau cho việc ánh xạ. Ví dụ, framework web Flask (Python) thêm các tuyến đến các hàm xem bằng cách sử dụng decorator.

```python
@app.route("/")
def hello():
    return "Hello World!"
```

Trong khi Django yêu cầu các nhà phát triển xác định danh sách các ánh xạ URL giữa mẫu URL và hàm xem.

```python
urlpatterns = [
    url(r'^$', views.index),
    # example: /best/my_team_name/5/
    url(r'^best/(?P<team_name>\w+?)/(?P<team_number>[0-9]+)/$', views.best),
]
```

### Dễ dàng truy cập dữ liệu trong yêu cầu

Dữ liệu có thể được mã hóa trong yêu cầu HTTP theo một số cách. Yêu cầu HTTP `GET` để lấy tệp hoặc dữ liệu từ máy chủ có thể mã hóa dữ liệu nào cần thiết trong các tham số URL hoặc trong cấu trúc URL. Yêu cầu HTTP `POST` để cập nhật tài nguyên trên máy chủ thay vào đó sẽ bao gồm thông tin cập nhật như "dữ liệu POST" trong phần thân của yêu cầu. Yêu cầu HTTP cũng có thể bao gồm thông tin về phiên hoặc người dùng hiện tại trong cookie phía máy khách.

Các framework web cung cấp các cơ chế phù hợp với ngôn ngữ lập trình để truy cập thông tin này. Ví dụ, đối tượng `HttpRequest` mà Django chuyển đến mọi hàm xem chứa các phương thức và thuộc tính để truy cập URL đích, loại yêu cầu (ví dụ: HTTP `GET`), tham số `GET` hoặc `POST`, cookie và dữ liệu phiên, v.v. Django cũng có thể truyền thông tin được mã hóa trong cấu trúc URL bằng cách xác định "mẫu bắt" trong trình ánh xạ URL (xem đoạn mã cuối trong phần trên).

### Trừu tượng hóa và đơn giản hóa quyền truy cập cơ sở dữ liệu

Các trang web sử dụng cơ sở dữ liệu để lưu trữ thông tin cả được chia sẻ với người dùng, và về người dùng. Các framework web thường cung cấp một lớp cơ sở dữ liệu trừu tượng hóa các thao tác đọc, viết, truy vấn và xóa cơ sở dữ liệu. Lớp trừu tượng này được gọi là Object-Relational Mapper (ORM).

Sử dụng ORM có hai lợi ích:

- Bạn có thể thay thế cơ sở dữ liệu bên dưới mà không nhất thiết phải thay đổi mã sử dụng nó. Điều này cho phép các nhà phát triển tối ưu hóa cho các đặc điểm của các cơ sở dữ liệu khác nhau dựa trên cách sử dụng của họ.
- Xác thực cơ bản của dữ liệu có thể được triển khai trong framework. Điều này làm cho việc kiểm tra và đảm bảo rằng dữ liệu được lưu trữ trong đúng loại trường cơ sở dữ liệu, có định dạng chính xác (ví dụ: địa chỉ email), và không độc hại theo bất kỳ cách nào (các hacker có thể sử dụng các mẫu mã nhất định để làm những việc xấu như xóa bản ghi cơ sở dữ liệu) trở nên dễ dàng và an toàn hơn.

Ví dụ, framework web Django cung cấp ORM và gọi đối tượng được sử dụng để định nghĩa cấu trúc của bản ghi là _mô hình_. Mô hình chỉ định _kiểu_ trường cần lưu trữ, có thể cung cấp xác thực ở cấp trường về thông tin nào có thể được lưu trữ (ví dụ: trường email chỉ cho phép địa chỉ email hợp lệ). Các định nghĩa trường cũng có thể chỉ định kích thước tối đa, giá trị mặc định, các tùy chọn danh sách chọn, văn bản trợ giúp cho tài liệu, văn bản nhãn cho biểu mẫu, v.v. Mô hình không nêu bất kỳ thông tin nào về cơ sở dữ liệu bên dưới vì đó là cài đặt cấu hình có thể thay đổi riêng biệt với mã của chúng ta.

Đoạn mã đầu tiên dưới đây cho thấy mô hình Django rất đơn giản cho đối tượng `Team`. Mô hình này lưu trữ tên đội và cấp độ đội dưới dạng trường ký tự và chỉ định số ký tự tối đa cần lưu trữ cho mỗi bản ghi. `team_level` là trường lựa chọn, vì vậy chúng ta cũng cung cấp ánh xạ giữa các lựa chọn được hiển thị và dữ liệu cần lưu trữ, cùng với giá trị mặc định.

```python
#best/models.py

from django.db import models

class Team(models.Model):
    team_name = models.CharField(max_length=40)

    TEAM_LEVELS = (
        ('U09', 'Under 09s'),
        ('U10', 'Under 10s'),
        ('U11', 'Under 11s'),
        # List our other teams
    )
    team_level = models.CharField(max_length=3,choices=TEAM_LEVELS,default='U11')
```

Mô hình Django cung cấp API truy vấn đơn giản cho việc tìm kiếm cơ sở dữ liệu. Điều này có thể khớp với một số trường cùng một lúc bằng cách sử dụng các tiêu chí khác nhau (ví dụ: chính xác, không phân biệt chữ hoa chữ thường, lớn hơn, v.v.), và có thể hỗ trợ các câu lệnh phức tạp (ví dụ: bạn có thể chỉ định tìm kiếm trên các đội U11 có tên đội bắt đầu bằng "Fr" hoặc kết thúc bằng "al").

Đoạn mã thứ hai cho thấy hàm xem (trình xử lý tài nguyên) để hiển thị tất cả các đội U09 của chúng ta. Trong trường hợp này, chúng ta chỉ định rằng chúng ta muốn lọc tất cả các bản ghi mà trường `team_level` có chính xác văn bản 'U09' (lưu ý bên dưới cách tiêu chí này được chuyển đến hàm `filter()` như là đối số với tên trường và kiểu khớp được phân tách bởi hai dấu gạch dưới: **team_level\_\_exact**).

```python
#best/views.py

from django.shortcuts import render
from .models import Team

def youngest(request):
    list_teams = Team.objects.filter(team_level__exact="U09")
    context = {'youngest_teams': list_teams}
    return render(request, 'best/index.html', context)
```

### Hiển thị dữ liệu

Các framework web thường cung cấp các hệ thống tạo mẫu. Chúng cho phép bạn chỉ định cấu trúc của tài liệu đầu ra, sử dụng các trình giữ chỗ cho dữ liệu sẽ được thêm vào khi trang được tạo ra. Các mẫu thường được sử dụng để tạo HTML, nhưng cũng có thể tạo các loại tài liệu khác.

Các framework web thường cung cấp cơ chế để dễ dàng tạo các định dạng khác từ dữ liệu đã lưu, bao gồm {{glossary("JSON")}} và {{glossary("XML")}}.

Ví dụ, hệ thống mẫu Django cho phép bạn chỉ định các biến bằng cách sử dụng cú pháp "double-handlebars" (ví dụ: `\{{ variable_name }}`), sẽ được thay thế bằng các giá trị được truyền từ hàm xem khi trang được hiển thị. Hệ thống mẫu cũng cung cấp hỗ trợ cho các biểu thức (với cú pháp: `{% expression %}`), cho phép các mẫu thực hiện các thao tác đơn giản như lặp qua các giá trị danh sách được truyền vào mẫu.

> [!NOTE]
> Nhiều hệ thống tạo mẫu khác sử dụng cú pháp tương tự, ví dụ: Jinja2 (Python), handlebars (JavaScript), moustache (JavaScript), v.v.

Đoạn mã dưới đây cho thấy điều này hoạt động như thế nào. Tiếp tục ví dụ "đội trẻ nhất" từ phần trước, mẫu HTML được truyền một biến danh sách có tên `youngest_teams` bởi hàm xem. Bên trong bộ khung HTML chúng ta có một biểu thức trước tiên kiểm tra xem biến `youngest_teams` có tồn tại không, và sau đó lặp qua nó trong vòng lặp `for`. Trên mỗi lần lặp, mẫu hiển thị giá trị `team_name` của đội trong một mục danh sách.

```django
#best/templates/best/index.html

<!doctype html>
<html lang="en">
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

## Cách chọn framework web

Có nhiều framework web tồn tại cho hầu hết mọi ngôn ngữ lập trình bạn có thể muốn sử dụng (chúng ta liệt kê một số framework phổ biến hơn trong phần tiếp theo). Với rất nhiều lựa chọn, có thể khó xác định framework nào cung cấp điểm khởi đầu tốt nhất cho ứng dụng web mới của bạn.

Một số yếu tố có thể ảnh hưởng đến quyết định của bạn là:

- **Công sức học tập:** Công sức học tập framework web phụ thuộc vào bạn quen thuộc với ngôn ngữ lập trình bên dưới như thế nào, sự nhất quán của API của nó, chất lượng tài liệu của nó, và quy mô và hoạt động của cộng đồng của nó. Nếu bạn bắt đầu từ hoàn toàn không có kinh nghiệm lập trình nào thì hãy xem xét Django (nó là một trong những dễ học nhất dựa trên các tiêu chí trên). Nếu bạn là một phần của nhóm phát triển đã có kinh nghiệm đáng kể với một framework web hoặc ngôn ngữ lập trình cụ thể, thì có ý nghĩa khi gắn bó với điều đó.
- **Năng suất:** Năng suất là thước đo mức độ nhanh chóng bạn có thể tạo các tính năng mới khi đã quen với framework, và bao gồm cả công sức để viết và duy trì mã (vì bạn không thể viết các tính năng mới trong khi các tính năng cũ bị hỏng). Nhiều yếu tố ảnh hưởng đến năng suất tương tự với những yếu tố cho "Công sức học tập" — ví dụ: tài liệu, cộng đồng, kinh nghiệm lập trình, v.v. — các yếu tố khác bao gồm:
  - _Mục đích/nguồn gốc của Framework_: Một số framework web ban đầu được tạo ra để giải quyết các loại vấn đề nhất định, và vẫn _tốt hơn_ khi tạo các ứng dụng web với các ràng buộc tương tự. Ví dụ, Django được tạo ra để hỗ trợ phát triển một trang web báo, vì vậy nó tốt cho các blog và các trang web khác liên quan đến việc xuất bản nội dung. Ngược lại, Flask là một framework nhẹ hơn nhiều và tuyệt vời để tạo các ứng dụng web chạy trên các thiết bị nhúng.
  - _Có ý kiến vs. không có ý kiến_: Framework có ý kiến là framework trong đó có những cách "tốt nhất" được khuyến nghị để giải quyết một vấn đề cụ thể. Các framework có ý kiến thường năng suất hơn khi bạn đang cố gắng giải quyết các vấn đề phổ biến, vì chúng dẫn bạn theo hướng đúng, tuy nhiên đôi khi kém linh hoạt hơn.
  - _Pin kèm vs. tự lấy_: Một số framework web bao gồm các công cụ/thư viện giải quyết mọi vấn đề mà nhà phát triển của họ có thể nghĩ đến "theo mặc định", trong khi các framework nhẹ hơn mong đợi các nhà phát triển web chọn và chọn giải pháp cho các vấn đề từ các thư viện riêng biệt (Django là ví dụ của cái trước, trong khi Flask là ví dụ của một framework rất nhẹ). Các framework bao gồm mọi thứ thường dễ dàng bắt đầu hơn vì bạn đã có mọi thứ bạn cần, và khả năng là nó được tích hợp tốt và được tài liệu hóa tốt. Tuy nhiên nếu một framework nhỏ hơn có mọi thứ bạn (sẽ từng) cần thì nó có thể chạy trong các môi trường bị hạn chế hơn và sẽ có tập hợp nhỏ hơn và dễ học hơn.
  - _Liệu framework có khuyến khích các thực hành phát triển tốt không_: Ví dụ, một framework khuyến khích kiến trúc [Model-View-Controller](/en-US/docs/Glossary/MVC) để tách mã thành các hàm logic sẽ dẫn đến mã có thể bảo trì hơn so với một framework không có kỳ vọng gì đối với các nhà phát triển. Tương tự, thiết kế framework có thể có tác động lớn đến việc kiểm tra và tái sử dụng mã dễ dàng như thế nào.

- **Hiệu suất của framework/ngôn ngữ lập trình:** Thường thì "tốc độ" không phải là yếu tố lớn nhất trong việc lựa chọn vì ngay cả các runtime tương đối chậm như Python cũng đủ "tốt" cho các trang web cỡ trung bình chạy trên phần cứng vừa phải. Lợi ích tốc độ nhận thấy của một ngôn ngữ khác, ví dụ: C++ hoặc JavaScript, có thể được bù đắp bởi chi phí học tập và bảo trì.
- **Hỗ trợ caching:** Khi trang web của bạn trở nên thành công hơn, bạn có thể thấy rằng nó không còn có thể đáp ứng số lượng yêu cầu nó đang nhận khi người dùng truy cập. Tại thời điểm này, bạn có thể xem xét thêm hỗ trợ cho caching. Caching là một tối ưu hóa nơi bạn lưu trữ tất cả hoặc một phần phản hồi web để nó không phải được tính toán lại trong các yêu cầu tiếp theo. Trả về phản hồi được lưu trong bộ nhớ đệm nhanh hơn nhiều so với việc tính toán ngay từ đầu. Caching có thể được triển khai trong mã của bạn hoặc trong máy chủ (xem [reverse proxy](https://en.wikipedia.org/wiki/Reverse_proxy)). Các framework web sẽ có các mức độ hỗ trợ khác nhau để xác định nội dung nào có thể được lưu trong bộ nhớ đệm.
- **Khả năng mở rộng:** Khi trang web của bạn thành công phi thường, bạn sẽ cạn kiệt lợi ích của caching và thậm chí đạt đến giới hạn của _mở rộng theo chiều dọc_ (chạy ứng dụng web của bạn trên phần cứng mạnh hơn). Tại thời điểm này, bạn có thể cần _mở rộng theo chiều ngang_ (chia sẻ tải bằng cách phân phối trang web của bạn trên một số máy chủ web và cơ sở dữ liệu) hoặc mở rộng "theo địa lý" vì một số khách hàng của bạn ở xa máy chủ của bạn. Framework web bạn chọn có thể tạo ra sự khác biệt lớn về việc mở rộng trang web của bạn dễ dàng như thế nào.
- **Bảo mật web:** Một số framework web cung cấp hỗ trợ tốt hơn để xử lý các cuộc tấn công web thông thường. Ví dụ, Django làm sạch tất cả đầu vào của người dùng từ các mẫu HTML để JavaScript do người dùng nhập không thể chạy. Các framework khác cung cấp bảo vệ tương tự, nhưng không phải lúc nào cũng được bật theo mặc định.

Có nhiều yếu tố có thể xảy ra khác, bao gồm cấp phép, liệu framework có đang được phát triển tích cực hay không, v.v.

Nếu bạn là người tuyệt đối mới bắt đầu lập trình, bạn có thể sẽ chọn framework của mình dựa trên "dễ học". Ngoài "dễ sử dụng" của bản thân ngôn ngữ, tài liệu/hướng dẫn chất lượng cao và một cộng đồng năng động giúp đỡ người dùng mới là các tài nguyên có giá trị nhất của bạn. Chúng tôi đã chọn [Django](https://www.djangoproject.com/) (Python) và [Express](https://expressjs.com/) (Node/JavaScript) để viết các ví dụ của chúng tôi sau này trong khóa học, chủ yếu vì chúng dễ học và có hỗ trợ tốt.

> [!NOTE]
> Hãy đến các trang web chính cho [Django](https://www.djangoproject.com/) (Python) và [Express](https://expressjs.com/) (Node/JavaScript) và xem tài liệu và cộng đồng của chúng.
>
> 1. Điều hướng đến các trang web chính (được liên kết ở trên)
>    - Nhấp vào các liên kết menu Tài liệu (được đặt tên như "Documentation, Guide, API Reference, Getting Started", v.v.).
>    - Bạn có thể thấy các chủ đề cho thấy cách thiết lập định tuyến URL, mẫu, và cơ sở dữ liệu/mô hình không?
>    - Các tài liệu có rõ ràng không?
> 2. Điều hướng đến danh sách gửi thư cho mỗi trang (có thể truy cập từ các liên kết Cộng đồng).
>    - Có bao nhiêu câu hỏi đã được đăng trong vài ngày qua
>    - Có bao nhiêu câu trả lời?
>    - Họ có một cộng đồng năng động không?

## Một số framework web tốt?

Bây giờ hãy chuyển sang, và thảo luận về một số framework web phía máy chủ cụ thể.

Các framework phía máy chủ dưới đây đại diện cho _một số_ trong số những framework phổ biến nhất hiện có tại thời điểm viết bài. Tất cả chúng đều có mọi thứ bạn cần để có năng suất — chúng là mã nguồn mở, đang được phát triển tích cực, có các cộng đồng nhiệt tình tạo tài liệu và giúp đỡ người dùng trên các bảng thảo luận, và được sử dụng trong nhiều trang web nổi tiếng. Có nhiều framework phía máy chủ tuyệt vời khác mà bạn có thể khám phá bằng cách tìm kiếm cơ bản trên internet.

> [!NOTE]
> Mô tả đến (một phần) từ các trang web framework!

### Django (Python)

[Django](https://www.djangoproject.com/) là Framework Web Python cấp cao khuyến khích phát triển nhanh và thiết kế sạch, thực dụng. Được xây dựng bởi các nhà phát triển có kinh nghiệm, nó giải quyết phần lớn sự phức tạp của phát triển web, vì vậy bạn có thể tập trung vào việc viết ứng dụng mà không cần phải phát minh lại bánh xe. Nó miễn phí và mã nguồn mở.

Django theo triết lý "Batteries included" và cung cấp hầu hết mọi thứ mà hầu hết các nhà phát triển có thể muốn làm "out of the box". Vì mọi thứ được bao gồm, chúng hoạt động cùng nhau, tuân theo các nguyên tắc thiết kế nhất quán, và có tài liệu phong phú và cập nhật. Nó cũng nhanh, an toàn, và rất có thể mở rộng. Vì dựa trên Python, mã Django dễ đọc và bảo trì.

Các trang web phổ biến sử dụng Django (từ trang chủ Django) bao gồm: Disqus, Instagram, Knight Foundation, MacArthur Foundation, Mozilla, National Geographic, Open Knowledge Foundation, Pinterest, Open Stack.

### Flask (Python)

[Flask](https://flask.palletsprojects.com/) là một microframework cho Python.

Mặc dù tối giản, Flask có thể tạo ra các trang web nghiêm túc ngay từ đầu. Nó chứa một máy chủ phát triển và debugger, và bao gồm hỗ trợ cho tạo mẫu [Jinja2](https://github.com/pallets/jinja), cookie an toàn, [kiểm tra đơn vị](https://en.wikipedia.org/wiki/Unit_testing), và phân phối yêu cầu [RESTful](https://restapitutorial.com/). Nó có tài liệu tốt và một cộng đồng năng động.

Flask đã trở nên cực kỳ phổ biến, đặc biệt là đối với các nhà phát triển cần cung cấp dịch vụ web trên các hệ thống nhỏ, bị hạn chế tài nguyên (ví dụ: chạy máy chủ web trên [Raspberry Pi](https://www.raspberrypi.org/), [Bộ điều khiển máy bay không người lái](https://www.techuseful.com/drone-definitions-learning-the-drone-lingo/), v.v.)

### Express (Node.js/JavaScript)

[Express](https://expressjs.com/) là một framework web nhanh, không có ý kiến, linh hoạt và tối giản cho [Node.js](https://nodejs.org/en/) (node là môi trường không có trình duyệt để chạy JavaScript). Nó cung cấp một bộ tính năng mạnh mẽ cho các ứng dụng web và di động và cung cấp các phương thức tiện ích HTTP hữu ích và [middleware](/en-US/docs/Glossary/Middleware).

Express cực kỳ phổ biến, một phần vì nó hỗ trợ di chuyển các lập trình viên JavaScript web phía máy khách sang phát triển phía máy chủ, và một phần vì nó hiệu quả về tài nguyên (môi trường node bên dưới sử dụng đa nhiệm nhẹ trong một luồng thay vì tạo các tiến trình riêng biệt cho mỗi yêu cầu web mới).

Vì Express là một framework web tối giản, nó không kết hợp mọi thành phần mà bạn có thể muốn sử dụng (ví dụ: quyền truy cập cơ sở dữ liệu và hỗ trợ người dùng và phiên được cung cấp thông qua các thư viện độc lập). Có nhiều thành phần độc lập tuyệt vời, nhưng đôi khi có thể khó xác định cái nào tốt nhất cho một mục đích cụ thể!

Nhiều framework phía máy chủ phổ biến và full-stack (bao gồm cả framework phía máy chủ và máy khách) dựa trên Express, bao gồm [Feathers](https://feathersjs.com/), [ItemsAPI](https://itemsapi.com/), [KeystoneJS](https://keystonejs.com/), [Kraken](https://krakenjs.com/), [LoopBack](https://loopback.io/), [MEAN](https://github.com/linnovate/mean), và [Sails](https://sailsjs.com/).

Nhiều công ty nổi tiếng sử dụng Express, bao gồm: Uber, Accenture, IBM, v.v.

### Deno (JavaScript)

[Deno](https://deno.com/) là một runtime và framework JavaScript/TypeScript đơn giản, hiện đại, và an toàn được xây dựng trên Chrome V8 và [Rust](https://rust-lang.org/).

Deno được hỗ trợ bởi [Tokio](https://tokio.rs/) — một runtime bất đồng bộ dựa trên Rust cho phép nó phục vụ các trang web nhanh hơn. Nó cũng có hỗ trợ nội bộ cho [WebAssembly](/en-US/docs/WebAssembly), cho phép biên dịch mã nhị phân để sử dụng ở phía máy khách. Deno nhằm mục đích lấp đầy một số lỗ hổng trong [Node.js](/en-US/docs/Learn_web_development/Extensions/Server-side/Node_server_without_framework) bằng cách cung cấp cơ chế tự nhiên duy trì bảo mật tốt hơn.

Các tính năng của Deno bao gồm:

- Bảo mật theo mặc định. [Các mô-đun Deno hạn chế quyền](https://docs.deno.com/runtime/fundamentals/security/) đối với quyền truy cập **tệp**, **mạng**, hoặc **môi trường** trừ khi được cho phép rõ ràng.
- Hỗ trợ TypeScript **out-of-the-box**.
- Cơ chế await đầu tiên.
- Cơ sở kiểm tra tích hợp và trình định dạng mã (`deno fmt`)
- Khả năng tương thích Trình duyệt (JavaScript): Các chương trình Deno được viết hoàn toàn bằng JavaScript không bao gồm không gian tên `Deno` (hoặc kiểm tra tính năng cho nó), sẽ hoạt động trực tiếp trong bất kỳ trình duyệt hiện đại nào.
- Đóng gói script thành một tệp JavaScript duy nhất.

Deno cung cấp một cách dễ dàng nhưng mạnh mẽ để sử dụng JavaScript cho cả lập trình phía máy khách và máy chủ.

### Ruby on Rails (Ruby)

[Rails](https://rubyonrails.org/) (thường được gọi là "Ruby on Rails") là một framework web được viết cho ngôn ngữ lập trình Ruby.

Rails tuân theo một triết lý thiết kế rất tương tự Django. Như Django, nó cung cấp các cơ chế tiêu chuẩn để định tuyến URL, truy cập dữ liệu từ cơ sở dữ liệu, tạo HTML từ mẫu và định dạng dữ liệu dưới dạng {{glossary("JSON")}} hoặc {{glossary("XML")}}. Nó tương tự khuyến khích sử dụng các mẫu thiết kế như DRY ("don't repeat yourself" — chỉ viết mã một lần nếu có thể), MVC (model-view-controller) và một số mẫu khác.

Tất nhiên có nhiều sự khác biệt do các quyết định thiết kế cụ thể và bản chất của các ngôn ngữ.

Rails đã được sử dụng cho các trang web nổi tiếng, bao gồm: [Basecamp](https://basecamp.com/), [GitHub](https://github.com/), [Shopify](https://www.shopify.com/), [Airbnb](https://www.airbnb.com/), [Twitch](https://www.twitch.tv/), [SoundCloud](https://soundcloud.com/), [Hulu](https://www.hulu.com/welcome), [Zendesk](https://www.zendesk.com/), [Square](https://squareup.com/us/en).

### Laravel (PHP)

[Laravel](https://laravel.com/) là một framework ứng dụng web với cú pháp biểu đạt, thanh lịch. Laravel cố gắng loại bỏ sự đau đớn khỏi việc phát triển bằng cách làm dễ dàng các tác vụ thông thường được sử dụng trong phần lớn các dự án web, chẳng hạn như:

- [Công cụ định tuyến đơn giản, nhanh chóng](https://laravel.com/docs/routing).
- [Container tiêm phụ thuộc mạnh mẽ](https://laravel.com/docs/container).
- Nhiều backend cho lưu trữ [phiên](https://laravel.com/docs/session) và [cache](https://laravel.com/docs/cache).
- [ORM cơ sở dữ liệu](https://laravel.com/docs/eloquent) biểu đạt, trực quan.
- [Di chuyển schema](https://laravel.com/docs/migrations) không phụ thuộc cơ sở dữ liệu.
- [Xử lý công việc nền mạnh mẽ](https://laravel.com/docs/queues).
- [Phát sóng sự kiện thời gian thực](https://laravel.com/docs/broadcasting).

Laravel có thể truy cập, nhưng mạnh mẽ, cung cấp các công cụ cần thiết cho các ứng dụng lớn, mạnh mẽ.

### ASP.NET

[ASP.NET](https://dotnet.microsoft.com/en-us/apps/aspnet) là một framework web mã nguồn mở được phát triển bởi Microsoft để xây dựng các ứng dụng và dịch vụ web hiện đại. Với ASP.NET, bạn có thể nhanh chóng tạo ra các trang web dựa trên HTML, CSS và JavaScript, mở rộng chúng để sử dụng bởi hàng triệu người dùng và dễ dàng thêm các khả năng phức tạp hơn như Web API, biểu mẫu trên dữ liệu, hoặc giao tiếp thời gian thực.

Một trong những điểm khác biệt của ASP.NET là nó được xây dựng trên [Common Language Runtime](https://en.wikipedia.org/wiki/Common_Language_Runtime) (CLR), cho phép các lập trình viên viết mã ASP.NET bằng bất kỳ ngôn ngữ .NET được hỗ trợ nào (C#, Visual Basic, v.v.). Như nhiều sản phẩm Microsoft, nó hưởng lợi từ các công cụ tuyệt vời (thường miễn phí), một cộng đồng nhà phát triển năng động, và tài liệu được viết tốt.

ASP.NET được sử dụng bởi Microsoft, Xbox.com, Stack Overflow, và nhiều trang web khác.

### Mojolicious (Perl)

[Mojolicious](https://mojolicious.org/) là một framework web thế hệ tiếp theo cho ngôn ngữ lập trình Perl.

Trong những ngày đầu của web, nhiều người đã học Perl vì một thư viện Perl tuyệt vời được gọi là [CGI](https://metacpan.org/pod/CGI). Nó đủ đơn giản để bắt đầu mà không cần biết nhiều về ngôn ngữ và đủ mạnh để tiếp tục. Mojolicious triển khai ý tưởng này bằng cách sử dụng các công nghệ tiên tiến.

Một số tính năng được cung cấp bởi Mojolicious là:

- Một framework web thời gian thực, để dễ dàng phát triển các nguyên mẫu một tệp thành các ứng dụng web MVC có cấu trúc tốt.
- Định tuyến RESTful, plugin, lệnh, mẫu kiểu Perl, đàm phán nội dung, quản lý phiên, xác thực biểu mẫu, framework kiểm tra, máy chủ tệp tĩnh, phát hiện CGI/[PSGI](https://plackperl.org/), và hỗ trợ Unicode đầu tiên.
- Triển khai đầy đủ client/server HTTP và WebSocket với hỗ trợ IPv6, TLS, SNI, IDNA, HTTP/SOCKS5 proxy, UNIX domain socket, Comet (long polling), keep-alive, connection pooling, timeout, cookie, multipart, và gzip compression.
- Parser và generator JSON và HTML/XML với hỗ trợ CSS selector.
- API Perl thuần túy, di động và hướng đối tượng rất sạch với không có phép màu ẩn.
- Mã tươi dựa trên nhiều năm kinh nghiệm, miễn phí và mã nguồn mở.

### Spring Boot (Java)

[Spring Boot](https://spring.io/projects/spring-boot/) là một trong số dự án được cung cấp bởi [Spring](https://spring.io/). Đây là điểm khởi đầu tốt để thực hiện phát triển web phía máy chủ bằng [Java](https://www.java.com/).

Mặc dù chắc chắn không phải là framework duy nhất dựa trên [Java](https://www.java.com/) nhưng nó dễ sử dụng để tạo ra các Ứng dụng dựa trên Spring độc lập, cấp sản xuất mà bạn có thể "chỉ cần chạy". Đây là cách nhìn theo ý kiến về nền tảng Spring và các thư viện bên thứ ba nhưng cho phép bắt đầu với sự phức tạp và cấu hình tối thiểu.

Nó có thể được sử dụng cho các vấn đề nhỏ nhưng điểm mạnh của nó là xây dựng các ứng dụng quy mô lớn hơn sử dụng cách tiếp cận đám mây. Thường nhiều ứng dụng chạy song song nói chuyện với nhau, với một số cung cấp tương tác người dùng và một số thực hiện công việc phụ trợ (ví dụ: truy cập cơ sở dữ liệu hoặc các dịch vụ khác). Bộ cân bằng tải giúp đảm bảo dự phòng và độ tin cậy hoặc cho phép xử lý định vị địa lý của yêu cầu người dùng để đảm bảo khả năng phản hồi.

## Tóm tắt

Bài viết này đã cho thấy rằng các framework web có thể làm cho việc phát triển và bảo trì mã phía máy chủ dễ dàng hơn. Nó cũng đã cung cấp tổng quan cấp cao về một số framework phổ biến, và thảo luận về các tiêu chí để chọn framework ứng dụng web. Bây giờ bạn ít nhất nên có ý tưởng về cách chọn framework web cho phát triển phía máy chủ của riêng bạn. Nếu không, đừng lo lắng — sau này trong khóa học, chúng ta sẽ cung cấp cho bạn các hướng dẫn chi tiết về Django và Express để cho bạn một số kinh nghiệm thực sự làm việc với framework web.

Đối với bài viết tiếp theo trong mô-đun này, chúng ta sẽ thay đổi hướng một chút và xem xét bảo mật web.

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/First_steps/Client-Server_overview", "Learn_web_development/Extensions/Server-side/First_steps/Website_security", "Learn_web_development/Extensions/Server-side/First_steps")}}
