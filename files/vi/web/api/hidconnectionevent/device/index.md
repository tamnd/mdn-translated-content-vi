---
title: "HIDConnectionEvent: device property"
short-title: device
slug: Web/API/HIDConnectionEvent/device
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HIDConnectionEvent.device
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Thuộc tính chỉ đọc **`device`** của giao diện {{domxref("HIDConnectionEvent")}} trả về {{domxref("HIDDevice")}} được liên kết với sự kiện kết nối này.

## Giá trị

Một {{domxref("HIDDevice")}}.

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
