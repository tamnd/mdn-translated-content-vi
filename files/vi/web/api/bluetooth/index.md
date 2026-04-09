---
title: Bluetooth
slug: Web/API/Bluetooth
page-type: web-api-interface
status:
  - experimental
browser-compat: api.Bluetooth
---

{{APIRef("Bluetooth API")}}{{securecontext_header}}{{SeeCompatTable}}

Giao diện **`Bluetooth`** của [Web Bluetooth API](/en-US/docs/Web/API/Web_Bluetooth_API) cung cấp các phương thức để truy vấn khả năng Bluetooth và yêu cầu quyền truy cập vào thiết bị.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ giao diện cha là {{domxref("EventTarget")}}._

## Phương thức thể hiện

- {{domxref("Bluetooth.getAvailability","Bluetooth.getAvailability()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} giải quyết thành giá trị boolean cho biết user agent có thể hỗ trợ Bluetooth hay không. Một số user agent cho phép người dùng cấu hình một tùy chọn quy định giá trị mà phương thức này trả về.
- {{domxref("Bluetooth.getDevices","Bluetooth.getDevices()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} giải quyết thành một mảng {{domxref("BluetoothDevice")}} mà origin này được phép truy cập. Quyền này có được từ các lần gọi trước tới {{domxref("Bluetooth.requestDevice","Bluetooth.requestDevice()")}}.
- {{domxref("Bluetooth.requestDevice","Bluetooth.requestDevice()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} giải quyết thành một đối tượng {{domxref("BluetoothDevice")}} khớp với các tùy chọn được chỉ định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
