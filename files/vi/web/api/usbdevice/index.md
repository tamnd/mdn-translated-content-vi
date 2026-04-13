---
title: USBDevice
slug: Web/API/USBDevice
page-type: web-api-interface
status:
  - experimental
browser-compat: api.USBDevice
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`USBDevice`** của [WebUSB API](/en-US/docs/Web/API/WebUSB_API) cung cấp quyền truy cập vào siêu dữ liệu về một thiết bị USB đã được ghép nối và các phương thức để điều khiển thiết bị đó.

## Thuộc tính phiên bản

- {{domxref("USBDevice.configuration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một đối tượng {{domxref("USBConfiguration")}} cho giao diện hiện đang được chọn của thiết bị USB đã ghép nối.
- {{domxref("USBDevice.configurations")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{jsxref("array")}} các giao diện dành riêng cho thiết bị để điều khiển thiết bị USB đã ghép nối.
- {{domxref("USBDevice.deviceClass")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một trong ba thuộc tính dùng để nhận dạng thiết bị USB nhằm mục đích tải trình điều khiển USB phù hợp với thiết bị đó. Hai thuộc tính còn lại là `USBDevice.deviceSubclass` và `USBDevice.deviceProtocol`.
- {{domxref("USBDevice.deviceProtocol")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một trong ba thuộc tính dùng để nhận dạng thiết bị USB nhằm mục đích tải trình điều khiển USB phù hợp với thiết bị đó. Hai thuộc tính còn lại là `USBDevice.deviceClass` và `USBDevice.deviceSubclass`.
- {{domxref("USBDevice.deviceSubclass")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một trong ba thuộc tính dùng để nhận dạng thiết bị USB nhằm mục đích tải trình điều khiển USB phù hợp với thiết bị đó. Hai thuộc tính còn lại là `USBDevice.deviceClass` và `USBDevice.deviceProtocol`.
- {{domxref("USBDevice.deviceVersionMajor")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Số phiên bản chính của thiết bị trong sơ đồ phiên bản ngữ nghĩa.
- {{domxref("USBDevice.deviceVersionMinor")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Số phiên bản phụ của thiết bị trong sơ đồ phiên bản ngữ nghĩa.
- {{domxref("USBDevice.deviceVersionSubminor")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Số phiên bản vá của thiết bị trong sơ đồ phiên bản ngữ nghĩa.
- {{domxref("USBDevice.manufacturerName")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Tên của tổ chức đã sản xuất thiết bị USB.
- {{domxref("USBDevice.opened")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Cho biết liệu một phiên làm việc đã được bắt đầu với thiết bị USB đã ghép nối hay chưa.
- {{domxref("USBDevice.productId")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Mã do nhà sản xuất định nghĩa để nhận dạng thiết bị USB.
- {{domxref("USBDevice.productName")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Tên do nhà sản xuất định nghĩa để nhận dạng thiết bị USB.
- {{domxref("USBDevice.serialNumber")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Số sê-ri do nhà sản xuất định nghĩa cho thiết bị USB cụ thể.
- {{domxref("USBDevice.usbVersionMajor")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một trong ba thuộc tính khai báo phiên bản giao thức USB được thiết bị hỗ trợ. Hai thuộc tính còn lại là `USBDevice.usbVersionMinor` và `USBDevice.usbVersionSubminor`.
- {{domxref("USBDevice.usbVersionMinor")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một trong ba thuộc tính khai báo phiên bản giao thức USB được thiết bị hỗ trợ. Hai thuộc tính còn lại là `USBDevice.usbVersionMajor` và `USBDevice.usbVersionSubminor`.
- {{domxref("USBDevice.usbVersionSubminor")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một trong ba thuộc tính khai báo phiên bản giao thức USB được thiết bị hỗ trợ. Hai thuộc tính còn lại là `USBDevice.usbVersionMajor` và `USBDevice.usbVersionMinor`.
- {{domxref("USBDevice.vendorId")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : ID nhà cung cấp chính thức do usb.org cấp.

## Phương thức phiên bản

- {{domxref("USBDevice.claimInterface()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết khi giao diện được yêu cầu được chiếm giữ để truy cập độc quyền.
- {{domxref("USBDevice.clearHalt()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết khi điều kiện tạm dừng được xóa.
- {{domxref("USBDevice.controlTransferIn()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết với {{domxref("USBInTransferResult")}} khi một lệnh hoặc thao tác trạng thái đã được truyền tới thiết bị USB.
- {{domxref("USBDevice.controlTransferOut()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết với {{domxref("USBOutTransferResult")}} khi một lệnh hoặc thao tác trạng thái đã được truyền từ thiết bị USB.
- {{domxref("USBDevice.close()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết khi tất cả các giao diện đang mở được giải phóng và phiên làm việc với thiết bị đã kết thúc.
- {{domxref("USBDevice.forget()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết sau khi tất cả các giao diện đang mở được giải phóng, phiên làm việc với thiết bị đã kết thúc, và quyền truy cập được đặt lại.
- {{domxref("USBDevice.isochronousTransferIn()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết với {{domxref("USBIsochronousInTransferResult")}} khi thông tin nhạy cảm về thời gian đã được truyền tới thiết bị USB.
- {{domxref("USBDevice.isochronousTransferOut()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết với {{domxref("USBIsochronousOutTransferResult")}} khi thông tin nhạy cảm về thời gian đã được truyền từ thiết bị USB.
- {{domxref("USBDevice.open()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết khi một phiên làm việc với thiết bị đã bắt đầu.
- {{domxref("USBDevice.releaseInterface()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết khi giao diện đã chiếm giữ được giải phóng khỏi truy cập độc quyền.
- {{domxref("USBDevice.reset()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết khi thiết bị được đặt lại và tất cả các thao tác ứng dụng bị hủy bỏ cùng với các promise của chúng bị từ chối.
- {{domxref("USBDevice.selectAlternateInterface()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết khi điểm cuối thay thế được chỉ định được chọn.
- {{domxref("USBDevice.selectConfiguration()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết khi cấu hình được chỉ định được chọn.
- {{domxref("USBDevice.transferIn()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết với {{domxref("USBInTransferResult")}} khi dữ liệu bulk hoặc ngắt được nhận từ thiết bị USB.
- {{domxref("USBDevice.transferOut()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết với {{domxref("USBOutTransferResult")}} khi dữ liệu bulk hoặc ngắt được gửi tới thiết bị USB.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
