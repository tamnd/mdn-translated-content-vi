---
title: "XRSession: thuộc tính interactionMode"
short-title: interactionMode
slug: Web/API/XRSession/interactionMode
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRSession.interactionMode
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`interactionMode`** của giao diện {{domxref("XRSession")}} mô tả không gian tốt nhất (theo tác nhân người dùng) để ứng dụng vẽ giao diện người dùng tương tác cho phiên hiện tại.

## Giá trị

Một chuỗi mô tả không gian tốt nhất (theo tác nhân người dùng) để ứng dụng vẽ giao diện người dùng tương tác cho phiên hiện tại.

Các giá trị có thể là:

- `screen-space`
  - : Cho biết giao diện người dùng nên được vẽ trực tiếp lên màn hình mà không cần chiếu. Đây thường là chế độ được báo cáo từ các thiết bị cầm tay.
- `world-space`
  - : Cho biết giao diện người dùng nên được vẽ trong thế giới, cách người dùng một khoảng cách, để họ có thể tương tác với nó bằng bộ điều khiển. Đây thường là chế độ được báo cáo từ các thiết bị đeo đầu.

## Ví dụ

```js
if (xrSession.interactionMode === "world-space") {
  // draw UI in the world
} else {
  // draw UI directly to the screen
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
