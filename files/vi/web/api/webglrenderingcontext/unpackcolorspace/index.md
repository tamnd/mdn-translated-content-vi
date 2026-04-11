---
title: "WebGLRenderingContext: unpackColorSpace property"
short-title: unpackColorSpace
slug: Web/API/WebGLRenderingContext/unpackColorSpace
page-type: web-api-instance-property
browser-compat: api.WebGLRenderingContext.unpackColorSpace
---

{{APIRef("WebGL")}}_TOK1__

Thuộc tính **`WebGLRenderingContext.unpackColorSpace`** chỉ định không gian màu cần chuyển đổi khi nhập họa tiết. Cùng với mặc định (`srgb`), không gian màu `display-p3` có thể được sử dụng.

Nguồn hình ảnh kết cấu có thể như sau:

- [`ImageBitmap`](/en-US/docs/Web/API/ImageBitmap)
- [`ImageData`](/en-US/docs/Web/API/ImageData)
- [`HTMLImageElement`](/en-US/docs/Web/API/HTMLImageElement)
- [`HTMLCanvasElement`](/en-US/docs/Web/API/HTMLCanvasElement)
- [`HTMLVideoElement`](/en-US/docs/Web/API/HTMLVideoElement)
- [`OffscreenCanvas`](/en-US/docs/Web/API/OffscreenCanvas)
- [`VideoFrame`](/en-US/docs/Web/API/VideoFrame)

Họa tiết được nhập bằng phương pháp [`WebGLRenderingContext.texImage2D()`](/en-US/docs/Web/API/WebGLRenderingContext/texImage2D) và [`WebGLRenderingContext.texSubImage2D()`](/en-US/docs/Web/API/WebGLRenderingContext/texSubImage2D) và quá trình chuyển đổi sang không gian màu `unpackColorSpace` được chỉ định sẽ diễn ra trong quá trình nhập.

Lưu ý rằng điều này không áp dụng cho [`HTMLImageElement`](/en-US/docs/Web/API/HTMLImageElement) khi thông số lưu trữ pixel `UNPACK_COLORSPACE_CONVERSION_WEBGL` được đặt thành `NONE`.

## Giá trị

Thuộc tính này có thể có các giá trị sau:

- `"srgb"` chọn [không gian màu sRGB](https://en.wikipedia.org/wiki/SRGB). Đây là giá trị mặc định.
- `"display-p3"` chọn [không gian màu display-p3](https://en.wikipedia.org/wiki/DCI-P3).

Nếu giá trị không hợp lệ được chỉ định thì giá trị `unpackColorSpace` sẽ không thay đổi.

## Ví dụ

### Chuyển đổi sRGB ImageData thành display-p3 theo kết cấu

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");

gl.drawingBufferColorSpace = "display-p3";
gl.unpackColorSpace = "display-p3";

// Some sRGB ImageData
// Will be converted from sRGB to Display P3
const imageData = new ImageData(data, 32, 32);

const tex = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, tex);
gl.texImage2D(
  gl.TEXTURE_2D,
  0,
  gl.RGBA,
  width,
  height,
  0,
  gl.RGBA,
  gl.UNSIGNED_BYTE,
  imageData,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [`WebGLRenderingContext.drawingBufferColorSpace`](/en-US/docs/Web/API/WebGLRenderingContext/drawingBufferColorSpace)
