---
title: X-Powered-By header
short-title: X-Powered-By
slug: Web/HTTP/Reference/Headers/X-Powered-By
page-type: http-header
status:
  - non-standard
sidebar: http
---

Tiêu đề HTTP **`X-Powered-By`** {{Glossary("response header")}} là tiêu đề không chuẩn để xác định ứng dụng hoặc framework đã tạo phản hồi.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden response header name")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
X-Powered-By: <application>
```

## Chỉ thị

- `<application>`
  - : Chuỗi mô tả ứng dụng hoặc framework máy chủ.

## Ví dụ

### Tiêu đề X-Powered-By của Express

Ứng dụng Express thường bao gồm tiêu đề `X-Powered-By` trong phản hồi với chuỗi `express` làm giá trị trường:

```http
X-Powered-By: express
```

## Đặc tả

Không phải là một phần của bất kỳ đặc tả hiện tại nào.

## Xem thêm

- Tiêu đề {{HTTPHeader("X-Forwarded-Host")}}, {{HTTPHeader("X-Forwarded-For")}}, {{HTTPHeader("X-Forwarded-Proto")}}
- {{HTTPHeader("Via")}}
- {{HTTPHeader("Forwarded")}}
