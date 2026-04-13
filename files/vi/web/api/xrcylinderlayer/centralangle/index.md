---
title: "XRCylinderLayer: centralAngle property"
short-title: centralAngle
slug: Web/API/XRCylinderLayer/centralAngle
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRCylinderLayer.centralAngle
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`centralAngle`** của giao diện {{domxref("XRCylinderLayer")}} đại diện cho góc tính bằng radian của phần hình trụ hiển thị.

## Giá trị

Số đại diện cho góc tính bằng radian của phần hình trụ hiển thị.

## Ví dụ

### Lấy góc trung tâm của lớp

Phương thức {{domxref("XRWebGLBinding.createCylinderLayer()")}} tạo lớp hình trụ và cho phép chỉ định `centralAngle`. Thuộc tính `XRCylinder.centralAngle` có thể được dùng sau khi tạo lớp để lấy góc trung tâm được dùng hoặc đặt thành góc mới.

```js
const cylinderLayer = xrGlBinding.createCylinderLayer({
  space: xrReferenceSpace,
  viewPixelWidth: 1200,
  viewPixelHeight: 600,
  centralAngle: (60 * Math.PI) / 180,
  aspectRatio: 2,
  radius: 2,
  transform: new XRRigidTransform(/* … */),
});

cylinderLayer.centralAngle; // 1.0471975511965976
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRCylinderLayer.aspectRatio")}}
- {{domxref("XRCylinderLayer.radius")}}
- {{jsxref("Math.PI")}}
