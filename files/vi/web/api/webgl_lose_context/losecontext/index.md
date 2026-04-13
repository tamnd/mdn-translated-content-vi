---
title: WEBGL_lose_context.loseContext()
slug: Web/API/WEBGL_lose_context/loseContext
page-type: webgl-extension-method
browser-compat: api.WEBGL_lose_context.loseContext
---

{{APIRef("WebGL")}}

Phương thức **`WEBGL_lose_context.loseContext()`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cho phép bạn mô phỏng việc mất {{domxref("WebGLRenderingContext")}}.

Nó kích hoạt các bước được mô tả trong [WebGL specification](https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.14.13) cho việc xử lý mất ngữ cảnh. Sự kiện [`webglcontextlost`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextlost_event) được gửi đến canvas liên quan với một sự kiện mô phỏng.

## Cú pháp

```js-nolint
loseContext()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Với extension này, bạn có thể mô phỏng sự kiện [`webglcontextlost`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextlost_event):

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");

canvas.addEventListener("webglcontextlost", (event) => {
  console.log(event);
});

gl.getExtension("WEBGL_lose_context").loseContext();

// Sự kiện "webglcontextlost" được kích hoạt.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.isContextLost()")}}
- Sự kiện: [`webglcontextlost`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextlost_event), [`webglcontextrestored`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextrestored_event)
