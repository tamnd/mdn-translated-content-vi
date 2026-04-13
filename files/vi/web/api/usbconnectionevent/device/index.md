---
title: "USBConnectionEvent: thuộc tính device"
short-title: device
slug: Web/API/USBConnectionEvent/device
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.USBConnectionEvent.device
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`device`** của giao diện {{domxref("USBConnectionEvent")}} trả về một đối tượng {{domxref("USBDevice")}} đại diện cho thiết bị đang được kết nối hoặc ngắt kết nối.

## Giá trị

Một đối tượng {{domxref("USBDevice")}}.

## Ví dụ

Kết nối một thiết bị USB kích hoạt sự kiện `connect`. {{domxref("USBDevice")}} hiện tại được trả về bằng cách gọi `event.device`.

```js
navigator.usb.addEventListener("connect", (event) => {
  console.log(event.device);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
