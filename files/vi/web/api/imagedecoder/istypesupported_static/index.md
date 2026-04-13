---
title: "ImageDecoder: phương thức tĩnh isTypeSupported()"
short-title: isTypeSupported()
slug: Web/API/ImageDecoder/isTypeSupported_static
page-type: web-api-static-method
browser-compat: api.ImageDecoder.isTypeSupported_static
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức tĩnh **`ImageDecoder.isTypeSupported()`** kiểm tra xem [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) đã cho có thể được tác nhân người dùng giải mã không.

## Cú pháp

```js-nolint
ImageDecoder.isTypeSupported(type)
```

### Tham số

- `type`
  - : Một chuỗi chứa [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) cần kiểm tra hỗ trợ giải mã.

### Giá trị trả về

Một {{jsxref("promise")}} được giải quyết với một giá trị boolean cho biết liệu các hình ảnh có định dạng `type` có thể được giải mã bởi API không.

## Ví dụ

Ví dụ sau đây kiểm tra xem hình ảnh GIF và PCX có được hỗ trợ để giải mã không và in kết quả ra console.

```js
let isGifSupported = await ImageDecoder.isTypeSupported("image/gif");
console.log(`GIF supported: ${isGifSupported}`); // Likely true.

let isPcxSupported = await ImageDecoder.isTypeSupported("image/pcx");
console.log(`PCX supported: ${isPcxSupported}`); // Probably false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
