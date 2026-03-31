---
title: Pragma header
short-title: Pragma
slug: Web/HTTP/Reference/Headers/Pragma
page-type: http-header
status:
  - deprecated
browser-compat: http.headers.Pragma
sidebar: http
---

{{Deprecated_Header}}

Tiêu đề HTTP **`Pragma`** là tiêu đề dành riêng cho triển khai có thể có các hiệu lực khác nhau dọc theo chuỗi yêu cầu-phản hồi.
Tiêu đề này phục vụ cho khả năng tương thích ngược với các bộ nhớ đệm HTTP/1.0 không hỗ trợ tiêu đề HTTP/1.1 {{HTTPHeader("Cache-Control")}}.

> [!NOTE]
> Tiêu đề `Pragma` không được chỉ định cho các phản hồi HTTP và do đó không phải là phần thay thế đáng tin cậy cho tiêu đề `Cache-Control` HTTP/1.1, mặc dù hành vi của nó giống như `Cache-Control: no-cache` nếu trường tiêu đề `Cache-Control` bị bỏ qua trong yêu cầu.
> Chỉ sử dụng `Pragma` để tương thích ngược với các máy khách HTTP/1.0.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}},
        {{Glossary("Response header")}} (hành vi phản hồi không được chỉ định và dành riêng cho triển khai).
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted response header")}}
      </th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Pragma: no-cache
```

## Chỉ thị

- `no-cache`
  - : Giống như `Cache-Control: no-cache`. Buộc các bộ nhớ đệm gửi yêu cầu đến máy chủ gốc để xác thực trước khi phát hành bản sao đã cache.

## Ví dụ

```http
Pragma: no-cache
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Cache-Control")}}
- {{HTTPHeader("Expires")}}
