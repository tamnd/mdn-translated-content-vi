---
title: Connection management in HTTP/1.x
slug: Web/HTTP/Guides/Connection_management_in_HTTP_1.x
page-type: guide
sidebar: http
---

Quản lý kết nối là một chủ đề quan trọng trong HTTP: việc mở và duy trì kết nối ảnh hưởng lớn đến hiệu suất của trang web và ứng dụng web. Trong HTTP/1.x, có một số mô hình: _kết nối ngắn hạn_, _kết nối bền vững_, và _HTTP pipelining_.

HTTP chủ yếu dựa vào TCP làm giao thức truyền tải, cung cấp kết nối giữa client và máy chủ. Thuở ban đầu, HTTP sử dụng một mô hình duy nhất để xử lý các kết nối như vậy. Các kết nối này có tuổi thọ ngắn: một kết nối mới được tạo mỗi khi cần gửi yêu cầu, và đóng lại khi nhận được câu trả lời.

Mô hình này có một giới hạn hiệu suất cố hữu: việc mở mỗi kết nối TCP là một thao tác tốn tài nguyên. Một số thông điệp phải được trao đổi giữa client và máy chủ. Độ trễ mạng và băng thông ảnh hưởng đến hiệu suất khi cần gửi yêu cầu. Các trang web hiện đại yêu cầu nhiều yêu cầu (một tá hoặc hơn) để phục vụ lượng thông tin cần thiết, cho thấy mô hình trước đó kém hiệu quả.

Hai mô hình mới hơn đã được tạo ra trong HTTP/1.1. Mô hình kết nối bền vững giữ các kết nối mở giữa các yêu cầu liên tiếp, giảm thời gian cần thiết để mở kết nối mới. Mô hình HTTP pipelining tiến một bước xa hơn, bằng cách gửi một số yêu cầu liên tiếp mà không cần chờ câu trả lời, giảm đáng kể độ trễ trong mạng.

![So sánh hiệu suất của ba mô hình kết nối HTTP/1.x: kết nối ngắn hạn, kết nối bền vững và HTTP pipelining.](http1_x_connections.png)

> [!NOTE]
> HTTP/2 bổ sung thêm các mô hình quản lý kết nối.

