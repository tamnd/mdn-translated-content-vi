---
title: USBIsochronousInTransferPacket
slug: Web/API/USBIsochronousInTransferPacket
page-type: web-api-interface
status:
  - experimental
browser-compat: api.USBIsochronousInTransferPacket
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện `USBIsochronousInTransferPacket` của [WebUSB API](/en-US/docs/Web/API/WebUSB_API) là một phần của phản hồi từ lệnh gọi phương thức `isochronousTransferIn()` của giao diện `USBDevice`. Nó đại diện cho trạng thái của một gói tin riêng lẻ từ yêu cầu truyền dữ liệu từ thiết bị USB đến USB host qua endpoint isochronous.

## Hàm khởi tạo

- {{domxref("USBIsochronousInTransferPacket.USBIsochronousInTransferPacket", "USBIsochronousInTransferPacket()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `USBIsochronousInTransferPacket` mới với các trường `status` và `data` được cung cấp.

## Thuộc tính phiên bản

- {{domxref("USBIsochronousInTransferPacket.data")}} {{ReadOnlyInline}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về đối tượng `DataView` chứa dữ liệu nhận được từ thiết bị USB trong gói tin này, nếu có.
- {{domxref("USBIsochronousInTransferPacket.status")}} {{ReadOnlyInline}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về trạng thái của yêu cầu truyền, một trong:
    - `"ok"` - Truyền thành công.
    - `"stall"` - Thiết bị chỉ ra lỗi bằng cách tạo điều kiện stall trên endpoint. Stall trên endpoint isochronous không cần được xóa.
    - `"babble"` - Thiết bị đáp lại với nhiều dữ liệu hơn dự kiến.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
