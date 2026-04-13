---
title: "XRCompositionLayer: mipLevels property"
short-title: mipLevels
slug: Web/API/XRCompositionLayer/mipLevels
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRCompositionLayer.mipLevels
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`mipLevels`** của giao diện {{domxref("XRCompositionLayer")}} là số lượng mip level trong dữ liệu màu sắc và texture của layer. Xem thêm [Mipmap](https://en.wikipedia.org/wiki/Mipmap) trên Wikipedia.

Số lượng mip level mong muốn có thể được chỉ định khi tạo layer. Tuy nhiên, nếu user agent không thể tạo số lượng được yêu cầu, nó có thể tạo ít hơn. Sử dụng `mipLevels` để xác định số lượng mip level thực tế cho một layer.

`viewPixelWidth` và `viewPixelHeight` cần là lũy thừa của hai vì chúng được giảm đi một nửa ở mỗi mip level.

## Giá trị

Một số bằng hoặc nhỏ hơn số mip level được yêu cầu khi tạo layer.

## Ví dụ

### Lấy mip level của layer

Thuộc tính `mipLevels` cho biết số lượng mip level thực tế đã được tạo. Trong ví dụ này, số lượng mong muốn là 5 mip level được yêu cầu cho một {{domxref("XRQuadLayer")}} đã được đáp ứng đầy đủ.

```js
let xrGLBinding = new XRWebGLBinding(session, gl);
let quadLayer = xrGLBinding.createQuadLayer({
  space: refSpace,
  viewPixelHeight: 512,
  viewPixelWidth: 512,
  width: 1.0,
  height: 1.0,
  mipLevels: 5,
  transform: new XRRigidTransform({
    /* … */
  }),
});

quadLayer.mipLevels; // 5
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Mipmap](https://en.wikipedia.org/wiki/Mipmap) trên Wikipedia
