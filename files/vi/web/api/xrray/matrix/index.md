---
title: "XRRay: matrix property"
short-title: matrix
slug: Web/API/XRRay/matrix
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRRay.matrix
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`matrix`** của giao diện {{DOMxRef("XRRay")}} là một phép biến đổi có thể được sử dụng để đặt vị trí các đối tượng dọc theo `XRRay`. Đây là ma trận 4x4 được cho dưới dạng {{jsxref("Float32Array")}} 16 phần tử theo thứ tự cột chính.

Phép biến đổi từ một tia xuất phát tại [0, 0, 0] và kéo dài theo trục z âm đến tia được mô tả bởi `origin` và `direction` của `XRRay`.

## Giá trị

Một đối tượng {{jsxref("Float32Array")}} 16 phần tử biểu diễn ma trận 4x4 theo thứ tự cột chính.

## Ví dụ

### Sử dụng thuộc tính `matrix`

Thuộc tính `matrix` có thể được sử dụng để định vị các biểu diễn đồ họa của tia khi kết xuất.

```js
let origin = { x: 10.0, y: 10.0, z: 10.0, w: 1.0 };
let direction = { x: 10.0, y: 0.0, z: 0.0, w: 0.0 };
let ray = new XRRay(origin, direction);

// Render the ray using the `ray.matrix` transform
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Float32Array")}}
