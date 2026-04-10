---
title: "WebGL2RenderingContext: phương thức framebufferTextureLayer()"
short-title: framebufferTextureLayer()
slug: Web/API/WebGL2RenderingContext/framebufferTextureLayer
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.framebufferTextureLayer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.framebufferTextureLayer()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) gắn một lớp duy nhất của texture vào một framebuffer.

Phương thức này tương tự như {{domxref("WebGLRenderingContext.framebufferTexture2D()")}}, nhưng chỉ một lớp duy nhất đã cho của mức texture được gắn vào điểm gắn.

## Cú pháp

```js-nolint
framebufferTextureLayer(target, attachment, texture, level, layer)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (target). Các giá trị có thể:
    - `gl.FRAMEBUFFER`: Tập hợp lưu trữ dữ liệu bộ đệm của màu, alpha, depth và stencil được sử dụng để kết xuất hình ảnh.
    - `gl.DRAW_FRAMEBUFFER`: Tương đương với `gl.FRAMEBUFFER`.
    - `gl.READ_FRAMEBUFFER`: Được sử dụng làm nguồn cho các hoạt động đọc.

- `attachment`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm gắn cho `texture`. Các giá trị có thể:
    - `gl.COLOR_ATTACHMENT{0-15}`: Gắn texture vào một trong các bộ đệm màu của framebuffer.
    - `gl.DEPTH_ATTACHMENT`: Gắn texture vào bộ đệm depth của framebuffer.
    - `gl.STENCIL_ATTACHMENT`: Gắn texture vào bộ đệm stencil của framebuffer.
    - `gl.DEPTH_STENCIL_ATTACHMENT`: bộ đệm depth và stencil.

- `texture`
  - : Một đối tượng {{domxref("WebGLTexture")}} có hình ảnh sẽ được gắn.
- `level`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định mức mipmap của hình ảnh texture sẽ được gắn.
- `layer`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định lớp của hình ảnh texture sẽ được gắn.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.framebufferTextureLayer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, texture, 0, 8);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.framebufferTexture2D()")}}