---
title: "XREquirectLayer: radius property"
short-title: radius
slug: Web/API/XREquirectLayer/radius
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XREquirectLayer.radius
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`radius`** của giao diện {{domxref("XREquirectLayer")}} đại diện cho bán kính của hình cầu.

## Giá trị

Một số đại diện cho bán kính không âm (tính bằng mét) của hình cầu. Giá trị bằng không hoặc vô hạn được coi là đại diện cho một hình cầu vô hạn. Đặt `radius` thành giá trị nhỏ hơn 0 sẽ đặt nó thành 0.

## Ví dụ

### Lấy bán kính của một lớp

Phương thức {{domxref("XRWebGLBinding.createEquirectLayer()")}} tạo một lớp equirect và cho phép chỉ định `radius`. Thuộc tính `XREquirectLayer.radius` có thể được sử dụng sau khi tạo lớp để lấy bán kính đã sử dụng hoặc đặt nó thành một giá trị mới.

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

equirectLayer.radius; // 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XREquirectLayer.centralHorizontalAngle")}}
- {{domxref("XREquirectLayer.lowerVerticalAngle")}}
- {{domxref("XREquirectLayer.upperVerticalAngle")}}
