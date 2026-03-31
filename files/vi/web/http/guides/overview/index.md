---
title: Tổng quan về HTTP
slug: Web/HTTP/Guides/Overview
page-type: guide
sidebar: http
---

**HTTP** là một {{Glossary("protocol", "giao thức")}} để tải các tài nguyên như tài liệu HTML.
Đây là nền tảng của mọi trao đổi dữ liệu trên Web và là giao thức client-server, nghĩa là các yêu cầu được khởi tạo bởi người nhận, thường là trình duyệt web.
Một tài liệu hoàn chỉnh thường được xây dựng từ các tài nguyên như nội dung văn bản, hướng dẫn bố cục, hình ảnh, video, script và nhiều hơn nữa.

![Một tài liệu Web đơn lẻ được tổng hợp từ nhiều tài nguyên từ các máy chủ khác nhau.](https://mdn.github.io/shared-assets/images/diagrams/http/overview/fetching-a-page.svg)

Client và máy chủ giao tiếp bằng cách trao đổi các thông điệp riêng lẻ (trái ngược với luồng dữ liệu).
Các thông điệp được gửi bởi client được gọi là _yêu cầu_ và các thông điệp được gửi bởi máy chủ như một câu trả lời được gọi là _phản hồi_.

![HTTP như một giao thức tầng ứng dụng, trên TCP (tầng vận chuyển) và IP (tầng mạng) và bên dưới tầng trình bày.](https://mdn.github.io/shared-assets/images/diagrams/http/overview/http-layers.svg)

Được thiết kế vào đầu những năm 1990, HTTP là một giao thức có thể mở rộng và đã phát triển theo thời gian.
Đây là giao thức tầng ứng dụng được gửi qua {{Glossary("TCP")}}, hoặc qua kết nối TCP được mã hóa {{Glossary("TLS")}}, mặc dù bất kỳ giao thức vận chuyển đáng tin cậy nào về mặt lý thuyết đều có thể được sử dụng.
Do khả năng mở rộng của nó, HTTP không chỉ được sử dụng để tải các tài liệu siêu văn bản, mà còn tải hình ảnh và video, hoặc đăng nội dung lên máy chủ, như với kết quả biểu mẫu HTML.
HTTP cũng có thể được sử dụng để tải các phần của tài liệu để cập nhật các trang Web theo yêu cầu.

## Các thành phần của hệ thống dựa trên HTTP

HTTP là giao thức client-server: các yêu cầu được gửi bởi một thực thể, user-agent (hoặc một proxy thay mặt nó).
Hầu hết thời gian, user-agent là một trình duyệt Web, nhưng nó có thể là bất cứ thứ gì, ví dụ như một robot thu thập Web để điền vào và duy trì chỉ mục công cụ tìm kiếm.

Mỗi yêu cầu riêng lẻ được gửi đến một máy chủ, xử lý nó và cung cấp một câu trả lời gọi là _phản hồi_.
Giữa client và máy chủ có nhiều thực thể, được gọi chung là {{Glossary("Proxy_server", "proxy")}}, thực hiện các hoạt động khác nhau và đóng vai trò là cổng hoặc {{Glossary("Cache", "bộ nhớ đệm")}}, ví dụ như vậy.

![Một yêu cầu HTTP từ client được chuyển tiếp qua nhiều proxy đến máy chủ và phản hồi đi theo cùng một tuyến đường trở lại với client.](https://mdn.github.io/shared-assets/images/diagrams/http/overview/client-server-chain.svg)

Trên thực tế, có nhiều máy tính hơn giữa trình duyệt và máy chủ xử lý yêu cầu: có router, modem, và nhiều hơn nữa.
Nhờ thiết kế phân lớp của Web, những thứ này được ẩn trong các lớp mạng và vận chuyển.
HTTP nằm trên cùng, ở tầng ứng dụng.
Mặc dù quan trọng để chẩn đoán vấn đề mạng, các lớp bên dưới phần lớn không liên quan đến mô tả HTTP.

### Client: user-agent

_User-agent_ là bất kỳ công cụ nào hoạt động thay mặt cho người dùng.
Vai trò này chủ yếu được thực hiện bởi trình duyệt Web, nhưng cũng có thể được thực hiện bởi các chương trình được sử dụng bởi kỹ sư và nhà phát triển Web để gỡ lỗi ứng dụng của họ.

Trình duyệt **luôn luôn** là thực thể khởi tạo yêu cầu.
Nó không bao giờ là máy chủ (mặc dù một số cơ chế đã được thêm vào qua nhiều năm để mô phỏng các thông điệp do máy chủ khởi tạo).

Để hiển thị một trang Web, trình duyệt gửi một yêu cầu ban đầu để tải tài liệu HTML đại diện cho trang.
Sau đó nó phân tích cú pháp tệp này, thực hiện các yêu cầu bổ sung tương ứng với các script thực thi, thông tin bố cục (CSS) để hiển thị, và các tài nguyên con trong trang (thường là hình ảnh và video).
Trình duyệt Web sau đó kết hợp các tài nguyên này để trình bày tài liệu hoàn chỉnh, trang Web.
Các script được thực thi bởi trình duyệt có thể tải thêm tài nguyên trong các giai đoạn sau và trình duyệt cập nhật trang Web tương ứng.

Một trang Web là một tài liệu siêu văn bản.
Điều này có nghĩa là một số phần của nội dung được hiển thị là các liên kết, có thể được kích hoạt (thường bằng cách nhấp chuột) để tải một trang Web mới, cho phép người dùng điều hướng user-agent của họ và duyệt qua Web.
Trình duyệt dịch các hướng dẫn này thành các yêu cầu HTTP, và tiếp tục giải thích các phản hồi HTTP để trình bày cho người dùng một phản hồi rõ ràng.

### Máy chủ Web

Ở phía đối diện của kênh giao tiếp là máy chủ, _phục vụ_ tài liệu theo yêu cầu của client.
Một máy chủ về mặt ảo xuất hiện như chỉ là một máy đơn; nhưng trên thực tế nó có thể là tập hợp các máy chủ chia sẻ tải (cân bằng tải), hoặc phần mềm khác (chẳng hạn như bộ nhớ đệm, máy chủ cơ sở dữ liệu, hoặc máy chủ thương mại điện tử), hoàn toàn hoặc một phần tạo ra tài liệu theo yêu cầu.

Một máy chủ không nhất thiết là một máy đơn, mà nhiều phiên bản phần mềm máy chủ có thể được lưu trữ trên cùng một máy.
Với HTTP/1.1 và tiêu đề {{HTTPHeader("Host")}}, chúng thậm chí có thể chia sẻ cùng một địa chỉ IP.

### Proxy

Giữa trình duyệt Web và máy chủ, nhiều máy tính và thiết bị chuyển tiếp các thông điệp HTTP.
Do cấu trúc phân lớp của ngăn xếp Web, hầu hết chúng hoạt động ở các cấp độ vận chuyển, mạng hoặc vật lý, trở nên trong suốt ở lớp HTTP và có khả năng gây ra tác động đáng kể đến hiệu suất.
Những thứ hoạt động ở các lớp ứng dụng thường được gọi là **proxy**.
Chúng có thể trong suốt, chuyển tiếp các yêu cầu mà chúng nhận được mà không thay đổi bất kỳ điều gì theo bất kỳ cách nào, hoặc không trong suốt, trong trường hợp này chúng sẽ thay đổi yêu cầu theo một cách nào đó trước khi chuyển tiếp đến máy chủ.
Proxy có thể thực hiện nhiều chức năng:

- bộ nhớ đệm (bộ nhớ đệm có thể là công khai hoặc riêng tư, như bộ nhớ đệm trình duyệt)
- lọc (như quét antivirus hoặc kiểm soát của cha mẹ)
- cân bằng tải (để cho phép nhiều máy chủ phục vụ các yêu cầu khác nhau)
- xác thực (để kiểm soát quyền truy cập vào các tài nguyên khác nhau)
- ghi nhật ký (cho phép lưu trữ thông tin lịch sử)

## Các khía cạnh cơ bản của HTTP

### HTTP đơn giản

HTTP thường được thiết kế để con người có thể đọc được, ngay cả khi có thêm độ phức tạp được giới thiệu trong HTTP/2 bằng cách đóng gói các thông điệp HTTP vào các khung.
Các thông điệp HTTP có thể được đọc và hiểu bởi con người, cung cấp khả năng kiểm tra dễ dàng hơn cho các nhà phát triển và giảm độ phức tạp cho người mới.

### HTTP có thể mở rộng

Được giới thiệu trong HTTP/1.0, [các tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers) làm cho giao thức này dễ mở rộng và thử nghiệm.
Chức năng mới thậm chí có thể được giới thiệu bởi một thỏa thuận giữa client và máy chủ về ngữ nghĩa của tiêu đề mới.

### HTTP không có trạng thái, nhưng không phải không có phiên

HTTP không có trạng thái: không có liên kết giữa hai yêu cầu được thực hiện liên tiếp trên cùng một kết nối.
Điều này ngay lập tức có khả năng gây ra vấn đề cho người dùng cố gắng tương tác với một số trang một cách nhất quán, ví dụ như sử dụng giỏ hàng thương mại điện tử.
Nhưng trong khi lõi của HTTP là không có trạng thái, cookie HTTP cho phép sử dụng các phiên có trạng thái.
Sử dụng khả năng mở rộng tiêu đề, HTTP Cookie được thêm vào quy trình làm việc, cho phép tạo phiên trên mỗi yêu cầu HTTP để chia sẻ cùng một ngữ cảnh, hoặc cùng một trạng thái.

### HTTP và kết nối

Kết nối được kiểm soát ở tầng vận chuyển, và do đó về cơ bản nằm ngoài phạm vi của HTTP.
HTTP không yêu cầu giao thức vận chuyển bên dưới phải dựa trên kết nối; nó chỉ yêu cầu nó _đáng tin cậy_, hoặc không mất thông điệp (ít nhất là trình bày lỗi trong những trường hợp đó).
Trong số hai giao thức vận chuyển phổ biến nhất trên Internet, TCP đáng tin cậy và UDP thì không.
HTTP do đó dựa vào tiêu chuẩn TCP, dựa trên kết nối.

Trước khi client và máy chủ có thể trao đổi cặp yêu cầu/phản hồi HTTP, họ phải thiết lập kết nối TCP, một quá trình yêu cầu nhiều lần đi lại.
Hành vi mặc định của HTTP/1.0 là mở một kết nối TCP riêng biệt cho mỗi cặp yêu cầu/phản hồi HTTP.
Điều này kém hiệu quả hơn so với việc chia sẻ một kết nối TCP duy nhất khi nhiều yêu cầu được gửi liên tiếp.

Để giảm thiểu lỗ hổng này, HTTP/1.1 đã giới thiệu _pipeline_ (điều này tỏ ra khó thực hiện) và _kết nối liên tục_: kết nối TCP bên dưới có thể được kiểm soát một phần bằng cách sử dụng tiêu đề {{HTTPHeader("Connection")}}.
HTTP/2 tiến xa hơn một bước bằng cách ghép các thông điệp qua một kết nối duy nhất, giúp giữ kết nối nóng hơn và hiệu quả hơn.

Các thử nghiệm đang được tiến hành để thiết kế một giao thức vận chuyển tốt hơn phù hợp hơn với HTTP.
Ví dụ, Google đang thử nghiệm với [QUIC](https://en.wikipedia.org/wiki/QUIC) xây dựng trên UDP để cung cấp một giao thức vận chuyển đáng tin cậy và hiệu quả hơn.

## Những gì có thể được kiểm soát bởi HTTP

Tính chất có thể mở rộng này của HTTP đã, theo thời gian, cho phép kiểm soát và chức năng nhiều hơn của Web.
Phương thức bộ nhớ đệm và xác thực được xử lý sớm trong lịch sử HTTP.
Khả năng nới lỏng _ràng buộc nguồn gốc_, ngược lại, chỉ được thêm vào trong những năm 2010.

Dưới đây là danh sách các tính năng phổ biến có thể kiểm soát bằng HTTP:

- _[Bộ nhớ đệm](/en-US/docs/Web/HTTP/Guides/Caching)_:
  Cách các tài liệu được lưu vào bộ nhớ đệm có thể được kiểm soát bởi HTTP.
  Máy chủ có thể hướng dẫn các proxy và client những gì cần lưu vào bộ nhớ đệm và trong bao lâu.
  Client có thể hướng dẫn các proxy bộ nhớ đệm trung gian bỏ qua tài liệu được lưu trữ.
- _Nới lỏng ràng buộc nguồn gốc_:
  Để ngăn chặn nghe lén và các xâm phạm quyền riêng tư khác, trình duyệt Web thực thi sự tách biệt nghiêm ngặt giữa các trang web.
  Chỉ các trang từ **cùng nguồn gốc** mới có thể truy cập tất cả thông tin của một trang Web.
  Mặc dù ràng buộc như vậy là gánh nặng cho máy chủ, các tiêu đề HTTP có thể nới lỏng sự tách biệt nghiêm ngặt này ở phía máy chủ, cho phép tài liệu trở thành một bức tranh ghép từ các miền khác nhau; thậm chí có thể có lý do liên quan đến bảo mật để làm như vậy.
- _Xác thực_:
  Một số trang có thể được bảo vệ để chỉ những người dùng cụ thể mới có thể truy cập.
  Xác thực cơ bản có thể được cung cấp bởi HTTP, sử dụng tiêu đề {{HTTPHeader("WWW-Authenticate")}} và các tiêu đề tương tự, hoặc bằng cách đặt một phiên cụ thể bằng [cookie HTTP](/en-US/docs/Web/HTTP/Guides/Cookies).
- _[Proxy và đường hầm](/en-US/docs/Web/HTTP/Guides/Proxy_servers_and_tunneling)_:
  Máy chủ hoặc client thường nằm trên mạng nội bộ và che giấu địa chỉ IP thực của chúng từ các máy tính khác.
  Các yêu cầu HTTP sau đó đi qua proxy để vượt qua rào cản mạng này.
  Không phải tất cả proxy đều là HTTP proxy.
  Ví dụ, giao thức SOCKS hoạt động ở cấp độ thấp hơn.
  Các giao thức khác, như FTP, có thể được xử lý bởi các proxy này.
- _Phiên_:
  Sử dụng cookie HTTP cho phép bạn liên kết các yêu cầu với trạng thái của máy chủ.
  Điều này tạo ra các phiên, mặc dù HTTP cơ bản là giao thức không có trạng thái.
  Điều này hữu ích không chỉ cho giỏ hàng thương mại điện tử, mà còn cho bất kỳ trang web nào cho phép cấu hình người dùng của đầu ra.

## Luồng HTTP

Khi một client muốn giao tiếp với một máy chủ, dù là máy chủ cuối hay một proxy trung gian, nó thực hiện các bước sau:

1. Mở kết nối TCP: Kết nối TCP được sử dụng để gửi một yêu cầu, hoặc nhiều yêu cầu, và nhận một câu trả lời.
   Client có thể mở một kết nối mới, tái sử dụng kết nối hiện có, hoặc mở nhiều kết nối TCP đến các máy chủ.

2. Gửi thông điệp HTTP: Các thông điệp HTTP (trước HTTP/2) có thể đọc được bởi con người.
   Với HTTP/2, những thông điệp này được đóng gói trong các khung, làm cho chúng không thể đọc trực tiếp, nhưng nguyên tắc vẫn giống nhau.
   Ví dụ:

   ```http
   GET / HTTP/1.1
   Host: developer.mozilla.org
   Accept-Language: fr
   ```

3. Đọc phản hồi được gửi bởi máy chủ, chẳng hạn như:

   ```http
   HTTP/1.1 200 OK
   Date: Sat, 09 Oct 2010 14:28:02 GMT
   Server: Apache
   Last-Modified: Tue, 01 Dec 2009 20:18:22 GMT
   ETag: "51142bc1-7449-479b075b2891b"
   Accept-Ranges: bytes
   Content-Length: 29769
   Content-Type: text/html

   <!doctype html>… (here come the 29769 bytes of the requested web page)
   ```

4. Đóng hoặc tái sử dụng kết nối cho các yêu cầu tiếp theo.

Nếu HTTP pipeline được kích hoạt, có thể gửi nhiều yêu cầu mà không cần chờ phản hồi đầu tiên được nhận đầy đủ.
HTTP pipeline đã tỏ ra khó thực hiện trong các mạng hiện có, nơi phần mềm cũ cùng tồn tại với các phiên bản hiện đại.
HTTP pipeline đã được thay thế trong HTTP/2 bằng cách ghép các yêu cầu trong một khung mạnh mẽ hơn.

## Thông điệp HTTP

Các thông điệp HTTP, như được định nghĩa trong HTTP/1.1 và trước đó, có thể đọc được bởi con người.
Trong HTTP/2, những thông điệp này được nhúng vào cấu trúc nhị phân, một _khung_, cho phép tối ưu hóa như nén tiêu đề và ghép kênh.
Ngay cả khi chỉ có một phần của thông điệp HTTP gốc được gửi trong phiên bản HTTP này, ngữ nghĩa của mỗi thông điệp vẫn không thay đổi và client tái tạo (về mặt ảo) yêu cầu HTTP/1.1 gốc.
Do đó, việc hiểu các thông điệp HTTP/2 theo định dạng HTTP/1.1 là hữu ích.

Có hai loại thông điệp HTTP, yêu cầu và phản hồi, mỗi loại có định dạng riêng.

### Yêu cầu

Một ví dụ yêu cầu HTTP:

![Tổng quan về yêu cầu HTTP GET với các tiêu đề](https://mdn.github.io/shared-assets/images/diagrams/http/overview/http-request.svg)

Các yêu cầu bao gồm các yếu tố sau:

- Một [phương thức](/en-US/docs/Web/HTTP/Reference/Methods) HTTP, thường là một động từ như {{HTTPMethod("GET")}}, {{HTTPMethod("POST")}}, hoặc một danh từ như {{HTTPMethod("OPTIONS")}} hoặc {{HTTPMethod("HEAD")}} định nghĩa hoạt động mà client muốn thực hiện.
  Thông thường, một client muốn tải một tài nguyên (sử dụng `GET`) hoặc đăng giá trị của một [biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms) (sử dụng `POST`), mặc dù có thể cần nhiều hoạt động hơn trong các trường hợp khác.
- Đường dẫn của tài nguyên cần tải; URL của tài nguyên đã được loại bỏ các yếu tố rõ ràng từ ngữ cảnh, ví dụ không có {{Glossary("protocol", "giao thức")}} (`http://`), {{Glossary("domain", "tên miền")}} (ở đây, `developer.mozilla.org`), hoặc {{Glossary("port", "cổng")}} TCP (ở đây, `80`).
- Phiên bản của giao thức HTTP.
- Các [tiêu đề](/en-US/docs/Web/HTTP/Reference/Headers) tùy chọn truyền đạt thông tin bổ sung cho các máy chủ.
- Một nội dung, cho một số phương thức như `POST`, tương tự như trong các phản hồi, chứa tài nguyên được gửi.

### Phản hồi

Một ví dụ phản hồi:

![Tổng quan về phản hồi HTTP '200 OK' cho yêu cầu GET bao gồm các tiêu đề phản hồi.](https://mdn.github.io/shared-assets/images/diagrams/http/overview/http-response.svg)

Các phản hồi bao gồm các yếu tố sau:

- Phiên bản của giao thức HTTP mà chúng tuân theo.
- Một [mã trạng thái](/en-US/docs/Web/HTTP/Reference/Status), cho biết yêu cầu có thành công hay không, và tại sao.
- Một thông điệp trạng thái, một mô tả ngắn gọn không chính thức của mã trạng thái.
- Các [tiêu đề](/en-US/docs/Web/HTTP/Reference/Headers) HTTP, giống như những tiêu đề cho yêu cầu.
- Tùy chọn, một nội dung chứa tài nguyên được tải.

## API dựa trên HTTP

API được sử dụng phổ biến nhất dựa trên HTTP là [Fetch API](/en-US/docs/Web/API/Fetch_API), có thể được sử dụng để thực hiện các yêu cầu HTTP từ JavaScript. Fetch API thay thế API {{domxref("XMLHttpRequest")}}.

Một API khác, [server-sent events](/en-US/docs/Web/API/Server-sent_events), là dịch vụ một chiều cho phép máy chủ gửi sự kiện đến client, sử dụng HTTP như cơ chế vận chuyển.
Sử dụng giao diện {{domxref("EventSource")}}, client mở kết nối và thiết lập các trình xử lý sự kiện.
Trình duyệt client tự động chuyển đổi các thông điệp đến trên luồng HTTP thành các đối tượng {{domxref("Event")}} phù hợp. Sau đó nó cung cấp chúng cho các trình xử lý sự kiện đã được đăng ký cho {{domxref("Event.type", "loại")}} sự kiện nếu được biết, hoặc đến trình xử lý sự kiện {{domxref("EventSource.message_event", "onmessage")}} nếu không có trình xử lý sự kiện theo loại cụ thể nào được thiết lập.

## Kết luận

HTTP là một giao thức có thể mở rộng dễ sử dụng.
Cấu trúc client-server, kết hợp với khả năng thêm tiêu đề, cho phép HTTP tiến lên cùng với các khả năng mở rộng của Web.

Mặc dù HTTP/2 thêm một số độ phức tạp bằng cách nhúng các thông điệp HTTP vào các khung để cải thiện hiệu suất, cấu trúc cơ bản của thông điệp vẫn giống nhau kể từ HTTP/1.0.
Luồng phiên vẫn đơn giản, cho phép điều tra và gỡ lỗi bằng [màn hình mạng HTTP](https://firefox-source-docs.mozilla.org/devtools-user/network_monitor/index.html).

## Xem thêm

- [Lịch sử phát triển của HTTP](/en-US/docs/Web/HTTP/Guides/Evolution_of_HTTP)
- Các thuật ngữ từ điển thuật ngữ:
  - {{glossary('HTTP')}}
  - {{glossary('HTTP_2', 'HTTP/2')}}
  - {{glossary('QUIC')}}
