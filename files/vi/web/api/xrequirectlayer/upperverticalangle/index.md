---
title: "XREquirectLayer: upperVerticalAngle property"
short-title: upperVerticalAngle
slug: Web/API/XREquirectLayer/upperVerticalAngle
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XREquirectLayer.upperVerticalAngle
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`upperVerticalAngle`** của giao diện {{domxref("XREquirectLayer")}} đại diện cho góc dọc trên tính bằng radian cho hình cầu.

## Giá trị

Một số đại diện cho góc dọc trên tính bằng radian cho hình cầu. Đặt `upperVerticalAngle` thành giá trị nhỏ hơn -π/2 sẽ đặt nó thành -π/2 và đặt thành giá trị lớn hơn π/2 sẽ đặt nó thành π/2.

## Ví dụ

### Lấy góc dọc trên của một lớp

Phương thức {{domxref("XRWebGLBinding.createEquirectLayer()")}} tạo một lớp equirect và cho phép chỉ định `upperVerticalAngle`. Thuộc tính `XREquirectLayer.upperVerticalAngle` có thể được sử dụng sau khi tạo lớp để lấy góc dọc trên đã sử dụng hoặc đặt nó thành một giá trị mới.

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

equirectLayer.upperVerticalAngle; // 1.5707963267948966
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XREquirectLayer.radius")}}
- {{domxref("XREquirectLayer.centralHorizontalAngle")}}
- {{domxref("XREquirectLayer.lowerVerticalAngle")}}
