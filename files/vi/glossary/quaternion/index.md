---
title: Tứ nguyên
slug: Glossary/Quaternion
page-type: glossary-definition
sidebar: glossarysidebar
---

**Quaternion** (số tứ nguyên) là thương của hai vector 3D và được dùng trong đồ họa 3D và trong các cảm biến gia tốc để biểu diễn dữ liệu hướng hoặc góc quay.

Mặc dù quaternion toán học phức tạp hơn, **quaternion đơn vị** (unit quaternions) hay **quaternion quay** (rotational quaternions) được dùng để biểu diễn phép quay khi sử dụng {{Glossary("WebGL")}} hoặc [WebXR](/en-US/docs/Web/API/WebXR_Device_API), ví dụ, được biểu diễn bằng cú pháp giống như một điểm 3D. Do đó, kiểu {{domxref("DOMPoint")}} (hoặc {{domxref("DOMPointReadOnly")}}) được dùng để lưu trữ quaternion.

## Xem thêm

- [Quaternions and spatial rotation](https://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation) trên Wikipedia
- [Quaternion](https://en.wikipedia.org/wiki/Quaternion) trên Wikipedia
- {{domxref("XRRigidTransform.orientation")}} trong tham chiếu WebXR Device API
