---
title: "WebGLRenderingContext: clearColor() method"
short-title: clearColor()
slug: Web/API/WebGLRenderingContext/clearColor
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.clearColor
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.clearColor()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định các giá trị màu được sử dụng khi xóa bộ đệm màu.

Điều này xác định giá trị màu nào sẽ được sử dụng khi gọi phương thức {{domxref("WebGLRenderingContext.clear", "clear()")}}. Các giá trị được kẹp giữa 0 và 1.

## Cú pháp

```js-nolint
clearColor(red, green, blue, alpha)
```

### Thông số

- `red`
  - : A {{domxref("WebGL_API/Types", "GLclampf")}} chỉ định giá trị màu đỏ được sử dụng khi bộ đệm màu
được xóa. Giá trị mặc định: 0.
- `green`
  - : A {{domxref("WebGL_API/Types", "GLclampf")}} chỉ định giá trị màu xanh lục được sử dụng khi màu
bộ đệm được xóa. Giá trị mặc định: 0.
- `blue`
  - : A {{domxref("WebGL_API/Types", "GLclampf")}} chỉ định giá trị màu xanh được sử dụng khi màu
bộ đệm được xóa. Giá trị mặc định: 0.
- `alpha`
  - : Một {{domxref("WebGL_API/Types", "GLclampf")}} chỉ định giá trị alpha (độ trong suốt) được sử dụng khi
bộ đệm màu sẽ bị xóa. Giá trị mặc định: 0.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.clearColor(1, 0.5, 0.5, 1);
```

Để có được màu sắc rõ nét hiện tại, hãy truy vấn hằng số `COLOR_CLEAR_VALUE` và trả về {{jsxref("Float32Array")}}.

```js
gl.getParameter(gl.COLOR_CLEAR_VALUE);
// Float32Array[1, 0.5, 0.5, 1]
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.clear()")}}
- {{domxref("WebGLRenderingContext.clearDepth()")}}
- {{domxref("WebGLRenderingContext.clearStencil()")}}
