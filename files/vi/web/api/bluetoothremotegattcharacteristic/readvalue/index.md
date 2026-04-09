---
title: "BluetoothRemoteGATTCharacteristic: phương thức readValue()"
short-title: readValue()
slug: Web/API/BluetoothRemoteGATTCharacteristic/readValue
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTCharacteristic.readValue
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`BluetoothRemoteGATTCharacteristic.readValue()`** trả về một {{jsxref("Promise")}} được giải quyết thành một {{jsxref("DataView")}} chứa bản sao của thuộc tính `value` nếu thuộc tính này sẵn có và được hỗ trợ. Nếu không, nó sẽ ném ra lỗi.

## Cú pháp

```js-nolint
readValue()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành một {{jsxref("DataView")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
