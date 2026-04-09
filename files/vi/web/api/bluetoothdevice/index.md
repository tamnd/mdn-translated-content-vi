---
title: BluetoothDevice
slug: Web/API/BluetoothDevice
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BluetoothDevice
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Giao diện `BluetoothDevice` của [Web Bluetooth API](/en-US/docs/Web/API/Web_Bluetooth_API) biểu diễn một thiết bị Bluetooth bên trong một môi trường thực thi script cụ thể.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

- {{DOMxRef("BluetoothDevice.id")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Một chuỗi định danh duy nhất cho một thiết bị.
- {{DOMxRef("BluetoothDevice.name")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Một chuỗi cung cấp tên dễ đọc cho con người của thiết bị.
- {{DOMxRef("BluetoothDevice.gatt")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Một tham chiếu tới {{DOMxRef("BluetoothRemoteGATTServer")}} của thiết bị.

## Phương thức thể hiện

- {{DOMxRef("BluetoothDevice.watchAdvertisements()")}} {{Experimental_Inline}}
  - : Một {{jsxref("Promise")}} được resolve thành `undefined` hoặc bị reject với lỗi nếu không thể hiển thị quảng bá vì bất kỳ lý do nào.
- {{DOMxRef("BluetoothDevice.forget()")}} {{Experimental_Inline}}
  - : Cung cấp một cách để trang thu hồi quyền truy cập vào một thiết bị mà người dùng đã cấp quyền truy cập.

## Sự kiện

Lắng nghe các sự kiện này bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán một trình nghe sự kiện cho thuộc tính `oneventname` của giao diện này.

- {{DOMxRef("BluetoothDevice/gattserverdisconnected_event", "gattserverdisconnected")}} {{experimental_inline}}
  - : Được kích hoạt trên một thiết bị khi một kết nối GATT đang hoạt động bị mất.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
