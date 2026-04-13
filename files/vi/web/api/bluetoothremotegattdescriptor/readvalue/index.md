---
title: "BluetoothRemoteGATTDescriptor: phương thức readValue()"
short-title: readValue()
slug: Web/API/BluetoothRemoteGATTDescriptor/readValue
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BluetoothRemoteGATTDescriptor.readValue
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`BluetoothRemoteGATTDescriptor.readValue()`** trả về một {{jsxref("Promise")}} hoàn tất với một {{jsxref("DataView")}} chứa một bản sao của thuộc tính `value` nếu giá trị đó có sẵn và được hỗ trợ. Nếu không, nó sẽ ném ra lỗi.

## Cú pháp

```js-nolint
readValue()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} hoàn tất với một {{jsxref("DataView")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
