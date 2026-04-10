---
title: HID
slug: Web/API/HID
page-type: web-api-interface
status:
  - experimental
browser-compat: api.HID
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Giao diện **`HID`** cung cấp các phương thức để kết nối với _thiết bị HID_, liệt kê các thiết bị HID đang được gắn và các trình xử lý sự kiện cho thiết bị HID đã kết nối.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Giao diện này cũng kế thừa các thuộc tính của giao diện cha, {{domxref("EventTarget")}}._

## Phương thức thể hiện

_Giao diện này cũng kế thừa các phương thức của giao diện cha, {{domxref("EventTarget")}}._

- {{domxref("HID.getDevices","getDevices()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một mảng các thiết bị HID đã kết nối mà người dùng trước đó đã cấp quyền truy cập thông qua lệnh gọi {{domxref("HID.requestDevice","requestDevice()")}}.
- {{domxref("HID.requestDevice","requestDevice()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một mảng các đối tượng {{domxref("HIDDevice")}} đã kết nối. Gọi hàm này sẽ kích hoạt luồng cấp quyền của user agent để giành quyền truy cập vào một thiết bị được chọn từ danh sách thiết bị được trả về.

### Sự kiện

- {{domxref("HID.connect_event", "connect")}} {{Experimental_Inline}}
  - : Được phát ra khi một thiết bị HID được kết nối.
- {{domxref("HID.disconnect_event", "disconnect")}} {{Experimental_Inline}}
  - : Được phát ra khi một thiết bị HID bị ngắt kết nối.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebHID API](/en-US/docs/Web/API/WebHID_API)
