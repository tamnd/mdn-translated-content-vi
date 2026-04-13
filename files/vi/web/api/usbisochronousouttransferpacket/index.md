---
title: USBIsochronousOutTransferPacket
slug: Web/API/USBIsochronousOutTransferPacket
page-type: web-api-interface
status:
  - experimental
browser-compat: api.USBIsochronousOutTransferPacket
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện `USBIsochronousOutTransferPacket` của [WebUSB API](/en-US/docs/Web/API/WebUSB_API) là một phần của phản hồi từ lệnh gọi phương thức `isochronousTransferOut()` của giao diện `USBDevice`. Nó đại diện cho trạng thái của một gói tin riêng lẻ từ yêu cầu truyền dữ liệu từ USB host đến thiết bị USB qua endpoint isochronous.

## Hàm khởi tạo

- {{domxref("USBIsochronousOutTransferPacket.USBIsochronousOutTransferPacket", "USBIsochronousOutTransferPacket()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `USBIsochronousOutTransferPacket` mới với các trường `status` và `bytesWritten` được cung cấp.

## Thuộc tính phiên bản

- {{domxref("USBIsochronousOutTransferPacket.bytesWritten")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về số byte từ gói tin đã được gửi đến thiết bị.
- {{domxref("USBIsochronousOutTransferPacket.status")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về trạng thái của yêu cầu truyền, một trong:
    - `"ok"` - Truyền thành công.
    - `"stall"` - Thiết bị chỉ ra lỗi bằng cách tạo điều kiện stall trên endpoint. Stall trên endpoint isochronous không cần được xóa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
