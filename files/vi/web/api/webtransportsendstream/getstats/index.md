---
title: "WebTransportSendStream: phương thức getStats()"
short-title: getStats()
slug: Web/API/WebTransportSendStream/getStats
page-type: web-api-instance-method
browser-compat: api.WebTransportSendStream.getStats
---

{{APIRef("WebTransport API")}}{{securecontext_header}} {{AvailableInWorkers}}

Phương thức **`getStats()`** của giao diện {{domxref("WebTransportSendStream")}} trả về bất đồng bộ một đối tượng chứa các thống kê cho luồng hiện tại.

Các thống kê bao gồm tổng số byte được ghi vào luồng, số byte đã được gửi (bỏ qua overhead của gói tin), số byte đã được đặt ít nhất một lần và số byte đã được xác nhận (cho đến byte không được xác nhận đầu tiên theo thứ tự tuần tự). Do đó, nó cung cấp thước đo tốc độ ứng dụng đang gửi byte đến máy chủ trên luồng cụ thể này.

## Cú pháp

```js-nolint
getStats()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một đối tượng chứa các thống kê về luồng hiện tại. Đối tượng được trả về có các thuộc tính sau:

- `bytesAcknowledged`
  - : Một số nguyên dương cho biết số byte được ghi vào luồng này đã được gửi và được xác nhận là đã nhận bởi máy chủ, sử dụng cơ chế ACK của QUIC. Chỉ các byte tuần tự cho đến, nhưng không bao gồm, byte không được xác nhận đầu tiên được tính. Con số này chỉ có thể tăng và luôn nhỏ hơn hoặc bằng `bytesSent`. Khi kết nối qua HTTP/2, giá trị sẽ khớp với `bytesSent`.
- `bytesSent`
  - : Một số nguyên dương cho biết số byte được ghi vào luồng này đã được gửi ít nhất một lần (nhưng không nhất thiết được xác nhận). Con số này chỉ có thể tăng và luôn nhỏ hơn hoặc bằng `bytesWritten`. Lưu ý rằng số đếm này không bao gồm các byte được gửi dưới dạng overhead mạng (như header gói tin).
- `bytesWritten`
  - : Một số nguyên dương cho biết số byte được ghi thành công vào luồng này. Con số này chỉ có thể tăng.

## Ví dụ

Đoạn mã dưới đây sử dụng `await` để chờ {{jsxref("Promise")}} được trả về bởi `getStats()`. Khi promise hoàn thành, kết quả cho số byte đã được gửi nhưng chưa được xác nhận được ghi vào console.

```js
const stats = await stream.getStats();
const bytesNotReceived = stats.bytesWritten - stats.bytesAcknowledged;
console.log(`Bytes still successfully sent: ${bytesNotReceived}`);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
