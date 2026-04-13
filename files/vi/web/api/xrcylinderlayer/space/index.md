---
title: "XRCylinderLayer: space property"
short-title: space
slug: Web/API/XRCylinderLayer/space
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRCylinderLayer.space
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`space`** của giao diện {{domxref("XRCylinderLayer")}} đại diện cho mối quan hệ không gian của lớp với môi trường vật lý của người dùng.

## Giá trị

Một {{domxref("XRSpace")}}.

## Ví dụ

### Cập nhật không gian của lớp hình trụ

Phương thức {{domxref("XRWebGLBinding.createCylinderLayer()")}} tạo lớp hình trụ và yêu cầu cung cấp thuộc tính `space`. Thuộc tính `XRCylinderLayer.space` có thể được dùng sau khi tạo lớp để lấy không gian được dùng hoặc đặt thành không gian mới.

```js
const cylinderLayer = xrGlBinding.createCylinderLayer({
  space: xrReferenceSpace,
  viewPixelWidth: 512,
  viewPixelHeight: 512,
});

cylinderLayer.space = someOtherSpace;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSpace")}}
- {{domxref("XRWebGLBinding.createCylinderLayer()")}}
