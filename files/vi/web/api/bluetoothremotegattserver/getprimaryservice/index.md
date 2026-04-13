---
title: "BluetoothRemoteGATTServer: phương thức getPrimaryService()"
short-title: getPrimaryService()
slug: Web/API/BluetoothRemoteGATTServer/getPrimaryService
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTServer.getPrimaryService
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`BluetoothRemoteGATTServer.getPrimaryService()`** trả về một promise cho {{domxref("BluetoothRemoteGATTService")}} chính do thiết bị Bluetooth cung cấp cho một UUID dịch vụ Bluetooth được chỉ định.

## Cú pháp

```js-nolint
getPrimaryService(bluetoothServiceUUID)
```

### Tham số

- `bluetoothServiceUUID`
  - : Mã định danh duy nhất toàn cục của một dịch vụ Bluetooth cho thiết bị được chỉ định; có thể là UUID 128 bit, bí danh UUID 16 bit hoặc 32 bit, hoặc một chuỗi trong danh sách khóa của [các dịch vụ GATT được gán](https://github.com/WebBluetoothCG/registries/blob/master/gatt_assigned_services.txt).

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải thành một đối tượng {{domxref("BluetoothRemoteGATTService")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
