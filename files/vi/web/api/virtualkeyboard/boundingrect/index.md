---
title: "VirtualKeyboard: boundingRect property"
short-title: boundingRect
slug: Web/API/VirtualKeyboard/boundingRect
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.VirtualKeyboard.boundingRect
---

{{APIRef("VirtualKeyboard API")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính **`boundingRect`** của giao diện {{domxref("VirtualKeyboard")}} chứa một {{domxref("DOMRect")}} cho biết vị trí và kích thước của bàn phím ảo trên màn hình phủ lên trang web.

Bàn phím ảo trên màn hình sẽ phủ lên viewport khi {{domxref("VirtualKeyboard_API", "Virtual Keyboard API", "", "nocode")}} được dùng để ngăn trình duyệt tự động thay đổi kích thước viewport. Điều này được thực hiện bằng cách đặt thuộc tính {{domxref("VirtualKeyboard.overlaysContent", "overlaysContent")}} thành `true`.

## Giá trị

Một {{domxref("DOMRect")}} cho biết vị trí và kích thước của bàn phím ảo trong viewport.

Tọa độ `x`, `y`, `width`, và `height` của hình chữ nhật hữu ích để định vị lại nội dung trong trang web cần hiển thị ngay cả khi bàn phím ảo đang hiển thị.

```js
const { x, y, width, height } = navigator.virtualKeyboard.boundingRect;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("VirtualKeyboard_API", "The VirtualKeyboard API", "", "nocode")}}
- [Full control with the VirtualKeyboard API](https://developer.chrome.com/docs/web-platform/virtual-keyboard/)
