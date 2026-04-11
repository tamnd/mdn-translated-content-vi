---
title: "USBDevice: thuộc tính configuration"
short-title: configuration
slug: Web/API/USBDevice/configuration
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.USBDevice.configuration
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`configuration`** của giao diện {{domxref("USBDevice")}} trả về một đối tượng {{domxref("USBConfiguration")}} cho giao diện hiện đang được chọn của thiết bị USB đã ghép nối.

## Giá trị

Một đối tượng {{domxref("USBConfiguration")}}.

## Ví dụ

Ví dụ sau đây sử dụng thuộc tính này để kiểm tra sự tồn tại của thuộc tính USBConfiguration nhằm chọn cấu hình trước khi chiếm giữ giao diện.

```js
async function connectDevice(usbDevice) {
  await usbDevice.open();
  if (usbDevice.configuration === null) await usbDevice.selectConfiguration(1);
  await usbDevice.claimInterface(0);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
