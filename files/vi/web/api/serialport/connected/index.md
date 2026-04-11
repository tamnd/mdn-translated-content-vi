---
title: "SerialPort: thuộc tính connected"
short-title: connected
slug: Web/API/SerialPort/connected
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.SerialPort.connected
---

{{SecureContext_Header}}{{APIRef("Web Serial API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`connected`** của giao diện {{domxref("SerialPort")}} trả về giá trị boolean cho biết liệu cổng có được [kết nối logic](/en-US/docs/Web/API/SerialPort/connect_event#description) với thiết bị hay không.

## Mô tả

Khi một thiết bị không dây ra khỏi vùng phủ sóng của máy chủ, bất kỳ cổng nối tiếp không dây nào được mở bởi ứng dụng web sẽ tự động đóng, mặc dù nó vẫn được kết nối logic. Trong trường hợp đó, ứng dụng web có thể cố gắng mở lại cổng bằng cách sử dụng {{domxref("SerialPort.open()")}}.

Tuy nhiên, nếu thiết bị không dây bị ngắt kết nối có chủ ý (ví dụ, nếu người dùng chọn ngắt kết nối nó bằng bảng điều khiển hệ điều hành), ứng dụng web nên tránh mở lại cổng để ngăn việc kết nối lại với thiết bị không dây.

Đoạn mã sau đây cho thấy cách thuộc tính `connected` có thể được sử dụng để phân biệt hai trường hợp này:

```js
const ports = await navigator.serial.getPorts();
for (const port of ports) {
  if (port.connected) {
    // The port is logically connected
    // automatically try to reopen the port
    await port.open({ baudRate: 9600 });
  } else {
    // The port is not logically connected; at this point you could
    // prompt the user to make sure the Bluetooth device is available, and
    // Show a "connect" button to allow them to try opening the port if desired
  }
}
```

## Giá trị

Một boolean — `true` nếu cổng được kết nối logic, và `false` nếu không.

## Ví dụ

### Ghi nhật ký khi cổng được kết nối

Đoạn mã sau đây gọi {{domxref("Serial.requestPort()")}} khi người dùng nhấn một {{htmlelement("button")}}, nhắc họ chọn một cổng nối tiếp để kết nối, sau đó ghi thông báo vào console báo cáo trạng thái kết nối:

```js
requestPortButton.addEventListener("click", async () => {
  const port = await navigator.serial.requestPort();
  console.log(`Requested serial port. Connected: ${port.connected}`);
});
```

### Ghi trạng thái kết nối khi kết nối và ngắt kết nối

Bạn có thể sử dụng đoạn mã sau để ghi trạng thái kết nối khi các sự kiện {{domxref("SerialPort.connect_event", "connect")}} và {{domxref("SerialPort.disconnect_event", "disconnect")}} kích hoạt:

```js
navigator.serial.addEventListener("connect", ({ target: port }) => {
  console.log(`Connect event fired. Connected: ${port.connected}`);
});

navigator.serial.addEventListener("disconnect", ({ target: port }) => {
  console.log(`Disconnect event fired. Connected: ${port.connected}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
