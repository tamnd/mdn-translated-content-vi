---
title: "BluetoothRemoteGATTService: phương thức getCharacteristics()"
short-title: getCharacteristics()
slug: Web/API/BluetoothRemoteGATTService/getCharacteristics
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTService.getCharacteristics
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`BluetoothGATTService.getCharacteristics()`** trả về một {{jsxref("Promise")}} tới một danh sách các thể hiện {{domxref("BluetoothRemoteGATTCharacteristic")}} cho một mã định danh duy nhất toàn cục (UUID) đã cho.

## Cú pháp

```js-nolint
getCharacteristics(characteristics)
```

### Tham số

- `characteristics`
  - : UUID của một đặc tính, ví dụ `'00002a37-0000-1000-8000-00805f9b34fb'` cho đặc tính Heart Rate Measurement.

### Giá trị trả về

Một {{jsxref("Promise")}} tới một {{jsxref("Array")}} các thể hiện {{domxref("BluetoothRemoteGATTCharacteristic")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
