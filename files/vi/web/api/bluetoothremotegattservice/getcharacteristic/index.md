---
title: "BluetoothRemoteGATTService: phương thức getCharacteristic()"
short-title: getCharacteristic()
slug: Web/API/BluetoothRemoteGATTService/getCharacteristic
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTService.getCharacteristic
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`BluetoothGATTService.getCharacteristic()`** trả về một {{jsxref("Promise")}} tới một thể hiện của {{domxref("BluetoothRemoteGATTCharacteristic")}} cho một mã định danh duy nhất toàn cục (UUID) đã cho.

## Cú pháp

```js-nolint
getCharacteristic(characteristic)
```

### Tham số

- `characteristic`
  - : UUID của một đặc tính, ví dụ `'00002a37-0000-1000-8000-00805f9b34fb'` cho đặc tính Heart Rate Measurement.

### Giá trị trả về

Một {{jsxref("Promise")}} tới một thể hiện của {{domxref("BluetoothRemoteGATTCharacteristic")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
