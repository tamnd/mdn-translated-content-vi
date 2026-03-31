---
title: Sec-WebSocket-Version header
short-title: Sec-WebSocket-Version
slug: Web/HTTP/Reference/Headers/Sec-WebSocket-Version
page-type: http-header
browser-compat: http.headers.Sec-WebSocket-Version
spec-urls: https://datatracker.ietf.org/doc/html/rfc6455#section-11.3.5
sidebar: http
---

Tiêu đề HTTP **Sec-WebSocket-Version** {{glossary("request header", "request")}} và {{glossary("response header")}} được sử dụng trong [bắt tay mở](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) [WebSocket](/en-US/docs/Web/API/WebSockets_API) để cho biết phiên bản giao thức WebSocket được máy khách hỗ trợ, và các phiên bản giao thức được máy chủ hỗ trợ nếu nó _không_ hỗ trợ phiên bản được chỉ định trong yêu cầu.

Tiêu đề chỉ có thể xuất hiện một lần trong yêu cầu, và chỉ định phiên bản WebSocket mà ứng dụng web đang sử dụng.
Phiên bản hiện tại của giao thức tại thời điểm viết bài là 13.
Tiêu đề được tác nhân người dùng tự động thêm vào yêu cầu khi kết nối {{domxref("WebSocket")}} được thiết lập.

Máy chủ sử dụng phiên bản để xác định xem nó có thể hiểu giao thức hay không.
Nếu máy chủ không hỗ trợ phiên bản, hoặc bất kỳ tiêu đề nào trong bắt tay không được hiểu hoặc có giá trị không chính xác, máy chủ nên gửi phản hồi với trạng thái {{httpstatus("400", "400 Bad Request")}} và đóng socket ngay lập tức.
Nó cũng nên bao gồm `Sec-WebSocket-Version` trong phản hồi `400`, liệt kê các phiên bản mà nó hỗ trợ.
Các phiên bản có thể được chỉ định trong các tiêu đề riêng lẻ, hoặc dưới dạng giá trị phân cách bằng dấu phẩy trong một tiêu đề duy nhất.

Tiêu đề không nên được gửi trong phản hồi nếu máy chủ hiểu phiên bản được chỉ định bởi máy khách.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có (tiền tố <code>Sec-</code>)</td>
    </tr>
  </tbody>
</table>

## Cú pháp

Yêu cầu

```http
Sec-WebSocket-Version: <version>
```

Phản hồi (chỉ khi có lỗi):

```http
Sec-WebSocket-Version: <server-supported-versions>
```

## Chỉ thị

- `<version>`
  - : Phiên bản giao thức WebSocket mà máy khách muốn sử dụng khi giao tiếp với máy chủ.
    Số này nên là phiên bản mới nhất có thể được liệt kê trong [IANA WebSocket Version Number Registry](https://www.iana.org/assignments/websocket/websocket.xml#version-number).
    Phiên bản cuối cùng mới nhất của giao thức WebSocket là phiên bản 13.
- `<server-supported-versions>`
  - : Khi có lỗi, danh sách phân cách bằng dấu phẩy các phiên bản giao thức WebSocket được máy chủ hỗ trợ.
    Tiêu đề không được gửi trong phản hồi nếu `<version>` được hỗ trợ.

## Ví dụ

### Bắt tay mở WebSocket

Phiên bản được máy khách hỗ trợ được chỉ định trong [yêu cầu bắt tay](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) `WebSocket` ban đầu.
Đối với giao thức hiện tại, phiên bản là "13", như được hiển thị dưới đây.

```http
GET /chat HTTP/1.1
Host: example.com:8000
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==
Sec-WebSocket-Version: 13
```

Nếu máy chủ hỗ trợ phiên bản 13 của giao thức, thì `Sec-WebSocket-Version` sẽ không xuất hiện trong phản hồi.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Sec-WebSocket-Accept")}}
- {{HTTPHeader("Sec-WebSocket-Key")}}
- {{HTTPHeader("Sec-WebSocket-Protocol")}}
- {{HTTPHeader("Sec-WebSocket-Extensions")}}
- [Bắt tay WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) trong _Viết WebSocket servers_
