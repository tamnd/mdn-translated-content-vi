---
title: RTCDataChannelStats
slug: Web/API/RTCDataChannelStats
page-type: web-api-interface
browser-compat: api.RTCStatsReport.type_data-channel
---

{{APIRef("WebRTC")}}

Từ điển **`RTCDataChannelStats`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) cung cấp thống kê liên quan đến một đối tượng {{domxref("RTCDataChannel")}} trên kết nối.

Báo cáo có thể được lấy bằng cách lặp qua {{domxref("RTCStatsReport")}} được trả về bởi {{domxref("RTCPeerConnection.getStats()")}} cho đến khi bạn tìm thấy một mục có [`type`](/en-US/docs/Web/API/RTCDataChannelStats/type) là `data-channel`.

Thống kê kênh dữ liệu có thể được tương quan với một kênh cụ thể bằng cách so sánh thuộc tính [`dataChannelIdentifier`](/en-US/docs/Web/API/RTCDataChannelStats/dataChannelIdentifier) với một {{domxref("RTCDataChannel.id")}} phù hợp.

## Thuộc tính phiên bản

- {{domxref("RTCDataChannelStats.bytesSent", "bytesSent")}} {{optional_inline}}
  - : Số nguyên dương cho biết tổng số byte tải trọng được gửi trên `RTCDataChannel` liên kết.
- {{domxref("RTCDataChannelStats.bytesReceived", "bytesReceived")}} {{optional_inline}}
  - : Số nguyên dương cho biết tổng số byte tải trọng được nhận trên `RTCDataChannel` liên kết.
- {{domxref("RTCDataChannelStats.dataChannelIdentifier", "dataChannelIdentifier")}} {{optional_inline}}
  - : Số nguyên dương chứa {{domxref("RTCDataChannel.id", "id")}} của `RTCDataChannel` liên kết.
- {{domxref("RTCDataChannelStats.label", "label")}} {{optional_inline}}
  - : Chuỗi chứa {{domxref("RTCDataChannel.label", "nhãn")}} của `RTCDataChannel` liên kết.
- {{domxref("RTCDataChannelStats.messagesReceived", "messagesReceived")}} {{optional_inline}}
  - : Số nguyên dương cho biết tổng số [sự kiện `message`](/en-US/docs/Web/API/RTCDataChannel/message_event) được kích hoạt cho các tin nhắn nhận được trên `RTCDataChannel` liên kết.
- {{domxref("RTCDataChannelStats.messagesSent", "messagesSent")}} {{optional_inline}}
  - : Số nguyên dương cho biết tổng số [sự kiện `message`](/en-US/docs/Web/API/RTCDataChannel/message_event) được kích hoạt cho các tin nhắn đã gửi trên kênh.
- {{domxref("RTCDataChannelStats.protocol", "protocol")}} {{optional_inline}}
  - : Chuỗi chứa {{domxref("RTCDataChannel.protocol", "giao thức")}} của `RTCDataChannel` liên kết.
- {{domxref("RTCDataChannelStats.state", "state")}}
  - : {{domxref("RTCDataChannel.readyState", "readyState")}} của `RTCDataChannel` liên kết.

### Thuộc tính phiên bản chung

Các thuộc tính sau là chung cho tất cả các đối tượng thống kê WebRTC (Xem [`RTCStatsReport`](/en-US/docs/Web/API/RTCStatsReport#common_instance_properties) để biết thêm thông tin).

<!-- RTCStats -->

- {{domxref("RTCDataChannelStats.id", "id")}}
  - : Chuỗi nhận dạng duy nhất đối tượng đang được theo dõi để tạo ra tập hợp thống kê này.
- {{domxref("RTCDataChannelStats.timestamp", "timestamp")}}
  - : Đối tượng {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm mẫu được lấy cho đối tượng thống kê này.
- {{domxref("RTCDataChannelStats.type", "type")}}
  - : Chuỗi có giá trị `"data-channel"`, cho biết loại thống kê mà đối tượng chứa.

## Ví dụ

Cho biến `myPeerConnection`, là một phiên bản của {{domxref("RTCPeerConnection")}}, đoạn mã dưới đây sử dụng `await` để chờ báo cáo thống kê, sau đó lặp qua nó bằng `RTCStatsReport.forEach()`.
Sau đó nó lọc các từ điển chỉ lấy những báo cáo có kiểu `data-channel` và ghi kết quả vào bảng điều khiển.

```js
const stats = await myPeerConnection.getStats();

stats.forEach((report) => {
  if (report.type === "data-channel") {
    // Ghi thông tin kênh
    console.log(report);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
