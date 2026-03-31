---
title: Access-Control-Expose-Headers header
short-title: Access-Control-Expose-Headers
slug: Web/HTTP/Reference/Headers/Access-Control-Expose-Headers
page-type: http-header
browser-compat: http.headers.Access-Control-Expose-Headers
sidebar: http
---

Tiêu đề HTTP **`Access-Control-Expose-Headers`** {{Glossary("response header", "phản hồi")}} cho phép máy chủ chỉ ra những tiêu đề phản hồi nào nên được cung cấp cho các script chạy trong trình duyệt trong phản hồi cho một yêu cầu cross-origin.

Chỉ có {{Glossary("CORS-safelisted response header", "các tiêu đề phản hồi được CORS chấp nhận")}} được hiển thị theo mặc định. Để máy khách có thể truy cập các tiêu đề khác, máy chủ phải liệt kê chúng bằng tiêu đề `Access-Control-Expose-Headers`.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header", "Tiêu đề phản hồi")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Access-Control-Expose-Headers: [<header-name>[, <header-name>]*]
Access-Control-Expose-Headers: *
```

## Chỉ thị

- `<header-name>`
  - : Danh sách không hoặc nhiều tên [tiêu đề](/en-US/docs/Web/HTTP/Reference/Headers) được phân tách bằng dấu phẩy mà máy khách được phép truy cập từ phản hồi. Chúng _bổ sung_ cho {{Glossary("CORS-safelisted response header", "các tiêu đề phản hồi được CORS chấp nhận")}}.
- `*` (ký tự đại diện)
  - : Bất kỳ tiêu đề nào. Giá trị `*` chỉ tính là giá trị ký tự đại diện đặc biệt cho các yêu cầu không có thông tin xác thực (các yêu cầu không có [cookie HTTP](/en-US/docs/Web/HTTP/Guides/Cookies) hoặc thông tin xác thực HTTP). Trong các yêu cầu có thông tin xác thực, nó được coi là tên tiêu đề chữ `*`.

## Ví dụ

{{Glossary("CORS-safelisted response header", "Các tiêu đề phản hồi được CORS chấp nhận")}} là: {{HTTPHeader("Cache-Control")}}, {{HTTPHeader("Content-Language")}}, {{HTTPHeader("Content-Length")}}, {{HTTPHeader("Content-Type")}}, {{HTTPHeader("Expires")}}, {{HTTPHeader("Last-Modified")}}, {{HTTPHeader("Pragma")}}. Để hiển thị tiêu đề phản hồi không được CORS chấp nhận, bạn có thể chỉ định:

```http
Access-Control-Expose-Headers: Content-Encoding
```

Để thêm hiển thị tiêu đề tùy chỉnh, như `Kuma-Revision`, bạn có thể chỉ định nhiều tiêu đề được phân tách bằng dấu phẩy:

```http
Access-Control-Expose-Headers: Content-Encoding, Kuma-Revision
```

Đối với các yêu cầu không có thông tin xác thực, máy chủ cũng có thể phản hồi bằng giá trị ký tự đại diện:

```http
Access-Control-Expose-Headers: *
```

Máy chủ cũng có thể phản hồi bằng giá trị `*` cho các yêu cầu có thông tin xác thực, nhưng trong trường hợp này nó sẽ tham chiếu đến tiêu đề có tên `*`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Access-Control-Allow-Headers")}}
- {{HTTPHeader("Access-Control-Allow-Origin")}}
