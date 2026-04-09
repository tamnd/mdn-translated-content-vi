---
title: "BluetoothUUID: phương thức tĩnh getService()"
short-title: getService()
slug: Web/API/BluetoothUUID/getService_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.BluetoothUUID.getService_static
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}

Phương thức tĩnh **`getService()`** của giao diện {{domxref("BluetoothUUID")}} trả về một UUID đại diện cho một service đã đăng ký khi truyền vào tên hoặc bí danh UUID 16 bit hay 32 bit.

## Cú pháp

```js-nolint
BluetoothUUID.getService(name)
```

### Tham số

- `name`
  - : Một chuỗi chứa tên của service.

### Giá trị trả về

Một UUID 128 bit.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `name` không xuất hiện trong registry.

## Ví dụ

Trong ví dụ sau, UUID đại diện cho service có tên `device_information` được trả về và in ra console.

```js
let result = BluetoothUUID.getService("device_information");
console.log(result); // "0000180a-0000-1000-8000-00805f9b34fb"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
