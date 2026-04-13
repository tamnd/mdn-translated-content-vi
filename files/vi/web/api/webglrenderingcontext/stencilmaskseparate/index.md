---
title: "WebGLRenderingContext: stencilMaskSeparate() method"
short-title: stencilMaskSeparate()
slug: Web/API/WebGLRenderingContext/stencilMaskSeparate
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.stencilMaskSeparate
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương pháp **`WebGLRenderingContext.stencilMaskSeparate()`** của các điều khiển [WebGL API](/en-US/docs/Web/API/WebGL_API) cho phép và vô hiệu hóa việc ghi mặt trước và/hoặc mặt sau của các bit riêng lẻ trong mặt phẳng stencil.

Phương thức {{domxref("WebGLRenderingContext.stencilMask()")}} có thể thiết lập cả hai mặt nạ ghi stencil mặt trước và mặt sau thành một giá trị cùng một lúc.

## Cú pháp

```js-nolint
stencilMaskSeparate(face, mask)
```

### Thông số

- `face`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định mặt nạ ghi stencil mặt trước và/hoặc mặt sau
được cập nhật. Các giá trị có thể là:
    - `gl.FRONT`
    - `gl.BACK`
    - `gl.FRONT_AND_BACK`

- `mask`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định một mặt nạ bit để kích hoạt hoặc vô hiệu hóa việc ghi
các bit riêng lẻ trong các mặt phẳng stencil. Theo mặc định, mặt nạ là tất cả 1.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.stencilMaskSeparate(gl.FRONT, 110101);
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
- {{domxref("WebGLRenderingContext.stencilMask()")}}
