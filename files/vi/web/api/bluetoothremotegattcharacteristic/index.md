---
title: BluetoothRemoteGATTCharacteristic
slug: Web/API/BluetoothRemoteGATTCharacteristic
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTCharacteristic
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Giao diện `BluetoothRemoteGATTCharacteristic` của [Web Bluetooth API](/en-US/docs/Web/API/Web_Bluetooth_API) biểu diễn một đặc tính GATT, là phần tử dữ liệu cơ bản cung cấp thêm thông tin về dịch vụ của thiết bị ngoại vi.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

- {{DOMxRef("BluetoothRemoteGATTCharacteristic.service")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về {{DOMxRef("BluetoothRemoteGATTService")}} mà đặc tính này thuộc về.
- {{DOMxRef("BluetoothRemoteGATTCharacteristic.uuid")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một chuỗi chứa UUID của đặc tính, ví dụ `'00002a37-0000-1000-8000-00805f9b34fb'` cho đặc tính Heart Rate Measurement.
- {{DOMxRef("BluetoothRemoteGATTCharacteristic.properties")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về các thuộc tính của đặc tính này.
- {{DOMxRef("BluetoothRemoteGATTCharacteristic.value")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Giá trị đặc tính hiện đang được lưu trong bộ nhớ đệm. Giá trị này được cập nhật khi giá trị của đặc tính được đọc hoặc được cập nhật thông qua một thông báo hay chỉ báo.

## Phương thức thể hiện

- {{DOMxRef("BluetoothRemoteGATTCharacteristic.getDescriptor()")}} {{Experimental_Inline}}
  - : Trả về một {{JSxRef("Promise")}} được giải quyết thành {{DOMxRef("BluetoothRemoteGATTDescriptor")}} đầu tiên cho một UUID mô tả nhất định.
- {{DOMxRef("BluetoothRemoteGATTCharacteristic.getDescriptors()")}} {{Experimental_Inline}}
  - : Trả về một {{JSxRef("Promise")}} được giải quyết thành một {{JSxRef("Array")}} gồm tất cả các đối tượng {{DOMxRef("BluetoothRemoteGATTDescriptor")}} cho một UUID mô tả nhất định.
- {{DOMxRef("BluetoothRemoteGATTCharacteristic.readValue()")}} {{Experimental_Inline}}
  - : Trả về một {{JSxRef("Promise")}} được giải quyết thành một {{JSxRef("DataView")}} chứa bản sao của thuộc tính `value` nếu thuộc tính này sẵn có và được hỗ trợ. Nếu không, nó sẽ ném ra lỗi.
- {{DOMxRef("BluetoothRemoteGATTCharacteristic.writeValue()")}} {{Deprecated_Inline}}
  - : Đặt thuộc tính `value` thành các byte chứa trong một {{JSxRef("ArrayBuffer")}} nhất định, [ghi giá trị đặc tính với phản hồi tùy chọn](https://webbluetoothcg.github.io/web-bluetooth/#writecharacteristicvalue), rồi trả về {{JSxRef("Promise")}} tương ứng.
- {{DOMxRef("BluetoothRemoteGATTCharacteristic.writeValueWithResponse()")}} {{Experimental_Inline}}
  - : Đặt thuộc tính `value` thành các byte chứa trong một {{JSxRef("ArrayBuffer")}} nhất định, [ghi giá trị đặc tính với phản hồi bắt buộc](https://webbluetoothcg.github.io/web-bluetooth/#writecharacteristicvalue), rồi trả về {{JSxRef("Promise")}} tương ứng.
- {{DOMxRef("BluetoothRemoteGATTCharacteristic.writeValueWithoutResponse()")}} {{Experimental_Inline}}
  - : Đặt thuộc tính `value` thành các byte chứa trong một {{JSxRef("ArrayBuffer")}} nhất định, [ghi giá trị đặc tính mà không cần phản hồi](https://webbluetoothcg.github.io/web-bluetooth/#writecharacteristicvalue), rồi trả về {{JSxRef("Promise")}} tương ứng.
- {{DOMxRef("BluetoothRemoteGATTCharacteristic.startNotifications()")}} {{Experimental_Inline}}
  - : Trả về một {{JSxRef("Promise")}} được giải quyết khi `navigator.bluetooth` được thêm vào ngữ cảnh thông báo đang hoạt động.
- {{DOMxRef("BluetoothRemoteGATTCharacteristic.stopNotifications()")}} {{Experimental_Inline}}
  - : Trả về một {{JSxRef("Promise")}} được giải quyết khi `navigator.bluetooth` bị xóa khỏi ngữ cảnh thông báo đang hoạt động.

## Sự kiện

- {{DOMxRef("BluetoothRemoteGATTCharacteristic/characteristicvaluechanged_event", "characteristicvaluechanged")}} {{Experimental_Inline}}
  - : Được kích hoạt trên `BluetoothRemoteGATTCharacteristic` khi giá trị của nó thay đổi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
