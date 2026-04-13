---
title: "XRCylinderLayer: aspectRatio property"
short-title: aspectRatio
slug: Web/API/XRCylinderLayer/aspectRatio
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRCylinderLayer.aspectRatio
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`aspectRatio`** của giao diện {{domxref("XRCylinderLayer")}} đại diện cho tỷ lệ của phần hình trụ hiển thị. Đây là tỷ lệ giữa chiều rộng của phần hình trụ hiển thị chia cho chiều cao của nó. Chiều rộng được tính bằng cách nhân {{domxref("XRCylinderLayer.radius", "radius")}} với {{domxref("XRCylinderLayer.centralAngle", "centralAngle")}}.

## Giá trị

Số đại diện cho tỷ lệ của phần hình trụ hiển thị.

## Ví dụ

### Lấy tỷ lệ khung hình của lớp

Phương thức {{domxref("XRWebGLBinding.createCylinderLayer()")}} tạo lớp hình trụ và cho phép chỉ định `aspectRatio`. Thuộc tính `XRCylinder.aspectRatio` có thể được dùng sau khi tạo lớp để lấy tỷ lệ khung hình được dùng hoặc đặt thành tỷ lệ mới.

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

cylinderLayer.aspectRatio; // 2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRCylinderLayer.centralAngle")}}
- {{domxref("XRCylinderLayer.radius")}}
