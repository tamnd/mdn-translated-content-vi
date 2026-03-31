---
title: Content-Length header
short-title: Content-Length
slug: Web/HTTP/Reference/Headers/Content-Length
page-type: http-header
browser-compat: http.headers.Content-Length
sidebar: http
---

Tiêu đề HTTP **`Content-Length`** chỉ ra kích thước, tính bằng byte, của thân thông điệp được gửi đến người nhận.

`Content-Length` bị giới hạn ở chỗ kích thước thông điệp phải được biết trước khi gửi các tiêu đề, đây là vấn đề khi nội dung được tạo động hoặc phát trực tuyến.

- Trong HTTP/1.0, nó là bắt buộc.
- Trong HTTP/1.1, nó có thể được thay thế bằng {{httpheader("Transfer-Encoding", "Transfer-Encoding: chunked")}} cho các phản hồi được gửi theo từng phần vì kích thước của nó được tính toán.
- Trong HTTP/2, `Content-Length` là dư thừa, vì độ dài nội dung có thể được suy ra từ các khung DATA. Nó vẫn có thể được bao gồm để tương thích ngược.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header", "Tiêu đề yêu cầu")}},
        {{Glossary("Response header", "Tiêu đề phản hồi")}},
        {{Glossary("Content header", "Tiêu đề nội dung")}}
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Có</td>
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
Content-Length: <length>
```

## Chỉ thị

- `<length>`
  - : Độ dài tính bằng octet.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Transfer-Encoding")}}
