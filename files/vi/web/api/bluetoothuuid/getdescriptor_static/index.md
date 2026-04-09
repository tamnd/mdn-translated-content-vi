---
title: "BluetoothUUID: phương thức tĩnh getDescriptor()"
short-title: getDescriptor()
slug: Web/API/BluetoothUUID/getDescriptor_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.BluetoothUUID.getDescriptor_static
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}

Phương thức tĩnh **`getDescriptor()`** của giao diện {{domxref("BluetoothUUID")}} trả về một UUID đại diện cho một descriptor đã đăng ký khi truyền vào tên hoặc bí danh UUID 16 bit hay 32 bit.

## Cú pháp

```js-nolint
BluetoothUUID.getDescriptor(name)
```

### Tham số

- `name`
  - : Một chuỗi chứa tên của descriptor.

### Giá trị trả về

Một UUID 128 bit.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `name` không xuất hiện trong registry.

## Ví dụ

Trong ví dụ sau, UUID đại diện cho descriptor có tên `time_trigger_setting` được trả về và in ra console.

```js
let result = BluetoothUUID.getDescriptor("time_trigger_setting");
console.log(result); // "0000290e-0000-1000-8000-00805f9b34fb"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
