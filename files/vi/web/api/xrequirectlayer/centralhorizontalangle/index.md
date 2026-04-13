---
title: "XREquirectLayer: centralHorizontalAngle property"
short-title: centralHorizontalAngle
slug: Web/API/XREquirectLayer/centralHorizontalAngle
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XREquirectLayer.centralHorizontalAngle
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`centralHorizontalAngle`** của giao diện {{domxref("XREquirectLayer")}} đại diện cho góc ngang trung tâm tính bằng radian cho hình cầu.

## Giá trị

Một số đại diện cho góc ngang trung tâm tính bằng radian cho hình cầu. Đặt `centralHorizontalAngle` thành giá trị nhỏ hơn 0 sẽ đặt nó thành 0 và đặt thành giá trị lớn hơn 2π sẽ đặt nó thành 2π.

## Ví dụ

### Lấy góc ngang trung tâm của một lớp

Phương thức {{domxref("XRWebGLBinding.createEquirectLayer()")}} tạo một lớp equirect và cho phép chỉ định `centralHorizontalAngle`. Thuộc tính `XREquirectLayer.centralHorizontalAngle` có thể được sử dụng sau khi tạo lớp để lấy góc ngang trung tâm đã sử dụng hoặc đặt nó thành một giá trị mới.

```js
const equirectLayer = xrGlBinding.createEquirectLayer({
  space: xrReferenceSpace,
  viewPixelWidth: 1200,
  viewPixelHeight: 600,
  centralHorizontalAngle: 2 * Math.PI,
  upperVerticalAngle: Math.PI / 2.0,
  lowerVerticalAngle: -Math.PI / 2.0,
  radius: 0,
});

equirectLayer.centralHorizontalAngle; // 6.283185307179586
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XREquirectLayer.radius")}}
- {{domxref("XREquirectLayer.lowerVerticalAngle")}}
- {{domxref("XREquirectLayer.upperVerticalAngle")}}
