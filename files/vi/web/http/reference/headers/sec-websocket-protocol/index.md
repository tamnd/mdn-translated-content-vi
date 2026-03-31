---
title: Sec-WebSocket-Protocol header
short-title: Sec-WebSocket-Protocol
slug: Web/HTTP/Reference/Headers/Sec-WebSocket-Protocol
page-type: http-header
browser-compat: http.headers.Sec-WebSocket-Protocol
spec-urls: https://datatracker.ietf.org/doc/html/rfc6455#section-11.3.4
sidebar: http
---

Tiêu đề HTTP **`Sec-WebSocket-Protocol`** {{glossary("request header", "request")}} và {{glossary("response header")}} được sử dụng trong [bắt tay mở](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) [WebSocket](/en-US/docs/Web/API/WebSockets_API) để thương lượng [sub-protocol](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#subprotocols) được sử dụng trong giao tiếp.
Đây có thể là giao thức được hiểu rõ, như SOAP hoặc WAMP, hoặc giao thức tùy chỉnh được máy khách và máy chủ hiểu.

Trong yêu cầu, tiêu đề chỉ định một hoặc nhiều sub-protocol WebSocket mà ứng dụng web muốn sử dụng, theo thứ tự ưu tiên.
Chúng có thể được thêm vào dưới dạng giá trị giao thức trong nhiều tiêu đề, hoặc dưới dạng giá trị phân cách bằng dấu phẩy được thêm vào một tiêu đề duy nhất.

Trong phản hồi, nó chỉ định sub-protocol được máy chủ chọn.
Đây phải là sub-protocol đầu tiên mà máy chủ hỗ trợ từ danh sách được cung cấp trong tiêu đề yêu cầu.

Tiêu đề yêu cầu được trình duyệt tự động thêm và điền vào bằng các giá trị được ứng dụng chỉ định trong tham số [`protocols`](/en-US/docs/Web/API/WebSocket/WebSocket#protocols) của `WebSocket()`.
Sub-protocol được máy chủ chọn được cung cấp cho ứng dụng web trong {{domxref("WebSocket.protocol")}}.

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
Sec-WebSocket-Protocol: <sub-protocols>
```

## Chỉ thị

- `<sub-protocols>`
  - : Danh sách phân cách bằng dấu phẩy các tên sub-protocol, theo thứ tự ưu tiên.
    Sub-protocol có thể được chọn từ [IANA WebSocket Subprotocol Name Registry](https://www.iana.org/assignments/websocket/websocket.xml#subprotocol-name), hoặc có thể là tên tùy chỉnh được máy khách và máy chủ hiểu.

    Là tiêu đề phản hồi, đây là một sub-protocol duy nhất mà máy chủ đã chọn.

## Ví dụ

### Bắt tay mở WebSocket

Sub-protocol được chỉ định trong [yêu cầu bắt tay](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) WebSocket ban đầu.
Yêu cầu dưới đây cho thấy máy khách thích `soap`, nhưng cũng hỗ trợ `wamp`.

```http
GET /chat HTTP/1.1
Host: example.com:8000
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==
Sec-WebSocket-Version: 13
Sec-WebSocket-Protocol: soap, wamp
```

Chỉ định giao thức như thế này có hiệu quả giống nhau:

```http
Sec-WebSocket-Protocol: soap
Sec-WebSocket-Protocol: wamp
```

Phản hồi từ máy chủ sẽ bao gồm tiêu đề `Sec-WebSocket-Protocol`, chọn sub-protocol đầu tiên mà nó hỗ trợ từ các sở thích của máy khách.
Dưới đây cho thấy đó là `soap`:

```http
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=
Sec-WebSocket-Protocol: soap
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Sec-WebSocket-Accept")}}
- {{HTTPHeader("Sec-WebSocket-Key")}}
- {{HTTPHeader("Sec-WebSocket-Version")}}
- {{HTTPHeader("Sec-WebSocket-Extensions")}}
- [Bắt tay WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) và [Subprotocols](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#subprotocols) trong _Viết WebSocket servers_
