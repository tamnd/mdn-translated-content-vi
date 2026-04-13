---
title: WEBGL_lose_context extension
slug: Web/API/WEBGL_lose_context
page-type: webgl-extension
browser-compat: api.WEBGL_lose_context
---

{{APIRef("WebGL")}}

Extension **`WEBGL_lose_context`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cung cấp các hàm để mô phỏng việc mất và khôi phục {{domxref("WebGLRenderingContext")}}.

Các sự kiện liên quan đến mất ngữ cảnh WebGL và ngữ cảnh WebGL được khôi phục được kích hoạt trên đối tượng {{domxref("HTMLCanvasElement")}}.

Extension WebGL có sẵn thông qua phương thức {{domxref("WebGLRenderingContext.getExtension()")}}.

## Thuộc tính phiên bản

Extension này không có thuộc tính riêng.

## Phương thức phiên bản

- {{domxref("WEBGL_lose_context.loseContext()")}}
  - : Mô phỏng việc mất ngữ cảnh.
- {{domxref("WEBGL_lose_context.restoreContext()")}}
  - : Mô phỏng việc khôi phục ngữ cảnh.

## Ví dụ

Với extension này, bạn có thể mô phỏng sự kiện [`webglcontextlost`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextlost_event) và [`webglcontextrestored`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextrestored_event):

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
- Sự kiện: [`webglcontextlost`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextlost_event), [`webglcontextrestored`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextrestored_event), [`webglcontextcreationerror`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextcreationerror_event)
