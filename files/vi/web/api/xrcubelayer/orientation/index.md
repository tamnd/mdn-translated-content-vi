---
title: "XRCubeLayer: thuộc tính orientation"
short-title: orientation
slug: Web/API/XRCubeLayer/orientation
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRCubeLayer.orientation
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`orientation`** của giao diện {{domxref("XRCubeLayer")}} đại diện cho hướng tương đối với thuộc tính `space`.

## Giá trị

Một {{domxref("DOMPointReadOnly")}}.

## Ví dụ

### Cập nhật hướng của cube layer

Phương thức {{domxref("XRWebGLBinding.createCubeLayer()")}} tạo một cube layer và cho phép chỉ định `orientation`. Thuộc tính `XRCubeLayer.orientation` có thể được sử dụng sau khi tạo layer để lấy hướng hiện tại hoặc đặt nó thành một hướng mới.

```js
const cubeLayer = xrGlBinding.createCubeLayer({
  space: xrReferenceSpace,
  viewPixelWidth: 512,
  viewPixelHeight: 512,
  orientation: DOMPointReadOnly.fromPoint({ x: 0.0, y: 0.0, z: 0.0, w: 1.0 }),
});

cubeLayer.orientation = someOtherPoint;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMPointReadOnly")}}
- {{domxref("XRSpace")}}
- {{domxref("XRWebGLBinding.createCubeLayer()")}}
