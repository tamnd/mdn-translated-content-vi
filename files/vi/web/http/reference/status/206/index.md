---
title: 206 Partial Content
slug: Web/HTTP/Reference/Status/206
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.206
sidebar: http
---

Mã trạng thái [phản hồi thành công](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) HTTP **`206 Partial Content`** được gửi để phản hồi một [yêu cầu phạm vi (range request)](/en-US/docs/Web/HTTP/Guides/Range_requests).
Thân phản hồi chứa các phạm vi dữ liệu được yêu cầu như được chỉ định trong tiêu đề {{HTTPHeader("Range")}} của yêu cầu.

Định dạng của phản hồi phụ thuộc vào số lượng phạm vi được yêu cầu.
Nếu một phạm vi duy nhất được yêu cầu, {{HTTPHeader("Content-Type")}} của toàn bộ phản hồi được đặt thành loại của tài liệu, và {{HTTPHeader("Content-Range")}} được cung cấp.
Nếu một số phạm vi được yêu cầu, {{HTTPHeader("Content-Type")}} được đặt thành `multipart/byteranges`, và mỗi đoạn bao gồm một phạm vi, với các tiêu đề {{HTTPHeader("Content-Range")}} và {{HTTPHeader("Content-Type")}} riêng mô tả nó.

## Trạng thái

```http
206 Partial Content
```

## Ví dụ

### Nhận phản hồi `206` cho một phạm vi được yêu cầu

Sau đây là ví dụ phản hồi `206` khi yêu cầu một phạm vi duy nhất là `21010-` (byte 21010 đến cuối tệp) của một tệp hình ảnh.
Phản hồi chứa {{HTTPHeader("Content-Type")}} là `image/gif` và {{HTTPHeader("Content-Range")}} được cung cấp:

```http
GET /z4d4kWk.gif HTTP/1.1
Host: images.example.com
Range: bytes=21010-
```

```http
HTTP/1.1 206 Partial Content
Date: Wed, 15 Nov 2015 06:25:24 GMT
Last-Modified: Wed, 15 Nov 2015 04:58:08 GMT
Content-Range: bytes 21010-47021/47022
Content-Length: 26012
Content-Type: image/gif
ETag: "abc123"
Accept-Ranges: bytes

# 26012 byte dữ liệu hình ảnh một phần…
```

### Nhận phản hồi `206` cho nhiều phạm vi được yêu cầu

Sau đây là ví dụ phản hồi `206` khi yêu cầu hai phạm vi của tệp PDF.
Phản hồi chứa {{HTTPHeader("Content-Type")}} `multipart/byteranges` với {{HTTPHeader("Content-Type")}} riêng (`application/pdf`) và {{HTTPHeader("Content-Range")}} cho mỗi phạm vi.

```http
GET /price-list.pdf HTTP/1.1
Host: example.com
Range: bytes=234-639,4590-7999
```

```http
HTTP/1.1 206 Partial Content
Date: Wed, 15 Nov 2015 06:25:24 GMT
Last-Modified: Wed, 15 Nov 2015 04:58:08 GMT
Content-Length: 1741
Content-Type: multipart/byteranges; boundary=String_separator
ETag: "abc123"
Accept-Ranges: bytes

--String_separator
Content-Type: application/pdf
Content-Range: bytes 234-639/8000

# nội dung của phạm vi đầu tiên (406 byte)
--String_separator
Content-Type: application/pdf
Content-Range: bytes 4590-7999/8000

# nội dung của phạm vi thứ hai (3410 byte)
--String_separator--
```

## Đặc tả

{{Specifications}}

## Xem thêm

- {{HTTPHeader("If-Range")}}
- {{HTTPHeader("Range")}}
- {{HTTPHeader("Content-Range")}}
- {{HTTPHeader("Content-Type")}}
- [Phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
