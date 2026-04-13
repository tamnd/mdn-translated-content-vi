---
title: USBOutTransferResult
slug: Web/API/USBOutTransferResult
page-type: web-api-interface
status:
  - experimental
browser-compat: api.USBOutTransferResult
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện `USBOutTransferResult` của [WebUSB API](/en-US/docs/Web/API/WebUSB_API) cung cấp kết quả từ lệnh gọi các phương thức `transferOut()` và `controlTransferOut()` của giao diện `USBDevice`. Nó đại diện cho kết quả từ yêu cầu truyền dữ liệu từ USB host đến thiết bị USB.

## Hàm khởi tạo

- {{domxref("USBOutTransferResult.USBOutTransferResult", "USBOutTransferResult()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `USBOutTransferResult` mới với các trường `status` và `bytesWritten` được cung cấp.

## Thuộc tính phiên bản

- {{domxref("USBOutTransferResult.bytesWritten")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về số byte từ yêu cầu truyền đã được gửi đến thiết bị.
- {{domxref("USBOutTransferResult.status")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về trạng thái của yêu cầu truyền, một trong:
    - `"ok"` - Truyền thành công.
    - `"stall"` - Thiết bị chỉ ra lỗi bằng cách tạo điều kiện stall trên endpoint. Stall trên endpoint bulk hoặc interrupt phải được xóa bằng cách gọi `clearHalt()` trước khi `transferOut()` có thể được gọi lại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
