---
title: RTCRemoteInboundRtpStreamStats
slug: Web/API/RTCRemoteInboundRtpStreamStats
page-type: web-api-interface
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp
---

{{APIRef("WebRTC")}}

Từ điển **`RTCRemoteInboundRtpStreamStats`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) được dùng để báo cáo thống kê từ điểm cuối từ xa về một luồng RTP đến cụ thể.
Chúng sẽ tương ứng với một luồng RTP đi ở đầu cục bộ của {{domxref("RTCPeerConnection")}}.

Có thể lấy các thống kê bằng cách duyệt qua {{domxref("RTCStatsReport")}} được trả về bởi {{domxref("RTCPeerConnection.getStats()")}} hoặc {{domxref("RTCRtpReceiver.getStats()")}} cho đến khi tìm thấy báo cáo có [`type`](/en-US/docs/Web/API/RTCRemoteInboundRtpStreamStats/type) là `remote-inbound-rtp`.

## Thuộc tính phiên bản

### Thống kê luồng đến từ xa

<!-- RTCRemoteInboundRtpStreamStats -->

- {{domxref("RTCRemoteInboundRtpStreamStats.fractionLost", "fractionLost")}} {{optional_inline}}
  - : Một số cho biết tỷ lệ gói bị mất cho SSRC này kể từ báo cáo người gửi hoặc người nhận cuối cùng.
- {{domxref("RTCRemoteInboundRtpStreamStats.localId", "localId")}} {{optional_inline}}
  - : Một chuỗi được dùng để tìm đối tượng {{domxref("RTCOutboundRtpStreamStats")}} cục bộ có cùng [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCRemoteInboundRtpStreamStats/ssrc).
- {{domxref("RTCRemoteInboundRtpStreamStats.roundTripTime", "roundTripTime")}} {{optional_inline}}
  - : Một số cho biết thời gian vòng lặp (RTT) ước tính cho SSRC này, tính bằng giây.
    Thuộc tính này sẽ không tồn tại cho đến khi nhận được dữ liệu RTT hợp lệ.
- {{domxref("RTCRemoteInboundRtpStreamStats.roundTripTimeMeasurements", "roundTripTimeMeasurements")}} {{optional_inline}}
  - : Một số nguyên dương cho biết tổng số phép đo thời gian vòng lặp hợp lệ đã nhận được cho [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCRemoteInboundRtpStreamStats/ssrc) này.
- {{domxref("RTCRemoteInboundRtpStreamStats.totalRoundTripTime", "totalRoundTripTime")}} {{optional_inline}}
  - : Một số cho biết tổng tích lũy của tất cả các phép đo thời gian vòng lặp kể từ đầu phiên, tính bằng giây.
    Thời gian vòng lặp trung bình có thể được tính bằng cách chia `totalRoundTripTime` cho [`roundTripTimeMeasurements`](/en-US/docs/Web/API/RTCRemoteInboundRtpStreamStats/roundTripTimeMeasurements).

### Thống kê luồng RTP được nhận

<!-- RTCReceivedRtpStreamStats -->

- {{domxref("RTCRemoteInboundRtpStreamStats.jitter", "jitter")}} {{optional_inline}}
  - : Một số cho biết {{glossary("jitter", "jitter gói")}} cho nguồn đồng bộ hóa này, đo bằng giây.
- {{domxref("RTCRemoteInboundRtpStreamStats.packetsLost", "packetsLost")}} {{optional_inline}}
  - : Một số nguyên cho biết tổng số gói RTP bị mất cho SSRC này, được đo tại điểm cuối từ xa.
    Giá trị này có thể âm nếu nhận được các gói trùng lặp.
- {{domxref("RTCRemoteInboundRtpStreamStats.packetsReceived", "packetsReceived")}} {{optional_inline}} {{experimental_inline}}
  - : Một số nguyên dương cho biết tổng số gói RTP đã nhận cho SSRC này, bao gồm cả các lần truyền lại.

### Thống kê luồng RTP chung

<!-- RTCRtpStreamStats -->

- {{domxref("RTCRemoteInboundRtpStreamStats.codecId", "codecId")}} {{optional_inline}}
  - : Một chuỗi xác định duy nhất đối tượng được kiểm tra để tạo ra đối tượng {{domxref("RTCCodecStats")}} liên kết với luồng {{Glossary("RTP")}} này.
- {{domxref("RTCRemoteInboundRtpStreamStats.kind", "kind")}}
  - : Một chuỗi cho biết liệu {{domxref("MediaStreamTrack")}} liên kết với luồng là track âm thanh hay video.
- {{domxref("RTCRemoteInboundRtpStreamStats.ssrc", "ssrc")}}
  - : Một số nguyên dương xác định SSRC của các gói RTP trong luồng này.
- {{domxref("RTCRemoteInboundRtpStreamStats.transportId", "transportId")}} {{optional_inline}}
  - : Một chuỗi xác định duy nhất đối tượng được kiểm tra để tạo ra đối tượng {{domxref("RTCTransportStats")}} liên kết với luồng RTP này.

### Thuộc tính phiên bản chung

Các thuộc tính sau đây có ở tất cả các đối tượng thống kê WebRTC.

<!-- RTCStats -->

- {{domxref("RTCRemoteInboundRtpStreamStats.id", "id")}}
  - : Một chuỗi xác định duy nhất đối tượng đang được giám sát để tạo ra tập hợp thống kê này.
- {{domxref("RTCRemoteInboundRtpStreamStats.timestamp", "timestamp")}}
  - : Một đối tượng {{domxref("DOMHighResTimeStamp")}} chỉ ra thời điểm lấy mẫu cho đối tượng thống kê này.
- {{domxref("RTCRemoteInboundRtpStreamStats.type", "type")}}
  - : Một chuỗi có giá trị `"inbound-rtp"`, chỉ ra loại thống kê mà đối tượng chứa.

## Ví dụ

Với biến `peerConnection` là một phiên bản của {{domxref("RTCPeerConnection")}}, đoạn code dưới đây sử dụng `await` để chờ báo cáo thống kê, sau đó duyệt qua nó bằng `RTCStatsReport.forEach()`.
Nó lọc các từ điển chỉ lấy những báo cáo có type là `remote-inbound-rtp` và ghi lại kết quả.

```js
const stats = await myPeerConnection.getStats();

stats.forEach((report) => {
  if (report.type === "remote-inbound-rtp") {
    console.log("Remote Inbound RTP Stream Stats:");
    console.log(`id: ${report.id}`);
    console.log(`timestamp: ${report.timestamp}`);
    console.log(`transportId: ${report.transportId}`);
    console.log(`ssrc: ${report.ssrc}`);
    console.log(`kind: ${report.kind}`);
    console.log(`codecId: ${report.codecId}`);
    console.log(`packetsReceived: ${report.packetsReceived}`);
    console.log(`packetsLost: ${report.packetsLost}`);
    console.log(`jitter: ${report.jitter}`);
    console.log(`totalRoundTripTime: ${report.totalRoundTripTime}`);
    console.log(
      `roundTripTimeMeasurements: ${report.roundTripTimeMeasurements}`,
    );
    console.log(`roundTripTime: ${report.roundTripTime}`);
    console.log(`localId: ${report.localId}`);
    console.log(`fractionLost: ${report.fractionLost}`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCStatsReport")}}
