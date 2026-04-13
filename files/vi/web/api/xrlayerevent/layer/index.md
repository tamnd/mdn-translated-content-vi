---
title: "XRLayerEvent: thuộc tính layer"
short-title: layer
slug: Web/API/XRLayerEvent/layer
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRLayerEvent.layer
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính **`layer`** của giao diện {{domxref("XRLayerEvent")}} là một tham chiếu đến {{domxref("XRLayer")}} đã tạo ra sự kiện.

## Giá trị

Một {{domxref("XRLayer")}}.

## Ví dụ

### Sử dụng thuộc tính `layer`

Trong ví dụ này, thuộc tính `layer` được sử dụng để lấy đối tượng {{domxref("XRLayer")}} đã gửi sự kiện.

```js
myLayer.addEventListener("redraw", (e) => {
  if (e.layer instanceof XRQuadLayer) {
    // redraw quad layer
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRLayer")}}
