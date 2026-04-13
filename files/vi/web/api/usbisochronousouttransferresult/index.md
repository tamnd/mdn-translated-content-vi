---
title: USBIsochronousOutTransferResult
slug: Web/API/USBIsochronousOutTransferResult
page-type: web-api-interface
status:
  - experimental
browser-compat: api.USBIsochronousOutTransferResult
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện `USBIsochronousOutTransferResult` của [WebUSB API](/en-US/docs/Web/API/WebUSB_API) cung cấp kết quả từ lệnh gọi phương thức `isochronousTransferOut()` của giao diện `USBDevice`. Nó đại diện cho kết quả từ yêu cầu truyền dữ liệu từ USB host đến thiết bị USB.

## Hàm khởi tạo

- {{domxref("USBIsochronousOutTransferResult.USBIsochronousOutTransferResult", "USBIsochronousOutTransferResult()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `USBIsochronousOutTransferResult` mới với trường `packet` được cung cấp.

## Thuộc tính phiên bản

- {{domxref("USBIsochronousOutTransferResult.packets")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một mảng đối tượng `USBIsochronousOutTransferPacket` chứa kết quả của mỗi yêu cầu gửi gói tin đến thiết bị.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
