---
title: Access-Control-Request-Headers header
short-title: Access-Control-Request-Headers
slug: Web/HTTP/Reference/Headers/Access-Control-Request-Headers
page-type: http-header
browser-compat: http.headers.Access-Control-Request-Headers
sidebar: http
---

Tiêu đề HTTP **`Access-Control-Request-Headers`** {{Glossary("request header", "yêu cầu")}} được trình duyệt sử dụng khi phát ra {{glossary("preflight request", "yêu cầu preflight")}} để cho máy chủ biết những [tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers) nào máy khách có thể gửi khi yêu cầu thực tế được thực hiện (chẳng hạn như với {{domxref("Window/fetch", "fetch()")}} hoặc {{domxref("XMLHttpRequest.setRequestHeader()")}}). Tiêu đề phía máy chủ bổ sung của {{HTTPHeader("Access-Control-Allow-Headers")}} sẽ trả lời tiêu đề phía trình duyệt này.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header", "Tiêu đề yêu cầu")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Access-Control-Request-Headers: <header-name>,<header-name>,…
```

## Chỉ thị

- `<header-name>`
  - : Danh sách được sắp xếp, duy nhất, phân tách bằng dấu phẩy, chữ thường [tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers) được bao gồm trong yêu cầu.

## Ví dụ

```http
Access-Control-Request-Headers: content-type,x-pingother
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Access-Control-Request-Method")}}
