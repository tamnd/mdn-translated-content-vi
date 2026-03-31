---
title: Access-Control-Request-Method header
short-title: Access-Control-Request-Method
slug: Web/HTTP/Reference/Headers/Access-Control-Request-Method
page-type: http-header
browser-compat: http.headers.Access-Control-Request-Method
sidebar: http
---

Tiêu đề HTTP **`Access-Control-Request-Method`** {{Glossary("request header", "yêu cầu")}} được trình duyệt sử dụng khi phát ra {{glossary("preflight request", "yêu cầu preflight")}} để cho máy chủ biết [phương thức HTTP](/en-US/docs/Web/HTTP/Reference/Methods) nào sẽ được sử dụng khi yêu cầu thực tế được thực hiện.
Tiêu đề này là cần thiết vì yêu cầu preflight luôn là {{HTTPMethod("OPTIONS")}} và không sử dụng cùng phương thức như yêu cầu thực tế.

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
Access-Control-Request-Method: <method>
```

## Chỉ thị

- `<method>`
  - : Một [phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods); ví dụ, {{HTTPMethod("GET")}}, {{HTTPMethod("POST")}}, hoặc {{HTTPMethod("DELETE")}}.

## Ví dụ

```http
Access-Control-Request-Method: POST
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Access-Control-Request-Headers")}}
