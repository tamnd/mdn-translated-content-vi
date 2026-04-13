---
title: "USB: phương thức getDevices()"
short-title: getDevices()
slug: Web/API/USB/getDevices
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USB.getDevices
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

**`getDevices`** là phương thức của giao diện {{DOMxRef("USB")}} trả về một {{JSxRef("Promise")}} phân giải thành một mảng các đối tượng {{DOMxRef("USBDevice")}} đại diện cho những thiết bị đã ghép đôi và đang được kết nối. Để biết thông tin về việc ghép đôi thiết bị, xem {{DOMxRef("USB.requestDevice()")}}.

## Cú pháp

```js-nolint
getDevices()
```

### Tham số

Không có.

### Giá trị trả về

Một {{JSxRef("Promise")}} phân giải thành một mảng các đối tượng {{DOMxRef("USBDevice")}}.

## Ví dụ

Ví dụ sau ghi nhật ký tên sản phẩm và số sê-ri của các thiết bị đã ghép đôi vào console. Để biết thông tin về việc ghép đôi thiết bị, xem {{DOMxRef("USB.requestDevice","USB.requestDevice()")}}.

```js
navigator.usb.getDevices().then((devices) => {
  console.log(`Tổng số thiết bị: ${devices.length}`);
  devices.forEach((device) => {
    console.log(
      `Tên sản phẩm: ${device.productName}, số sê-ri ${device.serialNumber}`,
    );
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
