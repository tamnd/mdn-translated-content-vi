---
title: "WebGLRenderingContext: drawingBufferColorSpace property"
short-title: drawingBufferColorSpace
slug: Web/API/WebGLRenderingContext/drawingBufferColorSpace
page-type: web-api-instance-property
browser-compat: api.WebGLRenderingContext.drawingBufferColorSpace
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Thuộc tính **`WebGLRenderingContext.drawingBufferColorSpace`** chỉ định không gian màu của vùng đệm vẽ WebGL. Cùng với mặc định (`srgb`), không gian màu `display-p3` có ​​thể được sử dụng.

Xem [`WebGLRenderingContext.unpackColorSpace`](/en-US/docs/Web/API/WebGLRenderingContext/unpackColorSpace) để xác định không gian màu cho họa tiết.

## Giá trị

Thuộc tính này có thể có các giá trị sau:

- `"srgb"` chọn [không gian màu sRGB](https://en.wikipedia.org/wiki/SRGB). Đây là giá trị mặc định.
- `"display-p3"` chọn [không gian màu display-p3](https://en.wikipedia.org/wiki/DCI-P3).

Nếu một giá trị không hợp lệ được chỉ định thì giá trị của `drawingBufferColorSpace` sẽ không thay đổi.

## Ví dụ

### Đặt không gian màu đệm vẽ để vẽ Màn hình P3 màu đỏ

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
gl.drawingBufferColorSpace = "display-p3";
gl.clearColor(1, 0, 0, 1);
gl.clear(gl.COLOR_BUFFER_BIT);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [`WebGLRenderingContext.unpackColorSpace`](/en-US/docs/Web/API/WebGLRenderingContext/unpackColorSpace)
