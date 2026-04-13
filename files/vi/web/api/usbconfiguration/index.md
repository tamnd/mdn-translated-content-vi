---
title: USBConfiguration
slug: Web/API/USBConfiguration
page-type: web-api-interface
status:
  - experimental
browser-compat: api.USBConfiguration
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện `USBConfiguration` của [WebUSB API](/en-US/docs/Web/API/WebUSB_API) cung cấp thông tin về một cấu hình cụ thể của thiết bị USB và các giao diện mà nó hỗ trợ.

## Hàm khởi tạo

- {{domxref("USBConfiguration.USBConfiguration", "USBConfiguration()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `USBConfiguration` mới chứa thông tin về cấu hình trên `USBDevice` được cung cấp với giá trị cấu hình đã cho.

## Thuộc tính phiên bản

- {{domxref("USBConfiguration.configurationValue")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về giá trị cấu hình của cấu hình này. Giá trị này bằng với trường [`bConfigurationValue`](https://www.beyondlogic.org/usbnutshell/usb5.shtml#ConfigurationDescriptors) của bộ mô tả cấu hình do thiết bị cung cấp để xác định cấu hình này.
- {{domxref("USBConfiguration.configurationName")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tên do thiết bị cung cấp để mô tả cấu hình này. Giá trị này bằng với giá trị của bộ mô tả chuỗi với chỉ số được cung cấp trong trường [`iConfiguration`](https://www.beyondlogic.org/usbnutshell/usb5.shtml#ConfigurationDescriptors) của bộ mô tả cấu hình xác định cấu hình này.
- {{domxref("USBConfiguration.interfaces")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về mảng chứa các phiên bản của {{domxref('USBInterface')}} mô tả từng giao diện được hỗ trợ bởi cấu hình này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
