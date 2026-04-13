---
title: "BluetoothRemoteGATTDescriptor: phương thức writeValue()"
short-title: writeValue()
slug: Web/API/BluetoothRemoteGATTDescriptor/writeValue
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTDescriptor.writeValue
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`BluetoothRemoteGATTDescriptor.writeValue()`** đặt thuộc tính `value` thành các byte chứa trong một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} và trả về một {{jsxref("Promise")}}.

## Cú pháp

```js-nolint
writeValue(buffer)
```

### Tham số

- `buffer`
  - : Đặt giá trị bằng các byte chứa trong bộ đệm.

### Giá trị trả về

Một {{jsxref("Promise")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
