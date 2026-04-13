---
title: "BluetoothRemoteGATTCharacteristic: phương thức writeValueWithResponse()"
short-title: writeValueWithResponse()
slug: Web/API/BluetoothRemoteGATTCharacteristic/writeValueWithResponse
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTCharacteristic.writeValueWithResponse
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`BluetoothRemoteGATTCharacteristic.writeValueWithResponse()`** đặt thuộc tính `value` của một đối tượng {{domxref("BluetoothRemoteGATTCharacteristic")}} thành các byte chứa trong một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} đã cho, [ghi giá trị đặc tính với phản hồi bắt buộc](https://webbluetoothcg.github.io/web-bluetooth/#writecharacteristicvalue), rồi trả về {{JSxRef("Promise")}} tương ứng.

## Cú pháp

```js-nolint
writeValueWithResponse(value)
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
