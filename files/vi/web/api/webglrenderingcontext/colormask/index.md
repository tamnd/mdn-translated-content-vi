---
title: "WebGLRenderingContext: colorMask() method"
short-title: colorMask()
slug: Web/API/WebGLRenderingContext/colorMask
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.colorMask
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.colorMask()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) thiết lập các thành phần màu nào sẽ bật hoặc tắt khi vẽ hoặc hiển thị thành {{domxref("WebGLFramebuffer")}}.

## Cú pháp

```js-nolint
colorMask(red, green, blue, alpha)
```

### Thông số

- `red`
  - : Một {{domxref("WebGL_API/Types", "GLboolean")}} chỉ định liệu thành phần màu đỏ có thể được
được ghi vào bộ đệm khung. Giá trị mặc định: `true`.
- `green`
  - : A {{domxref("WebGL_API/Types", "GLboolean")}} chỉ định liệu thành phần màu xanh lá cây có thể
được ghi vào bộ đệm khung. Giá trị mặc định: `true`.
- `blue`
  - : Một {{domxref("WebGL_API/Types", "GLboolean")}} chỉ định liệu thành phần màu xanh có thể được
được ghi vào bộ đệm khung. Giá trị mặc định: `true`.
- `alpha`
  - : A {{domxref("WebGL_API/Types", "GLboolean")}} chỉ định có hay không có alpha (trong suốt)
thành phần có thể được ghi vào bộ đệm khung. Giá trị mặc định: `true`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.colorMask(true, true, true, false);
```

Để có được mặt nạ màu hiện tại, hãy truy vấn hằng số `COLOR_WRITEMASK` và trả về {{jsxref("Array")}}.

```js
gl.getParameter(gl.COLOR_WRITEMASK);
// [true, true, true, false]
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.depthMask()")}}
- {{domxref("WebGLRenderingContext.stencilMask()")}}
