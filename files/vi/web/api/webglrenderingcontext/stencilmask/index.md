---
title: "WebGLRenderingContext: stencilMask() method"
short-title: stencilMask()
slug: Web/API/WebGLRenderingContext/stencilMask
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.stencilMask
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương pháp **`WebGLRenderingContext.stencilMask()`** của các điều khiển [WebGL API](/en-US/docs/Web/API/WebGL_API) cho phép và vô hiệu hóa cả việc ghi mặt trước và mặt sau của các bit riêng lẻ trong các mặt phẳng stencil.

Phương thức {{domxref("WebGLRenderingContext.stencilMaskSeparate()")}} có thể đặt mặt nạ ghi stencil mặt trước và mặt sau thành các giá trị khác nhau.

## Cú pháp

```js-nolint
stencilMask(mask)
```

### Thông số

- `mask`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định một mặt nạ bit để kích hoạt hoặc vô hiệu hóa việc ghi
các bit riêng lẻ trong các mặt phẳng stencil. Theo mặc định, mặt nạ là tất cả 1.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.stencilMask(110101);
```

Để có được các mặt nạ stencil hiện tại, hãy truy vấn các hằng số `STENCIL_WRITEMASK`, `STENCIL_BACK_WRITEMASK`, hoặc `STENCIL_BITS`.

```js
gl.getParameter(gl.STENCIL_WRITEMASK);
// 110101
gl.getParameter(gl.STENCIL_BACK_WRITEMASK);
// 110101
gl.getParameter(gl.STENCIL_BITS);
// 0
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.colorMask()")}}
- {{domxref("WebGLRenderingContext.depthMask()")}}
- {{domxref("WebGLRenderingContext.stencilMaskSeparate()")}}
