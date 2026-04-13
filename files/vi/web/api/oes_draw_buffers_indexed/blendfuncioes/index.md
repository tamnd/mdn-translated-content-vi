---
title: "OES_draw_buffers_indexed: blendFunciOES() method"
short-title: blendFunciOES()
slug: Web/API/OES_draw_buffers_indexed/blendFunciOES
page-type: web-api-instance-method
browser-compat: api.OES_draw_buffers_indexed.blendFunciOES
---

{{APIRef("WebGL")}}

Phương thức `blendFunciOES()` của phần mở rộng WebGL {{DOMxRef("OES_draw_buffers_indexed")}} định nghĩa hàm nào được dùng khi pha trộn pixel cho một bộ đệm vẽ cụ thể.

Xem {{DOMxRef("OES_draw_buffers_indexed.blendFuncSeparateiOES()")}} để đặt riêng các thành phần RGB và alpha và {{DOMxRef("WebGLRenderingContext.blendFunc()")}} cho phiên bản WebGL 1 của phương thức này.

## Cú pháp

```js-nolint
blendFunciOES(buf, src, dst)
```

### Tham số

- `buf`
  - : Một số nguyên `i` chỉ định bộ đệm vẽ liên kết với hằng số `gl.DRAW_BUFFERi`, xem [hằng số bộ đệm vẽ WebGL](/en-US/docs/Web/API/WebGL_API/Constants#draw_buffers).
- `src`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định hệ số nhân cho các nhân tố pha trộn nguồn. Chấp nhận cùng các enum với tham số `sfactor` trong {{DOMxRef("WebGLRenderingContext.blendFunc()")}}.
- `dst`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định hệ số nhân cho các nhân tố pha trộn đích. Chấp nhận cùng các enum với tham số `dfactor` trong {{DOMxRef("WebGLRenderingContext.blendFunc()")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu `buf` không phải là giá trị hợp lệ, lỗi `gl.INVALID_VALUE` được ném ra.
- Nếu `src` hoặc `dst` không phải là một trong các giá trị có thể, lỗi `gl.INVALID_ENUM` được ném ra.
- Các giới hạn pha trộn tương tự như trong {{DOMxRef("WebGLRenderingContext.blendFunc()")}} được áp dụng: Nếu một màu hằng số và một giá trị alpha hằng số được dùng cùng nhau làm nhân tố nguồn và đích, lỗi `gl.INVALID_ENUM` được ném ra.

## Ví dụ

### Đặt và lấy hàm pha trộn

Bạn có thể đặt các hàm pha trộn cho bộ đệm vẽ `gl.DRAW_BUFFER0` và `gl.DRAW_BUFFER1` như sau:

```js
const ext = gl.getExtension("OES_draw_buffers_indexed");

ext.blendFunciOES(0, gl.ONE, gl.ONE);
ext.blendFunciOES(1, gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);
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

- {{DOMxRef("OES_draw_buffers_indexed.blendFuncSeparateiOES()")}}
- {{DOMxRef("WebGLRenderingContext.blendFunc()")}}
