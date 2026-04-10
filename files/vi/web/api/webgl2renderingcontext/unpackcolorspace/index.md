---
title: "WebGL2RenderingContext: thuộc tính unpackColorSpace"
short-title: unpackColorSpace
slug: Web/API/WebGL2RenderingContext/unpackColorSpace
page-type: web-api-instance-property
browser-compat: api.WebGL2RenderingContext.unpackColorSpace
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Thuộc tính **`WebGL2RenderingContext.unpackColorSpace`** chỉ định không gian màu để chuyển đổi khi nhập texture. Cùng với giá trị mặc định (`srgb`), có thể sử dụng không gian màu `display-p3`.

Các nguồn hình ảnh texture có thể là:

- [`ImageBitmap`](/en-US/docs/Web/API/ImageBitmap)
- [`ImageData`](/en-US/docs/Web/API/ImageData)
- [`HTMLImageElement`](/en-US/docs/Web/API/HTMLImageElement)
- [`HTMLCanvasElement`](/en-US/docs/Web/API/HTMLCanvasElement)
- [`HTMLVideoElement`](/en-US/docs/Web/API/HTMLVideoElement)
- [`OffscreenCanvas`](/en-US/docs/Web/API/OffscreenCanvas)
- [`VideoFrame`](/en-US/docs/Web/API/VideoFrame)

Texture được nhập bằng các phương thức [`WebGLRenderingContext.texImage2D()`](/en-US/docs/Web/API/WebGLRenderingContext/texImage2D) và [`WebGLRenderingContext.texSubImage2D()`](/en-US/docs/Web/API/WebGLRenderingContext/texSubImage2D) và việc chuyển đổi sang không gian màu `unpackColorSpace` đã chỉ định xảy ra trong quá trình nhập.

Lưu ý rằng điều này không áp dụng cho [`HTMLImageElement`](/en-US/docs/Web/API/HTMLImageElement) khi tham số lưu trữ pixel `UNPACK_COLORSPACE_CONVERSION_WEBGL` được đặt thành `NONE`.

## Giá trị

Thuộc tính này có thể có các giá trị sau:

- `"srgb"` chọn [không gian màu sRGB](https://en.wikipedia.org/wiki/SRGB). Đây là giá trị mặc định.
- `"display-p3"` chọn [không gian màu display-p3](https://en.wikipedia.org/wiki/DCI-P3).

Nếu một giá trị không hợp lệ được chỉ định, thì giá trị của `unpackColorSpace` sẽ không thay đổi.

## Ví dụ

### Chuyển đổi ImageData sRGB sang display-p3 trong texture

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");

gl.drawingBufferColorSpace = "display-p3";
gl.unpackColorSpace = "display-p3";

// Một số ImageData sRGB
// Sẽ được chuyển đổi từ sRGB sang Display P3
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

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`WebGL2RenderingContext.drawingBufferColorSpace`](/en-US/docs/Web/API/WebGL2RenderingContext/drawingBufferColorSpace)