---
title: "WebGL2RenderingContext: phương thức invalidateFramebuffer()"
short-title: invalidateFramebuffer()
slug: Web/API/WebGL2RenderingContext/invalidateFramebuffer
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.invalidateFramebuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.invalidateFramebuffer()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) vô hiệu hóa nội dung của các điểm gắn trong một framebuffer.

## Cú pháp

```js-nolint
invalidateFramebuffer(target, attachments)
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

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.invalidateFramebuffer(gl.READ_FRAMEBUFFER, [
  gl.COLOR_ATTACHMENT0,
  gl.COLOR_ATTACHMENT1,
]);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.invalidateSubFramebuffer()")}}