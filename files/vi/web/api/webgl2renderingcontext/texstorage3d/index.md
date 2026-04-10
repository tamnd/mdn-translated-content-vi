---
title: "WebGL2RenderingContext: phương thức texStorage3D()"
short-title: texStorage3D()
slug: Web/API/WebGL2RenderingContext/texStorage3D
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.texStorage3D
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`texStorage3D()`** của {{domxref("WebGL2RenderingContext")}} trong [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định tất cả các mức của lưu trữ texture ba chiều.

## Cú pháp

```js-nolint
texStorage3D(target, levels, internalformat, width, height, depth)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (target) của texture đang hoạt động. Các giá trị có thể:
    - `gl.TEXTURE_3D`: Texture ba chiều.
    - `gl.TEXTURE_2D_ARRAY`: Texture mảng hai chiều.
- `levels`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định số mức texture.
- `internalformat`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định định dạng lưu trữ texture. Để biết danh sách các giá trị có thể, xem {{domxref("WebGL2RenderingContext.texStorage2D()")}}.
- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của texture tính bằng texel.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều cao của texture tính bằng texel.
- `depth`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều sâu của texture/số lượng texture trong một `TEXTURE_2D_ARRAY`.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.texStorage3D(gl.TEXTURE_3D, 1, gl.RGB8, 256, 256, 256);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.texStorage2D()")}}
- {{domxref("WEBGL_compressed_texture_etc")}}