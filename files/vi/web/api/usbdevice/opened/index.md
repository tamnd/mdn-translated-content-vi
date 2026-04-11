---
title: "USBDevice: thuộc tính opened"
short-title: opened
slug: Web/API/USBDevice/opened
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.USBDevice.opened
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`opened`** của giao diện {{domxref("USBDevice")}} cho biết liệu một phiên làm việc đã được bắt đầu với thiết bị USB đã ghép nối hay chưa. Thiết bị phải được mở trước khi trang web có thể điều khiển nó.

## Giá trị

Một {{jsxref("boolean")}}.

## Ví dụ

Ví dụ này dành cho một thiết bị USB giả định có đèn LED nhiều màu. Nó cho thấy cách kiểm tra xem thiết bị đã được mở chưa trước khi gọi {{domxref("USBDevice.controlTransferOut")}} để đặt màu LED được chỉ định.

> [!NOTE]
> Dữ liệu nào có thể được truyền tới thiết bị USB và cách thức truyền là đặc thù và độc đáo đối với từng thiết bị.

```js
async function setDeviceColor(usbDevice, r, g, b) {
  if (device.opened) {
    // This hypothetical USB device requires that the data passed to
    // it be in a Uint8Array.
    const payload = new Uint8Array([r, g, b]);

    await usbDevice.controlTransferOut(
      {
        requestType: "vendor",
        recipient: "device",
        request: 1,
        value: 0,
        index: 0,
      },
      payload,
    );
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
