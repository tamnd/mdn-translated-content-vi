---
title: Allow header
short-title: Allow
slug: Web/HTTP/Reference/Headers/Allow
page-type: http-header
spec-urls: https://httpwg.org/specs/rfc9110.html#field.allow
sidebar: http
---

Tiêu đề HTTP **`Allow`** {{Glossary("response header", "phản hồi")}} liệt kê tập hợp các [phương thức yêu cầu](/en-US/docs/Web/HTTP/Reference/Methods) được hỗ trợ bởi một tài nguyên.
Tiêu đề này phải được gửi nếu máy chủ phản hồi với mã trạng thái {{HTTPStatus("405", "405 Method Not Allowed")}} để chỉ ra những phương thức yêu cầu nào có thể được sử dụng thay thế.
Giá trị `Allow` trống chỉ ra rằng tài nguyên không cho phép bất kỳ phương thức yêu cầu nào, điều này có thể xảy ra tạm thời cho một tài nguyên nhất định.

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
Allow: <http-methods>
```

## Chỉ thị

- `<http-methods>`
  - : Danh sách phân tách bằng dấu phẩy các phương thức yêu cầu được phép hỗ trợ bởi tài nguyên.

## Ví dụ

```http
Allow: GET, POST, HEAD
```

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Mã trạng thái {{HTTPStatus("405", "405 Method Not Allowed")}}
- {{HTTPHeader("Server")}}
- {{HTTPMethod("OPTIONS")}}
