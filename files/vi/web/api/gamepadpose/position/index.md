---
title: "GamepadPose: position property"
short-title: position
slug: Web/API/GamepadPose/position
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.GamepadPose.position
---

{{APIRef("WebVR API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`position`** của giao diện {{domxref("GamepadPose")}} trả về vị trí của {{domxref("Gamepad")}} dưới dạng vectơ 3D.

Hệ tọa độ như sau:

- X dương là phía bên phải của người dùng.
- Y dương là hướng lên trên.
- Z dương là phía sau người dùng.

Các vị trí được đo bằng mét tính từ một điểm gốc, điểm gốc này là vị trí cảm biến được đọc lần đầu tiên.

## Giá trị

Một {{jsxref("Float32Array")}}, hoặc `null` nếu gamepad không thể cung cấp dữ liệu vị trí.

> [!NOTE]
> Các tác nhân người dùng có thể cung cấp các giá trị vị trí mô phỏng thông qua một số kỹ thuật nhất định; khi làm như vậy, họ vẫn nên báo cáo {{domxref("GamepadPose.hasPosition")}} là false.

## Ví dụ

TBD

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
