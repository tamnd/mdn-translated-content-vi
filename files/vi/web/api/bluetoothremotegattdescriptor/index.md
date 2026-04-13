---
title: BluetoothRemoteGATTDescriptor
slug: Web/API/BluetoothRemoteGATTDescriptor
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTDescriptor
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Giao diện `BluetoothRemoteGATTDescriptor` của [Web Bluetooth API](/en-US/docs/Web/API/Web_Bluetooth_API) cung cấp một bộ mô tả GATT, dùng để cung cấp thêm thông tin về giá trị của một đặc tính.

## Thuộc tính thể hiện

- {{DOMxRef("BluetoothRemoteGATTDescriptor.characteristic")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về {{DOMxRef("BluetoothRemoteGATTCharacteristic")}} mà bộ mô tả này thuộc về.
- {{DOMxRef("BluetoothRemoteGATTDescriptor.uuid")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về UUID của bộ mô tả đặc tính, ví dụ `"00002902-0000-1000-8000-00805f9b34fb"` cho bộ mô tả Client Characteristic Configuration.
- {{DOMxRef("BluetoothRemoteGATTDescriptor.value")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về giá trị bộ mô tả hiện đang được lưu trong bộ nhớ đệm. Giá trị này được cập nhật khi giá trị của bộ mô tả được đọc.

## Phương thức thể hiện

- {{DOMxRef("BluetoothRemoteGATTDescriptor.readValue()")}} {{Experimental_Inline}}
  - : Trả về một {{JSxRef("Promise")}} hoàn tất với một {{JSxRef("ArrayBuffer")}} chứa một bản sao của thuộc tính `value` nếu có sẵn và được hỗ trợ. Nếu không, nó sẽ ném ra lỗi.
- {{DOMxRef("BluetoothRemoteGATTDescriptor.writeValue()")}} {{Experimental_Inline}}
  - : Đặt thuộc tính `value` thành các byte chứa trong một {{JSxRef("ArrayBuffer")}} và trả về một {{JSxRef("Promise")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
