---
title: "XRRay: XRRay() constructor"
short-title: XRRay()
slug: Web/API/XRRay/XRRay
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.XRRay.XRRay
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Hàm khởi tạo **`XRRay()`** tạo một đối tượng {{domxref("XRRay")}} mới, là một tia hình học được mô tả bởi một điểm gốc và một vectơ hướng.

## Cú pháp

```js-nolint
new XRRay()
new XRRay(origin)
new XRRay(origin, direction)
new XRRay(transform)
```

### Tham số

- `origin` {{Optional_Inline}}
  - : Một đối tượng điểm xác định điểm 3 chiều trong không gian mà tia xuất phát từ đó, tính bằng mét. Tất cả các chiều đều là tùy chọn, nhưng nếu được cung cấp, thuộc tính `w` của gốc phải là 1.0. Đối tượng được khởi tạo mặc định là `{ x: 0.0, y: 0.0, z: 0.0, w: 1.0 }`.
- `direction` {{Optional_Inline}}
  - : Một đối tượng vectơ xác định vectơ hướng 3 chiều của tia. Tất cả các chiều đều là tùy chọn, nhưng nếu được cung cấp, thuộc tính `w` của hướng phải là 0.0. Đối tượng được khởi tạo mặc định là: `{ x: 0.0, y: 0.0, z: -1.0, w: 0.0 }`.
- `transform` {{Optional_Inline}}
  - : Một đối tượng {{domxref("XRRigidTransform")}} biểu diễn vị trí và hướng của tia.

### Giá trị trả về

Một đối tượng {{domxref("XRRay")}} mới được tạo.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu một trong các điều kiện sau được đáp ứng:
    - Tất cả tọa độ `x`, `y`, và `z` của `direction` đều bằng không.
    - Tọa độ `w` của `direction` không phải là 0.0.
    - Tọa độ `w` của `origin` không phải là 1.0.

## Ví dụ

### Tạo đối tượng `XRRay`

Hàm khởi tạo `XRRay()` cho phép tạo các tia mới bằng cách cung cấp điểm `origin` và vectơ `direction`, hoặc bằng cách truyền vào một đối tượng {{domxref("XRRigidTransform")}}.

```js
// Default configuration
let ray1 = new XRRay();

// Specifying origin, leaving direction as default
let ray2 = new XRRay({ y: 0.5 });

// Specifying both, origin and direction
let origin = { x: 10.0, y: 10.0, z: 10.0, w: 1.0 };
let direction = { x: 10.0, y: 0.0, z: 0.0, w: 0.0 };
let ray3 = new XRRay(origin, direction);

// Using DOMPoint.fromPoint
let ray4 = new XRRay(DOMPoint.fromPoint(origin), DOMPoint.fromPoint(direction));

// Using rigid transform
let rigidTransform = new XRRigidTransform(
  DOMPoint.fromPoint(origin),
  DOMPoint.fromPoint(direction),
);
let ray5 = new XRRay(rigidTransform);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMPoint")}}
- {{domxref("DOMPoint.fromPoint_static", "DOMPoint.fromPoint()")}}
