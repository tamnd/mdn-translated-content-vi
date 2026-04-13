---
title: "WebGLRenderingContext: framebufferTexture2D() method"
short-title: framebufferTexture2D()
slug: Web/API/WebGLRenderingContext/framebufferTexture2D
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.framebufferTexture2D
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.framebufferTexture2D()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) gắn kết cấu vào {{domxref("WebGLFramebuffer")}}.

## Cú pháp

```js-nolint
framebufferTexture2D(target, attachment, textarget, texture, level)
```

### Thông số

- `target`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích). Các giá trị có thể:
    - `gl.FRAMEBUFFER`
      - : Bộ sưu tập bộ đệm lưu trữ dữ liệu màu, alpha,
bộ đệm độ sâu và stencil được sử dụng để hiển thị hình ảnh.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.DRAW_FRAMEBUFFER`
      - : Được sử dụng làm đích để vẽ,
các thao tác hiển thị, xóa và ghi.
    - `gl.READ_FRAMEBUFFER`
      - : Được sử dụng làm nguồn cho các hoạt động đọc.

Khi liên kết, `gl.FRAMEBUFFER` thiết lập cả điểm liên kết `gl.DRAW_FRAMEBUFFER` và `gl.READ_FRAMEBUFFER`. Khi tham chiếu, `gl.FRAMEBUFFER` đề cập đến ràng buộc `gl.DRAW_FRAMEBUFFER`

- `attachment`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm đính kèm cho
`texture`. Các giá trị có thể:
    - `gl.COLOR_ATTACHMENT0`: Gắn kết cấu vào bộ đệm khung
đệm màu.
    - `gl.DEPTH_ATTACHMENT`: Gắn kết cấu vào bộ đệm khung
bộ đệm độ sâu.
    - `gl.STENCIL_ATTACHMENT`: Gắn kết cấu vào bộ đệm khung
bộ đệm stencil.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.DEPTH_STENCIL_ATTACHMENT`: bộ đệm độ sâu và stencil.
    - `gl.COLOR_ATTACHMENT1 gl.COLOR_ATTACHMENT2 gl.COLOR_ATTACHMENT3 gl.COLOR_ATTACHMENT4 gl.COLOR_ATTACHMENT5 gl.COLOR_ATTACHMENT6 gl.COLOR_ATTACHMENT7 gl.COLOR_ATTACHMENT8 gl.COLOR_ATTACHMENT9 gl.COLOR_ATTACHMENT10 gl.COLOR_ATTACHMENT11 gl.COLOR_ATTACHMENT12 gl.COLOR_ATTACHMENT13 gl.COLOR_ATTACHMENT14 gl.COLOR_ATTACHMENT15`

Khi sử dụng phần mở rộng {{domxref("WEBGL_draw_buffers")}}:
    - `ext.COLOR_ATTACHMENT0_WEBGL` (giống như
`gl.COLOR_ATTACHMENT0`)
    - `ext.COLOR_ATTACHMENT1_WEBGL ext.COLOR_ATTACHMENT2_WEBGL ext.COLOR_ATTACHMENT3_WEBGL ext.COLOR_ATTACHMENT4_WEBGL ext.COLOR_ATTACHMENT5_WEBGL ext.COLOR_ATTACHMENT6_WEBGL ext.COLOR_ATTACHMENT7_WEBGL ext.COLOR_ATTACHMENT8_WEBGL ext.COLOR_ATTACHMENT9_WEBGL ext.COLOR_ATTACHMENT10_WEBGL ext.COLOR_ATTACHMENT11_WEBGL ext.COLOR_ATTACHMENT12_WEBGL ext.COLOR_ATTACHMENT13_WEBGL ext.COLOR_ATTACHMENT14_WEBGL ext.COLOR_ATTACHMENT15_WEBGL`

Khi sử dụng phần mở rộng {{domxref("WEBGL_depth_texture")}}:
    - `gl.DEPTH_STENCIL_ATTACHMENT`: Lưu trữ dữ liệu bộ đệm theo chiều sâu và stencil.

- `textarget`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định mục tiêu kết cấu. Các giá trị có thể:
    - `gl.TEXTURE_2D`: Một hình ảnh 2D.
    - `gl.TEXTURE_CUBE_MAP_POSITIVE_X`: Hình ảnh mặt X dương của
khối lập phương.
    - `gl.TEXTURE_CUBE_MAP_NEGATIVE_X`: Hình ảnh cho mặt X âm của
khối lập phương.
    - `gl.TEXTURE_CUBE_MAP_POSITIVE_Y`: Hình ảnh mặt Y dương của
khối lập phương.
    - `gl.TEXTURE_CUBE_MAP_NEGATIVE_Y`: Hình ảnh cho mặt Y âm của
khối lập phương.
    - `gl.TEXTURE_CUBE_MAP_POSITIVE_Z`: Hình ảnh mặt Z dương của
khối lập phương.
    - `gl.TEXTURE_CUBE_MAP_NEGATIVE_Z`: Hình ảnh cho mặt Z âm của
khối lập phương.

- `texture`
  - : Một đối tượng {{domxref("WebGLTexture")}} có hình ảnh được đính kèm.
- `level`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định cấp độ mipmap của hình ảnh kết cấu sẽ được
đính kèm. Phải là 0.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Lỗi `gl.INVALID_ENUM` sẽ xuất hiện nếu
  - `target` không phải là `gl.FRAMEBUFFER`.
  - `attachment` không phải là một trong những điểm đính kèm được chấp nhận.
  - `textarget` không phải là một trong những mục tiêu kết cấu được chấp nhận.

- Một lỗi `gl.INVALID_VALUE` sẽ xuất hiện nếu `level` khác 0.
- Một lỗi `gl.INVALID_OPERATION` sẽ xuất hiện nếu `texture` không bằng 0
hoặc tên của một đối tượng kết cấu hiện có.

## Ví dụ

```js
gl.framebufferTexture2D(
  gl.FRAMEBUFFER,
  gl.COLOR_ATTACHMENT0,
  gl.TEXTURE_2D,
  texture,
  0,
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
- {{domxref("WEBGL_depth_texture")}}
- {{domxref("WEBGL_draw_buffers")}}
