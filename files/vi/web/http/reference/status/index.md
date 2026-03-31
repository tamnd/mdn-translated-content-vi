---
title: Mã trạng thái phản hồi HTTP
slug: Web/HTTP/Reference/Status
page-type: landing-page
browser-compat: http.status
sidebar: http
---

Mã trạng thái phản hồi HTTP cho biết liệu một yêu cầu [HTTP](/en-US/docs/Web/HTTP) cụ thể có được hoàn thành thành công hay không.
Các phản hồi được chia thành năm nhóm:

1. [Phản hồi thông tin](#informational_responses) (`100` – `199`)
2. [Phản hồi thành công](#successful_responses) (`200` – `299`)
3. [Thông báo chuyển hướng](#redirection_messages) (`300` – `399`)
4. [Phản hồi lỗi từ phía client](#client_error_responses) (`400` – `499`)
5. [Phản hồi lỗi từ phía server](#server_error_responses) (`500` – `599`)

Các mã trạng thái liệt kê dưới đây được định nghĩa bởi [RFC 9110](https://httpwg.org/specs/rfc9110.html#overview.of.status.codes).

> [!NOTE]
> Nếu bạn nhận được phản hồi không có trong danh sách này, đó là phản hồi không theo chuẩn, có thể là tùy chỉnh riêng của phần mềm máy chủ.

## Phản hồi thông tin

- {{HTTPStatus(100, "100 Continue")}}
  - : Phản hồi trung gian này cho biết client nên tiếp tục yêu cầu hoặc bỏ qua phản hồi nếu yêu cầu đã hoàn tất.
- {{HTTPStatus(101, "101 Switching Protocols")}}
  - : Mã này được gửi để phản hồi tiêu đề yêu cầu {{HTTPHeader("Upgrade")}} từ client và cho biết giao thức mà máy chủ đang chuyển sang.
- {{HTTPStatus(102, "102 Processing")}} {{deprecated_inline}}
  - : Mã này từng được dùng trong ngữ cảnh {{Glossary("WebDAV")}} để cho biết rằng máy chủ đã nhận được yêu cầu nhưng chưa có trạng thái sẵn sàng tại thời điểm phản hồi.
- {{HTTPStatus(103, "103 Early Hints")}}
  - : Mã trạng thái này chủ yếu được dùng với tiêu đề {{HTTPHeader("Link")}}, cho phép user agent bắt đầu [tải trước (preloading)](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload) tài nguyên trong khi máy chủ đang chuẩn bị phản hồi hoặc [kết nối trước (preconnect)](/en-US/docs/Web/HTML/Reference/Attributes/rel/preconnect) đến nguồn gốc mà trang sẽ cần tài nguyên.

## Phản hồi thành công

- {{HTTPStatus(200, "200 OK")}}
  - : Yêu cầu đã thành công. Ý nghĩa của "thành công" phụ thuộc vào phương thức HTTP:
    - {{HTTPMethod("GET")}}: Tài nguyên đã được lấy và truyền trong thân thông điệp.
    - {{HTTPMethod("HEAD")}}: Các tiêu đề trình bày được đưa vào phản hồi mà không có thân thông điệp.
    - {{HTTPMethod("PUT")}} hoặc {{HTTPMethod("POST")}}: Tài nguyên mô tả kết quả của hành động được truyền trong thân thông điệp.
    - {{HTTPMethod("TRACE")}}: Thân thông điệp chứa yêu cầu như máy chủ đã nhận.
- {{HTTPStatus(201, "201 Created")}}
  - : Yêu cầu đã thành công và một tài nguyên mới đã được tạo ra. Đây thường là phản hồi gửi sau các yêu cầu {{HTTPMethod("POST")}}, hoặc một số yêu cầu {{HTTPMethod("PUT")}}.
- {{HTTPStatus(202, "202 Accepted")}}
  - : Yêu cầu đã được nhận nhưng chưa được xử lý.
    Đây là phản hồi không cam kết, vì không có cách nào trong HTTP để sau đó gửi phản hồi bất đồng bộ cho biết kết quả của yêu cầu.
    Nó được dùng cho các trường hợp một tiến trình hoặc máy chủ khác xử lý yêu cầu, hoặc cho xử lý theo lô.
- {{HTTPStatus(203, "203 Non-Authoritative Information")}}
  - : Mã phản hồi này có nghĩa là metadata được trả về không hoàn toàn giống với những gì có sẵn từ máy chủ gốc, mà được thu thập từ bản sao cục bộ hoặc bên thứ ba.
    Điều này chủ yếu được dùng cho các bản sao gương hoặc sao lưu của tài nguyên khác.
    Ngoại trừ trường hợp cụ thể đó, phản hồi {{HTTPStatus(200, "200 OK")}} được ưu tiên hơn trạng thái này.
- {{HTTPStatus(204, "204 No Content")}}
  - : Không có nội dung để gửi cho yêu cầu này, nhưng các tiêu đề vẫn có thể hữu ích.
    User agent có thể cập nhật các tiêu đề đệm của tài nguyên này với các tiêu đề mới.
- {{HTTPStatus(205, "205 Reset Content")}}
  - : Yêu cầu user agent đặt lại tài liệu đã gửi yêu cầu này.
- {{HTTPStatus(206, "206 Partial Content")}}
  - : Mã phản hồi này được dùng để phản hồi [yêu cầu phạm vi (range request)](/en-US/docs/Web/HTTP/Guides/Range_requests) khi client đã yêu cầu một phần hoặc nhiều phần của tài nguyên.
- {{HTTPStatus(207, "207 Multi-Status")}} ({{Glossary("WebDAV")}})
  - : Truyền tải thông tin về nhiều tài nguyên, cho các tình huống mà nhiều mã trạng thái có thể phù hợp.
- {{HTTPStatus(208, "208 Already Reported")}} ({{Glossary("WebDAV")}})
  - : Được dùng bên trong phần tử phản hồi `<dav:propstat>` để tránh liệt kê lặp lại các thành viên bên trong của nhiều liên kết đến cùng một bộ sưu tập.
- {{HTTPStatus(226, "226 IM Used")}} ([HTTP Delta encoding](https://datatracker.ietf.org/doc/html/rfc3229))
  - : Máy chủ đã thực hiện yêu cầu {{HTTPMethod("GET")}} cho tài nguyên và phản hồi là biểu diễn kết quả của một hoặc nhiều thao tác thao túng thực thể áp dụng lên thực thể hiện tại.

## Thông báo chuyển hướng

- {{HTTPStatus(300, "300 Multiple Choices")}}
  - : Trong [thương lượng nội dung do tác nhân điều khiển](/en-US/docs/Web/HTTP/Guides/Content_negotiation#agent-driven_negotiation), yêu cầu có nhiều phản hồi có thể và user agent hoặc người dùng nên chọn một trong số đó.
    Không có cách chuẩn hóa để client tự động chọn một trong các phản hồi, vì vậy điều này hiếm khi được sử dụng.
- {{HTTPStatus(301, "301 Moved Permanently")}}
  - : URL của tài nguyên được yêu cầu đã thay đổi vĩnh viễn. URL mới được cung cấp trong phản hồi.
- {{HTTPStatus(302, "302 Found")}}
  - : Mã phản hồi này có nghĩa là URI của tài nguyên được yêu cầu đã thay đổi _tạm thời_.
    Các thay đổi tiếp theo trong URI có thể được thực hiện trong tương lai, vì vậy client nên sử dụng cùng URI trong các yêu cầu tương lai.
- {{HTTPStatus(303, "303 See Other")}}
  - : Máy chủ gửi phản hồi này để hướng dẫn client lấy tài nguyên được yêu cầu tại URI khác bằng yêu cầu {{HTTPMethod("GET")}}.
- {{HTTPStatus(304, "304 Not Modified")}}
  - : Được dùng cho mục đích bộ đệm.
    Nó cho client biết rằng phản hồi chưa được sửa đổi, vì vậy client có thể tiếp tục sử dụng cùng phiên bản [đã lưu đệm](/en-US/docs/Web/HTTP/Guides/Caching) của phản hồi.
- `305 Use Proxy` {{deprecated_inline}}
  - : Được định nghĩa trong phiên bản trước của đặc tả HTTP để chỉ ra rằng phản hồi được yêu cầu phải được truy cập thông qua proxy.
    Nó đã bị ngừng sử dụng do lo ngại về bảo mật liên quan đến cấu hình proxy trong băng tần.
- `306 unused`
  - : Mã phản hồi này không còn được sử dụng; nhưng được dành riêng. Nó đã được dùng trong phiên bản trước của đặc tả HTTP/1.1.
- {{HTTPStatus(307, "307 Temporary Redirect")}}
  - : Máy chủ gửi phản hồi này để hướng dẫn client lấy tài nguyên được yêu cầu tại URI khác với cùng phương thức đã được dùng trong yêu cầu trước.
    Điều này có ngữ nghĩa giống như mã phản hồi `302 Found`, ngoại trừ user agent _không được_ thay đổi phương thức HTTP đã dùng: nếu {{HTTPMethod("POST")}} được dùng trong yêu cầu đầu tiên, thì `POST` phải được dùng trong yêu cầu chuyển hướng.
- {{HTTPStatus(308, "308 Permanent Redirect")}}
  - : Điều này có nghĩa là tài nguyên hiện nằm vĩnh viễn tại URI khác, được chỉ định bởi tiêu đề phản hồi {{HTTPHeader("Location")}}.
    Điều này có ngữ nghĩa giống như mã phản hồi HTTP `301 Moved Permanently`, ngoại trừ user agent _không được_ thay đổi phương thức HTTP đã dùng: nếu {{HTTPMethod("POST")}} được dùng trong yêu cầu đầu tiên, thì `POST` phải được dùng trong yêu cầu thứ hai.

## Phản hồi lỗi từ phía client

- {{HTTPStatus(400, "400 Bad Request")}}
  - : Máy chủ không thể hoặc sẽ không xử lý yêu cầu do điều gì đó được coi là lỗi từ phía client (ví dụ: cú pháp yêu cầu không đúng định dạng, đóng khung thông điệp yêu cầu không hợp lệ, hoặc định tuyến yêu cầu gian lận).
- {{HTTPStatus(401, "401 Unauthorized")}}
  - : Mặc dù tiêu chuẩn HTTP quy định là "unauthorized" (trái phép), nhưng về mặt ngữ nghĩa phản hồi này có nghĩa là "unauthenticated" (chưa xác thực).
    Nghĩa là, client phải xác thực bản thân để nhận được phản hồi được yêu cầu.
- {{HTTPStatus(402, "402 Payment Required")}}
  - : Mục đích ban đầu của mã này dành cho các hệ thống thanh toán kỹ thuật số, tuy nhiên mã trạng thái này hiếm khi được dùng và không có quy ước chuẩn nào tồn tại.
- {{HTTPStatus(403, "403 Forbidden")}}
  - : Client không có quyền truy cập vào nội dung; tức là nó không được phép, vì vậy máy chủ từ chối cung cấp tài nguyên được yêu cầu.
    Khác với `401 Unauthorized`, danh tính của client đã được máy chủ biết đến.
- {{HTTPStatus(404, "404 Not Found")}}
  - : Máy chủ không thể tìm thấy tài nguyên được yêu cầu.
    Trong trình duyệt, điều này có nghĩa là URL không được nhận dạng.
    Trong API, điều này cũng có thể có nghĩa là endpoint hợp lệ nhưng bản thân tài nguyên không tồn tại.
    Máy chủ cũng có thể gửi phản hồi này thay vì `403 Forbidden` để ẩn sự tồn tại của tài nguyên từ client không được phép.
    Mã phản hồi này có lẽ là nổi tiếng nhất do xuất hiện thường xuyên trên web.
- {{HTTPStatus(405, "405 Method Not Allowed")}}
  - : [Phương thức yêu cầu](/en-US/docs/Web/HTTP/Reference/Methods) được máy chủ biết đến nhưng không được hỗ trợ bởi tài nguyên mục tiêu.
    Ví dụ, một API có thể không cho phép `DELETE` trên một tài nguyên, hoặc phương thức `TRACE` hoàn toàn.
- {{HTTPStatus(406, "406 Not Acceptable")}}
  - : Phản hồi này được gửi khi máy chủ web, sau khi thực hiện [thương lượng nội dung do máy chủ điều khiển](/en-US/docs/Web/HTTP/Guides/Content_negotiation#server-driven_content_negotiation), không tìm thấy nội dung nào phù hợp với các tiêu chí do user agent đưa ra.
- {{HTTPStatus(407, "407 Proxy Authentication Required")}}
  - : Tương tự `401 Unauthorized` nhưng việc xác thực cần được thực hiện bởi proxy.
- {{HTTPStatus(408, "408 Request Timeout")}}
  - : Phản hồi này được gửi trên kết nối không hoạt động bởi một số máy chủ, ngay cả khi không có yêu cầu trước đó từ client.
    Điều này có nghĩa là máy chủ muốn đóng kết nối không sử dụng này.
    Phản hồi này được dùng nhiều hơn kể từ khi một số trình duyệt sử dụng cơ chế kết nối trước HTTP để tăng tốc độ duyệt web.
    Một số máy chủ có thể đóng kết nối mà không gửi thông báo này.
- {{HTTPStatus(409, "409 Conflict")}}
  - : Phản hồi này được gửi khi yêu cầu xung đột với trạng thái hiện tại của máy chủ.
    Trong {{glossary("WebDAV")}} chỉnh sửa web từ xa, các phản hồi `409` là lỗi gửi đến client để người dùng có thể giải quyết xung đột và gửi lại yêu cầu.
- {{HTTPStatus(410, "410 Gone")}}
  - : Phản hồi này được gửi khi nội dung được yêu cầu đã bị xóa vĩnh viễn khỏi máy chủ, không có địa chỉ chuyển tiếp.
    Client được kỳ vọng sẽ xóa bộ đệm và liên kết đến tài nguyên.
    Đặc tả HTTP dự định mã trạng thái này được dùng cho "các dịch vụ khuyến mãi có thời hạn".
    Các API không nên cảm thấy buộc phải chỉ ra các tài nguyên đã xóa bằng mã trạng thái này.
- {{HTTPStatus(411, "411 Length Required")}}
  - : Máy chủ từ chối yêu cầu vì trường tiêu đề {{HTTPHeader("Content-Length")}} không được định nghĩa và máy chủ yêu cầu nó.
- {{HTTPStatus(412, "412 Precondition Failed")}}
  - : Trong [yêu cầu có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests), client đã chỉ định các điều kiện trước trong tiêu đề mà máy chủ không đáp ứng.
- {{HTTPStatus(413, "413 Content Too Large")}}
  - : Thân yêu cầu lớn hơn giới hạn được định nghĩa bởi máy chủ.
    Máy chủ có thể đóng kết nối hoặc trả về trường tiêu đề {{HTTPHeader("Retry-After")}}.
- {{HTTPStatus(414, "414 URI Too Long")}}
  - : URI mà client yêu cầu dài hơn mức máy chủ sẵn sàng diễn giải.
- {{HTTPStatus(415, "415 Unsupported Media Type")}}
  - : Định dạng phương tiện của dữ liệu được yêu cầu không được máy chủ hỗ trợ, vì vậy máy chủ từ chối yêu cầu.
- {{HTTPStatus(416, "416 Range Not Satisfiable")}}
  - : Các [phạm vi](/en-US/docs/Web/HTTP/Guides/Range_requests) được chỉ định bởi trường tiêu đề `Range` trong yêu cầu không thể được đáp ứng.
    Có thể là phạm vi nằm ngoài kích thước dữ liệu của tài nguyên mục tiêu.
- {{HTTPStatus(417, "417 Expectation Failed")}}
  - : Mã phản hồi này có nghĩa là kỳ vọng được chỉ ra bởi trường tiêu đề yêu cầu {{HTTPHeader("Expect")}} không thể được máy chủ đáp ứng.
- {{HTTPStatus(418, "418 I'm a teapot")}}
  - : Máy chủ từ chối pha cà phê bằng ấm trà.
- {{HTTPStatus(421, "421 Misdirected Request")}}
  - : Yêu cầu được gửi đến máy chủ không thể tạo ra phản hồi.
    Điều này có thể được gửi bởi máy chủ không được cấu hình để tạo phản hồi cho tổ hợp scheme và authority có trong URI yêu cầu.
- {{HTTPStatus(422, "422 Unprocessable Content")}} ({{Glossary("WebDAV")}})
  - : Yêu cầu có định dạng đúng nhưng không thể thực hiện do lỗi ngữ nghĩa.
- {{HTTPStatus(423, "423 Locked")}} ({{Glossary("WebDAV")}})
  - : Tài nguyên đang được truy cập bị khóa.
- {{HTTPStatus(424, "424 Failed Dependency")}} ({{Glossary("WebDAV")}})
  - : Yêu cầu thất bại do thất bại của một yêu cầu trước đó.
- {{HTTPStatus(425, "425 Too Early")}} {{experimental_inline}}
  - : Cho biết rằng máy chủ không sẵn sàng xử lý yêu cầu có thể bị phát lại.
- {{HTTPStatus(426, "426 Upgrade Required")}}
  - : Máy chủ từ chối thực hiện yêu cầu bằng giao thức hiện tại nhưng có thể sẵn sàng thực hiện sau khi client nâng cấp lên giao thức khác.
    Máy chủ gửi tiêu đề {{HTTPHeader("Upgrade")}} trong phản hồi 426 để chỉ ra các giao thức yêu cầu.
- {{HTTPStatus(428, "428 Precondition Required")}}
  - : Máy chủ gốc yêu cầu yêu cầu phải [có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests).
    Phản hồi này nhằm ngăn chặn vấn đề 'cập nhật bị mất', trong đó client {{HTTPMethod("GET")}} trạng thái tài nguyên, sửa đổi nó và {{HTTPMethod("PUT")}} lại cho máy chủ, trong khi đó một bên thứ ba đã sửa đổi trạng thái trên máy chủ, dẫn đến xung đột.
- {{HTTPStatus(429, "429 Too Many Requests")}}
  - : Người dùng đã gửi quá nhiều yêu cầu trong một khoảng thời gian nhất định ({{Glossary("Rate_limit","giới hạn tốc độ")}}).
- {{HTTPStatus(431, "431 Request Header Fields Too Large")}}
  - : Máy chủ không sẵn sàng xử lý yêu cầu vì các trường tiêu đề quá lớn.
    Yêu cầu có thể được gửi lại sau khi giảm kích thước các trường tiêu đề yêu cầu.
- {{HTTPStatus(451, "451 Unavailable For Legal Reasons")}}
  - : User agent yêu cầu một tài nguyên không thể được cung cấp hợp pháp, chẳng hạn như trang web bị chính phủ kiểm duyệt.

## Phản hồi lỗi từ phía server

- {{HTTPStatus(500, "500 Internal Server Error")}}
  - : Máy chủ gặp phải tình huống mà nó không biết cách xử lý.
    Lỗi này là chung chung, cho biết rằng máy chủ không thể tìm thấy mã trạng thái `5XX` phù hợp hơn để phản hồi.
- {{HTTPStatus(501, "501 Not Implemented")}}
  - : Phương thức yêu cầu không được máy chủ hỗ trợ và không thể xử lý. Các phương thức duy nhất mà máy chủ được yêu cầu hỗ trợ (và do đó không được trả về mã này) là {{HTTPMethod("GET")}} và {{HTTPMethod("HEAD")}}.
- {{HTTPStatus(502, "502 Bad Gateway")}}
  - : Phản hồi lỗi này có nghĩa là máy chủ, trong khi hoạt động như một cổng để nhận phản hồi cần thiết để xử lý yêu cầu, nhận được phản hồi không hợp lệ.
- {{HTTPStatus(503, "503 Service Unavailable")}}
  - : Máy chủ chưa sẵn sàng xử lý yêu cầu.
    Các nguyên nhân phổ biến là máy chủ đang bảo trì hoặc bị quá tải.
    Lưu ý rằng cùng với phản hồi này, một trang thân thiện với người dùng giải thích vấn đề nên được gửi.
    Phản hồi này nên được dùng cho các điều kiện tạm thời và tiêu đề HTTP {{HTTPHeader("Retry-After")}}, nếu có thể, nên chứa thời gian ước tính trước khi dịch vụ phục hồi.
    Quản trị viên web cũng phải lưu ý về các tiêu đề liên quan đến bộ đệm được gửi cùng phản hồi này, vì các phản hồi điều kiện tạm thời này thường không nên được lưu đệm.
- {{HTTPStatus(504, "504 Gateway Timeout")}}
  - : Phản hồi lỗi này được đưa ra khi máy chủ đang hoạt động như một cổng và không thể nhận được phản hồi kịp thời.
- {{HTTPStatus(505, "505 HTTP Version Not Supported")}}
  - : Phiên bản HTTP được dùng trong yêu cầu không được máy chủ hỗ trợ.
- {{HTTPStatus(506, "506 Variant Also Negotiates")}}
  - : Máy chủ có lỗi cấu hình nội bộ: trong quá trình thương lượng nội dung, biến thể được chọn được cấu hình để tự tham gia thương lượng nội dung, dẫn đến tham chiếu vòng tròn khi tạo phản hồi.
- {{HTTPStatus(507, "507 Insufficient Storage")}} ({{Glossary("WebDAV")}})
  - : Phương thức không thể được thực hiện trên tài nguyên vì máy chủ không thể lưu trữ biểu diễn cần thiết để hoàn thành yêu cầu thành công.
- {{HTTPStatus(508, "508 Loop Detected")}} ({{Glossary("WebDAV")}})
  - : Máy chủ phát hiện vòng lặp vô tận trong khi xử lý yêu cầu.
- {{HTTPStatus(510, "510 Not Extended")}}
  - : Yêu cầu của client khai báo một Phần mở rộng HTTP ({{RFC("2774")}}) nên được dùng để xử lý yêu cầu, nhưng phần mở rộng không được hỗ trợ.
- {{HTTPStatus(511, "511 Network Authentication Required")}}
  - : Cho biết rằng client cần xác thực để có được quyền truy cập mạng.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Danh sách mã trạng thái HTTP trên Wikipedia](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
- [Sổ đăng ký chính thức của IANA về mã trạng thái HTTP](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml)
