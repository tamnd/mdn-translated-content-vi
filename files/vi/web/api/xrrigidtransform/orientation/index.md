---
title: "XRRigidTransform: orientation property"
short-title: orientation
slug: Web/API/XRRigidTransform/orientation
page-type: web-api-instance-property
browser-compat: api.XRRigidTransform.orientation
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`orientation`** của giao diện {{domxref("XRRigidTransform")}} là một {{domxref("DOMPointReadOnly")}} chứa một {{Glossary("quaternion")}} được chuẩn hóa (còn gọi là **quaternion đơn vị** hay **[versor](https://en.wikipedia.org/wiki/Versor)**) chỉ định thành phần quay của phép biến đổi được đại diện bởi đối tượng. Nếu bạn chỉ định một quaternion có độ dài không chính xác bằng 1.0 mét, nó sẽ được chuẩn hóa cho bạn.

## Giá trị

Một đối tượng {{domxref("DOMPointReadOnly")}} chứa một quaternion đơn vị cung cấp thành phần hướng của phép biến đổi. Là một quaternion đơn vị, độ dài của quaternion được trả về luôn là 1.0 mét.

## Ví dụ

Để tạo một không gian tham chiếu được định hướng nhìn thẳng lên, được đặt ở độ cao 2 mét so với mặt đất:

```js
xrReferenceSpace = refSpace.getOffsetReferenceSpace(
  new XRRigidTransform({ y: -2 }, { x: 0.0, y: 1.0, z: 0.0, w: 1.0 }),
);
```

Quaternion đơn vị được chỉ định ở đây là \[0.0, 1.0, 0.0, 1.0] để chỉ ra rằng đối tượng phải nhìn trực tiếp dọc theo trục _y_.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chuyển động, hướng và chuyển vị](/en-US/docs/Web/API/WebXR_Device_API/Movement_and_motion)
- [Quaternion đơn vị](https://en.wikipedia.org/wiki/Versor)
- [Quaternion và phép quay trong không gian](https://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation)
