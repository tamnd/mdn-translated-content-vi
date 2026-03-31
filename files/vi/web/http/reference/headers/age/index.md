---
title: Age header
short-title: Age
slug: Web/HTTP/Reference/Headers/Age
page-type: http-header
browser-compat: http.headers.Age
sidebar: http
---

Tiêu đề HTTP **`Age`** {{Glossary("response header", "phản hồi")}} chỉ ra thời gian tính bằng giây mà một đối tượng đã nằm trong bộ nhớ đệm proxy.

Giá trị tiêu đề thường gần bằng không.
Nếu giá trị là `0`, đối tượng có thể đã được tải từ máy chủ gốc; nếu không, giá trị thường được tính là hiệu giữa ngày hiện tại của proxy và tiêu đề chung {{HTTPHeader("Date")}} được bao gồm trong phản hồi HTTP.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header", "Tiêu đề phản hồi")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Age: <delta-seconds>
```

## Chỉ thị

- `<delta-seconds>`
  - : Một số nguyên không âm đại diện cho thời gian tính bằng giây mà đối tượng đã nằm trong bộ nhớ đệm proxy.

## Ví dụ

```http
Age: 24
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Cache-Control")}}
- {{HTTPHeader("Expires")}}
