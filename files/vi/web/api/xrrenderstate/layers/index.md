---
title: "XRRenderState: layers property"
short-title: layers
slug: Web/API/XRRenderState/layers
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRRenderState.layers
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`layers`** của giao diện {{domxref("XRRenderState")}} là một mảng có thứ tự chứa các đối tượng {{domxref("XRLayer")}} được hiển thị bởi bộ kết hợp XR.

## Giá trị

Một mảng có thứ tự chứa các đối tượng {{domxref("XRLayer")}}. Thứ tự của các lớp là "từ sau ra trước".

## Ví dụ

### Lấy các lớp trạng thái kết xuất

Để đọc mảng các lớp WebXR, hãy sử dụng thuộc tính `layers` trên {{domxref("XRRenderState")}}. Các lớp có thể được đặt bằng phương thức {{domxref("XRSession.updateRenderState()")}}.

```js
const xrSession = navigator.xr.requestSession("immersive-ar", {
  optionalFeatures: ["layers"],
});

function onXRSessionStarted(xrSession) {
  const glCanvas = document.createElement("canvas");
  const gl = glCanvas.getContext("webgl", { xrCompatible: true });
  const xrGlBinding = new XRWebGLBinding(xrSession, gl);
  const projectionLayer = new XRWebGLLayer(xrSession, gl);
  const quadLayer = xrGlBinding.createQuadLayer({
    pixelWidth: 1024,
    pixelHeight: 1024,
  });

  xrSession.updateRenderState({
    layers: [projectionLayer, quadLayer],
  });

  xrSession.renderState.layers; // [projectionLayer, quadLayer]
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSession.updateRenderState()")}}
