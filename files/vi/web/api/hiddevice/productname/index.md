---
title: "HIDDevice: thuộc tính productName"
short-title: productName
slug: Web/API/HIDDevice/productName
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HIDDevice.productName
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Thuộc tính chỉ đọc **`productName`** của giao diện {{domxref("HIDDevice")}} trả về tên sản phẩm của thiết bị HID đang kết nối.

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ sau lấy danh sách thiết bị bằng {{domxref("HID.getDevices()")}} và ghi giá trị `productName` ra console.

```js
let devices = await navigator.hid.getDevices();
devices.forEach((device) => {
  console.log(`HID: ${device.productName}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
