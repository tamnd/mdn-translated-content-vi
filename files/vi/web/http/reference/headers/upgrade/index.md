---
title: Upgrade header
short-title: Upgrade
slug: Web/HTTP/Reference/Headers/Upgrade
page-type: http-header
browser-compat: http.headers.Upgrade
sidebar: http
---

Tiêu đề HTTP `Upgrade` {{glossary("request header", "request")}} và {{glossary("response header")}} có thể được sử dụng để nâng cấp kết nối máy khách/máy chủ đã được thiết lập lên một giao thức khác (qua cùng giao thức vận chuyển).
Ví dụ, nó có thể được máy khách sử dụng để nâng cấp kết nối từ HTTP/1.1 lên HTTP/2, hoặc kết nối HTTP(S) lên kết nối WebSocket.

> [!WARNING]
> HTTP/2 rõ ràng không cho phép sử dụng cơ chế và tiêu đề này; nó dành riêng cho HTTP/1.1.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}},
        {{Glossary("Response header")}}
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Upgrade: <protocol>[/<protocol_version>]
Upgrade: <protocol>[/<protocol_version>], …, <protocolN>[/<protocol_versionN>]
```

## Chỉ thị

- `<protocol>`
  - : Các giao thức được liệt kê, phân cách bằng dấu phẩy, theo thứ tự ưu tiên giảm dần.
- `<protocol_version>` {{optional_inline}}
  - : Phiên bản giao thức tùy chọn có thể được cung cấp với tiền tố `/` gạch chéo tiến.

## Mô tả

Trường tiêu đề `Upgrade` có thể được máy khách sử dụng để mời máy chủ chuyển sang một (hoặc nhiều) giao thức được liệt kê, theo thứ tự ưu tiên giảm dần.
Ví dụ, máy khách có thể gửi yêu cầu `GET` như được hiển thị, liệt kê các giao thức ưu thích để chuyển sang (trong trường hợp này `example/1` và `foo/2`):

```http
GET /index.html HTTP/1.1
Host: www.example.com
Connection: upgrade
Upgrade: example/1, foo/2
```

> [!NOTE]
> Tiêu đề {{HTTPHeader("Connection")}} với loại `upgrade` phải _luôn luôn_ được gửi cùng với tiêu đề `Upgrade`.

Máy chủ có thể bỏ qua yêu cầu, vì bất kỳ lý do nào, trong trường hợp đó nó nên phản hồi như thể tiêu đề `Upgrade` không được gửi (ví dụ, với {{HTTPStatus(200, "200 OK")}}).
Nếu máy chủ sẽ nâng cấp kết nối, nó phải:

1. Gửi lại trạng thái phản hồi {{HTTPStatus(101, "101 Switching Protocols")}} với tiêu đề `Upgrade` chỉ định (các) giao thức đang được chuyển sang. Ví dụ:

   ```http
   HTTP/1.1 101 Switching Protocols
   Upgrade: foo/2
   Connection: Upgrade
   ```

2. Gửi phản hồi cho yêu cầu ban đầu _sử dụng giao thức mới_ (máy chủ chỉ có thể chuyển sang giao thức mà nó có thể hoàn thành yêu cầu ban đầu).

Máy chủ cũng có thể gửi tiêu đề như một phần của phản hồi `Upgrade Required` {{HTTPStatus("426")}}, để cho biết rằng máy chủ sẽ không thực hiện yêu cầu bằng giao thức hiện tại, nhưng có thể làm vậy nếu giao thức được thay đổi. Sau đó máy khách có thể yêu cầu thay đổi giao thức bằng quy trình trên.

Thêm chi tiết và ví dụ được cung cấp trong chủ đề [Cơ chế nâng cấp giao thức](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism).

## Ví dụ

### Tiêu đề Upgrade với nhiều giao thức

Yêu cầu sau liệt kê nhiều giao thức theo thứ tự ưu tiên giảm dần:

```http
Connection: upgrade
Upgrade: HTTP/2.0, SHTTP/1.3, IRC/6.9, RTA/x11
```

### Nâng cấp lên WebSocket

Đây là kết hợp tiêu đề phổ biến để sử dụng khi bắt đầu nâng cấp kết nối HTTP lên WebSockets.
Xem [Nâng cấp lên kết nối WebSocket](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism#upgrading_to_a_websocket_connection) để biết thêm thông tin.

```http
Connection: Upgrade
Upgrade: websocket
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Cơ chế nâng cấp giao thức](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism)
- {{HTTPStatus(101, "101 Switching Protocols")}}
- {{HTTPStatus(426, "426 Upgrade Required")}}
- {{HTTPHeader("Connection")}}
