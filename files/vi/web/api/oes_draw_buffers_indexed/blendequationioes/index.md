---
title: "OES_draw_buffers_indexed: blendEquationiOES() method"
short-title: blendEquationiOES()
slug: Web/API/OES_draw_buffers_indexed/blendEquationiOES
page-type: web-api-instance-method
browser-compat: api.OES_draw_buffers_indexed.blendEquationiOES
---

{{APIRef("WebGL")}}

Phương thức `blendEquationiOES()` của phần mở rộng WebGL `OES_draw_buffers_indexed` đặt cả phương trình pha trộn RGB và alpha cho một bộ đệm vẽ cụ thể.

Xem {{DOMxRef("OES_draw_buffers_indexed.blendEquationSeparateiOES()")}} để đặt RGB và alpha riêng lẻ và {{DOMxRef("WebGLRenderingContext.blendEquation()")}} cho phiên bản WebGL 1 của phương thức này.

## Cú pháp

```js-nolint
blendEquationiOES(buf, mode)
```

### Tham số

- `buf`
  - : Một số nguyên `i` chỉ định bộ đệm vẽ liên kết với hằng số `gl.DRAW_BUFFERi`, xem [hằng số bộ đệm vẽ WebGL](/en-US/docs/Web/API/WebGL_API/Constants#draw_buffers).
- `mode`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định cách kết hợp màu nguồn và đích. Chấp nhận cùng các enum với tham số `mode` trong {{DOMxRef("WebGLRenderingContext.blendEquation()")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu `buf` không phải là giá trị hợp lệ, lỗi `gl.INVALID_VALUE` được ném ra.
- Nếu `mode` không phải là một trong các giá trị có thể, lỗi `gl.INVALID_ENUM` được ném ra.

## Ví dụ

### Đặt và lấy phương trình pha trộn

Bạn có thể đặt phương trình pha trộn cho bộ đệm vẽ `gl.DRAW_BUFFER0` và `gl.DRAW_BUFFER1` như sau:

```js
const ext = gl.getExtension("OES_draw_buffers_indexed");

ext.blendEquationiOES(0, gl.FUNC_ADD);
ext.blendEquationiOES(1, gl.FUNC_SUBTRACT);
```

Để lấy phương trình pha trộn cho bộ đệm vẽ `gl.DRAW_BUFFER0` và `gl.DRAW_BUFFER1`, truy vấn các hằng số `BLEND_EQUATION_RGB` và `BLEND_EQUATION_ALPHA` bằng {{domxref("WebGL2RenderingContext.getIndexedParameter()")}}:

```js
// For gl.DRAW_BUFFER0
gl.getIndexedParameter(gl.BLEND_EQUATION_RGB, 0);
gl.getIndexedParameter(gl.BLEND_EQUATION_ALPHA, 0);

// For gl.DRAW_BUFFER0
gl.getIndexedParameter(gl.BLEND_EQUATION_RGB, 1);
gl.getIndexedParameter(gl.BLEND_EQUATION_ALPHA, 1);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("OES_draw_buffers_indexed.blendEquationSeparateiOES()")}}
- {{DOMxRef("WebGLRenderingContext.blendEquation()")}}
