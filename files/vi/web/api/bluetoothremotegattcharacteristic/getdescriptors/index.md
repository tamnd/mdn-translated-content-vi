---
title: "BluetoothRemoteGATTCharacteristic: phương thức getDescriptors()"
short-title: getDescriptors()
slug: Web/API/BluetoothRemoteGATTCharacteristic/getDescriptors
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTCharacteristic.getDescriptors
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`BluetoothRemoteGATTCharacteristic.getDescriptors()`** trả về một {{jsxref("Promise")}} được giải quyết thành một {{jsxref("Array")}} gồm tất cả các đối tượng {{domxref("BluetoothRemoteGATTDescriptor")}} cho một UUID mô tả nhất định.

## Cú pháp

```js-nolint
getDescriptors(bluetoothDescriptorUUID)
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành một {{jsxref("Array")}} gồm các đối tượng {{domxref("BluetoothRemoteGATTDescriptor")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
