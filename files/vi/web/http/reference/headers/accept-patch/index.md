---
title: Accept-Patch header
short-title: Accept-Patch
slug: Web/HTTP/Reference/Headers/Accept-Patch
page-type: http-header
spec-urls: https://www.rfc-editor.org/rfc/rfc5789#section-3.1
sidebar: http
---

Tiêu đề HTTP **`Accept-Patch`** {{Glossary("response header", "phản hồi")}} quảng cáo những [kiểu phương tiện](/en-US/docs/Web/HTTP/Guides/MIME_types) nào mà máy chủ có thể hiểu trong yêu cầu {{HTTPMethod("PATCH")}}.
Ví dụ, một máy chủ nhận được yêu cầu `PATCH` với kiểu phương tiện không được hỗ trợ có thể phản hồi bằng {{HTTPStatus("415", "415 Unsupported Media Type")}} và một tiêu đề `Accept-Patch` tham chiếu đến một hoặc nhiều kiểu phương tiện được hỗ trợ.

Tiêu đề nên xuất hiện trong các yêu cầu {{HTTPMethod("OPTIONS")}} đến tài nguyên hỗ trợ phương thức `PATCH`.
Tiêu đề `Accept-Patch` trong phản hồi cho bất kỳ phương thức yêu cầu nào ngụ ý rằng `PATCH` được phép trên tài nguyên đích trong yêu cầu.

> [!NOTE]
> IANA duy trì [danh sách các mã hóa nội dung chính thức](https://www.iana.org/assignments/http-parameters/http-parameters.xhtml#content-coding).
> Các mã hóa `bzip` và `bzip2` không phải tiêu chuẩn nhưng có thể được sử dụng trong một số trường hợp, đặc biệt để hỗ trợ kế thừa.

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
Accept-Patch: <media-type>/<subtype>
Accept-Patch: <media-type>/*
Accept-Patch: */*

// Danh sách kiểu phương tiện phân tách bằng dấu phẩy
Accept-Patch: <media-type>/<subtype>, <media-type>/<subtype>
```

## Chỉ thị

- `<media-type>/<subtype>`
  - : Một [kiểu phương tiện](/en-US/docs/Web/HTTP/Guides/MIME_types) đơn, chính xác, như `text/html`.
- `<media-type>/*`
  - : Một kiểu phương tiện không có kiểu con. Ví dụ, `image/*` tương ứng với `image/png`, `image/svg`, `image/gif`, và các kiểu hình ảnh khác.
- `*/*`
  - : Bất kỳ kiểu phương tiện nào.

## Ví dụ

```http
Accept-Patch: application/json
Accept-Patch: application/json, text/plain
Accept-Patch: text/plain;charset=utf-8
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

Khả năng tương thích trình duyệt không liên quan đến tiêu đề này.
Máy chủ gửi tiêu đề, và thông số kỹ thuật không xác định hành vi máy khách.

## Xem thêm

- {{HTTPHeader("Accept-Post")}}
- {{HTTPStatus("415", "415 Unsupported Media Type")}}
- Phương thức yêu cầu {{HTTPMethod("PATCH")}}
