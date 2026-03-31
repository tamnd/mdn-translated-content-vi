---
title: Host header
short-title: Host
slug: Web/HTTP/Reference/Headers/Host
page-type: http-header
browser-compat: http.headers.Host
sidebar: http
---

Tiêu đề HTTP **`Host`** {{Glossary("request header")}} chỉ định máy chủ và số cổng của máy chủ mà yêu cầu đang được gửi đến.

Nếu không có cổng nào được bao gồm, cổng mặc định cho dịch vụ được yêu cầu sẽ được ngầm định (ví dụ: `443` cho URL HTTPS và `80` cho URL HTTP).

Trường tiêu đề `Host` phải được gửi trong tất cả các thông điệp yêu cầu HTTP/1.1.
Mã trạng thái {{HTTPStatus("400", "400 Bad Request")}} có thể được gửi đến bất kỳ thông điệp yêu cầu HTTP/1.1 nào thiếu hoặc chứa nhiều hơn một trường tiêu đề `Host`.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Host: <host>:<port>
```

## Chỉ thị

- `<host>`
  - : Tên miền của máy chủ (cho virtual hosting).
- `<port>` {{optional_inline}}
  - : Số cổng TCP mà máy chủ đang lắng nghe.

## Ví dụ

```http
Host: developer.mozilla.org
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPStatus("400")}}
- {{HTMLElement("base")}}
