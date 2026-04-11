---
title: "SerialPort: phương thức getSignals()"
short-title: getSignals()
slug: Web/API/SerialPort/getSignals
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.SerialPort.getSignals
---

{{SecureContext_Header}}{{APIRef("Web Serial API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`SerialPort.getSignals()`** của giao diện {{domxref("SerialPort")}} trả về một {{jsxref("Promise")}} phân giải với một đối tượng chứa trạng thái hiện tại của các tín hiệu điều khiển của cổng.

## Cú pháp

```js-nolint
getSignals()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{jsxref("Promise")}} phân giải với một đối tượng chứa các thành viên sau:

- `clearToSend`
  - : Một boolean cho biết cho đầu kia của kết nối nối tiếp rằng nó sẵn sàng gửi dữ liệu.
- `dataCarrierDetect`
  - : Một boolean bật/tắt tín hiệu điều khiển cần thiết để giao tiếp qua kết nối nối tiếp.
- `dataSetReady`
  - : Một boolean cho biết liệu thiết bị có sẵn sàng gửi và nhận dữ liệu hay không.
- `ringIndicator`
  - : Một boolean cho biết liệu tín hiệu chuông có nên được gửi qua kết nối nối tiếp hay không.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Trả về nếu cổng chưa được mở. Gọi {{domxref("SerialPort.open()")}} để tránh lỗi này.
- `NetworkError` {{domxref("DOMException")}}
  - : Trả về nếu không thể đọc các tín hiệu trên thiết bị.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
