---
title: "SerialPort: phương thức setSignals()"
short-title: setSignals()
slug: Web/API/SerialPort/setSignals
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.SerialPort.setSignals
---

{{SecureContext_Header}}{{APIRef("Web Serial API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`setSignals()`** của giao diện {{domxref("SerialPort")}} đặt các tín hiệu điều khiển trên cổng và trả về một {{jsxref("Promise")}} phân giải khi chúng được đặt.

## Cú pháp

```js-nolint
setSignals()
setSignals(options)
```

### Tham số

- `options` {{Optional_Inline}}
  - : Một đối tượng với bất kỳ giá trị nào sau đây:
    - `dataTerminalReady`
      - : Một boolean cho biết có nên gọi hệ điều hành để khẳng định (nếu true) hoặc hủy khẳng định (nếu false) tín hiệu "data terminal ready" hay "DTR" trên cổng nối tiếp hay không.
    - `requestToSend`
      - : Một boolean cho biết có nên gọi hệ điều hành để khẳng định (nếu true) hoặc hủy khẳng định (nếu false) tín hiệu "request to send" hay "RTS" trên cổng nối tiếp hay không.
    - `break`
      - : Một boolean cho biết có nên gọi hệ điều hành để khẳng định (nếu true) hoặc hủy khẳng định (nếu false) tín hiệu "break" trên cổng nối tiếp hay không.

### Giá trị trả về

Một {{jsxref("Promise")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Trả về nếu cổng chưa được mở. Gọi {{domxref("SerialPort.open()")}} để tránh lỗi này.
- `NetworkError` {{domxref("DOMException")}}
  - : Trả về nếu không thể đặt các tín hiệu trên thiết bị.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
