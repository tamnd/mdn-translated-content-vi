---
title: RTCOutboundRtpStreamStats
slug: Web/API/RTCOutboundRtpStreamStats
page-type: web-api-interface
browser-compat: api.RTCStatsReport.type_outbound-rtp
---

{{APIRef("WebRTC")}}

Từ điển **`RTCOutboundRtpStreamStats`** trong [WebRTC API](/en-US/docs/Web/API/WebRTC_API) được dùng để báo cáo các số liệu và thống kê liên quan đến luồng {{Glossary("RTP")}} đi được gửi bởi một {{domxref("RTCRtpSender")}}.

Bạn có thể lấy các thống kê bằng cách lặp qua {{domxref("RTCStatsReport")}} được trả về bởi {{domxref("RTCPeerConnection.getStats()")}} hoặc {{domxref("RTCRtpSender.getStats()")}} cho đến khi tìm thấy báo cáo có [`type`](/en-US/docs/Web/API/RTCOutboundRtpStreamStats/type) là `outbound-rtp`.

## Thuộc tính phiên bản

- {{domxref("RTCOutboundRtpStreamStats.active", "active")}} {{experimental_inline}}
  - : Giá trị boolean cho biết liệu luồng RTP này có được cấu hình để gửi hay đã bị vô hiệu hóa.
- {{domxref("RTCOutboundRtpStreamStats.frameHeight", "frameHeight")}}
  - : Số nguyên cho biết chiều cao của khung hình được mã hóa cuối cùng, tính bằng pixel. _Không xác định cho các luồng âm thanh._
- {{domxref("RTCOutboundRtpStreamStats.frameWidth", "frameWidth")}}
  - : Số nguyên cho biết chiều rộng của khung hình được mã hóa cuối cùng, tính bằng pixel. _Không xác định cho các luồng âm thanh._
- {{domxref("RTCOutboundRtpStreamStats.framesEncoded", "framesEncoded")}}
  - : Số khung hình đã được mã hóa thành công đến nay để gửi trên luồng RTP này. _Không xác định cho các luồng âm thanh._
- {{domxref("RTCOutboundRtpStreamStats.framesPerSecond", "framesPerSecond")}}
  - : Số biểu thị các khung hình được mã hóa đã gửi trong giây vừa qua. _Không xác định cho các luồng âm thanh._
- {{domxref("RTCOutboundRtpStreamStats.framesSent", "framesSent")}}
  - : Số nguyên dương biểu thị tổng số khung hình được mã hóa đã gửi trên luồng RTP này. _Không xác định cho các luồng âm thanh._
- {{domxref("RTCOutboundRtpStreamStats.headerBytesSent", "headerBytesSent")}}
  - : Số nguyên dương biểu thị tổng số byte header RTP và byte đệm đã gửi cho SSRC này.
- {{domxref("RTCOutboundRtpStreamStats.keyFramesEncoded", "keyFramesEncoded")}} {{experimental_inline}}
  - : Số nguyên dương biểu thị tổng số khung hình chính được mã hóa thành công trong luồng phương tiện RTP này. _Không xác định cho các luồng âm thanh._
- {{domxref("RTCOutboundRtpStreamStats.mediaSourceId", "mediaSourceId")}}
  - : Chuỗi biểu thị id của đối tượng thống kê của track hiện đang gắn với bộ gửi của luồng này.
- {{domxref("RTCOutboundRtpStreamStats.mid", "mid")}}
  - : Chuỗi xác định duy nhất cặp nguồn và đích của luồng transceiver. Đây là giá trị của {{domxref("RTCRtpTransceiver.mid")}} tương ứng trừ khi giá trị đó là null, trong trường hợp đó thuộc tính thống kê không có mặt.
- {{domxref("RTCOutboundRtpStreamStats.nackCount", "nackCount")}}
  - : Giá trị số nguyên cho biết tổng số gói Negative ACKnowledgement (NACK) mà `RTCRtpSender` này đã nhận từ {{domxref("RTCRtpReceiver")}} từ xa. Giá trị được tính cục bộ này cung cấp chỉ số về khả năng phục hồi lỗi của kết nối.
- {{domxref("RTCOutboundRtpStreamStats.qpSum", "qpSum")}}
  - : Giá trị 64-bit chứa tổng của các giá trị QP cho mọi khung hình được mã hóa bởi {{domxref("RTCRtpSender")}} này. Giá trị được tính cục bộ này cung cấp chỉ số về mức độ nén dữ liệu. _Không xác định cho các luồng âm thanh._
- {{domxref("RTCOutboundRtpStreamStats.qualityLimitationDurations", "qualityLimitationDurations")}} {{experimental_inline}}
  - : Bản đồ các lý do mà độ phân giải hoặc tốc độ khung hình của luồng phương tiện đã bị giảm, cùng với thời gian chất lượng bị giảm cho mỗi lý do. _Không xác định cho các luồng âm thanh._
- {{domxref("RTCOutboundRtpStreamStats.qualityLimitationReason", "qualityLimitationReason")}} {{experimental_inline}}
  - : Chuỗi cho biết lý do tại sao luồng đang bị giới hạn chất lượng. Một trong: `none`, `cpu`, `bandwidth`, hoặc `other`. _Không xác định cho các luồng âm thanh._
