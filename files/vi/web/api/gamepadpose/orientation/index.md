---
title: "GamepadPose: orientation property"
short-title: orientation
slug: Web/API/GamepadPose/orientation
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.GamepadPose.orientation
---

{{APIRef("WebVR API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`orientation`** của giao diện {{domxref("GamepadPose")}} trả về hướng của {{domxref("Gamepad")}}, dưới dạng giá trị quaternion.

Giá trị là một {{jsxref("Float32Array")}}, bao gồm các giá trị sau:

- pitch (độ nghiêng) — góc quay quanh trục X.
- yaw (xoay ngang) — góc quay quanh trục Y.
- roll (lăn) — góc quay quanh trục Z.
- w — chiều thứ tư (thường là 1).

Góc yaw (xoay quanh trục y) là tương đối so với góc yaw ban đầu của cảm biến khi lần đầu tiên được đọc.

## Giá trị

Một {{jsxref("Float32Array")}}, hoặc `null` nếu cảm biến VR không thể cung cấp dữ liệu hướng.

## Ví dụ

TBD

> [!NOTE]
> Hướng `{ x: 0, y: 0, z: 0, w: 1 }` được coi là "hướng về phía trước".

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
