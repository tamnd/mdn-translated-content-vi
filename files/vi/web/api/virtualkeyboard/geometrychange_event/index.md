---
title: "VirtualKeyboard: geometrychange event"
short-title: geometrychange
slug: Web/API/VirtualKeyboard/geometrychange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.VirtualKeyboard.geometrychange_event
---

{{APIRef("VirtualKeyboard API")}}{{SeeCompatTable}}{{securecontext_header}}

Sự kiện **`geometrychange`** của giao diện {{domxref("VirtualKeyboard")}} được kích hoạt khi bàn phím ảo trên màn hình được bật/tắt giữa trạng thái hiển thị và ẩn.

Sự kiện `geometrychange` hữu ích để phát hiện khi bàn phím ảo xuất hiện và biến mất, để bạn có thể điều chỉnh bố cục cho phù hợp. Điều này cần thiết khi sử dụng {{domxref("VirtualKeyboard_API", "Virtual Keyboard API", "", "nocode")}} để vô hiệu hóa việc tự động thay đổi kích thước viewport mặc định của trình duyệt khi bàn phím ảo được hiển thị và ẩn.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("geometrychange", (event) => { })

ongeometrychange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Đoạn code sau sử dụng sự kiện `geometrychange` để phát hiện khi hình học của bàn phím ảo thay đổi, sau đó truy cập thuộc tính {{domxref("VirtualKeyboard.boundingRect", "boundingRect")}} để truy vấn kích thước và vị trí của bàn phím ảo:

```js
if ("virtualKeyboard" in navigator) {
  navigator.virtualKeyboard.overlaysContent = true;

  navigator.virtualKeyboard.addEventListener("geometrychange", (event) => {
    const { x, y, width, height } = event.target.boundingRect;
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("VirtualKeyboard_API", "The VirtualKeyboard API", "", "nocode")}}
- [Full control with the VirtualKeyboard API](https://developer.chrome.com/docs/web-platform/virtual-keyboard/)
