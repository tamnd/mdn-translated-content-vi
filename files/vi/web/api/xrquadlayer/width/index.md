---
title: "XRQuadLayer: width property"
short-title: width
slug: Web/API/XRQuadLayer/width
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRQuadLayer.width
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`width`** của giao diện {{domxref("XRQuadLayer")}} đại diện chiều rộng của layer tính bằng mét.

## Giá trị

Một số đại diện chiều rộng của layer tính bằng mét.

## Ví dụ

### Đặt kích thước và vị trí của layer

Đoạn code ví dụ này định vị layer cách gốc của `xrReferenceSpace` hai mét với `height` và `width` là 1.5 mét.

```js
const quadLayer = xrGlBinding.createQuadLayer({
  space: xrReferenceSpace,
  viewPixelWidth: 512,
  viewPixelHeight: 512,
});

quadLayer.transform = new XRRigidTransform({ z: -2 });
quadLayer.width = 1.5;
quadLayer.height = 1.5;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRQuadLayer.height")}}
