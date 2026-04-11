---
title: "XRWebGLBinding: hàm tạo XRWebGLBinding()"
short-title: XRWebGLBinding()
slug: Web/API/XRWebGLBinding/XRWebGLBinding
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.XRWebGLBinding.XRWebGLBinding
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Hàm tạo **`XRWebGLBinding()`** tạo và
trả về một đối tượng {{domxref("XRWebGLBinding")}} mới.

## Cú pháp

```js-nolint
new XRWebGLBinding(session, context)
```

### Tham số

- `session`
  - : Đối tượng {{domxref("XRSession")}} xác định phiên WebXR sẽ được
    kết xuất bằng ngữ cảnh WebGL.
- `context`
  - : {{domxref("WebGLRenderingContext")}} hoặc {{domxref("WebGL2RenderingContext")}}
    xác định ngữ cảnh vẽ WebGL để sử dụng kết xuất cảnh cho phiên
    WebXR được chỉ định.

### Giá trị trả về

Một {{domxref("XRWebGLBinding")}} mới.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `XRWebGLBinding` mới không thể được tạo do một trong các tình huống sau:
    - {{domxref("XRSession")}} được chỉ định bởi `session` đã
      bị dừng.
    - Ngữ cảnh WebGL được chỉ định, `context`, [đã bị mất](/en-US/docs/Web/API/WebGLRenderingContext/isContextLost#usage_notes) vì bất kỳ lý do nào, chẳng hạn như chuyển đổi hoặc đặt lại GPU.
    - `session` được chỉ định là immersive nhưng `context`
      không tương thích với WebXR.

## Ví dụ

```js
const canvasElement = document.querySelector(".output-canvas");
const gl = canvasElement.getContext("webgl");
const xrSession = await navigator.xr.requestSession("immersive-vr");
await gl.makeXRCompatible();

const glBinding = new XRWebGLBinding(xrSession, gl);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.makeXRCompatible()")}}
