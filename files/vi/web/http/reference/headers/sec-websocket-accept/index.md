---
title: Sec-WebSocket-Accept header
short-title: Sec-WebSocket-Accept
slug: Web/HTTP/Reference/Headers/Sec-WebSocket-Accept
page-type: http-header
browser-compat: http.headers.Sec-WebSocket-Accept
spec-urls: https://datatracker.ietf.org/doc/html/rfc6455#section-11.3.3
sidebar: http
---

Tiêu đề HTTP **Sec-WebSocket-Accept** {{glossary("response header")}} được sử dụng trong [bắt tay mở](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) [WebSocket](/en-US/docs/Web/API/WebSockets_API) để cho biết máy chủ sẵn sàng nâng cấp lên kết nối WebSocket.

Tiêu đề này không được xuất hiện quá một lần trong phản hồi, và có giá trị chỉ thị được tính toán từ tiêu đề yêu cầu {{HTTPHeader("Sec-WebSocket-Key")}} được gửi trong yêu cầu tương ứng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Sec-WebSocket-Accept: <hashed key>
```

## Chỉ thị

- `<hashed key>`
  - : Nếu tiêu đề {{HTTPHeader("Sec-WebSocket-Key")}} được cung cấp, giá trị của tiêu đề này được tính bằng cách lấy giá trị của key, nối chuỗi `258EAFA5-E914-47DA-95CA-C5AB0DC85B11`, và lấy hash [SHA-1](https://en.wikipedia.org/wiki/SHA-1) của chuỗi nối đó — kết quả là giá trị 20 byte.
    Giá trị đó sau đó được mã hóa [base64](/en-US/docs/Glossary/Base64) để lấy giá trị của thuộc tính này.

## Ví dụ

### Bắt tay mở WebSocket

Máy khách sẽ khởi tạo bắt tay WebSocket với yêu cầu như sau.
Lưu ý rằng điều này bắt đầu như yêu cầu HTTP `GET` (HTTP/1.1 trở lên) và bao gồm tiêu đề {{httpheader("Upgrade")}} cho biết ý định nâng cấp lên kết nối WebSocket.
Nó cũng bao gồm `Sec-WebSocket-Key`, được sử dụng trong tính toán `Sec-WebSocket-Accept` để xác nhận ý định nâng cấp kết nối lên kết nối WebSocket.

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

- {{HTTPHeader("Sec-WebSocket-Key")}}
- {{HTTPHeader("Sec-WebSocket-Version")}}
- {{HTTPHeader("Sec-WebSocket-Protocol")}}
- {{HTTPHeader("Sec-WebSocket-Extensions")}}
- [Bắt tay WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) trong _Viết WebSocket servers_
- [Cơ chế nâng cấp giao thức HTTP](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism)
