---
title: "WebGL2RenderingContext: phương thức invalidateSubFramebuffer()"
short-title: invalidateSubFramebuffer()
slug: Web/API/WebGL2RenderingContext/invalidateSubFramebuffer
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.invalidateSubFramebuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.invalidateSubFramebuffer()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) vô hiệu hóa các phần nội dung của các điểm gắn trong một framebuffer.

## Cú pháp

```js-nolint
invalidateSubFramebuffer(target, attachments, x, y, width, height)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (target). Các giá trị có thể:
    - `gl.FRAMEBUFFER`
      - : Tập hợp lưu trữ dữ liệu bộ đệm của màu, alpha, depth và stencil được sử dụng để kết xuất hình ảnh.
    - `gl.DRAW_FRAMEBUFFER`
      - : Tương đương với `gl.FRAMEBUFFER`.
    - `gl.READ_FRAMEBUFFER`
      - : Được sử dụng làm nguồn cho các hoạt động đọc.

- `attachments`
  - : Một {{jsxref("Array")}} các {{domxref("WebGL_API/Types", "GLenum")}} chỉ định các điểm gắn sẽ vô hiệu hóa. Các giá trị có thể:
    - `gl.COLOR_ATTACHMENT{0-15}`
      - : Vô hiệu hóa một trong các bộ đệm màu của framebuffer.
    - `gl.DEPTH_ATTACHMENT`
      - : Vô hiệu hóa bộ đệm depth của framebuffer.
    - `gl.STENCIL_ATTACHMENT`
      - : Vô hiệu hóa bộ đệm stencil của framebuffer.
    - `gl.DEPTH_STENCIL_ATTACHMENT`
      - : Vô hiệu hóa cả bộ đệm depth và stencil của framebuffer.

- `x`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định gốc bên trái của hình chữ nhật pixel sẽ vô hiệu hóa.
- `y`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định gốc dưới cùng của hình chữ nhật pixel sẽ vô hiệu hóa.
- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của hình chữ nhật pixel sẽ vô hiệu hóa.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều cao của hình chữ nhật pixel sẽ vô hiệu hóa.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.invalidateSubFramebuffer(
  gl.READ_FRAMEBUFFER,
  [gl.COLOR_ATTACHMENT0, gl.COLOR_ATTACHMENT1],
  0,
  0,
  256,
  256,
);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.invalidateFramebuffer()")}}