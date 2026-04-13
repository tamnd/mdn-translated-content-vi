---
title: "WebGL2RenderingContext: thuộc tính drawingBufferColorSpace"
short-title: drawingBufferColorSpace
slug: Web/API/WebGL2RenderingContext/drawingBufferColorSpace
page-type: web-api-instance-property
browser-compat: api.WebGL2RenderingContext.drawingBufferColorSpace
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Thuộc tính **`WebGL2RenderingContext.drawingBufferColorSpace`** chỉ định không gian màu của bộ đệm vẽ WebGL. Cùng với giá trị mặc định (`srgb`), có thể sử dụng không gian màu `display-p3`.

Xem [`WebGL2RenderingContext.unpackColorSpace`](/en-US/docs/Web/API/WebGL2RenderingContext/unpackColorSpace) để chỉ định không gian màu cho texture.

## Giá trị

Thuộc tính này có thể có các giá trị sau:

- `"srgb"` chọn [không gian màu sRGB](https://en.wikipedia.org/wiki/SRGB). Đây là giá trị mặc định.
- `"display-p3"` chọn [không gian màu display-p3](https://en.wikipedia.org/wiki/DCI-P3).

Nếu một giá trị không hợp lệ được chỉ định, thì giá trị của `drawingBufferColorSpace` sẽ không thay đổi.

## Ví dụ

### Đặt không gian màu bộ đệm vẽ để vẽ màu Display P3 đỏ

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
gl.drawingBufferColorSpace = "display-p3";
gl.clearColor(1, 0, 0, 1);
gl.clear(gl.COLOR_BUFFER_BIT);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`WebGL2RenderingContext.unpackColorSpace`](/en-US/docs/Web/API/WebGLRenderingContext/unpackColorSpace)