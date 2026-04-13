---
title: WebGLObject
slug: Web/API/WebGLObject
page-type: web-api-interface
status:
  - experimental
browser-compat: api.WebGLObject
---

{{APIRef("WebGL")}}{{SeeCompatTable}}{{AvailableInWorkers}}

**`WebGLObject`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và là giao diện cha cho tất cả các đối tượng WebGL.

Đối tượng này không có thuộc tính hoặc phương thức công khai nào.

Nếu ngữ cảnh WebGL bị mất, cờ nội bộ _invalidated_ của tất cả các phiên bản `WebGLObject` được đặt thành `true`.

## Các đối tượng kế thừa từ `WebGLObject`

WebGL 1:

- {{domxref("WebGLBuffer")}}
- {{domxref("WebGLFramebuffer")}}
- {{domxref("WebGLProgram")}}
- {{domxref("WebGLRenderbuffer")}}
- {{domxref("WebGLShader")}}
- {{domxref("WebGLTexture")}}

WebGL 2:

- {{domxref("WebGLQuery")}} (và `WebGLTimerQueryEXT`)
- {{domxref("WebGLSampler")}}
- {{domxref("WebGLSync")}}
- {{domxref("WebGLTransformFeedback")}}
- {{domxref("WebGLVertexArrayObject")}} (và `WebGLVertexArrayObjectOES`)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`WebGLRenderingContext.isContextLost()`](/en-US/docs/Web/API/WebGLRenderingContext/isContextLost)
- [`WEBGL_lose_context`](/en-US/docs/Web/API/WEBGL_lose_context)
- [Sự kiện `webglcontextlost`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextlost_event)
