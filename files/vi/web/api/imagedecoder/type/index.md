---
title: "ImageDecoder: thuộc tính type"
short-title: type
slug: Web/API/ImageDecoder/type
page-type: web-api-instance-property
browser-compat: api.ImageDecoder.type
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("ImageDecoder")}} phản ánh [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) được cấu hình trong quá trình khởi tạo.

## Giá trị

Một chuỗi chứa [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) đã được cấu hình.

## Ví dụ

Ví dụ sau đây in giá trị của `type` ra console.

```js
console.log(imageDecoder.type);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
