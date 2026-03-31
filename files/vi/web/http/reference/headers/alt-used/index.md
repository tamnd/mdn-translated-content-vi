---
title: Alt-Used header
short-title: Alt-Used
slug: Web/HTTP/Reference/Headers/Alt-Used
page-type: http-header
spec-urls: https://datatracker.ietf.org/doc/html/rfc7838
sidebar: http
---

Tiêu đề HTTP **`Alt-Used`** {{Glossary("request header", "yêu cầu")}} được sử dụng để xác định dịch vụ thay thế đang được sử dụng, giống như trường tiêu đề HTTP {{HTTPHeader("Host")}} xác định máy chủ và cổng của nguồn gốc.

Tiêu đề này nhằm mục đích cho phép các dịch vụ thay thế phát hiện vòng lặp, phân biệt lưu lượng cho mục đích cân bằng tải, và nói chung đảm bảo rằng có thể xác định đích đến dự kiến của lưu lượng, vì việc giới thiệu thông tin này sau khi giao thức đang được sử dụng đã được chứng minh là có vấn đề.

Khi máy khách sử dụng dịch vụ thay thế cho yêu cầu, nó có thể chỉ ra điều này cho máy chủ bằng cách sử dụng tiêu đề HTTP `Alt-Used`.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header", "Tiêu đề yêu cầu")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Alt-Used: <host>:<port>
```

## Chỉ thị

- `<host>`
  - : Tên miền của máy chủ.
- `<port>` {{optional_inline}}
  - : Số cổng TCP mà máy chủ đang lắng nghe.

## Ví dụ

```http
Alt-Used: alternate.example.net
```

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- {{HTTPHeader("Alt-Svc")}}
- {{HTTPHeader("Host")}}
