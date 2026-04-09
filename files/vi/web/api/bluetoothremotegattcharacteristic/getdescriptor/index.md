---
title: "BluetoothRemoteGATTCharacteristic: phương thức getDescriptor()"
short-title: getDescriptor()
slug: Web/API/BluetoothRemoteGATTCharacteristic/getDescriptor
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTCharacteristic.getDescriptor
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`BluetoothRemoteGATTCharacteristic.getDescriptor()`** trả về một {{jsxref("Promise")}} được giải quyết thành {{domxref("BluetoothRemoteGATTDescriptor")}} đầu tiên cho một UUID mô tả nhất định.

## Cú pháp

```js-nolint
getDescriptor(bluetoothDescriptorUUID)
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành {{domxref("BluetoothRemoteGATTDescriptor")}} đầu tiên.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
