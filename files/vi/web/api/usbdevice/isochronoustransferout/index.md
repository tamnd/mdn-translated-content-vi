---
title: "USBDevice: phương thức isochronousTransferOut()"
short-title: isochronousTransferOut()
slug: Web/API/USBDevice/isochronousTransferOut
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USBDevice.isochronousTransferOut
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`isochronousTransferOut()`** của giao diện {{domxref("USBDevice")}} trả về một {{jsxref("Promise")}} được giải quyết với {{domxref("USBIsochronousOutTransferResult")}} khi thông tin nhạy cảm về thời gian đã được truyền từ thiết bị USB.

## Cú pháp

```js-nolint
isochronousTransferOut(endpointNumber, data, packetLengths)
```

### Tham số

- `endpointNumber`
  - : Số của một điểm cuối dành riêng cho thiết bị (bộ đệm).
- `data`
  - : Một {{jsxref("TypedArray")}} chứa dữ liệu cần gửi tới thiết bị.
- `packetLengths`
  - : Một mảng các độ dài cho các gói tin đang được truyền.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với {{domxref("USBIsochronousOutTransferResult")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
