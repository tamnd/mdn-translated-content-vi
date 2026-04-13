---
title: USBInTransferResult
slug: Web/API/USBInTransferResult
page-type: web-api-interface
status:
  - experimental
browser-compat: api.USBInTransferResult
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện `USBInTransferResult` của [WebUSB API](/en-US/docs/Web/API/WebUSB_API) cung cấp kết quả từ lệnh gọi các phương thức `transferIn()` và `controlTransferIn()` của giao diện `USBDevice`. Nó đại diện cho kết quả từ yêu cầu truyền dữ liệu từ thiết bị USB đến USB host.

## Hàm khởi tạo

- {{domxref("USBInTransferResult.USBInTransferResult", "USBInTransferResult()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `USBInTransferResult` mới với các trường `status` và `data` được cung cấp.

## Thuộc tính phiên bản

- {{domxref("USBInTransferResult.data")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về đối tượng `DataView` chứa dữ liệu nhận được từ thiết bị USB, nếu có.
- {{domxref("USBInTransferResult.status")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về trạng thái của yêu cầu truyền, một trong:
    - `"ok"` - Truyền thành công.
    - `"stall"` - Thiết bị chỉ ra lỗi bằng cách tạo điều kiện stall trên endpoint. Stall trên endpoint điều khiển không cần được xóa. Stall trên endpoint bulk hoặc interrupt phải được xóa bằng cách gọi `clearHalt()` trước khi `transferIn()` có thể được gọi lại.
    - `"babble"` - Thiết bị đáp lại với nhiều dữ liệu hơn dự kiến.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
