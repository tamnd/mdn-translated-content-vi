---
title: "WebGLRenderingContext: blendColor() method"
short-title: blendColor()
slug: Web/API/WebGLRenderingContext/blendColor
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.blendColor
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.blendColor()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) được sử dụng để thiết lập hệ số hòa trộn nguồn và đích.

## Cú pháp

```js-nolint
blendColor(red, green, blue, alpha)
```

### Thông số

- `red`
  - : A {{domxref("WebGL_API/Types", "GLclampf")}} cho thành phần màu đỏ trong khoảng từ 0 đến 1. Giá trị mặc định là 0.
- `green`
  - : A {{domxref("WebGL_API/Types", "GLclampf")}} cho thành phần màu xanh lá cây trong khoảng từ 0 đến 1. Giá trị mặc định là 0.
- `blue`
  - : A {{domxref("WebGL_API/Types", "GLclampf")}} cho thành phần màu xanh lam trong phạm vi từ 0 đến 1. Giá trị mặc định là 0.
- `alpha`
  - : A {{domxref("WebGL_API/Types", "GLclampf")}} cho thành phần alpha (độ trong suốt) trong khoảng 0.
thành 1. Giá trị mặc định là 0.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Để đặt màu hòa trộn, hãy sử dụng:

```js
gl.blendColor(0, 0.5, 1, 1);
```

Để có được màu hòa trộn, hãy truy vấn hằng số `BLEND_COLOR` và trả về {{jsxref("Float32Array")}}.

```js
gl.getParameter(gl.BLEND_COLOR);
// Float32Array[0, 0.5, 1, 1]
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.blendEquation()")}}
- {{domxref("WebGLRenderingContext.blendFunc()")}}
