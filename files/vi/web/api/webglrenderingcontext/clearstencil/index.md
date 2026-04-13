---
title: "WebGLRenderingContext: clearStencil() method"
short-title: clearStencil()
slug: Web/API/WebGLRenderingContext/clearStencil
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.clearStencil
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.clearStencil()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định giá trị rõ ràng cho bộ đệm stencil.

Điều này xác định giá trị stencil nào sẽ được sử dụng khi gọi phương thức {{domxref("WebGLRenderingContext.clear", "clear()")}}.

## Cú pháp

```js-nolint
clearStencil(s)
```

### Thông số

- `s`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định chỉ mục được sử dụng khi xóa bộ đệm stencil.
Giá trị mặc định: 0.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.clearStencil(1);
```

Để có được giá trị xóa stencil hiện tại, hãy truy vấn hằng số `STENCIL_CLEAR_VALUE`.

```js
gl.getParameter(gl.STENCIL_CLEAR_VALUE);
// 1
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.clear()")}}
- {{domxref("WebGLRenderingContext.clearColor()")}}
- {{domxref("WebGLRenderingContext.clearDepth()")}}
