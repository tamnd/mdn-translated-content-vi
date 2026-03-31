---
title: X-Forwarded-Host header
short-title: X-Forwarded-Host
slug: Web/HTTP/Reference/Headers/X-Forwarded-Host
page-type: http-header
status:
  - non-standard
sidebar: http
---

Tiêu đề HTTP **`X-Forwarded-Host`** (XFH) {{Glossary("request header")}} là tiêu đề de-facto chuẩn để xác định máy chủ gốc được yêu cầu bởi máy khách trong tiêu đề yêu cầu HTTP {{HTTPHeader("Host")}}.

Tên máy chủ và cổng của các proxy ngược (load balancer, CDN) có thể khác với máy chủ gốc xử lý yêu cầu, trong trường hợp đó tiêu đề `X-Forwarded-Host` hữu ích để xác định `Host` nào ban đầu được sử dụng.

Phiên bản chuẩn hóa của tiêu đề này là tiêu đề HTTP {{HTTPHeader("Forwarded")}}, mặc dù nó ít được sử dụng hơn nhiều.

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
X-Forwarded-Host: <host>
```

## Chỉ thị

- `<host>`
  - : Tên miền của máy chủ được chuyển tiếp.

## Ví dụ

```http
X-Forwarded-Host: id42.example-cdn.com
```

## Đặc tả

Không phải là một phần của bất kỳ đặc tả hiện tại nào.

## Xem thêm

- Tiêu đề {{HTTPHeader("X-Forwarded-For")}}, {{HTTPHeader("X-Forwarded-Proto")}}
- {{HTTPHeader("Host")}}
- {{HTTPHeader("Forwarded")}}
