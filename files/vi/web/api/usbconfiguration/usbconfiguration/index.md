---
title: "USBConfiguration: USBConfiguration() constructor"
short-title: USBConfiguration()
slug: Web/API/USBConfiguration/USBConfiguration
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.USBConfiguration.USBConfiguration
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Hàm khởi tạo **`USBConfiguration()`** tạo một đối tượng {{domxref("USBConfiguration")}} mới chứa thông tin về cấu hình trên USBDevice được cung cấp với giá trị cấu hình đã cho.

## Cú pháp

```js-nolint
new USBConfiguration(device, configurationValue)
```

### Tham số

- `device`
  - : Chỉ định {{domxref('USBDevice')}} bạn muốn cấu hình.
- `configurationValue`
  - : Chỉ định [bộ mô tả cấu hình](https://www.beyondlogic.org/usbnutshell/usb5.shtml#ConfigurationDescriptors) bạn muốn đọc. Đây là số nguyên không dấu trong phạm vi 0 đến 255.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
