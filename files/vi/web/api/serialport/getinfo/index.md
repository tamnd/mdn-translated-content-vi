---
title: "SerialPort: phương thức getInfo()"
short-title: getInfo()
slug: Web/API/SerialPort/getInfo
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.SerialPort.getInfo
---

{{SecureContext_Header}}{{APIRef("Web Serial API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`getInfo()`** của giao diện {{domxref("SerialPort")}} trả về một đối tượng chứa thông tin định danh cho thiết bị có sẵn qua cổng.

## Cú pháp

```js-nolint
getInfo()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng chứa các thuộc tính sau:

- `usbVendorId`
  - : Nếu cổng là một phần của thiết bị USB, thuộc tính này là một số nguyên không dấu ngắn xác định nhà cung cấp thiết bị. Nếu không, nó là `undefined`.
- `usbProductId`
  - : Nếu cổng là một phần của thiết bị USB, thuộc tính này là một số nguyên không dấu ngắn xác định thiết bị USB. Nếu không, nó là `undefined`.
- `bluetoothServiceClassId` {{experimental_inline}}
  - : Nếu cổng là một dịch vụ Bluetooth RFCOMM, thuộc tính này là một số nguyên dài không dấu hoặc chuỗi đại diện cho ID lớp dịch vụ Bluetooth của thiết bị. Nếu không, nó là `undefined`.

## Ví dụ

Đoạn mã này gọi phương thức {{domxref("Serial.requestPort()")}} khi một `<button>` được nhấn. Chúng ta truyền một bộ lọc vào `requestPort()` để lọc cho các thiết bị Arduino Uno USB. Sau khi cổng được yêu cầu, chúng ta gọi `getInfo()` để trả về `usbProductId` và `usbVendorId` của thiết bị.

```html
<button id="connect">Connect</button>
```

```js
const connectBtn = document.getElementById("connect");

// Filter for devices with the Arduino Uno USB Vendor/Product IDs
const filters = [
  { usbVendorId: 0x2341, usbProductId: 0x0043 },
  { usbVendorId: 0x2341, usbProductId: 0x0001 }
];

connectBtn.addEventListener("click", () => {
  try {
    // Prompt the user to select an Arduino Uno device
    const port = await navigator.serial.requestPort({ filters });

    // Return the device's identifying info
    const { usbProductId, usbVendorId } = port.getInfo();
  } catch (e) {
    // The user didn't select a device
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
