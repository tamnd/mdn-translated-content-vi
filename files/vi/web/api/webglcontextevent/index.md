---
title: WebGLContextEvent
slug: Web/API/WebGLContextEvent
page-type: web-api-interface
browser-compat: api.WebGLContextEvent
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **WebGLContextEvent** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và là giao diện cho một sự kiện được tạo ra để phản hồi với sự thay đổi trạng thái của ngữ cảnh kết xuất WebGL.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("WebGLContextEvent.WebGLContextEvent", "WebGLContextEvent()")}}
  - : Tạo một đối tượng `WebGLContextEvent` mới.

## Thuộc tính phiên bản

_Giao diện này kế thừa các thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("WebGLContextEvent.statusMessage")}}
  - : Một thuộc tính chỉ đọc chứa thông tin bổ sung về sự kiện.

## Phương thức phiên bản

_Giao diện này không định nghĩa bất kỳ phương thức riêng nào, nhưng kế thừa các phương thức từ giao diện cha {{domxref("Event")}}._

## Ví dụ

Với sự trợ giúp của tiện ích mở rộng {{domxref("WEBGL_lose_context")}}, bạn có thể mô phỏng các sự kiện {{domxref("HTMLCanvasElement/webglcontextlost_event", "webglcontextlost")}} và {{domxref("HTMLCanvasElement/webglcontextrestored_event", "webglcontextrestored")}}:

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");

canvas.addEventListener("webglcontextlost", (e) => {
  console.log(e);
});

gl.getExtension("WEBGL_lose_context").loseContext();

// WebGLContextEvent event with type "webglcontextlost" is logged.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.isContextLost()")}}
- {{domxref("WEBGL_lose_context")}}, {{domxref("WEBGL_lose_context.loseContext()")}}, {{domxref("WEBGL_lose_context.restoreContext()")}}
- Sự kiện: [webglcontextlost](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextlost_event), [webglcontextrestored](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextrestored_event), [webglcontextcreationerror](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextcreationerror_event)
