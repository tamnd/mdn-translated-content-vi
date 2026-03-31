---
title: Sec-Fetch-User header
short-title: Sec-Fetch-User
slug: Web/HTTP/Reference/Headers/Sec-Fetch-User
page-type: http-header
browser-compat: http.headers.Sec-Fetch-User
sidebar: http
---

Tiêu đề HTTP **`Sec-Fetch-User`** {{Glossary("fetch metadata request header")}} được gửi cho các yêu cầu được khởi tạo bởi hoạt động kích hoạt của người dùng, và giá trị của nó luôn là `?1`.

Máy chủ có thể sử dụng tiêu đề này để xác định liệu yêu cầu điều hướng từ tài liệu, iframe, v.v., có được người dùng khởi tạo hay không.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Fetch Metadata Request Header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có (tiền tố <code>Sec-</code>)</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted request header")}}
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Sec-Fetch-User: ?1
```

## Chỉ thị

Giá trị sẽ luôn là `?1`. Khi yêu cầu được kích hoạt bởi thứ gì đó khác với hoạt động kích hoạt của người dùng, đặc tả yêu cầu trình duyệt bỏ qua hoàn toàn tiêu đề.

## Ví dụ

### Sử dụng Sec-Fetch-User

Nếu người dùng nhấp vào liên kết trang đến một trang khác trên cùng nguồn gốc, yêu cầu kết quả sẽ có các tiêu đề sau:

```http
Sec-Fetch-Dest: document
Sec-Fetch-Mode: navigate
Sec-Fetch-Site: same-origin
Sec-Fetch-User: ?1
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Sec-Fetch-Dest")}}, {{HTTPHeader("Sec-Fetch-Mode")}}, {{HTTPHeader("Sec-Fetch-Site")}} fetch metadata request headers
- [Protect your resources from web attacks with Fetch Metadata](https://web.dev/articles/fetch-metadata) (web.dev)
- [Fetch Metadata Request Headers playground](https://secmetadata.appspot.com/) (secmetadata.appspot.com)
