---
title: "XRCylinderLayer: radius property"
short-title: radius
slug: Web/API/XRCylinderLayer/radius
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRCylinderLayer.radius
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`radius`** của giao diện {{domxref("XRCylinderLayer")}} đại diện cho bán kính của hình trụ.

## Giá trị

Số đại diện cho bán kính của hình trụ.

## Ví dụ

### Lấy bán kính của lớp

Phương thức {{domxref("XRWebGLBinding.createCylinderLayer()")}} tạo lớp hình trụ và cho phép chỉ định `radius`. Thuộc tính `XRCylinder.radius` có thể được dùng sau khi tạo lớp để lấy bán kính được dùng hoặc đặt thành bán kính mới.

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

cylinderLayer.radius; // 2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRCylinderLayer.aspectRatio")}}
- {{domxref("XRCylinderLayer.centralAngle")}}
- {{jsxref("Math.PI")}}
