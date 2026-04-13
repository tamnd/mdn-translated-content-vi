---
title: "XRRenderState: baseLayer property"
short-title: baseLayer
slug: Web/API/XRRenderState/baseLayer
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRRenderState.baseLayer
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`baseLayer`** của giao diện {{domxref("XRRenderState")}} trả về phiên bản {{domxref("XRWebGLLayer")}} là nguồn của các hình ảnh bitmap và mô tả cách hình ảnh được kết xuất trong thiết bị.

Thuộc tính này chỉ đọc; tuy nhiên, bạn có thể gián tiếp thay đổi giá trị của nó bằng {{domxref("XRSession.updateRenderState")}}.

## Giá trị

Một đối tượng {{domxref("XRWebGLLayer")}} được sử dụng làm nguồn nội dung của thế giới khi kết xuất mỗi frame của cảnh.

Xem các ví dụ dưới đây để biết cách sử dụng {{domxref("XRSession.updateRenderState", "updateRenderState()")}} để đặt `XRWebGLLayer` hiện tại được sử dụng để kết xuất cảnh.

## Ví dụ

Bạn có thể đặt `XRWebGLLayer` được sử dụng để kết xuất bằng cách gọi {{domxref("XRSession.updateRenderState", "updateRenderState()")}}, như sau:

```js
let canvas = document.querySelector("canvas");
gl = canvas.getContext("webgl", { xrCompatible: true });
setNewWebGLLayer();

function setNewWebGLLayer(gl) {
  if (!gl) {
    /* WebGL not available */
    return;
  }

  xrSession.updateRenderState({
    baseLayer: new XRWebGLLayer(xrSession, gl),
  });
}
```

Ở đây, canvas được lấy trong dòng đầu tiên là canvas mà WebGL sẽ vẽ vào. Ngữ cảnh đó được truyền vào {{domxref("XRWebGLLayer.XRWebGLLayer", "XRWebGLLayer()")}} để tạo một `XRWebGLLayer` sử dụng nội dung của ngữ cảnh WebGL `gl` làm nguồn hình ảnh thế giới trong khi trình bày.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
