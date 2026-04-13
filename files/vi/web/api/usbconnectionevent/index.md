---
title: USBConnectionEvent
slug: Web/API/USBConnectionEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.USBConnectionEvent
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`USBConnectionEvent`** của {{domxref('WebUSB API','','',' ')}} là loại sự kiện được truyền vào các sự kiện `USB` {{domxref("USB.connect_event", "connect")}} và {{domxref("USB.disconnect_event", "disconnect")}} khi user agent phát hiện một thiết bị USB mới được kết nối hoặc ngắt kết nối.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("USBConnectionEvent.USBConnectionEvent", "USBConnectionEvent()")}} {{Experimental_Inline}}
  - : Trả về một đối tượng `USBConnectionEvent`.

## Thuộc tính phiên bản

- {{domxref("USBConnectionEvent.device")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một đối tượng {{domxref("USBDevice")}} đại diện cho thiết bị hiện tại.

## Ví dụ

Trong ví dụ sau, việc lắng nghe các sự kiện connect và disconnect được sử dụng để thêm và xóa các thiết bị khỏi giao diện người dùng của ứng dụng.

```js
navigator.usb.addEventListener("connect", (event) => {
  // Add event.device to the UI.
});

navigator.usb.addEventListener("disconnect", (event) => {
  // Remove event.device from the UI.
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
