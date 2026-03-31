---
title: Sec-WebSocket-Extensions header
short-title: Sec-WebSocket-Extensions
slug: Web/HTTP/Reference/Headers/Sec-WebSocket-Extensions
page-type: http-header
browser-compat: http.headers.Sec-WebSocket-Extensions
spec-urls: https://datatracker.ietf.org/doc/html/rfc6455#section-11.3.2
sidebar: http
---

Tiêu đề HTTP **Sec-WebSocket-Extensions** {{glossary("request header", "request")}} và {{glossary("response header")}} được sử dụng trong [bắt tay mở](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) [WebSocket](/en-US/docs/Web/API/WebSockets_API) để thương lượng phần mở rộng giao thức được máy khách và máy chủ sử dụng.

Trong yêu cầu, tiêu đề chỉ định một hoặc nhiều phần mở rộng mà ứng dụng web muốn sử dụng, theo thứ tự ưu tiên.
Chúng có thể được thêm vào nhiều tiêu đề, hoặc dưới dạng giá trị phân cách bằng dấu phẩy được thêm vào một tiêu đề duy nhất.
Mỗi phần mở rộng cũng có thể có một hoặc nhiều tham số — đây là các giá trị phân cách bằng dấu chấm phẩy được liệt kê sau phần mở rộng.

Trong phản hồi, tiêu đề chỉ có thể xuất hiện một lần, nơi nó chỉ định phần mở rộng được máy chủ chọn từ các sở thích của máy khách.
Giá trị này phải là phần mở rộng đầu tiên mà máy chủ hỗ trợ từ danh sách được cung cấp trong tiêu đề yêu cầu.

Tiêu đề yêu cầu được trình duyệt tự động thêm dựa trên khả năng của nó, và không phụ thuộc vào các tham số được truyền vào constructor khi `WebSocket` được tạo.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}, {{Glossary("Response header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có (tiền tố <code>Sec-</code>)</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Sec-WebSocket-Extensions: <extensions>
```

## Chỉ thị

- `<extensions>`
  - : Danh sách phân cách bằng dấu phẩy các phần mở rộng cần yêu cầu (hoặc để máy chủ đồng ý hỗ trợ).
    Thường được chọn từ [IANA WebSocket Extension Name Registry](https://www.iana.org/assignments/websocket/websocket.xml#extension-name) (cũng có thể sử dụng phần mở rộng tùy chỉnh).
    Các phần mở rộng nhận tham số phân định chúng bằng dấu chấm phẩy.

## Ví dụ

### Bắt tay mở WebSocket

Yêu cầu HTTP dưới đây hiển thị bắt tay mở nơi máy khách hỗ trợ phần mở rộng `permessage-deflate` (với tham số `client_max_window_bits`) và phần mở rộng `bbf-usp-protocol`.

```http
GET /chat HTTP/1.1
Host: example.com:8000
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==
Sec-WebSocket-Version: 13
Sec-WebSocket-Extensions: permessage-deflate; client_max_window_bits, bbf-usp-protocol
```

Yêu cầu dưới đây với các tiêu đề riêng biệt cho mỗi phần mở rộng là tương đương:

```http
GET /chat HTTP/1.1
Host: example.com:8000
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==
Sec-WebSocket-Version: 13
Sec-WebSocket-Extensions: permessage-deflate; client_max_window_bits
Sec-WebSocket-Extensions: bbf-usp-protocol
```

Phản hồi dưới đây có thể được gửi từ máy chủ để cho biết rằng nó sẽ hỗ trợ phần mở rộng `permessage-deflate`:

```http
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=
Sec-WebSocket-Extensions: permessage-deflate
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Sec-WebSocket-Accept")}}
- {{HTTPHeader("Sec-WebSocket-Key")}}
- {{HTTPHeader("Sec-WebSocket-Version")}}
- {{HTTPHeader("Sec-WebSocket-Protocol")}}
- [Bắt tay WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) và [Subprotocols](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#subprotocols) trong _Viết WebSocket servers_
