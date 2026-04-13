---
title: USBAlternateInterface
slug: Web/API/USBAlternateInterface
page-type: web-api-interface
status:
  - experimental
browser-compat: api.USBAlternateInterface
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện `USBAlternateInterface` của [WebUSB API](/en-US/docs/Web/API/WebUSB_API) cung cấp thông tin về một cấu hình cụ thể của giao diện được cung cấp bởi thiết bị USB. Một giao diện bao gồm một hoặc nhiều cài đặt thay thế có thể cấu hình một tập hợp endpoint dựa trên chế độ hoạt động của thiết bị.

## Hàm khởi tạo

- {{domxref("USBAlternateInterface.USBAlternateInterface", "USBAlternateInterface()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `USBAlternateInterface` mới sẽ được điền thông tin về giao diện thay thế của `USBInterface` đã cung cấp với số cài đặt thay thế đã cho.

## Thuộc tính phiên bản

- {{domxref("USBAlternateInterface.alternateSetting")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về số cài đặt thay thế của giao diện này. Bằng với trường `bAlternateSetting` của mô tả giao diện định nghĩa giao diện này.
- {{domxref("USBAlternateInterface.interfaceClass")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về lớp của giao diện này. Bằng với trường `bInterfaceClass` của mô tả giao diện định nghĩa giao diện này. [Các giá trị chuẩn](https://www.usb.org/defined-class-codes) cho trường này được định nghĩa bởi USB Implementers Forum. Giá trị `0xFF` biểu thị giao diện do nhà cung cấp định nghĩa.
- {{domxref("USBAlternateInterface.interfaceSubclass")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về lớp con của giao diện này. Bằng với trường `bInterfaceSubClass` của mô tả giao diện định nghĩa giao diện này. Ý nghĩa của giá trị này phụ thuộc vào trường `interfaceClass`.
- {{domxref("USBAlternateInterface.interfaceProtocol")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về giao thức được hỗ trợ bởi giao diện này. Bằng với trường `bInterfaceProtocol` của mô tả giao diện định nghĩa giao diện này. Ý nghĩa của giá trị này phụ thuộc vào các trường `interfaceClass` và `interfaceSubclass`.
- {{domxref("USBAlternateInterface.interfaceName")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tên của giao diện, nếu thiết bị cung cấp. Đây là giá trị của mô tả chuỗi với chỉ số được chỉ định bởi trường `iInterface` của mô tả giao diện định nghĩa giao diện này.
- {{domxref("USBAlternateInterface.endpoints")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một mảng chứa các phiên bản giao diện `USBEndpoint` mô tả từng endpoint là một phần của giao diện này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
