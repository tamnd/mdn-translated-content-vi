---
title: "OES_draw_buffers_indexed: blendEquationSeparateiOES() method"
short-title: blendEquationSeparateiOES()
slug: Web/API/OES_draw_buffers_indexed/blendEquationSeparateiOES
page-type: web-api-instance-method
browser-compat: api.OES_draw_buffers_indexed.blendEquationSeparateiOES
---

{{APIRef("WebGL")}}

Phương thức `blendEquationSeparateiOES()` của phần mở rộng WebGL {{DOMxRef("OES_draw_buffers_indexed")}} đặt riêng các phương trình pha trộn RGB và alpha cho một bộ đệm vẽ cụ thể.

Xem {{DOMxRef("OES_draw_buffers_indexed.blendEquationiOES()")}} để đặt RGB và alpha cùng nhau và {{DOMxRef("WebGLRenderingContext.blendEquationSeparate()")}} cho phiên bản WebGL 1 của phương thức này.

## Cú pháp

```js-nolint
blendEquationSeparateiOES(buf, modeRGB, modeAlpha)
```

### Tham số

- `buf`
  - : Một số nguyên `i` chỉ định bộ đệm vẽ liên kết với hằng số `gl.DRAW_BUFFERi`, xem [hằng số bộ đệm vẽ WebGL](/en-US/docs/Web/API/WebGL_API/Constants#draw_buffers).
- `modeRGB`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định cách kết hợp các thành phần màu RGB nguồn và đích. Chấp nhận cùng các enum với tham số `modeRGB` trong {{DOMxRef("WebGLRenderingContext.blendEquationSeparate()")}}.
- `modeAlpha`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định cách kết hợp các thành phần màu alpha nguồn và đích. Chấp nhận cùng các enum với tham số `modeAlpha` trong {{DOMxRef("WebGLRenderingContext.blendEquationSeparate()")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu `buf` không phải là giá trị hợp lệ, lỗi `gl.INVALID_VALUE` được ném ra.
- Nếu `modeRGB` hoặc `modeAlpha` không được đặt thành một trong các giá trị có thể, lỗi `gl.INVALID_ENUM` được ném ra.

## Ví dụ

### Đặt và lấy phương trình pha trộn

Ví dụ sau đặt các phương trình pha trộn cho bộ đệm vẽ `gl.DRAW_BUFFER0` (lời gọi với `buf` là 0) và `gl.DRAW_BUFFER1` (lời gọi với `buf` là 1).

```js
const ext = gl.getExtension("OES_draw_buffers_indexed");

ext.blendEquationSeparateiOES(0, gl.FUNC_ADD, gl.FUNC_SUBTRACT);
ext.blendEquationSeparateiOES(1, gl.FUNC_ADD, gl.FUNC_SUBTRACT);
```

Để lấy phương trình pha trộn cho `gl.DRAW_BUFFER0` và `gl.DRAW_BUFFER1`, truy vấn các hằng số `BLEND_EQUATION_RGB` và `BLEND_EQUATION_ALPHA` bằng {{domxref("WebGL2RenderingContext.getIndexedParameter()")}}:

```js
// For gl.DRAW_BUFFER0
gl.getIndexedParameter(gl.BLEND_EQUATION_RGB, 0);
gl.getIndexedParameter(gl.BLEND_EQUATION_ALPHA, 0);

// for gl.DRAW_BUFFER1
gl.getIndexedParameter(gl.BLEND_EQUATION_RGB, 1);
gl.getIndexedParameter(gl.BLEND_EQUATION_ALPHA, 1);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("OES_draw_buffers_indexed.blendEquationiOES()")}}
- {{DOMxRef("WebGLRenderingContext.blendEquationSeparate()")}}
