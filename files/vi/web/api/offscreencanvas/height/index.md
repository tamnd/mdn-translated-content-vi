---
title: OffscreenCanvas.height
slug: Web/API/OffscreenCanvas/height
page-type: web-api-instance-property
browser-compat: api.OffscreenCanvas.height
---

{{APIRef("Canvas API")}}

Thuộc tính **`height`** của giao diện {{domxref("OffscreenCanvas")}} trả về và đặt chiều cao của canvas ngoài màn hình.

## Giá trị

Một số nguyên không âm biểu thị chiều cao tính bằng đơn vị CSS pixel.

## Ví dụ

```js
const offscreen = new OffscreenCanvas(256, 256);
console.log(offscreen.height); // 256
offscreen.height = 128;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