- {{domxref("RTCOutboundRtpStreamStats.remoteId", "remoteId")}}
  - : Chuỗi xác định đối tượng {{domxref("RTCRemoteInboundRtpStreamStats")}} cung cấp thống kê cho đầu từ xa cho cùng SSRC này. ID này ổn định qua nhiều lần gọi `getStats()`.
- {{domxref("RTCOutboundRtpStreamStats.retransmittedBytesSent", "retransmittedBytesSent")}}
  - : Số nguyên dương biểu thị tổng số byte dữ liệu đã truyền lại cho nguồn liên quan đến luồng này.
- {{domxref("RTCOutboundRtpStreamStats.retransmittedPacketsSent", "retransmittedPacketsSent")}}
  - : Số nguyên dương biểu thị tổng số gói dữ liệu đã truyền lại cho nguồn liên quan đến luồng này.
- {{domxref("RTCOutboundRtpStreamStats.rid", "rid")}}
  - : Chuỗi cho biết ID luồng RTP cho luồng video tương ứng.
- {{domxref("RTCOutboundRtpStreamStats.scalabilityMode", "scalabilityMode")}} {{experimental_inline}}
  - : Chuỗi biểu thị chế độ khả năng mở rộng cho luồng RTP, nếu có cấu hình.
- {{domxref("RTCOutboundRtpStreamStats.targetBitrate", "targetBitrate")}}
  - : Số biểu thị tốc độ bit mà codec của `RTCRtpSender` hiện đang cố đạt được cho luồng này.
- {{domxref("RTCOutboundRtpStreamStats.totalEncodeTime", "totalEncodeTime")}}
  - : Số biểu thị tổng số giây đã dành để mã hóa các khung hình được mã hóa cho luồng {{domxref("RTCRtpSender")}} này. _Không xác định cho các luồng âm thanh._
- {{domxref("RTCOutboundRtpStreamStats.totalEncodedBytesTarget", "totalEncodedBytesTarget")}} {{experimental_inline}}
  - : Tổng tích lũy của các kích thước khung hình _mục tiêu_ cho tất cả các khung hình đã được mã hóa đến nay. Điều này có thể khác với tổng của các kích thước khung hình _thực tế_. _Không xác định cho các luồng âm thanh._
- {{domxref("RTCOutboundRtpStreamStats.totalPacketSendDelay", "totalPacketSendDelay")}}
  - : Số biểu thị tổng thời gian tính bằng giây mà các gói dữ liệu đã nằm trong bộ đệm cục bộ trước khi được truyền đi.

### Thống kê luồng RTP đã gửi

<!-- RTCSentRtpStreamStats -->

- {{domxref("RTCOutboundRtpStreamStats.bytesSent", "bytesSent")}} {{optional_inline}}
  - : Số nguyên dương cho biết tổng số byte đã gửi cho SSRC này, bao gồm cả các lần truyền lại.
- {{domxref("RTCOutboundRtpStreamStats.packetsSent", "packetsSent")}} {{optional_inline}}
  - : Số nguyên dương cho biết tổng số gói RTP đã gửi cho SSRC này, bao gồm cả các lần truyền lại.

### Thống kê luồng RTP chung

<!-- RTCRtpStreamStats -->

- {{domxref("RTCOutboundRtpStreamStats.codecId", "codecId")}} {{optional_inline}}
  - : Chuỗi xác định duy nhất đối tượng đã được kiểm tra để tạo ra đối tượng {{domxref("RTCCodecStats")}} liên quan đến luồng {{Glossary("RTP")}} này.
- {{domxref("RTCOutboundRtpStreamStats.kind", "kind")}}
  - : Chuỗi cho biết liệu {{domxref("MediaStreamTrack")}} liên quan đến luồng là track âm thanh hay video.
- {{domxref("RTCOutboundRtpStreamStats.ssrc", "ssrc")}}
  - : Số nguyên dương xác định SSRC của các gói RTP trong luồng này.
- {{domxref("RTCOutboundRtpStreamStats.transportId", "transportId")}} {{optional_inline}}
  - : Chuỗi xác định duy nhất đối tượng đã được kiểm tra để tạo ra đối tượng {{domxref("RTCTransportStats")}} liên quan đến luồng RTP này.

### Thuộc tính phiên bản chung

Các thuộc tính sau đây có ở tất cả đối tượng thống kê WebRTC.

<!-- RTCStats -->

- {{domxref("RTCOutboundRtpStreamStats.id", "id")}}
  - : Chuỗi xác định duy nhất đối tượng đang được theo dõi để tạo ra tập hợp thống kê này.
- {{domxref("RTCOutboundRtpStreamStats.timestamp", "timestamp")}}
  - : Đối tượng {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm mẫu được lấy cho đối tượng thống kê này.
- {{domxref("RTCOutboundRtpStreamStats.type", "type")}}
  - : Chuỗi có giá trị `"outbound-rtp"`, cho biết loại thống kê mà đối tượng chứa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCStatsReport")}}
