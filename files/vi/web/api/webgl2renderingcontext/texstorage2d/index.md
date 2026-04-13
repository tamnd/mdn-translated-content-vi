---
title: "WebGL2RenderingContext: phương thức texStorage2D()"
short-title: texStorage2D()
slug: Web/API/WebGL2RenderingContext/texStorage2D
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.texStorage2D
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`texStorage2D()`** của {{domxref("WebGL2RenderingContext")}} trong [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định tất cả các mức của lưu trữ texture hai chiều.

## Cú pháp

```js-nolint
texStorage2D(target, levels, internalformat, width, height)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (target) của texture đang hoạt động. Các giá trị có thể:
    - `gl.TEXTURE_2D`: Texture hai chiều.
    - `gl.TEXTURE_CUBE_MAP`: Texture cube-map.
- `levels`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định số mức texture.
- `internalformat`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định định dạng lưu trữ texture.
- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của texture tính bằng texel.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều cao của texture tính bằng texel.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.texStorage2D(gl.TEXTURE_2D, 1, gl.RGB8, 256, 256);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.texStorage3D()")}}
- {{domxref("WEBGL_compressed_texture_etc")}}