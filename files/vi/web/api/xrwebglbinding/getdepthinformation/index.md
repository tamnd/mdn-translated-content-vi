---
title: "XRWebGLBinding: phương thức getDepthInformation()"
short-title: getDepthInformation()
slug: Web/API/XRWebGLBinding/getDepthInformation
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRWebGLBinding.getDepthInformation
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`getDepthInformation()`** của giao diện {{domxref("XRWebGLBinding")}} trả về đối tượng {{domxref("XRWebGLDepthInformation")}} chứa thông tin độ sâu WebGL.

## Cú pháp

```js-nolint
getDepthInformation(view)
```

### Tham số

- `view`
  - : Đối tượng {{domxref("XRView")}} thu được từ tư thế của người xem.

### Giá trị trả về

Đối tượng {{domxref("XRWebGLDepthInformation")}}.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu `"depth-sensing"` không có trong danh sách tính năng được kích hoạt cho {{domxref("XRSession")}} này.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `XRFrame` không hoạt động hoặc không có hoạt hình. Việc lấy thông tin độ sâu chỉ hợp lệ trong callback {{domxref("XRSession.requestAnimationFrame()", "requestAnimationFrame()")}}.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("XRSession.depthUsage", "depthUsage")}} của phiên không phải là `"gpu-optimized"`.

## Ví dụ

### Lấy thông tin độ sâu WebGL

```js
const canvasElement = document.querySelector(".output-canvas");
const gl = canvasElement.getContext("webgl");
await gl.makeXRCompatible();

// Đảm bảo yêu cầu phiên với depth-sensing được kích hoạt
const session = navigator.xr.requestSession("immersive-ar", {
  requiredFeatures: ["depth-sensing"],
  depthSensing: {
    usagePreference: ["gpu-optimized"],
    formatPreference: ["luminance-alpha"],
  },
});

const glBinding = new XRWebGLBinding(session, gl);

// …

// Lấy thông tin độ sâu trong một khung hoạt động và có hoạt hình
function rafCallback(time, frame) {
  session.requestAnimationFrame(rafCallback);
  const pose = frame.getViewerPose(referenceSpace);
  if (pose) {
    for (const view of pose.views) {
      const depthInformation = glBinding.getDepthInformation(view);
      if (depthInformation) {
        // Thực hiện gì đó với thông tin độ sâu
        // gl.bindTexture(gl.TEXTURE_2D, depthInformation.texture);
        // …
      }
    }
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRWebGLDepthInformation.texture")}}
