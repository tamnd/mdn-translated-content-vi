---
title: "USBDevice: phương thức transferOut()"
short-title: transferOut()
slug: Web/API/USBDevice/transferOut
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USBDevice.transferOut
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`transferOut()`** của giao diện {{domxref("USBDevice")}} trả về một {{jsxref("promise")}} được giải quyết với {{domxref("USBOutTransferResult")}} khi dữ liệu bulk hoặc ngắt được gửi tới thiết bị USB.

## Cú pháp

```js-nolint
transferOut(endpointNumber, data)
```

### Tham số

- `endpointNumber`
  - : Số của một điểm cuối dành riêng cho thiết bị (bộ đệm).
- `data`
  - : Một {{jsxref("TypedArray")}} chứa dữ liệu cần gửi tới thiết bị.

### Giá trị trả về

Một {{jsxref("promise")}} được giải quyết với {{domxref("USBOutTransferResult")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