Điều quan trọng cần lưu ý là quản lý kết nối trong HTTP áp dụng cho kết nối giữa hai nút liên tiếp, đây là [hop-by-hop](/en-US/docs/Web/HTTP/Reference/Headers#hop-by-hop_headers) và không phải [end-to-end](/en-US/docs/Web/HTTP/Reference/Headers#end-to-end_headers). Mô hình được sử dụng trong các kết nối giữa client và proxy đầu tiên của nó có thể khác với mô hình giữa proxy và máy chủ đích (hoặc bất kỳ proxy trung gian nào). Các tiêu đề HTTP liên quan đến việc xác định mô hình kết nối, như {{HTTPHeader("Connection")}} và {{HTTPHeader("Keep-Alive")}}, là các tiêu đề [hop-by-hop](/en-US/docs/Web/HTTP/Reference/Headers#hop-by-hop_headers) với giá trị có thể bị thay đổi bởi các nút trung gian.

Một chủ đề liên quan là khái niệm nâng cấp kết nối HTTP, trong đó kết nối HTTP/1.1 được nâng cấp lên một giao thức khác, chẳng hạn như TLS/1.0, WebSocket, hoặc thậm chí HTTP/2 dạng cleartext. [Cơ chế nâng cấp giao thức](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism) này được ghi lại chi tiết hơn ở nơi khác.

## Kết nối ngắn hạn

Mô hình ban đầu của HTTP, và mô hình mặc định trong HTTP/1.0, là _kết nối ngắn hạn_. Mỗi yêu cầu HTTP hoàn thành trên kết nối riêng của nó; điều này có nghĩa là một bắt tay TCP xảy ra trước mỗi yêu cầu HTTP, và các yêu cầu này được tuần tự hóa.

Bản thân bắt tay TCP tốn thời gian, nhưng kết nối TCP thích nghi với tải của nó, trở nên hiệu quả hơn với các kết nối được duy trì lâu hơn (hoặc kết nối ấm). Kết nối ngắn hạn không sử dụng tính năng hiệu quả này của TCP, và hiệu suất giảm so với mức tối ưu do tiếp tục truyền qua kết nối mới, lạnh.

Mô hình này là mô hình mặc định được sử dụng trong HTTP/1.0 (nếu không có tiêu đề {{HTTPHeader("Connection")}}, hoặc nếu giá trị của nó được đặt thành `close`). Trong HTTP/1.1, mô hình này chỉ được sử dụng khi tiêu đề {{HTTPHeader("Connection")}} được gửi với giá trị `close`.

> [!NOTE]
> Trừ khi xử lý một hệ thống rất cũ không hỗ trợ kết nối bền vững, không có lý do chính đáng nào để sử dụng mô hình này.

## Kết nối bền vững

Kết nối ngắn hạn có hai trở ngại lớn: thời gian cần để thiết lập kết nối mới là đáng kể, và hiệu suất của kết nối TCP bên dưới chỉ cải thiện khi kết nối này đã được sử dụng một thời gian (kết nối ấm). Để giải quyết những vấn đề này, khái niệm _kết nối bền vững_ đã được thiết kế, thậm chí trước cả HTTP/1.1. Ngoài ra, nó có thể được gọi là _kết nối keep-alive_.

Kết nối bền vững là kết nối vẫn mở trong một khoảng thời gian, và có thể được tái sử dụng cho nhiều yêu cầu, giúp tiết kiệm việc cần bắt tay TCP mới, và tận dụng các khả năng nâng cao hiệu suất của TCP. Kết nối này sẽ không mở mãi mãi: các kết nối nhàn rỗi sẽ bị đóng sau một thời gian (máy chủ có thể sử dụng tiêu đề {{HTTPHeader("Keep-Alive")}} để chỉ định thời gian tối thiểu kết nối nên được giữ mở).

Kết nối bền vững cũng có những nhược điểm; ngay cả khi nhàn rỗi, chúng vẫn tiêu thụ tài nguyên máy chủ, và dưới tải nặng, {{Glossary("Denial of Service", "tấn công DoS")}} có thể được thực hiện. Trong những trường hợp như vậy, sử dụng kết nối không bền vững, được đóng ngay khi chúng nhàn rỗi, có thể cung cấp hiệu suất tốt hơn.

Kết nối HTTP/1.0 không bền vững theo mặc định. Đặt {{HTTPHeader("Connection")}} thành bất kỳ giá trị nào khác ngoài `close`, thường là `retry-after`, sẽ làm cho chúng bền vững.

Trong HTTP/1.1, tính bền vững là mặc định, và tiêu đề không còn cần thiết nữa (nhưng nó thường được thêm như một biện pháp phòng thủ cho các trường hợp yêu cầu quay lại HTTP/1.0).

## HTTP pipelining

> [!NOTE]
> HTTP pipelining không được kích hoạt mặc định trong các trình duyệt hiện đại:
>
> - [Proxy](https://en.wikipedia.org/wiki/Proxy_server) lỗi vẫn còn phổ biến và chúng dẫn đến các hành vi kỳ lạ và không nhất quán mà các nhà phát triển web không thể dự đoán và chẩn đoán dễ dàng.
> - Pipelining phức tạp để triển khai đúng cách: kích thước của tài nguyên đang được truyền, [RTT](https://en.wikipedia.org/wiki/Round-trip_delay_time) hiệu quả sẽ được sử dụng, cũng như băng thông hiệu quả, có ảnh hưởng trực tiếp đến sự cải thiện do pipeline mang lại. Nếu không biết những điều này, các thông điệp quan trọng có thể bị trì hoãn sau những thông điệp không quan trọng. Khái niệm quan trọng thậm chí còn thay đổi trong quá trình bố cục trang! Do đó, HTTP pipelining chỉ mang lại sự cải thiện nhỏ trong hầu hết các trường hợp.
> - Pipelining phải chịu {{glossary("head of line blocking", "chặn head-of-line")}}.
>
> Vì những lý do này, pipelining đã được thay thế bằng một thuật toán tốt hơn, _multiplexing_, được sử dụng bởi HTTP/2.

Theo mặc định, các yêu cầu [HTTP](/en-US/docs/Web/HTTP) được đưa ra tuần tự. Yêu cầu tiếp theo chỉ được đưa ra sau khi nhận được phản hồi cho yêu cầu hiện tại. Vì chúng bị ảnh hưởng bởi độ trễ mạng và giới hạn băng thông, điều này có thể dẫn đến độ trễ đáng kể trước khi yêu cầu tiếp theo được _nhìn thấy_ bởi máy chủ.

Pipelining là quá trình gửi các yêu cầu liên tiếp, qua cùng một kết nối bền vững, mà không cần chờ câu trả lời. Điều này tránh độ trễ của kết nối. Về lý thuyết, hiệu suất cũng có thể được cải thiện nếu hai yêu cầu HTTP được đóng gói vào cùng một thông điệp TCP. [MSS](https://en.wikipedia.org/wiki/Maximum_segment_size) (Maximum Segment Size) điển hình đủ lớn để chứa một số yêu cầu đơn giản, mặc dù nhu cầu về kích thước của các yêu cầu HTTP tiếp tục tăng.

Không phải tất cả các loại yêu cầu HTTP đều có thể được pipelined: chỉ các phương thức {{Glossary("idempotent")}}, tức là {{HTTPMethod("GET")}}, {{HTTPMethod("HEAD")}}, {{HTTPMethod("OPTIONS")}}, {{HTTPMethod("TRACE")}}, {{HTTPMethod("PUT")}}, và {{HTTPMethod("DELETE")}}, mới có thể được phát lại an toàn. Nếu xảy ra lỗi, nội dung pipeline có thể được lặp lại.

Ngày nay, mọi proxy và máy chủ tuân thủ HTTP/1.1 đều nên hỗ trợ pipelining, mặc dù nhiều hệ thống có giới hạn trong thực tế: đây là lý do đáng kể khiến không có trình duyệt hiện đại nào kích hoạt tính năng này theo mặc định.

## Domain sharding

> [!NOTE]
> Trừ khi bạn có nhu cầu tức thời rất cụ thể, đừng sử dụng kỹ thuật đã lỗi thời này; hãy chuyển sang HTTP/2 thay thế. Trong HTTP/2, domain sharding không còn hữu ích nữa: kết nối HTTP/2 có khả năng xử lý các yêu cầu song song không ưu tiên rất tốt. Domain sharding thậm chí còn có hại cho hiệu suất. Hầu hết các triển khai HTTP/2 sử dụng một kỹ thuật gọi là [connection coalescing](https://daniel.haxx.se/blog/2016/08/18/http2-connection-coalescing/) để đảo ngược việc domain sharding có thể xảy ra.

Vì kết nối HTTP/1.x đang tuần tự hóa các yêu cầu, ngay cả khi không có bất kỳ thứ tự nào, nó không thể tối ưu nếu không có băng thông đủ lớn. Như một giải pháp, trình duyệt mở nhiều kết nối đến mỗi domain, gửi các yêu cầu song song. Mặc định trước đây là 2 đến 3 kết nối, nhưng nay đã tăng lên mức sử dụng phổ biến hơn là 6 kết nối song song. Có nguy cơ kích hoạt bảo vệ {{Glossary("Denial of Service", "DoS")}} ở phía máy chủ nếu thử nhiều hơn con số này.

Nếu máy chủ muốn phản hồi trang web hoặc ứng dụng nhanh hơn, máy chủ có thể buộc mở thêm kết nối. Ví dụ, thay vì có tất cả tài nguyên trên cùng một domain, giả sử `www.example.com`, nó có thể được chia thành một số domain, `www1.example.com`, `www2.example.com`, `www3.example.com`. Mỗi domain này phân giải thành _cùng một_ máy chủ, và trình duyệt web sẽ mở 6 kết nối đến mỗi (trong ví dụ của chúng ta, tăng kết nối lên 18). Kỹ thuật này được gọi là _domain sharding_.

![Không có domain sharding, client yêu cầu sáu hình ảnh từ một domain với tối đa hai yêu cầu diễn ra song song. Với domain sharding, các hình ảnh có sẵn từ hai domain và client có thể chạy bốn yêu cầu song song, tải xuống hình ảnh trong thời gian ngắn hơn.](httpsharding.png)

## Kết luận

Quản lý kết nối được cải thiện cho phép tăng hiệu suất đáng kể trong HTTP. Với HTTP/1.1 hoặc HTTP/1.0, sử dụng kết nối bền vững – ít nhất cho đến khi nó trở nên nhàn rỗi – dẫn đến hiệu suất tốt nhất. Tuy nhiên, sự thất bại của pipelining đã dẫn đến việc thiết kế các mô hình quản lý kết nối vượt trội hơn, đã được tích hợp vào HTTP/2.

## Xem thêm

- [Sự phát triển của HTTP](/en-US/docs/Web/HTTP/Guides/Evolution_of_HTTP)
- Thuật ngữ:
  - {{glossary('HTTP')}}
  - {{glossary('HTTP_2', 'HTTP/2')}}
  - {{glossary('QUIC')}}
  - {{glossary('Round Trip Time', 'Round Trip Time (RTT)')}}
  - {{glossary('TCP slow start')}}
  - {{glossary('TLS')}}
  - {{glossary('TCP', 'Transmission Control Protocol (TCP)')}}
