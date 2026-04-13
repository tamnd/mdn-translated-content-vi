---
title: "USBDevice: phương thức isochronousTransferIn()"
short-title: isochronousTransferIn()
slug: Web/API/USBDevice/isochronousTransferIn
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USBDevice.isochronousTransferIn
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`isochronousTransferIn()`** của giao diện {{domxref("USBDevice")}} trả về một {{jsxref("Promise")}} được giải quyết với {{domxref("USBIsochronousInTransferResult")}} khi thông tin nhạy cảm về thời gian đã được truyền tới (nhận bởi) thiết bị USB.

## Cú pháp

```js-nolint
isochronousTransferIn(endpointNumber, packetLengths)
```

### Tham số

- `endpointNumber`
  - : Số của một điểm cuối dành riêng cho thiết bị (bộ đệm).
- `packetLengths`
  - : Một mảng các độ dài cho các gói tin đang được nhận.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với {{domxref("USBIsochronousInTransferResult")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
