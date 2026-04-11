---
title: "WebGLRenderingContext: copyTexSubImage2D() method"
short-title: copyTexSubImage2D()
slug: Web/API/WebGLRenderingContext/copyTexSubImage2D
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.copyTexSubImage2D
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`copyTexSubImage2D()`** của giao diện {{domxref("WebGLRenderingContext")}} của [WebGL API](/en-US/docs/Web/API/WebGL_API) sao chép các pixel từ {{domxref("WebGLFramebuffer")}} hiện tại thành một ảnh phụ có kết cấu 2D.

## Cú pháp

```js-nolint
copyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height)
```

### Thông số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích) của kết cấu đang hoạt động. Các giá trị có thể:
    - `gl.TEXTURE_2D`: Một kết cấu hai chiều.
    - `gl.TEXTURE_CUBE_MAP_POSITIVE_X`: Mặt X dương cho kết cấu dạng khối lập phương.
    - `gl.TEXTURE_CUBE_MAP_NEGATIVE_X`: Mặt X âm cho kết cấu được ánh xạ hình khối.
    - `gl.TEXTURE_CUBE_MAP_POSITIVE_Y`: Mặt Y dương cho kết cấu dạng khối lập phương.
    - `gl.TEXTURE_CUBE_MAP_NEGATIVE_Y`: Mặt Y âm cho kết cấu được ánh xạ hình khối.
    - `gl.TEXTURE_CUBE_MAP_POSITIVE_Z`: Mặt Z dương cho kết cấu dạng khối lập phương.
    - `gl.TEXTURE_CUBE_MAP_NEGATIVE_Z`: Mặt Z âm cho kết cấu dạng khối lập phương.
- `level`
  - : A {{domxref("WebGL_API/Types", "GLint")}} xác định mức độ chi tiết. Cấp 0 là cấp độ hình ảnh cơ sở và cấp độ _n_ là cấp độ giảm mipmap thứ n.
- `xoffset`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định độ lệch ngang trong ảnh kết cấu.
- `yoffset`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định độ lệch dọc trong ảnh kết cấu.
- `x`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định tọa độ x của góc dưới bên trái nơi bắt đầu sao chép.
- `y`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định tọa độ y của góc dưới bên trái nơi bắt đầu sao chép.
- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của kết cấu bằng texels.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} xác định chiều cao của kết cấu tính bằng texels.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.copyTexSubImage2D(gl.TEXTURE_2D, 0, 0, 0, 0, 0, 16, 16);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.copyTexImage2D()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
- {{domxref("WebGLRenderingContext.texSubImage2D()")}}
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}
