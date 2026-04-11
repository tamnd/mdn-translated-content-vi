---
title: "HIDDevice: thuộc tính productId"
short-title: productId
slug: Web/API/HIDDevice/productId
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HIDDevice.productId
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Thuộc tính chỉ đọc **`productId`** của giao diện {{domxref("HIDDevice")}} trả về ID sản phẩm của thiết bị HID đang kết nối.

## Giá trị

Một số nguyên. Nếu thiết bị không có ID sản phẩm hoặc không thể truy cập ID sản phẩm, giá trị này sẽ là `0`.

## Ví dụ

Ví dụ sau lấy danh sách thiết bị bằng {{domxref("HID.getDevices()")}} và ghi giá trị `productId` ra console.

```js
let devices = await navigator.hid.getDevices();
devices.forEach((device) => {
  console.log(`HID: ${device.productId}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
