---
title: WEBGL_lose_context.restoreContext()
slug: Web/API/WEBGL_lose_context/restoreContext
page-type: webgl-extension-method
browser-compat: api.WEBGL_lose_context.restoreContext
---

{{APIRef("WebGL")}}

Phương thức **`WEBGL_lose_context.restoreContext()`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cho phép bạn mô phỏng việc khôi phục {{domxref("WebGLRenderingContext")}}.

## Cú pháp

```js-nolint
restoreContext()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `INVALID_OPERATION` nếu ngữ cảnh chưa bị mất.

## Ví dụ

Với extension này, bạn có thể mô phỏng việc khôi phục ngữ cảnh:

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const ext = gl.getExtension("WEBGL_lose_context");

canvas.addEventListener("webglcontextlost", (event) => {
  event.preventDefault();
  // Khôi phục ngữ cảnh sau độ trễ
  setTimeout(() => ext.restoreContext(), 1000);
});

canvas.addEventListener("webglcontextrestored", (event) => {
  console.log("Ngữ cảnh WebGL đã được khôi phục.");
  // Khởi tạo lại WebGL tại đây
});

// Mô phỏng mất ngữ cảnh
ext.loseContext();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.isContextLost()")}}
- Sự kiện: [`webglcontextlost`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextlost_event), [`webglcontextrestored`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextrestored_event)
