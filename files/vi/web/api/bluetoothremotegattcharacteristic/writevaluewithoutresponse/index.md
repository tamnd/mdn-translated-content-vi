---
title: "BluetoothRemoteGATTCharacteristic: phương thức writeValueWithoutResponse()"
short-title: writeValueWithoutResponse()
slug: Web/API/BluetoothRemoteGATTCharacteristic/writeValueWithoutResponse
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTCharacteristic.writeValueWithoutResponse
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`BluetoothRemoteGATTCharacteristic.writeValueWithoutResponse()`** đặt thuộc tính `value` của một đối tượng {{domxref("BluetoothRemoteGATTCharacteristic")}} thành các byte chứa trong một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} đã cho, [ghi giá trị đặc tính mà không cần phản hồi](https://webbluetoothcg.github.io/web-bluetooth/#writecharacteristicvalue), rồi trả về {{JSxRef("Promise")}} tương ứng.

## Cú pháp

```js-nolint
writeValueWithoutResponse(value)
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
