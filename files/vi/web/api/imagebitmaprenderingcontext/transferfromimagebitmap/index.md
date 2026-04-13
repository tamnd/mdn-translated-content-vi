---
title: "ImageBitmapRenderingContext: transferFromImageBitmap() method"
short-title: transferFromImageBitmap()
slug: Web/API/ImageBitmapRenderingContext/transferFromImageBitmap
page-type: web-api-instance-method
browser-compat: api.ImageBitmapRenderingContext.transferFromImageBitmap
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Phương thức **`ImageBitmapRenderingContext.transferFromImageBitmap()`** hiển thị {{domxref("ImageBitmap")}} đã cho trong canvas liên kết với ngữ cảnh kết xuất này. Quyền sở hữu `ImageBitmap` cũng được chuyển cho canvas.

Phương thức này trước đây có tên là `transferImageBitmap()`, nhưng đã được đổi tên trong một thay đổi thông số kỹ thuật. Tên cũ được giữ lại như một bí danh để tránh phá vỡ code.

## Cú pháp

```js-nolint
transferFromImageBitmap(bitmap)
```

### Tham số

- `bitmap`
  - : Một đối tượng {{domxref("ImageBitmap")}} để chuyển, hoặc `null`. Nếu giá trị là `null`, canvas được đặt lại thành trống.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### HTML

```html
<canvas id="htmlCanvas"></canvas>
```

### JavaScript

```js
const htmlCanvas = document
  .getElementById("htmlCanvas")
  .getContext("bitmaprenderer");

// Draw a WebGL scene offscreen
const offscreen = new OffscreenCanvas(256, 256);
const gl = offscreen.getContext("webgl");

// Perform some drawing using the gl context

// Transfer the current frame to the visible canvas
const bitmap = offscreen.transferToImageBitmap();
htmlCanvas.transferFromImageBitmap(bitmap);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện định nghĩa phương thức này, {{domxref("ImageBitmapRenderingContext")}}
- {{domxref("OffscreenCanvas")}}
- {{domxref("OffscreenCanvas.transferToImageBitmap()")}}
