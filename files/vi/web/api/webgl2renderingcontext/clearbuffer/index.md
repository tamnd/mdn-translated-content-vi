---
title: "WebGL2RenderingContext: phương thức clearBuffer[fiuv]()"
short-title: clearBuffer[fiuv]()
slug: Web/API/WebGL2RenderingContext/clearBuffer
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.clearBufferiv
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Các phương thức **`WebGL2RenderingContext.clearBuffer[fiuv]()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) xóa các bộ đệm từ framebuffer hiện đang được liên kết.

## Cú pháp

```js-nolint
clearBufferfv(buffer, drawbuffer, values)
clearBufferfv(buffer, drawbuffer, values, srcOffset)

clearBufferiv(buffer, drawbuffer, values)
clearBufferiv(buffer, drawbuffer, values, srcOffset)

clearBufferuiv(buffer, drawbuffer, values)
clearBufferuiv(buffer, drawbuffer, values, srcOffset)

clearBufferfi(buffer, drawbuffer, depth, stencil)
```

### Tham số

- `buffer`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định bộ đệm sẽ xóa. Các giá trị có thể:
    - `gl.COLOR`: Bộ đệm màu.
    - `gl.DEPTH`: Bộ đệm depth.
    - `gl.STENCIL`: Bộ đệm stencil.
    - `gl.DEPTH_STENCIL`: xóa các bộ đệm depth và stencil (được sử dụng với `clearBufferfi`).

- `drawBuffer`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định bộ đệm vẽ sẽ xóa.
- `values`
  - : Một {{jsxref("Array")}} các giá trị {{domxref("WebGL_API/Types", "GLint")}}, {{domxref("WebGL_API/Types", "GLuint")}} hoặc {{domxref("WebGL_API/Types", "GLfloat")}} hoặc một {{jsxref("Int32Array")}}, {{jsxref("Uint32Array")}} hoặc {{jsxref("Float32Array")}} chỉ định các giá trị sẽ xóa.
- `depth`
  - : Một {{domxref("WebGL_API/Types", "GLfloat")}} chỉ định giá trị để xóa bộ đệm kết xuất depth.
- `stencil`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định giá trị để xóa bộ đệm kết xuất stencil.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.clearBufferiv(gl.COLOR, 0, new Int32Array([r, g, b, a]));
gl.clearBufferuiv(gl.COLOR, 0, new Uint32Array([r, g, b, a]));
gl.clearBufferfv(gl.COLOR, 0, new Float32Array([r, g, b, a]));
gl.clearBufferfv(gl.COLOR, 0, [0.0, 0.0, 0.0, 0.0]);
gl.clearBufferfi(gl.DEPTH_STENCIL, 0, 1.0, 0);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.drawBuffers()")}}