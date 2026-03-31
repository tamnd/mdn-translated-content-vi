---
title: NEL header
short-title: NEL
slug: Web/HTTP/Reference/Headers/NEL
page-type: http-header
status:
  - experimental
browser-compat: http.headers.NEL
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`NEL`** {{Glossary("response header")}} được sử dụng để cấu hình ghi nhật ký yêu cầu mạng.

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
NEL: { "report_to": "name_of_reporting_group", "max_age": 12345, "include_subdomains": false, "success_fraction": 0.0, "failure_fraction": 1.0 }
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Giải thích về Network Error Logging (NEL)](/en-US/docs/Web/HTTP/Guides/Network_Error_Logging)
