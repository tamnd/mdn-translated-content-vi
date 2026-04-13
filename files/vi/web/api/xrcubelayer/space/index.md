---
title: "XRCubeLayer: thuộc tính space"
short-title: space
slug: Web/API/XRCubeLayer/space
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRCubeLayer.space
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`space`** của giao diện {{domxref("XRCubeLayer")}} đại diện cho mối quan hệ không gian của layer với môi trường vật lý của người dùng.

## Giá trị

Một {{domxref("XRSpace")}}.

## Ví dụ

### Cập nhật space của cube layer

Phương thức {{domxref("XRWebGLBinding.createCubeLayer()")}} tạo một cube layer và yêu cầu phải cung cấp thuộc tính `space`. Thuộc tính `XRCubeLayer.space` có thể được sử dụng sau khi tạo layer để lấy space đang sử dụng hoặc đặt nó thành một space mới.

```js
const cubeLayer = xrGlBinding.createCubeLayer({
  space: xrReferenceSpace,
  viewPixelWidth: 512,
  viewPixelHeight: 512,
});

cubeLayer.space = someOtherSpace;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSpace")}}
- {{domxref("XRWebGLBinding.createCubeLayer()")}}
