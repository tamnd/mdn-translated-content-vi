---
title: OffscreenCanvas.width
slug: Web/API/OffscreenCanvas/width
page-type: web-api-instance-property
browser-compat: api.OffscreenCanvas.width
---

{{APIRef("Canvas API")}}

Thuộc tính **`width`** của giao diện {{domxref("OffscreenCanvas")}} trả về và đặt chiều rộng của canvas ngoài màn hình.

## Giá trị

Một số nguyên không âm biểu thị chiều rộng tính bằng đơn vị CSS pixel.

## Ví dụ

```js
const offscreen = new OffscreenCanvas(256, 256);
console.log(offscreen.width); // 256
offscreen.width = 128;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
