---
title: "GamepadPose: angularAcceleration property"
short-title: angularAcceleration
slug: Web/API/GamepadPose/angularAcceleration
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.GamepadPose.angularAcceleration
---

{{APIRef("WebVR API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`angularAcceleration`** của giao diện {{domxref("GamepadPose")}} trả về một mảng đại diện cho vectơ gia tốc góc của {{domxref("Gamepad")}}, tính bằng mét mỗi giây bình phương.

Nói cách khác, đây là gia tốc hiện tại của vòng quay cảm biến quanh các trục `x`, `y` và `z`.

## Giá trị

Một {{jsxref("Float32Array")}}, hoặc `null` nếu gamepad không thể cung cấp thông tin gia tốc góc.

## Ví dụ

TBD

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
