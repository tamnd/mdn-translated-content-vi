---
title: USBInterface
slug: Web/API/USBInterface
page-type: web-api-interface
status:
  - experimental
browser-compat: api.USBInterface
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện `USBInterface` của [WebUSB API](/en-US/docs/Web/API/WebUSB_API) cung cấp thông tin về một giao diện được cung cấp bởi thiết bị USB. Một giao diện đại diện cho một tính năng của thiết bị triển khai một giao thức cụ thể và có thể chứa các endpoint cho giao tiếp hai chiều.

## Hàm khởi tạo

- {{domxref("USBInterface.USBInterface", "USBInterface()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `USBInterface` mới sẽ được điền thông tin về giao diện trên `USBConfiguration` đã cung cấp với số giao diện đã cho.

## Thuộc tính phiên bản

- {{domxref("USBInterface.interfaceNumber")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về số giao diện của giao diện này. Bằng với trường `bInterfaceNumber` của mô tả giao diện định nghĩa giao diện này.
- {{domxref("USBInterface.alternate")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về cấu hình thay thế hiện đang được chọn của giao diện này. Theo mặc định, đây là `USBAlternateInterface` từ `alternates` có `alternateSetting` bằng `0`. Nó có thể được thay đổi bằng cách gọi `USBDevice.selectAlternateInterface()` với bất kỳ giá trị nào khác được tìm thấy trong `alternates`.
- {{domxref("USBInterface.alternates")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một mảng chứa các phiên bản giao diện `USBAlternateInterface` mô tả từng cấu hình thay thế có thể cho giao diện này.
- {{domxref("USBInterface.claimed")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về liệu giao diện này có được trang hiện tại yêu cầu bằng cách gọi `USBDevice.claimInterface()` hay không.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
