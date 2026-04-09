---
title: "BluetoothRemoteGATTCharacteristic: phương thức writeValue()"
short-title: writeValue()
slug: Web/API/BluetoothRemoteGATTCharacteristic/writeValue
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.BluetoothRemoteGATTCharacteristic.writeValue
---

{{APIRef("Bluetooth API")}}{{Deprecated_header}}{{SecureContext_Header}}

Hãy dùng {{DOMxRef("BluetoothRemoteGATTCharacteristic.writeValueWithResponse()")}} và {{DOMxRef("BluetoothRemoteGATTCharacteristic.writeValueWithoutResponse()")}} thay thế.

Phương thức **`BluetoothRemoteGATTCharacteristic.writeValue()`** đặt thuộc tính `value` của một đối tượng {{domxref("BluetoothRemoteGATTCharacteristic")}} thành các byte chứa trong một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} đã cho, [ghi giá trị đặc tính với phản hồi tùy chọn](https://webbluetoothcg.github.io/web-bluetooth/#writecharacteristicvalue), rồi trả về {{JSxRef("Promise")}} tương ứng.

## Cú pháp

```js-nolint
writeValue(buffer)
```

### Tham số

- `value`
  - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}}.

### Giá trị trả về

Một {{jsxref("Promise")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
