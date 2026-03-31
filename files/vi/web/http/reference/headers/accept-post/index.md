---
title: Accept-Post header
short-title: Accept-Post
slug: Web/HTTP/Reference/Headers/Accept-Post
page-type: http-header
spec-urls: https://www.w3.org/TR/ldp/#header-accept-post
sidebar: http
---

Tiêu đề HTTP **`Accept-Post`** {{Glossary("response header", "phản hồi")}} quảng cáo những [kiểu phương tiện](/en-US/docs/Web/HTTP/Guides/MIME_types) nào được máy chủ chấp nhận trong yêu cầu {{HTTPMethod("POST")}}.
Ví dụ, một máy chủ nhận được yêu cầu `POST` với kiểu phương tiện không được hỗ trợ có thể phản hồi bằng {{HTTPStatus("415", "415 Unsupported Media Type")}} và một tiêu đề `Accept-Post` tham chiếu đến một hoặc nhiều kiểu phương tiện được hỗ trợ.

Tiêu đề nên xuất hiện trong các yêu cầu {{HTTPMethod("OPTIONS")}} đến tài nguyên hỗ trợ phương thức `POST`.
Tiêu đề `Accept-Post` trong phản hồi cho bất kỳ phương thức yêu cầu nào ngụ ý rằng `POST` được phép trên tài nguyên đích trong yêu cầu.

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
Accept-Post: <media-type>/<subtype>
Accept-Post: <media-type>/*
Accept-Post: */*

// Danh sách kiểu phương tiện phân tách bằng dấu phẩy
Accept-Post: <media-type>/<subtype>, <media-type>/<subtype>
```

> [!NOTE]
> Tiêu đề `Accept-Post` chỉ định phạm vi phương tiện theo cách tương tự như {{HTTPHeader("Accept")}}, ngoại trừ không có khái niệm về ưu tiên qua đối số `q` ({{Glossary("quality values")}}).
> Điều này là vì `Accept-Post` là tiêu đề phản hồi trong khi `Accept` là tiêu đề yêu cầu.

## Chỉ thị

- `<media-type>/<subtype>`
  - : Một [kiểu phương tiện](/en-US/docs/Web/HTTP/Guides/MIME_types) đơn, chính xác, như `text/html`.
- `<media-type>/*`
  - : Một kiểu phương tiện không có kiểu con. Ví dụ, `image/*` tương ứng với `image/png`, `image/svg`, `image/gif`, và các kiểu hình ảnh khác.
- `*/*`
  - : Bất kỳ kiểu phương tiện nào.

## Ví dụ

```http
Accept-Post: application/json, text/plain
Accept-Post: image/webp
Accept-Post: */*
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

Khả năng tương thích trình duyệt không liên quan đến tiêu đề này.
Tiêu đề được gửi bởi máy chủ và thông số kỹ thuật không xác định hành vi máy khách.

## Xem thêm

- {{HTTPHeader("Accept-Patch")}}
- Phương thức yêu cầu {{HTTPMethod("POST")}}
