---
title: "XRRay: direction property"
short-title: direction
slug: Web/API/XRRay/direction
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRRay.direction
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`direction`** của giao diện {{DOMxRef("XRRay")}} là một {{domxref("DOMPointReadOnly")}} biểu diễn vectơ hướng 3 chiều của tia, được chuẩn hóa thành [vectơ đơn vị](https://en.wikipedia.org/wiki/Unit_vector) có độ dài 1.0.

## Giá trị

Một đối tượng {{domxref("DOMPointReadOnly")}}.

## Ví dụ

### Sử dụng thuộc tính `direction`

Thuộc tính `direction` chứa vectơ hướng 3 chiều đã được chuẩn hóa của tia.

```js
let origin = { x: 10.0, y: 10.0, z: 10.0, w: 1.0 };
let direction = { x: 10.0, y: 0.0, z: 0.0, w: 0.0 };
let ray = new XRRay(origin, direction);

ray.direction;
// returns DOMPointReadOnly {x : 1.0, y : 0.0, z : 0.0, w : 0.0}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMPointReadOnly")}}
