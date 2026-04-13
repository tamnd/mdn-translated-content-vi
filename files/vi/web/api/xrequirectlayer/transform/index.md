---
title: "XREquirectLayer: transform property"
short-title: transform
slug: Web/API/XREquirectLayer/transform
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XREquirectLayer.transform
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`transform`** của giao diện {{domxref("XREquirectLayer")}} đại diện cho độ lệch và hướng tương đối với {{domxref("XREquirectLayer.space", "space")}} của lớp.

## Giá trị

Một {{domxref("XRRigidTransform")}}.

## Ví dụ

### Đặt vị trí của lớp equirect

Ví dụ này đặt lớp cách gốc của `xrReferenceSpace` hai mét.

```js
const equirectLayer = xrGlBinding.createEquirectLayer({
  space: xrReferenceSpace,
  viewPixelWidth: 512,
  viewPixelHeight: 512,
});

equirectLayer.transform = new XRRigidTransform({ z: -2 });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRRigidTransform")}}
- {{domxref("XREquirectLayer.space")}}
