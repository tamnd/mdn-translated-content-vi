---
title: "XREquirectLayer: space property"
short-title: space
slug: Web/API/XREquirectLayer/space
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XREquirectLayer.space
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`space`** của giao diện {{domxref("XREquirectLayer")}} đại diện cho mối quan hệ không gian của lớp với môi trường vật lý của người dùng.

## Giá trị

Một {{domxref("XRSpace")}}.

## Ví dụ

### Cập nhật không gian của lớp equirect

Phương thức {{domxref("XRWebGLBinding.createEquirectLayer()")}} tạo một lớp equirect và yêu cầu thuộc tính `space` phải được cung cấp. Thuộc tính `XREquirectLayer.space` có thể được sử dụng sau khi tạo lớp để lấy không gian đã sử dụng hoặc đặt nó thành một không gian mới.

```js
const equirectLayer = xrGlBinding.createEquirectLayer({
  space: xrReferenceSpace,
  viewPixelWidth: 512,
  viewPixelHeight: 512,
});

equirectLayer.space = someOtherSpace;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSpace")}}
- {{domxref("XRWebGLBinding.createEquirectLayer()")}}
