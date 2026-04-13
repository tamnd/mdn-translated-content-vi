---
title: "XRCylinderLayer: transform property"
short-title: transform
slug: Web/API/XRCylinderLayer/transform
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRCylinderLayer.transform
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`transform`** của giao diện {{domxref("XRCylinderLayer")}} đại diện cho độ lệch và hướng so với {{domxref("XRCylinderLayer.space", "space")}} của lớp.

## Giá trị

Một {{domxref("XRRigidTransform")}}.

## Ví dụ

### Đặt vị trí của lớp hình trụ

Đoạn mã ví dụ này đặt lớp cách hai mét tính từ gốc của `xrReferenceSpace`.

```js
const cylinderLayer = xrGlBinding.createCylinderLayer({
  space: xrReferenceSpace,
  viewPixelWidth: 512,
  viewPixelHeight: 512,
});

cylinderLayer.transform = new XRRigidTransform({ z: -2 });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRRigidTransform")}}
- {{domxref("XRCylinderLayer.space")}}
