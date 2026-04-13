---
title: RTCRemoteOutboundRtpStreamStats
slug: Web/API/RTCRemoteOutboundRtpStreamStats
page-type: web-api-interface
browser-compat: api.RTCStatsReport.type_remote-outbound-rtp
---

{{APIRef("WebRTC")}}

Từ điển **`RTCRemoteOutboundRtpStreamStats`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) được sử dụng để báo cáo thống kê từ điểm cuối từ xa về luồng RTP đi của nó.
Điều này sẽ tương ứng với một luồng đến đang được {{domxref("RTCPeerConnection")}} cục bộ nhận.

Thống kê có thể được lấy bằng cách lặp qua {{domxref("RTCStatsReport")}} được trả về bởi {{domxref("RTCPeerConnection.getStats()")}} cho đến khi bạn tìm thấy báo cáo có [`type`](/en-US/docs/Web/API/RTCRemoteOutboundRtpStreamStats/type) là `remote-outbound-rtp`.

## Thuộc tính phiên bản

### Thống kê đặc thù cho luồng đi từ xa

- {{domxref("RTCRemoteOutboundRtpStreamStats.localId", "localId")}} {{optional_inline}}
  - : Chuỗi được sử dụng để tìm đối tượng {{domxref("RTCInboundRtpStreamStats")}} cục bộ có cùng [nguồn đồng bộ (SSRC)](/en-US/docs/Web/API/RTCRemoteOutboundRtpStreamStats/ssrc).
- {{domxref("RTCRemoteOutboundRtpStreamStats.remoteTimestamp", "remoteTimestamp")}} {{optional_inline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} xác định dấu thời gian (trên thiết bị từ xa) tại đó thống kê trong đối tượng `RTCRemoteOutboundRtpStreamStats` được gửi bởi điểm cuối từ xa. Điều này khác với {{domxref("RTCRemoteOutboundRtpStreamStats.timestamp", "timestamp")}}; nó đại diện cho thời điểm thống kê của đối tượng được nhận hoặc tạo ra bởi điểm cuối cục bộ.
- `reportsSent` {{optional_inline}} {{experimental_inline}}
  - : Một số nguyên dương cho biết tổng số khối Báo cáo Người gửi (SR) {{glossary("RTCP")}} được gửi cho [nguồn đồng bộ (SSRC)](/en-US/docs/Web/API/RTCRemoteOutboundRtpStreamStats/ssrc) này.
- {{domxref("RTCRemoteOutboundRtpStreamStats.roundTripTimeMeasurements", "roundTripTimeMeasurements")}} {{optional_inline}} {{experimental_inline}}
  - : Một số dương đại diện cho tổng số đo lường thời gian khứ hồi hợp lệ được nhận cho [nguồn đồng bộ (SSRC)](/en-US/docs/Web/API/RTCRemoteOutboundRtpStreamStats/ssrc) này.
- {{domxref("RTCRemoteOutboundRtpStreamStats.totalRoundTripTime", "totalRoundTripTime")}} {{optional_inline}} {{experimental_inline}}
  - : Số cho biết tổng cộng tất cả các đo lường thời gian khứ hồi kể từ đầu phiên, tính bằng giây.
    Thời gian khứ hồi trung bình có thể được tính bằng cách chia `totalRoundTripTime` cho [`roundTripTimeMeasurements`](/en-US/docs/Web/API/RTCRemoteOutboundRtpStreamStats/roundTripTimeMeasurements).

### Thống kê luồng RTP đã gửi

<!-- RTCSentRtpStreamStats -->

- `bytesSent` {{optional_inline}}
  - : Một số nguyên dương cho biết tổng số byte được gửi cho SSRC này, bao gồm cả truyền lại. <!-- [RFC3550] section 6.4.1 -->
- `packetsSent` {{optional_inline}}
  - : Một số nguyên dương cho biết tổng số gói RTP được gửi cho SSRC này, bao gồm cả truyền lại. <!-- [RFC3550] section 6.4.1 -->

### Thống kê luồng RTP chung

<!-- RTCRtpStreamStats -->

- {{domxref("RTCRemoteOutboundRtpStreamStats.codecId", "codecId")}} {{optional_inline}}
  - : Chuỗi nhận dạng duy nhất đối tượng đã được kiểm tra để tạo ra báo cáo {{domxref("RTCCodecStats")}} liên kết với luồng {{Glossary("RTP")}} này.
- {{domxref("RTCRemoteOutboundRtpStreamStats.kind", "kind")}}
  - : Chuỗi cho biết {{domxref("MediaStreamTrack")}} liên kết với luồng là audio hay video.
- {{domxref("RTCRemoteOutboundRtpStreamStats.ssrc", "ssrc")}}
  - : Số nguyên dương xác định nguồn đồng bộ (SSRC) của các gói RTP trong luồng này.
- {{domxref("RTCRemoteOutboundRtpStreamStats.transportId", "transportId")}} {{optional_inline}}
  - : Chuỗi nhận dạng duy nhất đối tượng đã được kiểm tra để tạo ra báo cáo {{domxref("RTCTransportStats")}} liên kết với luồng RTP này.

### Thuộc tính phiên bản chung

Các thuộc tính sau là chung cho tất cả các đối tượng thống kê WebRTC.

<!-- RTCStats -->

- {{domxref("RTCRemoteOutboundRtpStreamStats.id", "id")}}
  - : Chuỗi nhận dạng duy nhất đối tượng đang được theo dõi để tạo ra tập hợp thống kê này.
- {{domxref("RTCRemoteOutboundRtpStreamStats.timestamp", "timestamp")}}
  - : Đối tượng {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm mẫu được lấy cho đối tượng thống kê này.
- {{domxref("RTCRemoteOutboundRtpStreamStats.type", "type")}}
  - : Chuỗi có giá trị `"remote-outbound-rtp"`, cho biết loại thống kê mà đối tượng chứa.

## Ghi chú sử dụng

Thuộc tính {{domxref("RTCRemoteOutboundRtpStreamStats.remoteTimestamp", "remoteTimestamp")}} của đối tượng `RTCRemoteOutboundRtpStreamStats` cung cấp thống kê dựa trên dấu thời gian NTP của dữ liệu nhận được từ một khối Báo cáo Người gửi (SR) {{Glossary("RTCP")}}.
Hãy lưu ý rằng đồng hồ từ xa có thể không được đồng bộ với đồng hồ cục bộ (cả thời gian hiện tại lẫn tốc độ thời gian trôi qua).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
