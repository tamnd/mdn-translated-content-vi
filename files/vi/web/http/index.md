---
title: "HTTP: Giao thức truyền siêu văn bản"
short-title: HTTP
slug: Web/HTTP
page-type: landing-page
sidebar: http
---

**HTTP** là một {{glossary("protocol", "giao thức")}} ở [tầng ứng dụng](https://en.wikipedia.org/wiki/Application_Layer) dùng để truyền tải các tài liệu siêu phương tiện, chẳng hạn như HTML.
Nó được thiết kế để giao tiếp giữa trình duyệt web và máy chủ web, nhưng cũng có thể được sử dụng cho các mục đích khác, chẳng hạn như giao tiếp giữa các máy, truy cập lập trình vào API, và nhiều hơn nữa.

HTTP tuân theo [mô hình client-server](https://en.wikipedia.org/wiki/Client%E2%80%93server_model) truyền thống, trong đó client mở kết nối để thực hiện một yêu cầu, sau đó chờ cho đến khi nhận được phản hồi từ máy chủ.
HTTP là một [giao thức không trạng thái](https://en.wikipedia.org/wiki/Stateless_protocol), nghĩa là máy chủ không lưu giữ bất kỳ dữ liệu phiên nào giữa hai yêu cầu, mặc dù việc bổ sung [cookie](/en-US/docs/Web/HTTP/Guides/Cookies) sau này đã thêm trạng thái vào một số tương tác client-server.

## Hướng dẫn

HTTP là một giao thức có thể mở rộng, dựa trên các khái niệm như tài nguyên và Định danh tài nguyên thống nhất (URI), cấu trúc thông điệp cơ bản, và mô hình giao tiếp client-server.
Trên nền tảng những khái niệm này, nhiều phần mở rộng đã được phát triển qua nhiều năm để bổ sung chức năng và cập nhật ngữ nghĩa, bao gồm các phương thức HTTP và tiêu đề bổ sung.

Các [hướng dẫn HTTP](/en-US/docs/Web/HTTP/Guides) được liệt kê theo thứ tự từ tổng quan chung đến các chủ đề chuyên biệt, hướng đến trường hợp sử dụng cụ thể.
Người mới bắt đầu được khuyến khích bắt đầu với các hướng dẫn nền tảng trước khi khám phá các bài viết chuyên sâu hơn.

- [Tổng quan về HTTP](/en-US/docs/Web/HTTP/Guides/Overview)
  - : Các tính năng cơ bản của HTTP, những gì nó có thể làm, mục đích sử dụng trong kiến trúc web, và vị trí của nó trong ngăn xếp giao thức.
- [Lịch sử phát triển của HTTP](/en-US/docs/Web/HTTP/Guides/Evolution_of_HTTP)
  - : HTTP được tạo ra vào đầu những năm 1990 và đã được mở rộng nhiều lần.
    Bài viết này đi qua lịch sử và mô tả HTTP/0.9, HTTP/1.0, HTTP/1.1, qua HTTP/2 và HTTP/3, cũng như những điểm mới được giới thiệu qua các năm.
- [Một phiên HTTP điển hình](/en-US/docs/Web/HTTP/Guides/Session)
  - : Mô tả luồng của một phiên HTTP, từ thiết lập kết nối, gửi yêu cầu, đến nhận phản hồi.
- [Thông điệp HTTP](/en-US/docs/Web/HTTP/Guides/Messages)
  - : Các thông điệp HTTP được truyền tải dưới dạng yêu cầu và phản hồi có cấu trúc xác định.
    Bài viết này mô tả cấu trúc chung, mục đích, và các loại thông điệp khác nhau.
- [Kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types)
  - : Kể từ HTTP/1.0, có thể truyền tải các loại nội dung khác nhau.
    Bài viết này giải thích cách thực hiện điều này bằng cách sử dụng tiêu đề {{HTTPHeader("Content-Type")}} và tiêu chuẩn MIME.
    Danh sách ngắn các loại phổ biến được sử dụng bởi các nhà phát triển web có thể tìm thấy tại [Các kiểu MIME phổ biến](/en-US/docs/Web/HTTP/Guides/MIME_types/Common_types).
- [Nén trong HTTP](/en-US/docs/Web/HTTP/Guides/Compression)
  - : Trình duyệt và máy chủ nén thông điệp của họ trước khi gửi qua mạng để giảm lượng dữ liệu cần truyền, cải thiện tốc độ truyền tải và sử dụng băng thông.
- [Bộ nhớ đệm HTTP](/en-US/docs/Web/HTTP/Guides/Caching)
  - : Bộ nhớ đệm là một cơ chế rất quan trọng để cung cấp trải nghiệm nhanh trên Web và sử dụng tài nguyên hiệu quả.
    Bài viết này mô tả các phương pháp bộ nhớ đệm khác nhau và cách sử dụng các tiêu đề HTTP để kiểm soát chúng.
- [Xác thực HTTP](/en-US/docs/Web/HTTP/Guides/Authentication)
  - : Xác thực là cách xác minh danh tính của client khi thực hiện yêu cầu đến máy chủ.
    Nó đảm bảo rằng chỉ những người dùng hoặc hệ thống được ủy quyền mới có thể truy cập các tài nguyên nhất định.
- [Sử dụng cookie HTTP](/en-US/docs/Web/HTTP/Guides/Cookies)
  - : Mặc dù HTTP là giao thức không trạng thái, máy chủ có thể gửi tiêu đề {{HTTPHeader("Set-Cookie")}} cùng với phản hồi.
    Sau đó, client trả về giá trị cookie với mọi yêu cầu tiếp theo đến máy chủ dưới dạng tiêu đề yêu cầu {{HTTPHeader("Cookie")}}.
    Điều này thêm khả năng lưu trữ và trao đổi một lượng nhỏ dữ liệu, tạo ra trạng thái cho một số tương tác client-server.
- [Chuyển hướng trong HTTP](/en-US/docs/Web/HTTP/Guides/Redirections)
  - : Chuyển hướng URL, còn được gọi là chuyển tiếp URL, là kỹ thuật để cung cấp nhiều hơn một địa chỉ URL cho một trang, biểu mẫu, toàn bộ trang web, hoặc ứng dụng web.
    HTTP có một loại phản hồi đặc biệt, được gọi là HTTP redirect, cho hoạt động này.
- [Yêu cầu có điều kiện HTTP](/en-US/docs/Web/HTTP/Guides/Conditional_requests)
  - : Trong các yêu cầu có điều kiện, kết quả của một yêu cầu phụ thuộc vào giá trị của một trình xác nhận trong yêu cầu.
    Phương pháp này được sử dụng nhiều trong [bộ nhớ đệm](/en-US/docs/Web/HTTP/Guides/Caching) và các trường hợp sử dụng như tiếp tục tải xuống, ngăn chặn mất cập nhật khi sửa đổi tài liệu trên máy chủ, và nhiều hơn nữa.
- [Yêu cầu phạm vi HTTP](/en-US/docs/Web/HTTP/Guides/Range_requests)
  - : Một yêu cầu phạm vi yêu cầu máy chủ gửi một phần cụ thể (hoặc các phần) của tài nguyên trở lại cho client thay vì toàn bộ tài nguyên.
    Yêu cầu phạm vi hữu ích khi client biết họ chỉ cần một phần của tệp lớn, hoặc trong trường hợp ứng dụng cho phép người dùng tạm dừng và tiếp tục tải xuống.
- [Thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation)
  - : HTTP định nghĩa một tập hợp các tiêu đề thông điệp, bắt đầu bằng [`Accept`](/en-US/docs/Web/HTTP/Reference/Headers/Accept) như một cách để trình duyệt thông báo định dạng, ngôn ngữ hoặc mã hóa mà nó ưa thích.
    Bài viết này giải thích cách quảng cáo này xảy ra, cách máy chủ dự kiến phản ứng, và cách nó chọn phản hồi phù hợp nhất cho một yêu cầu.
- [Quản lý kết nối trong HTTP/1.x](/en-US/docs/Web/HTTP/Guides/Connection_management_in_HTTP_1.x)
  - : HTTP/1.1 là phiên bản HTTP đầu tiên hỗ trợ kết nối liên tục và pipeline.
    Bài viết này giải thích cả hai khái niệm, bao gồm ưu và nhược điểm của từng khái niệm.
- [Cơ chế nâng cấp giao thức](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism)
  - : HTTP/1.1 cung cấp cơ chế để nâng cấp kết nối đã thiết lập sang giao thức khác bằng cách sử dụng tiêu đề {{HTTPHeader("Upgrade")}}.
    Client có thể nâng cấp kết nối từ HTTP/1.1 lên HTTP/2, hoặc kết nối HTTP(S) lên [WebSocket](/en-US/docs/Web/API/WebSocket) (`ws` / `wss`).
- [Máy chủ proxy và đường hầm](/en-US/docs/Web/HTTP/Guides/Proxy_servers_and_tunneling)
  - : Proxy có thể nằm trên máy tính cục bộ của người dùng, hoặc ở bất kỳ đâu giữa máy tính của người dùng và máy chủ đích trên Internet.
    Trang này phác thảo một số kiến thức cơ bản về proxy và giới thiệu một vài tùy chọn cấu hình.
- [Gợi ý từ HTTP Client](/en-US/docs/Web/HTTP/Guides/Client_hints)
  - : Client Hints là tập hợp các tiêu đề phản hồi mà máy chủ có thể sử dụng để chủ động yêu cầu thông tin từ client về thiết bị, mạng, người dùng, và tùy chọn đặc thù của user-agent.
    Máy chủ sau đó có thể xác định tài nguyên nào cần gửi, dựa trên thông tin mà client chọn cung cấp.
- [Ghi nhật ký lỗi mạng](/en-US/docs/Web/HTTP/Guides/Network_Error_Logging) {{experimental_inline}}
  - : Ghi nhật ký lỗi mạng là cơ chế có thể được cấu hình thông qua tiêu đề phản hồi HTTP `NEL`.
    Tiêu đề thử nghiệm này cho phép các trang web và ứng dụng chọn nhận báo cáo về các lần tải mạng thất bại (hoặc thậm chí thành công) từ các trình duyệt hỗ trợ.
- [Phát hiện trình duyệt sử dụng user agent](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent)
  - : Rất hiếm khi nên dùng phương pháp nghe lén user agent để phát hiện trình duyệt, nhưng có những trường hợp cần thiết.
    Tài liệu này sẽ hướng dẫn bạn thực hiện điều này một cách chính xác nhất có thể khi cần thiết, với trọng tâm vào các cân nhắc cần thực hiện trước khi đi theo hướng này.

### Bảo mật và quyền riêng tư

- [Chính sách quyền hạn](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
  - : Permissions Policy cung cấp cơ chế để các nhà phát triển web khai báo rõ ràng những chức năng nào có thể và không thể được sử dụng trên một trang web.
    Bạn định nghĩa một tập hợp "chính sách" hạn chế những API mà mã của trang web có thể truy cập hoặc sửa đổi hành vi mặc định của trình duyệt cho một số tính năng nhất định.
- [Chia sẻ tài nguyên giữa các nguồn gốc (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
  - : Các yêu cầu HTTP cross-site là các yêu cầu tài nguyên từ một tên miền khác với tên miền của tài nguyên đang thực hiện yêu cầu.
    Các trang web ngày nay thường xuyên tải tài nguyên cross-site, ví dụ, một trang 'Domain A' (`http://domaina.example/`) yêu cầu hình ảnh từ 'Domain B' (`http://domainb.foo/image.jpg`) thông qua phần tử `img`.
    CORS cho phép các nhà phát triển web kiểm soát cách trang web của họ phản ứng với các yêu cầu cross-site.
- [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP)
  - : CSP cho phép quản trị viên trang web sử dụng tiêu đề phản hồi {{HTTPHeader("Content-Security-Policy")}} để kiểm soát tài nguyên nào mà client được phép tải cho một trang nhất định.
    Hướng dẫn CSP mô tả cơ chế Chính sách bảo mật nội dung tổng thể giúp phát hiện và giảm thiểu một số loại tấn công, bao gồm Cross-Site Scripting (XSS) và các cuộc tấn công tiêm dữ liệu.
- [Chính sách tài nguyên cross-origin (CORP)](/en-US/docs/Web/HTTP/Guides/Cross-Origin_Resource_Policy)
  - : CORP cho phép các trang web và ứng dụng bảo vệ chống lại các yêu cầu cụ thể từ các nguồn gốc khác (chẳng hạn như những yêu cầu được đưa ra bằng các phần tử như `<script>` và `<img>`), để giảm thiểu các cuộc tấn công kênh phụ suy đoán.
- [Hướng dẫn bảo mật web của Mozilla](https://infosec.mozilla.org/guidelines/web_security)
  - : Tập hợp các mẹo để giúp các nhóm vận hành tạo ra các ứng dụng web an toàn.

### Tài nguyên liên quan

- [URI](/en-US/docs/Web/URI)
  - : Định danh tài nguyên thống nhất (URI) được sử dụng để mô tả và định vị tài nguyên trên web và là thành phần thiết yếu trong các yêu cầu HTTP.
- [Cấu hình máy chủ cho phương tiện Ogg](/en-US/docs/Web/Media/Guides/Formats/Configuring_servers_for_Ogg_media)
  - : Hướng dẫn này đề cập đến một số thay đổi cấu hình máy chủ có thể cần thiết để máy chủ web của bạn phục vụ chính xác các tệp phương tiện Ogg.
    Thông tin này cũng có thể hữu ích nếu bạn gặp các loại phương tiện khác mà máy chủ của bạn chưa được cấu hình để nhận dạng.

## Công cụ & tài nguyên

Các công cụ và tài nguyên hữu ích để hiểu và gỡ lỗi HTTP.

- [Firefox Developer Tools](https://firefox-source-docs.mozilla.org/devtools-user/index.html)
  - : [Network monitor](https://firefox-source-docs.mozilla.org/devtools-user/network_monitor/index.html)
- [HTTP Observatory](/en-US/observatory)
  - : Một dự án được thiết kế để giúp các nhà phát triển, quản trị viên hệ thống và chuyên gia bảo mật cấu hình trang web của họ một cách an toàn và bảo mật.
- [RedBot](https://redbot.org/)
  - : Công cụ kiểm tra các tiêu đề liên quan đến bộ nhớ đệm của bạn.
- [nghttp2](https://github.com/nghttp2/nghttp2)
  - : Triển khai HTTP/2 client, máy chủ và proxy được viết bằng C với các công cụ kiểm tra tải và đo điểm chuẩn, cùng bộ mã hóa và giải mã HPACK.
- [curl](https://github.com/curl/curl)
  - : Công cụ dòng lệnh để truyền dữ liệu được chỉ định bằng cú pháp URL.
    Hỗ trợ HTTP, HTTPS, WS, WSS, cùng nhiều giao thức khác.
- [Cách trình duyệt hoạt động (2011)](https://web.dev/articles/howbrowserswork)
  - : Một bài viết rất toàn diện về nội bộ trình duyệt và luồng yêu cầu thông qua giao thức HTTP.

## Tài liệu tham khảo

Tài liệu [tham khảo HTTP](/en-US/docs/Web/HTTP/Reference) chứa thông tin chi tiết về các tiêu đề, phương thức yêu cầu, phản hồi trạng thái, và liệt kê các thông số kỹ thuật và tài liệu tiêu chuẩn liên quan.

- [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
  - : Các tiêu đề thông điệp được sử dụng để gửi siêu dữ liệu về tài nguyên hoặc thông điệp HTTP, và để mô tả hành vi của client hoặc máy chủ.
- [Các phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
  - : Các phương thức yêu cầu chỉ ra mục đích của yêu cầu và những gì được mong đợi nếu yêu cầu thành công.
    Các phương thức phổ biến nhất là {{HTTPMethod("GET")}} và {{HTTPMethod("POST")}} để truy xuất và gửi dữ liệu đến máy chủ, tương ứng, nhưng còn có các phương thức khác phục vụ các mục đích khác nhau.
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
  - : Mã trạng thái phản hồi cho biết kết quả của một yêu cầu HTTP cụ thể.
    Các phản hồi được nhóm thành năm lớp: thông tin, thành công, chuyển hướng, lỗi client, và lỗi máy chủ.
- [Tài nguyên và thông số kỹ thuật HTTP](/en-US/docs/Web/HTTP/Reference/Resources_and_specifications)
  - : Trang này liệt kê các tài nguyên liên quan về HTTP kể từ khi được chỉ định lần đầu vào đầu những năm 1990.

Các phần con sau đây cũng đáng chú ý:

- [Các chỉ thị CSP](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#directives)
  - : Tiêu đề phản hồi {{HTTPHeader("Content-Security-Policy")}} (CSP) cho phép quản trị viên trang web chỉ định tài nguyên nào mà user agent được phép tải cho một trang nhất định.
    Phần này liệt kê các chỉ thị có thể được sử dụng trong tiêu đề CSP, với các trang tài liệu riêng lẻ mô tả cách các chỉ thị hoạt động và cách sử dụng chúng.
- [Các chỉ thị Permissions-Policy](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#directives)
  - : Tiêu đề phản hồi {{HTTPHeader("Permissions-Policy")}} cung cấp cơ chế để cho phép hoặc từ chối việc sử dụng các tính năng của trình duyệt trong một tài liệu hoặc trong bất kỳ phần tử {{HTMLElement("iframe")}} nào trong tài liệu.
    Phần này liệt kê các chỉ thị có thể được sử dụng trong tiêu đề Permissions-Policy, với các trang tài liệu riêng lẻ mô tả cách các chỉ thị hoạt động và cách sử dụng chúng.
