---
title: "WebGLRenderingContext: framebufferRenderbuffer() method"
short-title: framebufferRenderbuffer()
slug: Web/API/WebGLRenderingContext/framebufferRenderbuffer
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.framebufferRenderbuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.framebufferRenderbuffer()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) gắn một đối tượng {{domxref("WebGLRenderbuffer")}} vào một đối tượng {{domxref("WebGLFramebuffer")}}.

## Cú pháp

```js-nolint
framebufferRenderbuffer(target, attachment, renderbuffertarget, renderbuffer)
```

### Thông số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích) cho bộ đệm khung.
Các giá trị có thể:
    - `gl.FRAMEBUFFER`
      - : Bộ sưu tập bộ đệm lưu trữ dữ liệu màu, alpha,
bộ đệm độ sâu và stencil được sử dụng để hiển thị hình ảnh.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.DRAW_FRAMEBUFFER`
      - : Tương đương với `gl.FRAMEBUFFER`.
Được sử dụng làm đích cho các hoạt động vẽ, hiển thị, xóa và viết.
    - `gl.READ_FRAMEBUFFER`
      - : Được sử dụng làm nguồn cho các hoạt động đọc.

- `attachment`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm đính kèm cho bộ đệm kết xuất.
Các giá trị có thể:
    - `gl.COLOR_ATTACHMENT0`: bộ đệm màu.
    - `gl.DEPTH_ATTACHMENT`: bộ đệm độ sâu.
    - `gl.DEPTH_STENCIL_ATTACHMENT`: bộ đệm độ sâu và stencil.
    - `gl.STENCIL_ATTACHMENT`: bộ đệm stencil.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.COLOR_ATTACHMENT1 gl.COLOR_ATTACHMENT2 gl.COLOR_ATTACHMENT3 gl.COLOR_ATTACHMENT4 gl.COLOR_ATTACHMENT5 gl.COLOR_ATTACHMENT6 gl.COLOR_ATTACHMENT7 gl.COLOR_ATTACHMENT8 gl.COLOR_ATTACHMENT9 gl.COLOR_ATTACHMENT10 gl.COLOR_ATTACHMENT11 gl.COLOR_ATTACHMENT12 gl.COLOR_ATTACHMENT13 gl.COLOR_ATTACHMENT14 gl.COLOR_ATTACHMENT15`

Khi sử dụng phần mở rộng {{domxref("WEBGL_draw_buffers")}}:
    - `ext.COLOR_ATTACHMENT0_WEBGL` (giống như
`gl.COLOR_ATTACHMENT0`)
    - `ext.COLOR_ATTACHMENT1_WEBGL ext.COLOR_ATTACHMENT2_WEBGL ext.COLOR_ATTACHMENT3_WEBGL ext.COLOR_ATTACHMENT4_WEBGL ext.COLOR_ATTACHMENT5_WEBGL ext.COLOR_ATTACHMENT6_WEBGL ext.COLOR_ATTACHMENT7_WEBGL ext.COLOR_ATTACHMENT8_WEBGL ext.COLOR_ATTACHMENT9_WEBGL ext.COLOR_ATTACHMENT10_WEBGL ext.COLOR_ATTACHMENT11_WEBGL ext.COLOR_ATTACHMENT12_WEBGL ext.COLOR_ATTACHMENT13_WEBGL ext.COLOR_ATTACHMENT14_WEBGL ext.COLOR_ATTACHMENT15_WEBGL`

- `renderbuffertarget`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích) cho bộ đệm kết xuất.
Các giá trị có thể:
    - `gl.RENDERBUFFER`
      - : Bộ đệm lưu trữ dữ liệu cho các hình ảnh đơn lẻ ở định dạng bên trong có thể hiển thị.

- `renderbuffer`
  - : Một đối tượng {{domxref("WebGLRenderbuffer")}} để đính kèm.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Một lỗi `gl.INVALID_ENUM` sẽ xuất hiện nếu `target` không được
`gl.FRAMEBUFFER`, `gl.DRAW_FRAMEBUFFER`, hoặc `gl.READ_FRAMEBUFFER`.
- Một lỗi `gl.INVALID_ENUM` sẽ xuất hiện nếu `renderbuffertarget` được
không phải `gl.RENDERBUFFER`.
- Một lỗi `gl.INVALID_ENUM` sẽ xuất hiện nếu `attachment` không phải là một
trong số các enum được phép.

## Ví dụ

```js
gl.framebufferRenderbuffer(
  gl.FRAMEBUFFER,
  gl.COLOR_ATTACHMENT0,
  gl.RENDERBUFFER,
  renderbuffer,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createFramebuffer()")}}
- {{domxref("WebGLRenderingContext.deleteFramebuffer()")}}
- {{domxref("WebGLRenderingContext.isFramebuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLRenderbuffer")}}
- {{domxref("WEBGL_draw_buffers")}}
