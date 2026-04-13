---
title: BluetoothUUID
slug: Web/API/BluetoothUUID
page-type: web-api-interface
browser-compat: api.BluetoothUUID
---

{{APIRef("Bluetooth API")}}

Giao diện **`BluetoothUUID`** của [Web Bluetooth API](/en-US/docs/Web/API/Web_Bluetooth_API) cung cấp cách tra cứu các giá trị Universally Unique Identifier (UUID) theo tên trong [registry](https://www.bluetooth.com/specifications/assigned-numbers/) do Bluetooth SIG duy trì.

## Mô tả

Chuỗi UUID là một UUID 128 bit, ví dụ `00001818-0000-1000-8000-00805f9b34fb`.
Bluetooth registry chứa các danh sách descriptor, service và characteristic được nhận diện bằng các UUID này, bên cạnh bí danh 16 bit hoặc 32 bit và một tên.

Giao diện `BluetoothUUID` cung cấp các phương thức để truy xuất các UUID 128 bit này.

## Phương thức tĩnh

- [`BluetoothUUID.canonicalUUID()`](/en-US/docs/Web/API/BluetoothUUID/canonicalUUID_static) {{Experimental_Inline}}
  - : Trả về UUID 128 bit khi truyền vào bí danh UUID 16 bit hoặc 32 bit.
- [`BluetoothUUID.getCharacteristic()`](/en-US/docs/Web/API/BluetoothUUID/getCharacteristic_static) {{Experimental_Inline}}
  - : Trả về UUID 128 bit đại diện cho một characteristic đã đăng ký khi truyền vào tên hoặc bí danh UUID 16 bit hay 32 bit.
- [`BluetoothUUID.getDescriptor()`](/en-US/docs/Web/API/BluetoothUUID/getDescriptor_static) {{Experimental_Inline}}
  - : Trả về một UUID đại diện cho một descriptor đã đăng ký khi truyền vào tên hoặc bí danh UUID 16 bit hay 32 bit.
- [`BluetoothUUID.getService()`](/en-US/docs/Web/API/BluetoothUUID/getService_static) {{Experimental_Inline}}
  - : Trả về một UUID đại diện cho một service đã đăng ký khi truyền vào tên hoặc bí danh UUID 16 bit hay 32 bit.

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
