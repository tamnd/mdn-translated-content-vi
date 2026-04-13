---
title: "WebGL2RenderingContext: phương thức copyTexSubImage3D()"
short-title: copyTexSubImage3D()
slug: Web/API/WebGL2RenderingContext/copyTexSubImage3D
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.copyTexSubImage3D
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`copyTexSubImage3D()`** của giao diện {{domxref("WebGL2RenderingContext")}} trong [WebGL API](/en-US/docs/Web/API/WebGL_API) sao chép pixel từ {{domxref("WebGLFramebuffer")}} hiện tại vào một hình ảnh con của texture 3D.

## Cú pháp

```js-nolint
copyTexSubImage3D(target, level, xoffset, yoffset, zoffset, x, y, width, height)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (target) của texture đang hoạt động. Các giá trị có thể:
    - `gl.TEXTURE_3D`: Texture ba chiều.
    - `gl.TEXTURE_2D_ARRAY`: Texture mảng hai chiều.
- `level`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định mức chi tiết. Mức 0 là mức hình ảnh cơ sở và mức _n_ là mức giảm mipmap thứ n.
- `xoffset`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định offset x trong ảnh texture.
- `yoffset`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định offset y trong ảnh texture.
- `zoffset`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định offset z trong ảnh texture.
- `x`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định tọa độ x của góc dưới bên trái nơi bắt đầu sao chép.
- `y`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định tọa độ y của góc dưới bên trái nơi bắt đầu sao chép.
- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của texture tính bằng texel.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều cao của texture tính bằng texel.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.copyTexSubImage3D(gl.TEXTURE_3D, 0, 0, 0, 0, 0, 0, 16, 16);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.copyTexImage2D()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
- {{domxref("WebGLRenderingContext.texSubImage2D()")}}
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}