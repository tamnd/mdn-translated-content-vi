---
title: OffscreenCanvas.convertToBlob()
slug: Web/API/OffscreenCanvas/convertToBlob
page-type: web-api-instance-method
browser-compat: api.OffscreenCanvas.convertToBlob
---

{{APIRef("Canvas API")}}

Phương thức **`convertToBlob()`** của {{domxref("OffscreenCanvas")}} tạo một {{domxref("Blob")}} biểu diễn hình ảnh chứa trong canvas.

## Cú pháp

```js-nolint
convertToBlob()
convertToBlob(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Các tùy chọn để mã hóa hình ảnh.

### Giá trị trả về

Một lời hứa (promise) sẽ được hoàn thành bằng một {{domxref("Blob")}}.

## Ví dụ

```js
const offscreen = new OffscreenCanvas(256, 256);
const blob = await offscreen.convertToBlob();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
