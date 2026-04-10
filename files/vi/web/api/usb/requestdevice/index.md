---
title: "USB: phương thức requestDevice()"
short-title: requestDevice()
slug: Web/API/USB/requestDevice
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USB.requestDevice
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

**`requestDevice()`** là phương thức của giao diện {{domxref("USB")}} trả về một {{jsxref("Promise")}} phân giải thành một thể hiện {{domxref("USBDevice")}} nếu tìm thấy thiết bị được chỉ định. Gọi hàm này sẽ kích hoạt luồng ghép đôi của user agent.

## Cú pháp

```js-nolint
requestDevice(options)
```

### Tham số

- `options`
  - : Một đối tượng thiết lập các tùy chọn để chọn thiết bị phù hợp. Các tùy chọn có sẵn là:
    - `filters`
      - : Một mảng các đối tượng lọc cho những thiết bị có thể ghép đôi. Mỗi đối tượng lọc có thể có các thuộc tính sau:
        - `vendorId`
        - `productId`
        - `classCode`
        - `subclassCode`
        - `protocolCode`
        - `serialNumber`

### Giá trị trả về

Một {{JSxRef("Promise")}} phân giải thành một thể hiện của {{DOMxRef("USBDevice")}}.

## Bảo mật

[Kích hoạt tạm thời](/en-US/docs/Web/Security/Defenses/User_activation) là bắt buộc. Người dùng phải tương tác với trang hoặc một phần tử giao diện người dùng thì tính năng này mới hoạt động.

## Ví dụ

Ví dụ sau tìm một trong hai thiết bị USB. Lưu ý rằng có hai mã sản phẩm được chỉ định. Cả hai đều được truyền vào `requestDevice()`. Điều này kích hoạt luồng của user agent, nhắc người dùng chọn một thiết bị để ghép đôi. Chỉ thiết bị được chọn mới được truyền vào `then()`.

Số lượng bộ lọc không quyết định số thiết bị mà user agent hiển thị. Ví dụ, nếu chỉ tìm thấy một thiết bị USB có mã sản phẩm `0xa800`, thì user agent chỉ liệt kê một thiết bị. Ngược lại, nếu user agent tìm thấy hai thiết bị của mục đầu tiên và một thiết bị của mục thứ hai, thì cả ba thiết bị sẽ được liệt kê.

```js
const filters = [
  { vendorId: 0x1209, productId: 0xa800 },
  { vendorId: 0x1209, productId: 0xa850 },
];
navigator.usb
  .requestDevice({ filters })
  .then((usbDevice) => {
    console.log(`Product name: ${usbDevice.productName}`);
  })
  .catch((e) => {
    console.error(`There is no device. ${e}`);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
