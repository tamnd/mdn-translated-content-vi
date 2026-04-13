---
title: "USBDevice: phương thức selectConfiguration()"
short-title: selectConfiguration()
slug: Web/API/USBDevice/selectConfiguration
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USBDevice.selectConfiguration
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`selectConfiguration()`** của giao diện {{domxref("USBDevice")}} trả về một {{jsxref("promise")}} được giải quyết khi cấu hình được chỉ định được chọn.

## Cú pháp

```js-nolint
selectConfiguration(configurationValue)
```

### Tham số

- `configurationValue`
  - : Số của một cấu hình dành riêng cho thiết bị.

### Giá trị trả về

Một {{jsxref("promise")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
