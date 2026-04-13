---
title: "OVR_multiview2: phương thức framebufferTextureMultiviewOVR()"
short-title: framebufferTextureMultiviewOVR()
slug: Web/API/OVR_multiview2/framebufferTextureMultiviewOVR
page-type: webgl-extension-method
browser-compat: api.OVR_multiview2.framebufferTextureMultiviewOVR
---

{{APIRef("WebGL")}}

Phương thức **`OVR_multiview2.framebufferTextureMultiviewOVR()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) gắn kết texture multiview vào {{domxref("WebGLFramebuffer")}}.

## Cú pháp

```js-nolint
framebufferTextureMultiviewOVR(target, attachment, texture, level, baseViewIndex, numViews)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API.Types", "GLenum")}} chỉ định điểm gắn kết (đích). Các giá trị có thể:
    - `gl.FRAMEBUFFER`
      - : Lưu trữ dữ liệu bộ đệm màu sắc, alpha, độ sâu và stencil dùng để kết xuất hình ảnh.
    - `gl.DRAW_FRAMEBUFFER`
      - : Tương đương với `gl.FRAMEBUFFER`. Được dùng làm đích cho các thao tác vẽ, kết xuất, xóa và ghi.
    - `gl.READ_FRAMEBUFFER`
      - : Được dùng làm nguồn cho các thao tác đọc.

- `attachment`
  - : Một {{domxref("WebGL_API.Types", "GLenum")}} chỉ định điểm gắn kết cho `texture`.
- `texture`
  - : Một đối tượng {{domxref("WebGLTexture")}} cần gắn kết hình ảnh.
- `level`
  - : Một {{domxref("WebGL_API.Types", "GLint")}} chỉ định cấp độ mipmap của hình ảnh texture cần gắn kết. Phải là 0.
- `baseViewIndex`
  - : Một {{domxref("WebGL_API.Types", "GLint")}} chỉ định chỉ số view cơ sở của attachment đối tượng framebuffer.
- `numViews`
  - : Một {{domxref("WebGL_API.Types", "GLsizei")}} chỉ định số lượng view của attachment đối tượng framebuffer.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Lỗi `gl.INVALID_ENUM` được ném nếu `target` không phải `gl.FRAMEBUFFER` hoặc `attachment` không phải là một trong các điểm gắn kết được chấp nhận.
- Lỗi `gl.INVALID_VALUE` được ném nếu `level` không phải 0, hoặc nếu `numViews` nhỏ hơn một hoặc lớn hơn `MAX_VIEWS_OVR`.
- Lỗi `gl.INVALID_OPERATION` được ném nếu `texture` không phải 0 hoặc tên của đối tượng texture hiện có.

## Ví dụ

```js
ext.framebufferTextureMultiviewOVR(
  gl.DRAW_FRAMEBUFFER,
  gl.COLOR_ATTACHMENT0,
  colorTex,
  0,
  0,
  2,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("OVR_multiview2")}}
- {{domxref("WEBGL_depth_texture")}}
- {{domxref("WEBGL_draw_buffers")}}
