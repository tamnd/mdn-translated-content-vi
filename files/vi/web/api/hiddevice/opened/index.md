---
title: "HIDDevice: thuộc tính opened"
short-title: opened
slug: Web/API/HIDDevice/opened
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HIDDevice.opened
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Thuộc tính chỉ đọc **`opened`** của giao diện {{domxref("HIDDevice")}} trả về `true` nếu kết nối đến {{domxref("HIDDevice")}} đang mở và sẵn sàng truyền dữ liệu.

## Giá trị

Một giá trị boolean, `true` nếu kết nối đang mở.

## Ví dụ

Ví dụ sau lấy danh sách thiết bị bằng {{domxref("HID.getDevices()")}} và ghi giá trị `opened` ra console.

```js
let devices = await navigator.hid.getDevices();
devices.forEach((device) => {
  console.log(`HID: ${device.opened}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
