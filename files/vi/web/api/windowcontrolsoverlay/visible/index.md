---
title: "WindowControlsOverlay: thuộc tính visible"
short-title: visible
slug: Web/API/WindowControlsOverlay/visible
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.WindowControlsOverlay.visible
---

{{APIRef("Window Controls Overlay API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`visible`** của giao diện {{domxref("WindowControlsOverlay")}} trả về một {{Glossary("Boolean")}} cho biết lớp phủ điều khiển cửa sổ có hiển thị hay không.

Lớp phủ điều khiển cửa sổ sẽ không hiển thị nếu:

- Thành viên [`display_override`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display_override) của Web App Manifest không được đặt thành `window-controls-overlay`.
- Hoặc, nếu người dùng đã từ chối tính năng này.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
if (navigator.windowControlsOverlay.visible) {
  // Execute code if the controls overlay is visible.
} else {
  // Do something else when it isn't visible.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("WindowControlsOverlay")}} mà nó thuộc về.
