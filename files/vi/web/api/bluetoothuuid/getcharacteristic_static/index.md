---
title: "BluetoothUUID: phương thức tĩnh getCharacteristic()"
short-title: getCharacteristic()
slug: Web/API/BluetoothUUID/getCharacteristic_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.BluetoothUUID.getCharacteristic_static
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}

Phương thức tĩnh **`getCharacteristic()`** của giao diện {{domxref("BluetoothUUID")}} trả về một UUID đại diện cho một characteristic đã đăng ký khi truyền vào tên hoặc bí danh UUID 16 bit hay 32 bit.

## Cú pháp

```js-nolint
BluetoothUUID.getCharacteristic(name)
```

### Tham số

- `name`
  - : Một chuỗi chứa tên của characteristic.

### Giá trị trả về

Một UUID 128 bit.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `name` không xuất hiện trong registry.

## Ví dụ

Trong ví dụ sau, UUID đại diện cho characteristic có tên `apparent_wind_direction` được trả về và in ra console.

```js
let result = BluetoothUUID.getCharacteristic("apparent_wind_direction");
console.log(result); // "00002a73-0000-1000-8000-00805f9b34fb"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
