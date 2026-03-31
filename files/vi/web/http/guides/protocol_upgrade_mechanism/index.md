---
title: Protocol upgrade mechanism
slug: Web/HTTP/Guides/Protocol_upgrade_mechanism
page-type: guide
spec-urls:
  - https://www.rfc-editor.org/rfc/rfc6455
  - https://www.rfc-editor.org/rfc/rfc7230
  - https://www.rfc-editor.org/rfc/rfc7540
sidebar: http
---

[Giao thức HTTP/1.1](/en-US/docs/Web/HTTP) cung cấp một cơ chế đặc biệt có thể được sử dụng để nâng cấp kết nối đã thiết lập lên giao thức khác, sử dụng trường header {{HTTPHeader("Upgrade")}}.

Cơ chế này là tùy chọn; nó không thể được sử dụng để nhấn mạnh việc thay đổi giao thức. Các triển khai có thể chọn không tận dụng lợi thế của việc nâng cấp ngay cả khi họ hỗ trợ giao thức mới và trên thực tế, cơ chế này chủ yếu được sử dụng để khởi động kết nối WebSockets.

Lưu ý rằng HTTP/2 rõ ràng không cho phép sử dụng cơ chế này; nó dành riêng cho HTTP/1.1.

## Nâng cấp kết nối HTTP/1.1

Trường header {{HTTPHeader("Upgrade")}} được client sử dụng để mời máy chủ chuyển sang một trong các giao thức được liệt kê, theo thứ tự ưu tiên giảm dần.

Vì `Upgrade` là header hop-by-hop, nó cũng cần được liệt kê trong trường header {{HTTPHeader("Connection")}}. Điều này có nghĩa là một yêu cầu điển hình bao gồm Upgrade sẽ trông như thế này:

```http
GET /index.html HTTP/1.1
Host: www.example.com
Connection: upgrade
Upgrade: example/1, foo/2
```

