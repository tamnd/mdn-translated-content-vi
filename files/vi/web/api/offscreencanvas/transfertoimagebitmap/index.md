---
title: OffscreenCanvas.transferToImageBitmap()
slug: Web/API/OffscreenCanvas/transferToImageBitmap
page-type: web-api-instance-method
browser-compat: api.OffscreenCanvas.transferToImageBitmap
---

{{APIRef("Canvas API")}}

Phương thức **`transferToImageBitmap()`** của {{domxref("OffscreenCanvas")}} tạo một {{domxref("ImageBitmap")}} từ hình ảnh mới được kết xuất gần nhất.

## Cú pháp

```js-nolint
transferToImageBitmap()
```

### Giá trị trả về

Một đối tượng {{domxref("ImageBitmap")}}.

## Ví dụ

```js
const offscreen = new OffscreenCanvas(256, 256);
const bitmap = offscreen.transferToImageBitmap();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
