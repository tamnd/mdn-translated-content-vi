---
title: "USBDevice: phương thức claimInterface()"
short-title: claimInterface()
slug: Web/API/USBDevice/claimInterface
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USBDevice.claimInterface
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`claimInterface()`** của giao diện {{domxref("USBDevice")}} trả về một {{jsxref("promise")}} được giải quyết khi giao diện được yêu cầu được chiếm giữ để truy cập độc quyền.

## Cú pháp

```js-nolint
claimInterface(interfaceNumber)
```

### Tham số

- `interfaceNumber`
  - : Chỉ mục của một trong các giao diện được thiết bị hỗ trợ. Các giao diện mang tính dành riêng cho từng thiết bị.

### Giá trị trả về

Một {{jsxref("promise")}}.

## Ví dụ

Ví dụ sau đây cho thấy `claimInterface()` trong ngữ cảnh kết nối với một thiết bị USB.

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
