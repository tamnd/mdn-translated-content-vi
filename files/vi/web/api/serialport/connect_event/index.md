---
title: "SerialPort: sự kiện connect"
short-title: connect
slug: Web/API/SerialPort/connect_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.SerialPort.connect_event
---

{{APIRef("Web Serial API")}}{{SecureContext_Header}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`connect`** của giao diện {{domxref("SerialPort")}} được kích hoạt khi cổng kết nối với thiết bị.

## Mô tả

Cụ thể hơn, sự kiện `connect` kích hoạt khi cổng trở nên **kết nối logic** với thiết bị sau khi người dùng cấp quyền cho trang web truy cập cổng sau lệnh gọi {{domxref("Serial.requestPort()")}}:

- Trong trường hợp cổng nối tiếp có dây, điều này xảy ra khi cổng được kết nối vật lý với thiết bị, ví dụ qua USB.
- Trong trường hợp cổng nối tiếp không dây (ví dụ, Bluetooth RFCOMM), điều này xảy ra khi cổng tạo một hoặc nhiều kết nối đang hoạt động với thiết bị (ví dụ qua các kênh Bluetooth L2CAP).

### Nổi bọt sự kiện

Sự kiện này nổi bọt lên thực thể {{domxref("Serial")}} đã trả về giao diện này. Thuộc tính `event.target` tham chiếu đến đối tượng {{domxref('SerialPort')}} nổi bọt lên.

Để biết thêm thông tin, xem [Nổi bọt sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("connect", (event) => { })

onconnect = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Thông báo khi một cổng cụ thể kết nối

Phương thức {{domxref("Serial.requestPort()")}} trả về một {{jsxref("Promise")}} phân giải với một {{domxref("SerialPort")}} được người dùng chọn.

```js
// Prompt user to choose a serial port
const port = await navigator.serial.requestPort();

port.addEventListener("connect", (event) => {
  // notify that the chosen port is connected
});
```

### Lắng nghe bất kỳ cổng nào vừa kết nối

Sự kiện `connect` nổi bọt lên đối tượng {{domxref("Serial")}} nơi bạn có thể lắng nghe bất kỳ cổng nào vừa kết nối.

```js
navigator.serial.addEventListener("connect", (event) => {
  // notify that a new port is available
  // use `event.target` to refer to the newly-added port
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("SerialPort.disconnect_event", "disconnect")}}
