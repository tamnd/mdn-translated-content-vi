---
title: BluetoothRemoteGATTServer
slug: Web/API/BluetoothRemoteGATTServer
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTServer
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Giao diện **`BluetoothRemoteGATTServer`** của [Web Bluetooth API](/en-US/docs/Web/API/Web_Bluetooth_API) biểu diễn một máy chủ GATT trên một thiết bị từ xa.

## Thuộc tính thể hiện

- {{DOMxRef("BluetoothRemoteGATTServer.connected")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một giá trị boolean trả về `true` trong khi môi trường thực thi script này đang kết nối tới `this.device`. Giá trị này có thể là `false` ngay cả khi user agent vẫn đang kết nối vật lý.
- {{DOMxRef("BluetoothRemoteGATTServer.device")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một tham chiếu tới {{DOMxRef("BluetoothDevice")}} đang chạy máy chủ này.

## Phương thức thể hiện

- {{DOMxRef("BluetoothRemoteGATTServer.connect()")}} {{Experimental_Inline}}
  - : Khiến môi trường thực thi script kết nối tới `this.device`.
- {{DOMxRef("BluetoothRemoteGATTServer.disconnect()")}} {{Experimental_Inline}}
  - : Khiến môi trường thực thi script ngắt kết nối khỏi `this.device`.
- {{DOMxRef("BluetoothRemoteGATTServer.getPrimaryService()")}} {{Experimental_Inline}}
  - : Trả về một promise cho {{DOMxRef("BluetoothRemoteGATTService")}} chính do thiết bị Bluetooth cung cấp cho một `BluetoothServiceUUID` được chỉ định.
- {{DOMxRef("BluetoothRemoteGATTServer.getPrimaryServices()")}} {{Experimental_Inline}}
  - : Trả về một promise cho danh sách các đối tượng {{DOMxRef("BluetoothRemoteGATTService")}} chính do thiết bị Bluetooth cung cấp cho một `BluetoothServiceUUID` được chỉ định.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
