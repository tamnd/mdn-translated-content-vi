---
title: "XRRay: origin property"
short-title: origin
slug: Web/API/XRRay/origin
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRRay.origin
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`origin`** của giao diện {{DOMxRef("XRRay")}} là một {{domxref("DOMPointReadOnly")}} biểu diễn điểm 3 chiều trong không gian mà tia xuất phát từ đó, tính bằng mét.

## Giá trị

Một đối tượng {{domxref("DOMPointReadOnly")}}.

## Ví dụ

### Sử dụng thuộc tính `origin`

Thuộc tính `origin` chứa điểm 3 chiều trong không gian mà tia xuất phát từ đó, tính bằng mét.

```js
let origin = { x: 10.0, y: 10.0, z: 10.0, w: 1.0 };
let direction = { x: 10.0, y: 0.0, z: 0.0, w: 0.0 };
let ray = new XRRay(origin, direction);

ray.origin;
// returns DOMPointReadOnly {x : 10.0, y : 10.0, z : 10.0, w : 1.0}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMPointReadOnly")}}
