---
title: "WebGLRenderingContext: isShader() method"
short-title: isShader()
slug: Web/API/WebGLRenderingContext/isShader
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.isShader
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.isShader()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về `true` nếu {{domxref("WebGLShader")}} được truyền là hợp lệ, nếu không thì `false`.

## Cú pháp

```js-nolint
isShader(shader)
```

### Thông số

- `shader`
  - : A {{domxref("WebGLShader")}} để kiểm tra.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết shader có hợp lệ hay không.

## Ví dụ

### Kiểm tra trình đổ bóng

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const shader = gl.createShader(gl.VERTEX_SHADER);

// …

gl.isShader(shader);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createShader()")}}
- {{domxref("WebGLRenderingContext.deleteShader()")}}
