---
title: "XRQuadLayer: space property"
short-title: space
slug: Web/API/XRQuadLayer/space
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRQuadLayer.space
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`space`** của giao diện {{domxref("XRQuadLayer")}} đại diện mối quan hệ không gian của layer với môi trường vật lý của người dùng.

## Giá trị

Một {{domxref("XRSpace")}}.

## Ví dụ

### Đặt kích thước và vị trí của layer

Đoạn code ví dụ này định vị layer cách `newSpace` hai mét với `height` và `width` là 1.5 mét.

```js
const quadLayer = xrGlBinding.createQuadLayer({
  space: xrReferenceSpace,
  viewPixelWidth: 512,
  viewPixelHeight: 512,
});

quadLayer.space = newSpace;
quadLayer.transform = new XRRigidTransform({ z: -2 });
quadLayer.width = 1.5;
quadLayer.height = 1.5;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSpace")}}
- {{domxref("XRQuadLayer.transform")}}
