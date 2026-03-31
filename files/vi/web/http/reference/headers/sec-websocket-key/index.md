---
title: Sec-WebSocket-Key header
short-title: Sec-WebSocket-Key
slug: Web/HTTP/Reference/Headers/Sec-WebSocket-Key
page-type: http-header
browser-compat: http.headers.Sec-WebSocket-Key
spec-urls: https://datatracker.ietf.org/doc/html/rfc6455#section-11.3.1
sidebar: http
---

Tiêu đề HTTP **Sec-WebSocket-Key** {{glossary("request header")}} được sử dụng trong [bắt tay mở](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) [WebSocket](/en-US/docs/Web/API/WebSockets_API) để cho phép máy khách (tác nhân người dùng) xác nhận rằng nó "thực sự muốn" yêu cầu rằng máy khách HTTP được nâng cấp thành WebSocket.

Giá trị của key được tính toán bằng thuật toán được định nghĩa trong đặc tả WebSocket, vì vậy điều này _không cung cấp bảo mật_.
Thay vào đó, nó giúp ngăn các máy khách không phải WebSocket vô tình, hoặc thông qua việc lạm dụng, yêu cầu kết nối WebSocket.

Tiêu đề này được tác nhân người dùng tự động thêm khi script mở WebSocket; không thể thêm bằng cách sử dụng phương thức {{domxref("Window/fetch", "fetch()")}} hoặc {{domxref("XMLHttpRequest.setRequestHeader()")}}.

Tiêu đề phản hồi {{HTTPHeader("Sec-WebSocket-Accept")}} của máy chủ nên bao gồm giá trị được tính toán dựa trên giá trị key được chỉ định.
Tác nhân người dùng sau đó có thể xác thực điều này trước khi xác nhận kết nối.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có (tiền tố <code>Sec-</code>)</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Sec-WebSocket-Key: <key>
```

## Chỉ thị

- `<key>`
  - : Key cho yêu cầu nâng cấp này.
    Đây là {{Glossary("Nonce", "nonce")}} 16 byte được chọn ngẫu nhiên đã được mã hóa base64 và isomorphic.
    Tác nhân người dùng thêm điều này khi khởi tạo kết nối WebSocket.

## Ví dụ

### Bắt tay mở WebSocket

Máy khách sẽ khởi tạo bắt tay WebSocket với yêu cầu như sau.
Lưu ý rằng điều này bắt đầu như yêu cầu HTTP `GET` (HTTP/1.1 trở lên), ngoài `Sec-WebSocket-Key`, yêu cầu bao gồm tiêu đề {{httpheader("Upgrade")}}, cho biết ý định nâng cấp từ HTTP lên kết nối WebSocket.

```http
GET /chat HTTP/1.1
Host: example.com:8000
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==
Sec-WebSocket-Version: 13
```

Phản hồi từ máy chủ nên bao gồm tiêu đề `Sec-WebSocket-Accept` với giá trị được tính từ tiêu đề `Sec-WebSocket-Key` trong yêu cầu, và xác nhận ý định nâng cấp kết nối lên kết nối WebSocket:

```http
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Sec-WebSocket-Accept")}}
- {{HTTPHeader("Sec-WebSocket-Version")}}
- {{HTTPHeader("Sec-WebSocket-Protocol")}}
- {{HTTPHeader("Sec-WebSocket-Extensions")}}
- [Bắt tay WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) trong _Viết WebSocket servers_
- [Cơ chế nâng cấp giao thức HTTP](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism)
