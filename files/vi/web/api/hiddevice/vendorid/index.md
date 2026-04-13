---
title: "HIDDevice: thuộc tính vendorId"
short-title: vendorId
slug: Web/API/HIDDevice/vendorId
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HIDDevice.vendorId
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Thuộc tính chỉ đọc **`vendorId`** của giao diện {{domxref("HIDDevice")}} trả về ID nhà cung cấp của thiết bị HID đang kết nối. ID này xác định nhà sản xuất thiết bị.

## Giá trị

Một số nguyên. Nếu thiết bị không có ID nhà cung cấp hoặc không thể truy cập ID nhà cung cấp, giá trị này sẽ là `0`.

## Ví dụ

Ví dụ sau lấy danh sách thiết bị bằng {{domxref("HID.getDevices()")}} và ghi giá trị `vendorId` ra console.

```js
let devices = await navigator.hid.getDevices();
devices.forEach((device) => {
  console.log(`HID: ${device.vendorId}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
