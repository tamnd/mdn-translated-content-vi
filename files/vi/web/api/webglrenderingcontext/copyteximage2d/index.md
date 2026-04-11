---
title: "WebGLRenderingContext: copyTexImage2D() method"
short-title: copyTexImage2D()
slug: Web/API/WebGLRenderingContext/copyTexImage2D
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.copyTexImage2D
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`copyTexImage2D()`** của giao diện {{domxref("WebGLRenderingContext")}} của [WebGL API](/en-US/docs/Web/API/WebGL_API) sao chép các pixel từ {{domxref("WebGLFramebuffer")}} hiện tại thành một hình ảnh kết cấu 2D.

## Cú pháp

```js-nolint
copyTexImage2D(target, level, internalformat, x, y, width, height, border)
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
- `internalformat`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định cách lưu trữ kết cấu sau khi nó được tải. Các giá trị có thể:
    - `gl.ALPHA`: Loại bỏ các thành phần màu đỏ, xanh lá cây và xanh dương và đọc thành phần alpha.
    - `gl.RGB`: Loại bỏ các thành phần alpha và đọc các thành phần màu đỏ, lục và lam.
    - `gl.RGBA`: Các thành phần màu đỏ, xanh lá cây, xanh dương và alpha được đọc từ bộ đệm màu.
    - `gl.LUMINANCE`: Mỗi thành phần màu là một thành phần độ chói, alpha là 1.0.
    - `gl.LUMINANCE_ALPHA`: Mỗi thành phần là một thành phần độ chói/alpha.
- `x`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định tọa độ x của góc dưới bên trái nơi bắt đầu sao chép.
- `y`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định tọa độ y của góc dưới bên trái nơi bắt đầu sao chép.
- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của kết cấu bằng texels.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} xác định chiều cao của kết cấu tính bằng texels.
- `border`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định độ rộng của đường viền. Phải là 0.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.copyTexImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 0, 0, 512, 512, 0);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createTexture()")}}
- {{domxref("WebGLRenderingContext.bindTexture()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
- {{domxref("WebGLRenderingContext.texSubImage2D()")}}
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}
