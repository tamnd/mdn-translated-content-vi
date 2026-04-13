---
title: "SerialPort: sự kiện disconnect"
short-title: disconnect
slug: Web/API/SerialPort/disconnect_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.SerialPort.disconnect_event
---

{{SecureContext_Header}}{{APIRef("Web Serial API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`disconnect`** của giao diện {{domxref("SerialPort")}} được kích hoạt khi cổng ngắt kết nối khỏi thiết bị.

## Mô tả

Cụ thể hơn, sự kiện `disconnect` kích hoạt khi một cổng đã từng [kết nối logic](/en-US/docs/Web/API/SerialPort/connect_event#description) sau khi người dùng cấp quyền cho trang web truy cập nó (sau lệnh gọi {{domxref("Serial.requestPort()")}}) không còn kết nối nữa.

### Nổi bọt sự kiện

Sự kiện này nổi bọt lên thực thể {{domxref("Serial")}} đã trả về giao diện này. Thuộc tính `event.target` tham chiếu đến đối tượng {{domxref('SerialPort')}} nổi bọt lên.

Để biết thêm thông tin, xem [Nổi bọt sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("disconnect", (event) => { })

ondisconnect = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Thông báo khi một cổng cụ thể ngắt kết nối

Ở đây trình lắng nghe sự kiện được cài đặt trên một đối tượng {{domxref("SerialPort")}} cụ thể.

```js
port.addEventListener("disconnect", (event) => {
  // notify that the port has become unavailable
});
```

### Lắng nghe bất kỳ cổng nào trở nên không khả dụng

Sự kiện `disconnect` nổi bọt lên đối tượng {{domxref("Serial")}} nơi bạn có thể lắng nghe bất kỳ cổng nào trở nên không khả dụng.

```js
navigator.serial.addEventListener("disconnect", (event) => {
  // notify that a port has become unavailable
  // use `event.target` to refer to the unavailable port
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("SerialPort.connect_event", "connect")}}
