---
title: "USBConfiguration: configurationValue property"
short-title: configurationValue
slug: Web/API/USBConfiguration/configurationValue
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.USBConfiguration.configurationValue
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`configurationValue`** của giao diện {{domxref("USBConfiguration")}} trả về giá trị cấu hình của cấu hình này. Giá trị này bằng với trường [`bConfigurationValue`](https://www.beyondlogic.org/usbnutshell/usb5.shtml#ConfigurationDescriptors) của bộ mô tả cấu hình do thiết bị cung cấp để xác định cấu hình này.

## Giá trị

[Bộ mô tả cấu hình](https://www.beyondlogic.org/usbnutshell/usb5.shtml#ConfigurationDescriptors) của {{domxref("USBDevice")}} được chỉ định trong hàm khởi tạo của phiên bản {{domxref("USBConfiguration")}} hiện tại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
