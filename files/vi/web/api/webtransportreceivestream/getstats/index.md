---
title: "WebTransportReceiveStream: phương thức getStats()"
short-title: getStats()
slug: Web/API/WebTransportReceiveStream/getStats
page-type: web-api-instance-method
browser-compat: api.WebTransportReceiveStream.getStats
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Phương thức **`getStats()`** của giao diện {{domxref("WebTransportReceiveStream")}} trả về bất đồng bộ một đối tượng chứa các số liệu thống kê cho luồng hiện tại.

Các số liệu thống kê bao gồm tổng số byte có thứ tự đã đến trên luồng này (bỏ qua overhead mạng, cho đến byte đầu tiên còn thiếu) và tổng số byte đã được ứng dụng đọc. Do đó, nó cung cấp thước đo tốc độ ứng dụng đang sử dụng byte từ máy chủ trên luồng cụ thể này.

## Cú pháp

```js-nolint
getStats()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một đối tượng chứa số liệu thống kê về luồng hiện tại. Đối tượng trả về có các thuộc tính sau:

- `timestamp`
  - : Một {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm thu thập số liệu thống kê, tính từ ngày 1 tháng 1 năm 1970 theo UTC.
- `bytesReceived`
  - : Một số nguyên dương cho biết số byte đã nhận bởi luồng này, cho đến byte đầu tiên còn thiếu. Con số này không bao gồm overhead mạng và chỉ có thể tăng.
- `bytesRead`
  - : Một số nguyên dương cho biết số byte mà ứng dụng đã đọc từ luồng `WebTransportReceiveStream` này. Con số này chỉ có thể tăng và luôn nhỏ hơn hoặc bằng `bytesReceived`.

## Ví dụ

Đoạn mã dưới đây sử dụng `await` để chờ {{jsxref("Promise")}} được trả về bởi `getStats()`. Khi promise được thực hiện, số byte chưa được đọc sẽ được ghi vào bảng điều khiển.

```js
const stats = await stream.getStats();
const unConsumedBytes = stats.bytesReceived - stats.bytesRead;
console.log(`Bytes in reader queue: ${unConsumedBytes}`);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