Các header khác có thể được yêu cầu tùy thuộc vào giao thức được yêu cầu; ví dụ: các nâng cấp [WebSocket](/en-US/docs/Web/API/WebSocket) cho phép các header bổ sung để cấu hình chi tiết về kết nối WebSocket cũng như cung cấp mức độ bảo mật nhất định trong việc mở kết nối. Xem [Nâng cấp lên kết nối WebSocket](#upgrading_to_a_websocket_connection) để biết thêm chi tiết.

Nếu máy chủ quyết định nâng cấp kết nối, nó gửi lại trạng thái phản hồi {{HTTPStatus(101, "101 Switching Protocols")}} với header Upgrade chỉ định (các) giao thức đang được chuyển đổi. Nếu nó không (hoặc không thể) nâng cấp kết nối, nó bỏ qua header `Upgrade` và gửi lại phản hồi thông thường (ví dụ: {{HTTPStatus(200, "200 OK")}}).

Ngay sau khi gửi mã trạng thái `101`, máy chủ có thể bắt đầu nói bằng giao thức mới, thực hiện bất kỳ bắt tay bổ sung nào dành riêng cho giao thức khi cần thiết. Về mặt hiệu quả, kết nối trở thành đường ống hai chiều ngay sau khi phản hồi được nâng cấp hoàn tất và yêu cầu khởi tạo nâng cấp có thể được hoàn thành qua giao thức mới.

## Các trường hợp sử dụng phổ biến cho cơ chế này

Ở đây chúng ta xem xét các trường hợp sử dụng phổ biến nhất cho header {{HTTPHeader("Upgrade")}}.

### Nâng cấp lên kết nối WebSocket

Cho đến nay, trường hợp sử dụng phổ biến nhất để nâng cấp kết nối HTTP là sử dụng WebSockets, luôn được triển khai bằng cách nâng cấp kết nối HTTP hoặc HTTPS. Hãy nhớ rằng nếu bạn đang mở kết nối mới bằng [WebSocket API](/en-US/docs/Web/API/WebSocket) hoặc bất kỳ thư viện nào thực hiện WebSockets, hầu hết hoặc tất cả điều này được thực hiện cho bạn. Ví dụ: mở kết nối WebSocket là một phương thức duy nhất:

```js
webSocket = new WebSocket("ws://destination.server.ext", "optionalProtocol");
```

Hàm tạo {{domxref("WebSocket.WebSocket", "WebSocket()")}} thực hiện tất cả công việc tạo kết nối HTTP/1.1 ban đầu và sau đó xử lý quá trình bắt tay và nâng cấp cho bạn.

> [!NOTE]
> Bạn cũng có thể sử dụng scheme URL `"wss://"` để mở kết nối WebSocket an toàn.

Nếu bạn cần tạo kết nối WebSocket từ đầu, bạn sẽ phải tự xử lý quá trình bắt tay. Sau khi tạo phiên HTTP/1.1 ban đầu, bạn cần yêu cầu nâng cấp bằng cách thêm vào yêu cầu tiêu chuẩn các header {{HTTPHeader("Upgrade")}} và {{HTTPHeader("Connection")}}, như sau:

```http
Connection: Upgrade
Upgrade: websocket
```

### Header dành riêng cho WebSocket

Các header sau đây được liên quan trong quá trình nâng cấp WebSocket. Ngoài header {{HTTPHeader("Upgrade")}} và {{HTTPHeader("Connection")}}, phần còn lại thường là tùy chọn hoặc được xử lý cho bạn bởi trình duyệt và máy chủ khi chúng nói chuyện với nhau.

#### {{HTTPHeader("Sec-WebSocket-Extensions")}}

Chỉ định một hoặc nhiều tiện ích mở rộng WebSocket cấp giao thức để yêu cầu máy chủ sử dụng. Việc sử dụng nhiều hơn một header `Sec-WebSocket-Extension` trong yêu cầu được phép; kết quả giống như nếu bạn bao gồm tất cả các tiện ích mở rộng được liệt kê trong một header như vậy.

```http
Sec-WebSocket-Extensions: extensions
```

- `extensions`
  - : Danh sách tiện ích mở rộng được phân tách bằng dấu phẩy để yêu cầu (hoặc đồng ý hỗ trợ). Chúng nên được chọn từ [IANA WebSocket Extension Name Registry](https://www.iana.org/assignments/websocket/websocket.xml#extension-name). Các tiện ích mở rộng nhận tham số làm như vậy bằng cách sử dụng phân cách bằng dấu chấm phẩy.

Ví dụ: header này cho biết hai tiện ích mở rộng tùy chỉnh: `superspeed` và `colormode` (cũng có tham số `depth=16`):

```http
Sec-WebSocket-Extensions: superspeed, colormode; depth=16
```

#### {{HTTPHeader("Sec-WebSocket-Key")}}

Cung cấp thông tin cho máy chủ cần thiết để xác nhận rằng client có quyền yêu cầu nâng cấp lên WebSocket. Header này có thể được sử dụng khi các client không an toàn (HTTP) muốn nâng cấp, để cung cấp một mức độ bảo vệ nhất định chống lại lạm dụng. Giá trị của khóa được tính bằng thuật toán được định nghĩa trong đặc tả WebSocket, vì vậy điều này _không cung cấp bảo mật_. Thay vào đó, nó giúp ngăn các client không phải WebSocket vô tình, hoặc do lạm dụng, yêu cầu kết nối WebSocket. Về bản chất, khóa này xác nhận "Vâng, tôi thực sự có ý định mở kết nối WebSocket."

Header này được tự động thêm bởi các client chọn sử dụng nó; nó không thể được thêm bằng các phương thức {{domxref("Window/fetch", "fetch()")}} hoặc {{domxref("XMLHttpRequest.setRequestHeader()")}}.

```http
Sec-WebSocket-Key: key
```

- `key`
  - : Khóa cho yêu cầu nâng cấp này. Client thêm điều này nếu họ muốn làm vậy, và máy chủ sẽ bao gồm trong phản hồi một khóa của riêng mình mà client sẽ xác nhận trước khi gửi phản hồi nâng cấp cho bạn.

Header {{HTTPHeader("Sec-WebSocket-Accept")}} của phản hồi máy chủ sẽ có giá trị được tính dựa trên `key` được chỉ định.

#### {{HTTPHeader("Sec-WebSocket-Protocol")}}

Header `Sec-WebSocket-Protocol` chỉ định một hoặc nhiều giao thức WebSocket mà bạn muốn sử dụng, theo thứ tự ưu tiên. Giao thức đầu tiên được máy chủ hỗ trợ sẽ được chọn và trả về bởi máy chủ trong header `Sec-WebSocket-Protocol` được bao gồm trong phản hồi. Bạn có thể sử dụng điều này nhiều hơn một lần trong header; kết quả giống như nếu bạn sử dụng danh sách các định danh giao thức con được phân tách bằng dấu phẩy trong một header duy nhất.

```http
Sec-WebSocket-Protocol: subprotocols
```

- `subprotocols`
  - : Danh sách tên giao thức con được phân tách bằng dấu phẩy, theo thứ tự ưu tiên. Các giao thức con có thể được chọn từ [IANA WebSocket Subprotocol Name Registry](https://www.iana.org/assignments/websocket/websocket.xml#subprotocol-name) hoặc có thể là tên tùy chỉnh được client và máy chủ hiểu chung.

#### {{HTTPHeader("Sec-WebSocket-Version")}}

##### Header yêu cầu

Chỉ định phiên bản giao thức WebSocket mà client muốn sử dụng, để máy chủ có thể xác nhận xem phiên bản đó có được hỗ trợ ở phía máy chủ hay không.

```http
Sec-WebSocket-Version: version
```

- `version`
  - : Phiên bản giao thức WebSocket mà client muốn sử dụng khi giao tiếp với máy chủ. Số này phải là phiên bản mới nhất có thể được liệt kê trong [IANA WebSocket Version Number Registry](https://www.iana.org/assignments/websocket/websocket.xml#version-number). Phiên bản cuối cùng mới nhất của giao thức WebSocket là phiên bản 13.

##### Header phản hồi

Nếu máy chủ không thể giao tiếp bằng phiên bản giao thức WebSocket được chỉ định, nó sẽ phản hồi bằng lỗi (như 426 Upgrade Required) bao gồm trong các header của nó header `Sec-WebSocket-Version` với danh sách các phiên bản giao thức được hỗ trợ phân tách bằng dấu phẩy. Nếu máy chủ hỗ trợ phiên bản giao thức được yêu cầu, không có header `Sec-WebSocket-Version` nào được bao gồm trong phản hồi.

```http
Sec-WebSocket-Version: supportedVersions
```

- `supportedVersions`
  - : Danh sách các phiên bản giao thức WebSocket được máy chủ hỗ trợ phân tách bằng dấu phẩy.

### Header chỉ có trong phản hồi

Phản hồi từ máy chủ có thể bao gồm những header này.

#### {{HTTPHeader("Sec-WebSocket-Accept")}}

Được bao gồm trong thông báo phản hồi từ máy chủ trong quá trình mở bắt tay khi máy chủ sẵn sàng khởi tạo kết nối WebSocket. Nó sẽ xuất hiện không quá một lần trong các header phản hồi.

```http
Sec-WebSocket-Accept: hash
```

- `hash`
  - : Nếu header {{HTTPHeader("Sec-WebSocket-Key")}} được cung cấp, giá trị của header này được tính bằng cách lấy giá trị của khóa, nối chuỗi "258EAFA5-E914-47DA-95CA-C5AB0DC85B11" vào nó, lấy hash [SHA-1](https://en.wikipedia.org/wiki/SHA-1) của chuỗi đã nối đó, tạo ra giá trị 20 byte. Giá trị đó sau đó được mã hóa [base64](/en-US/docs/Glossary/Base64) để có được giá trị của thuộc tính này.

## Thông số kỹ thuật

{{specifications}}

## Xem thêm

- [WebSocket API](/en-US/docs/Web/API/WebSocket)
- [Sự phát triển của HTTP](/en-US/docs/Web/HTTP/Guides/Evolution_of_HTTP)
- Thuật ngữ:
  - {{glossary('HTTP')}}
  - {{glossary('HTTP_2', 'HTTP/2')}}
  - {{glossary('QUIC')}}
