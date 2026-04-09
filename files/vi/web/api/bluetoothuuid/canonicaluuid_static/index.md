---
title: "BluetoothUUID: phương thức tĩnh canonicalUUID()"
short-title: canonicalUUID()
slug: Web/API/BluetoothUUID/canonicalUUID_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.BluetoothUUID.canonicalUUID_static
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}

Phương thức tĩnh **`canonicalUUID()`** của giao diện {{domxref("BluetoothUUID")}} trả về UUID 128 bit khi truyền vào bí danh UUID 16 bit hoặc 32 bit.

## Cú pháp

```js-nolint
BluetoothUUID.canonicalUUID(alias)
```

### Tham số

- `alias`
  - : Một chuỗi chứa bí danh UUID 16 bit hoặc 32 bit.

### Giá trị trả về

Một UUID 128 bit.

## Ví dụ

Trong ví dụ sau, UUID được biểu diễn bằng bí danh `0x110A` được trả về và in ra console.

```js
let result = BluetoothUUID.canonicalUUID("0x110A");
console.log(result); // "0000110a-0000-1000-8000-00805f9b34fb"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
