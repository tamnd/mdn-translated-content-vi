---
title: "USBDevice: phương thức selectAlternateInterface()"
short-title: selectAlternateInterface()
slug: Web/API/USBDevice/selectAlternateInterface
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USBDevice.selectAlternateInterface
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`selectAlternateInterface()`** của giao diện {{domxref("USBDevice")}} trả về một {{jsxref("promise")}} được giải quyết khi điểm cuối thay thế được chỉ định được chọn.

## Cú pháp

```js-nolint
selectAlternateInterface(interfaceNumber, alternateSetting)
```

### Tham số

- `interfaceNumber`
  - : Chỉ mục của một trong các giao diện được thiết bị hỗ trợ. Các giao diện mang tính dành riêng cho từng thiết bị.
- `alternateSetting`
  - : Cấu hình của giao diện đã chọn.

### Giá trị trả về

Một {{jsxref("promise")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
