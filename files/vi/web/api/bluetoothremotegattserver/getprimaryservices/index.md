---
title: "BluetoothRemoteGATTServer: phương thức getPrimaryServices()"
short-title: getPrimaryServices()
slug: Web/API/BluetoothRemoteGATTServer/getPrimaryServices
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTServer.getPrimaryServices
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`BluetoothRemoteGATTServer.getPrimaryServices()`** trả về một promise cho danh sách các đối tượng {{domxref("BluetoothRemoteGATTService")}} chính do thiết bị Bluetooth cung cấp cho một `BluetoothServiceUUID` được chỉ định.

## Cú pháp

```js-nolint
getPrimaryServices(bluetoothServiceUUID)
```

### Tham số

- `bluetoothServiceUUID`
  - : Một mã định danh duy nhất toàn cục của dịch vụ Bluetooth cho thiết bị được chỉ định.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải thành một danh sách các đối tượng {{domxref("BluetoothRemoteGATTService")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
