---
title: HIDConnectionEvent
slug: Web/API/HIDConnectionEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.HIDConnectionEvent
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Giao diện **`HIDConnectionEvent`** của [WebHID API](/en-US/docs/Web/API/WebHID_API) đại diện cho các sự kiện kết nối HID, là loại sự kiện được truyền cho các trình xử lý sự kiện {{domxref("HID/connect_event", "connect")}} và {{domxref("HID/disconnect_event", "disconnect")}} khi trạng thái kết nối của thiết bị thay đổi.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("HIDConnectionEvent.HIDConnectionEvent", "HIDConnectionEvent()")}} {{Experimental_Inline}}
  - : Trả về một đối tượng `HIDConnectionEvent` mới. Thông thường hàm khởi tạo này không được sử dụng vì các sự kiện được tạo khi trạng thái kết nối của thiết bị thay đổi.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("Event")}}._

- {{domxref("HIDConnectionEvent.device")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về phiên bản {{domxref("HIDDevice")}} đại diện cho thiết bị liên kết với sự kiện kết nối.

## Ví dụ

Ví dụ sau đây đăng ký các trình lắng nghe sự kiện cho các sự kiện `connect` và `disconnect`, sau đó in {{domxref("HIDDevice.productName")}} ra console.

```js
navigator.hid.addEventListener("connect", ({ device }) => {
  console.log(`HID connected: ${device.productName}`);
});

navigator.hid.addEventListener("disconnect", ({ device }) => {
  console.log(`HID disconnected: ${device.productName}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
