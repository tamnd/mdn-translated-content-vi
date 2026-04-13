---
title: "OES_draw_buffers_indexed: blendFuncSeparateiOES() method"
short-title: blendFuncSeparateiOES()
slug: Web/API/OES_draw_buffers_indexed/blendFuncSeparateiOES
page-type: web-api-instance-method
browser-compat: api.OES_draw_buffers_indexed.blendFuncSeparateiOES
---

{{APIRef("WebGL")}}

Phương thức `blendFuncSeparateiOES()` của phần mở rộng WebGL {{DOMxRef("OES_draw_buffers_indexed")}} định nghĩa hàm nào được dùng khi pha trộn pixel cho các thành phần RGB và alpha riêng lẻ cho một bộ đệm vẽ cụ thể.

Xem {{DOMxRef("OES_draw_buffers_indexed.blendFunciOES()")}} để đặt RGB và alpha cùng nhau và {{DOMxRef("WebGLRenderingContext.blendFuncSeparate()")}} cho phiên bản WebGL 1 của phương thức này.

## Cú pháp

```js-nolint
blendFuncSeparateiOES(buf, srcRGB, dstRGB, srcAlpha, dstAlpha)
```

### Tham số

- `buf`
  - : Một số nguyên `i` chỉ định bộ đệm vẽ liên kết với hằng số `gl.DRAW_BUFFERi`, xem [hằng số bộ đệm vẽ WebGL](/en-US/docs/Web/API/WebGL_API/Constants#draw_buffers).
- `srcRGB`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định hệ số nhân cho các nhân tố pha trộn nguồn đỏ, xanh lá và xanh dương (RGB). Chấp nhận cùng các enum với tham số `srcRGB` trong {{DOMxRef("WebGLRenderingContext.blendFuncSeparate()")}}.
- `dstRGB`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định hệ số nhân cho các nhân tố pha trộn đích đỏ, xanh lá và xanh dương (RGB). Chấp nhận cùng các enum với tham số `dstRGB` trong {{DOMxRef("WebGLRenderingContext.blendFuncSeparate()")}}.
- `srcAlpha`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định hệ số nhân cho nhân tố pha trộn alpha nguồn. Chấp nhận cùng các enum với tham số `srcAlpha` trong {{DOMxRef("WebGLRenderingContext.blendFuncSeparate()")}}.
- `dstAlpha`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định hệ số nhân cho nhân tố pha trộn alpha đích. Chấp nhận cùng các enum với tham số `srcAlpha` trong {{DOMxRef("WebGLRenderingContext.blendFuncSeparate()")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu `buf` không phải là giá trị hợp lệ, lỗi `gl.INVALID_VALUE` được ném ra.
- Nếu `srcRGB`, `dstRGB`, `srcAlpha` hoặc `dstAlpha` không phải là một trong các giá trị có thể, lỗi `gl.INVALID_ENUM` được ném ra.
- Các giới hạn pha trộn tương tự như trong {{DOMxRef("WebGLRenderingContext.blendFuncSeparate()")}} được áp dụng: Nếu một màu hằng số và một giá trị alpha hằng số được dùng cùng nhau làm nhân tố nguồn và đích, lỗi `gl.INVALID_ENUM` được ném ra.

## Ví dụ

### Đặt và lấy hàm pha trộn

Ví dụ sau đặt các hàm pha trộn cho bộ đệm vẽ `gl.DRAW_BUFFER0` (lời gọi với `buf` là 0) và `gl.DRAW_BUFFER1` (lời gọi với `buf` là 1).

```js
const ext = gl.getExtension("OES_draw_buffers_indexed");

ext.blendFuncSeparateiOES(0, gl.ONE, gl.ONE, gl.ZERO, gl.ZERO);
ext.blendFuncSeparateiOES(
  1,
  gl.SRC_ALPHA,
  gl.ONE_MINUS_SRC_ALPHA,
  gl.ZERO,
  gl.ZERO,
);
```

Để lấy các hàm pha trộn cho bộ đệm vẽ `gl.DRAW_BUFFER0` và `gl.DRAW_BUFFER1`, truy vấn các hằng số `BLEND_SRC_RGB`, `BLEND_SRC_ALPHA`, `BLEND_DST_RGB` và `BLEND_DST_ALPHA` bằng {{domxref("WebGL2RenderingContext.getIndexedParameter()")}}:

```js
// For gl.DRAW_BUFFER0
gl.getIndexedParameter(gl.BLEND_SRC_RGB, 0);
gl.getIndexedParameter(gl.BLEND_SRC_ALPHA, 0);
gl.getIndexedParameter(gl.BLEND_DST_RGB, 0);
gl.getIndexedParameter(gl.BLEND_DST_ALPHA, 0);

// For gl.DRAW_BUFFER0
gl.getIndexedParameter(gl.BLEND_SRC_RGB, 1);
gl.getIndexedParameter(gl.BLEND_SRC_ALPHA, 1);
gl.getIndexedParameter(gl.BLEND_DST_RGB, 1);
gl.getIndexedParameter(gl.BLEND_DST_ALPHA, 1);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("OES_draw_buffers_indexed.blendFunciOES()")}}
- {{DOMxRef("WebGLRenderingContext.blendFuncSeparate()")}}
