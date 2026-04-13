---
title: "WebGLRenderingContext: frontFace() method"
short-title: frontFace()
slug: Web/API/WebGLRenderingContext/frontFace
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.frontFace
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương pháp **`WebGLRenderingContext.frontFace()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) xác định xem đa giác là mặt trước hay mặt sau bằng cách thiết lập hướng cuộn dây.

## Cú pháp

```js-nolint
frontFace(mode)
```

### Thông số

- `mode`
  - : Hướng cuộn dây loại [GLenum](/en-US/docs/Web/API/WebGL_API/Types).
Giá trị mặc định là `gl.CCW`. Các giá trị có thể:
    - `gl.CW`: Lên dây theo chiều kim đồng hồ.
    - `gl.CCW`: Cuộn dây ngược chiều kim đồng hồ.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.frontFace(gl.CW);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.cullFace()")}}
