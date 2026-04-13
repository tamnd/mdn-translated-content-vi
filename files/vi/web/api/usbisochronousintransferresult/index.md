---
title: USBIsochronousInTransferResult
slug: Web/API/USBIsochronousInTransferResult
page-type: web-api-interface
status:
  - experimental
browser-compat: api.USBIsochronousInTransferResult
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện `USBIsochronousInTransferResult` của [WebUSB API](/en-US/docs/Web/API/WebUSB_API) cung cấp kết quả từ lệnh gọi phương thức `isochronousTransferIn()` của giao diện `USBDevice`. Nó đại diện cho kết quả từ yêu cầu truyền dữ liệu từ thiết bị USB đến USB host.

## Hàm khởi tạo

- {{domxref("USBIsochronousInTransferResult.USBIsochronousInTransferResult", "USBIsochronousInTransferResult()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `USBIsochronousInTransferResult` mới với các trường `packets` và `data` được cung cấp.

## Thuộc tính phiên bản

- {{domxref("USBIsochronousInTransferResult.data")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về đối tượng `DataView` chứa dữ liệu nhận được từ thiết bị. Đây là dữ liệu kết hợp từ tất cả các gói tin. Xem các đối tượng `DataView` riêng lẻ trong mảng `packets` để biết phần của bộ đệm này chứa dữ liệu từ mỗi gói tin.
- {{domxref("USBIsochronousInTransferResult.packets")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một mảng đối tượng `USBIsochronousInTransferPacket` chứa kết quả của mỗi yêu cầu nhận gói tin từ thiết bị.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
