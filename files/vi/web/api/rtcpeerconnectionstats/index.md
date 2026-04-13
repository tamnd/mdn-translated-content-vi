---
title: RTCPeerConnectionStats
slug: Web/API/RTCPeerConnectionStats
page-type: web-api-interface
browser-compat: api.RTCStatsReport.type_peer-connection
---

{{APIRef("WebRTC")}}

Dictionary **`RTCPeerConnectionStats`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) cung cấp thông tin về peer connection cấp cao ({{domxref("RTCPeerConnection")}}).

Cụ thể, nó cung cấp số lượng kênh dữ liệu duy nhất đã được mở, và số lượng kênh đã mở đã bị đóng.
Điều này cho phép tính toán số lượng kênh đang mở hiện tại.

Các số liệu thống kê này có thể được lấy bằng cách lặp {{domxref("RTCStatsReport")}} được trả về bởi {{domxref("RTCPeerConnection.getStats()")}} cho đến khi tìm thấy báo cáo với [`type`](/en-US/docs/Web/API/RTCPeerConnectionStats/type) là `peer-connection`.

## Thuộc tính phiên bản

- {{domxref("RTCPeerConnectionStats.dataChannelsOpened", "dataChannelsOpened")}}
  - : Một giá trị số nguyên dương cho biết số lượng đối tượng {{domxref("RTCDataChannel")}} duy nhất đã vào trạng thái [`open`](/en-US/docs/Web/API/RTCDataChannel/readyState#open) trong suốt vòng đời của chúng.
- {{domxref("RTCPeerConnectionStats.dataChannelsClosed", "dataChannelsClosed")}}
  - : Một giá trị số nguyên dương cho biết số lượng đối tượng {{domxref("RTCDataChannel")}} duy nhất đã rời trạng thái [`open`](/en-US/docs/Web/API/RTCDataChannel/readyState#open) trong suốt vòng đời của chúng (các kênh chuyển sang [`closing`](/en-US/docs/Web/API/RTCDataChannel/readyState#closing) hoặc [`closed`](/en-US/docs/Web/API/RTCDataChannel/readyState#closed) mà không bao giờ ở trạng thái `open` thì không được tính vào số này).
    Một kênh sẽ rời trạng thái `open` nếu một trong hai đầu của kết nối hoặc giao thức truyền tải bên dưới bị đóng.

### Thuộc tính phiên bản chung

Các thuộc tính sau là chung cho tất cả các đối tượng thống kê WebRTC.

<!-- RTCStats -->

- {{domxref("RTCPeerConnectionStats.id", "id")}}
  - : Một chuỗi xác định duy nhất đối tượng đang được theo dõi để tạo tập hợp thống kê này.
- {{domxref("RTCPeerConnectionStats.timestamp", "timestamp")}}
  - : Một đối tượng {{domxref("DOMHighResTimeStamp")}} cho biết thời gian mẫu được lấy cho đối tượng thống kê này.
- {{domxref("RTCPeerConnectionStats.type", "type")}}
  - : Một chuỗi với giá trị `"peer-connection"`, cho biết loại thống kê mà đối tượng chứa.

## Ví dụ

Ví dụ này cho thấy một hàm trả về tổng số kết nối đang mở, hoặc `null` nếu không có thống kê nào được cung cấp.
Hàm này có thể được gọi trong một vòng lặp, tương tự cách tiếp cận được sử dụng trong [ví dụ `RTCPeerConnection.getStats()`](/en-US/docs/Web/API/RTCPeerConnection/getStats#examples)

Hàm chờ kết quả của lời gọi {{domxref("RTCPeerConnection.getStats()")}} và sau đó lặp {{domxref("RTCStatsReport")}} được trả về để chỉ lấy các số liệu thống kê loại `"peer-connection"`.
Sau đó nó trả về tổng số kênh đang mở, hoặc `null`, sử dụng dữ liệu trong báo cáo.

```js
async function numberOpenConnections (peerConnection) {
  const stats = await peerConnection.getStats();
  let peerConnectionStats = null;

  stats.forEach((report) => {
    if (report.type === "peer-connection") {
      peerConnectionStats = report;
      break;
    }
  });

result = (typeof peerConnectionStats.dataChannelsOpened === 'undefined' || typeof peerConnectionStats.dataChannelsClosed=== 'undefined') ? null : peerConnectionStats.dataChannelsOpened - peerConnectionStats.dataChannelsClosed;
return result
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
