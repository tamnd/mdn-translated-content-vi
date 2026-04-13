---
title: BluetoothRemoteGATTService
slug: Web/API/BluetoothRemoteGATTService
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTService
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Giao diện `BluetoothRemoteGATTService` của [Web Bluetooth API](/en-US/docs/Web/API/Web_Bluetooth_API) biểu diễn một dịch vụ do máy chủ GATT cung cấp, bao gồm một thiết bị, một danh sách các dịch vụ được tham chiếu và một danh sách các đặc tính của dịch vụ này.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

- {{domxref("BluetoothRemoteGATTService.device")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về thông tin về một thiết bị Bluetooth thông qua một thể hiện của {{domxref("BluetoothDevice")}}.
- {{domxref("BluetoothRemoteGATTService.isPrimary")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một giá trị boolean cho biết đây là dịch vụ chính hay dịch vụ phụ.
- {{domxref("BluetoothRemoteGATTService.uuid")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một chuỗi biểu diễn UUID của dịch vụ này.

## Phương thức thể hiện

- {{domxref("BluetoothRemoteGATTService.getCharacteristic()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} tới một thể hiện của {{domxref("BluetoothRemoteGATTCharacteristic")}} cho một mã định danh duy nhất toàn cục (UUID) đã cho.
- {{domxref("BluetoothRemoteGATTService.getCharacteristics()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} tới một {{jsxref("Array")}} các thể hiện {{domxref("BluetoothRemoteGATTCharacteristic")}} cho một mã định danh duy nhất toàn cục (UUID) tùy chọn.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
