---
title: "XRFrame: phương thức getDepthInformation()"
short-title: getDepthInformation()
slug: Web/API/XRFrame/getDepthInformation
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRFrame.getDepthInformation
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`getDepthInformation()`** của giao diện {{domxref("XRFrame")}} trả về một đối tượng {{domxref("XRCPUDepthInformation")}} chứa thông tin độ sâu CPU cho khung đang hoạt động và đang được hoạt họa.

## Cú pháp

```js-nolint
getDepthInformation(view)
```

### Tham số

- `view`
  - : Một đối tượng {{domxref("XRView")}} lấy từ tư thế người xem.

### Giá trị trả về

Một đối tượng {{domxref("XRCPUDepthInformation")}}.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném nếu `"depth-sensing"` không có trong danh sách tính năng được bật cho {{domxref("XRSession")}} này.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu:
    - `XRFrame` không đang hoạt động hoặc không đang được hoạt họa. Việc lấy thông tin độ sâu chỉ hợp lệ trong callback của {{domxref("XRSession.requestAnimationFrame()", "requestAnimationFrame()")}}.
    - {{domxref("XRSession.depthUsage", "depthUsage")}} của phiên không phải là `"cpu-optimized"`.

## Ví dụ

### Lấy thông tin độ sâu CPU

```js
// Make sure to request a session with depth-sensing enabled
const session = navigator.xr.requestSession("immersive-ar", {
  requiredFeatures: ["depth-sensing"],
  depthSensing: {
    usagePreference: ["cpu-optimized", "gpu-optimized"],
    formatPreference: ["luminance-alpha", "float32"],
  },
});

// …

// Obtain depth information in an active and animated frame
function rafCallback(time, frame) {
  session.requestAnimationFrame(rafCallback);
  const pose = frame.getViewerPose(referenceSpace);
  if (pose) {
    for (const view of pose.views) {
      const depthInformation = frame.getDepthInformation(view);
      if (depthInformation) {
        // Do something with the depth information
        renderDepth(depthInformation);
      }
    }
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
