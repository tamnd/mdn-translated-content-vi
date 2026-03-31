---
title: Upgrade-Insecure-Requests header
short-title: Upgrade-Insecure-Requests
slug: Web/HTTP/Reference/Headers/Upgrade-Insecure-Requests
page-type: http-header
browser-compat: http.headers.Upgrade-Insecure-Requests
sidebar: http
---

Tiêu đề HTTP **`Upgrade-Insecure-Requests`** {{Glossary("request header")}} gửi tín hiệu đến máy chủ cho biết sở thích của máy khách về phản hồi được mã hóa và xác thực, và rằng máy khách có thể xử lý thành công chỉ thị {{CSP("upgrade-insecure-requests")}} [CSP](/en-US/docs/Web/HTTP/Guides/CSP).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Upgrade-Insecure-Requests: <boolean>
```

## Chỉ thị

- `<boolean>`
  - : `1` cho biết 'đúng' và là giá trị hợp lệ duy nhất cho trường này.

## Ví dụ

### Sử dụng Upgrade-Insecure-Requests

Yêu cầu của máy khách báo hiệu cho máy chủ rằng nó hỗ trợ các cơ chế nâng cấp của {{CSP("upgrade-insecure-requests")}}:

```http
GET / HTTP/1.1
Host: example.com
Upgrade-Insecure-Requests: 1
```

Máy chủ có thể chuyển hướng đến phiên bản an toàn của trang web. Tiêu đề {{HTTPHeader("Vary")}} có thể được sử dụng để trang web không được phục vụ bởi bộ đệm cho các máy khách không hỗ trợ cơ chế nâng cấp.

```http
Location: https://example.com/
Vary: Upgrade-Insecure-Requests
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- Chỉ thị CSP {{CSP("upgrade-insecure-requests")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và tiêu đề {{HTTPHeader("Vary")}}
