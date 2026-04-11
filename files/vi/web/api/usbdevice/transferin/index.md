---
title: "USBDevice: phương thức transferIn()"
short-title: transferIn()
slug: Web/API/USBDevice/transferIn
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USBDevice.transferIn
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`transferIn()`** của giao diện {{domxref("USBDevice")}} trả về một {{jsxref("promise")}} được giải quyết với {{domxref("USBInTransferResult")}} khi dữ liệu bulk hoặc ngắt được nhận từ thiết bị USB.

## Cú pháp

```js-nolint
transferIn(endpointNumber, length)
```

### Tham số

- `endpointNumber`
  - : Số của một điểm cuối dành riêng cho thiết bị (bộ đệm).
- `length`
  - : Số byte tối đa sẽ được đọc lại từ thiết bị. Dữ liệu thực tế nằm trong {{domxref("USBInTransferResult")}} trong Promise được giải quyết.

### Giá trị trả về

Một {{jsxref("promise")}} được giải quyết với {{domxref("USBInTransferResult")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
