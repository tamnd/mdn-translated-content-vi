---
title: RTCInboundRtpStreamStats
slug: Web/API/RTCInboundRtpStreamStats
page-type: web-api-interface
browser-compat: api.RTCStatsReport.type_inbound-rtp
---

{{APIRef("WebRTC")}}

Từ điển **`RTCInboundRtpStreamStats`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) được dùng để báo cáo các thống kê liên quan đến đầu nhận của một luồng RTP ở phía cục bộ của {{domxref("RTCPeerConnection")}}.

Có thể lấy các thống kê bằng cách duyệt qua {{domxref("RTCStatsReport")}} được trả về bởi {{domxref("RTCPeerConnection.getStats()")}} hoặc {{domxref("RTCRtpReceiver.getStats()")}} cho đến khi tìm thấy báo cáo có [`type`](/en-US/docs/Web/API/RTCInboundRtpStreamStats/type) là `inbound-rtp`.

## Thuộc tính phiên bản

- {{domxref("RTCInboundRtpStreamStats.audioLevel", "audioLevel")}}
  - : Một số chỉ ra mức âm thanh của track được nhận.
    _Không xác định đối với luồng video._
- {{domxref("RTCInboundRtpStreamStats.bytesReceived", "bytesReceived")}}
  - : Một số nguyên dương chỉ ra tổng số byte đã nhận được cho đến nay từ nguồn media này.
- {{domxref("RTCInboundRtpStreamStats.concealedSamples", "concealedSamples")}}
  - : Một số nguyên dương chỉ ra số lượng mẫu phải được che giấu do nằm trong các gói bị mất hoặc đến quá muộn để phát.
    _Không xác định đối với luồng video._
- {{domxref("RTCInboundRtpStreamStats.concealmentEvents", "concealmentEvents")}}
  - : Một số nguyên dương chỉ ra số lần xảy ra sự kiện che giấu, trong đó một sự kiện duy nhất được đếm cho tất cả các mẫu che giấu liên tiếp theo sau một mẫu không bị che giấu.
    _Không xác định đối với luồng video._
- {{domxref("RTCInboundRtpStreamStats.estimatedPlayoutTimestamp", "estimatedPlayoutTimestamp")}} {{experimental_inline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} chỉ ra thời gian phát ước tính của track ở bộ nhận này.
- {{domxref("RTCInboundRtpStreamStats.fecPacketsDiscarded", "fecPacketsDiscarded")}}
  - : Một số nguyên dương chỉ ra số gói RTP Forward Error Correction (FEC) đã nhận được cho nguồn này mà phần dữ liệu sửa lỗi đã bị bỏ qua.
- {{domxref("RTCInboundRtpStreamStats.fecPacketsReceived", "fecPacketsReceived")}}
  - : Một số nguyên dương chỉ ra tổng số gói Forward Error Correction (FEC) đã nhận được cho nguồn này.
- {{domxref("RTCInboundRtpStreamStats.frameHeight", "frameHeight")}}
  - : Một số nguyên dương chỉ ra chiều cao của khung hình được giải mã gần nhất, tính bằng pixel.
    _Không xác định đối với luồng âm thanh và trước khi khung hình đầu tiên được giải mã._
- {{domxref("RTCInboundRtpStreamStats.framesAssembledFromMultiplePackets", "framesAssembledFromMultiplePackets")}} {{experimental_inline}}
  - : Một số nguyên dương chỉ ra tổng số khung hình được giải mã đúng trong luồng RTP này được lắp ráp từ nhiều hơn một gói RTP.
    _Không xác định đối với luồng âm thanh._
- {{domxref("RTCInboundRtpStreamStats.framesDecoded", "framesDecoded")}}
  - : Một số nguyên kiểu long chỉ ra tổng số khung hình video đã được giải mã thành công cho đến nay từ nguồn media này. Đây là số khung hình sẽ được hiển thị nếu không có khung nào bị bỏ.
    _Không xác định đối với luồng âm thanh._
- {{domxref("RTCInboundRtpStreamStats.framesPerSecond", "framesPerSecond")}}
  - : Một số nguyên dương chỉ ra số khung hình được giải mã trong giây vừa qua.
    _Không xác định đối với luồng âm thanh._
- {{domxref("RTCInboundRtpStreamStats.framesReceived", "framesReceived")}}
  - : Một số nguyên dương chỉ ra tổng số khung hình hoàn chỉnh đã nhận được trên luồng RTP này.
    _Không xác định đối với luồng âm thanh._
- {{domxref("RTCInboundRtpStreamStats.frameWidth", "frameWidth")}}
  - : Một số nguyên dương chỉ ra chiều rộng của khung hình được giải mã gần nhất, tính bằng pixel.
    _Không xác định đối với luồng âm thanh và trước khi khung hình đầu tiên được giải mã._
- {{domxref("RTCInboundRtpStreamStats.freezeCount", "freezeCount")}} {{experimental_inline}}
  - : Một số nguyên dương chỉ ra tổng số lần đóng băng video mà bộ nhận này gặp phải.
    _Không xác định đối với luồng âm thanh._
- {{domxref("RTCInboundRtpStreamStats.headerBytesReceived", "headerBytesReceived")}}
  - : Một số nguyên dương chỉ ra tổng số byte tiêu đề và đệm RTP đã nhận cho SSRC này, bao gồm cả các lần truyền lại.
- {{domxref("RTCInboundRtpStreamStats.insertedSamplesForDeceleration", "insertedSamplesForDeceleration")}}
  - : Một số nguyên dương chỉ ra số lượng mẫu được chèn vào để làm chậm tốc độ phát từ bộ đệm jitter.
    _Không xác định đối với luồng video._
- {{domxref("RTCInboundRtpStreamStats.jitterBufferDelay", "jitterBufferDelay")}}
  - : Một số chỉ ra tổng thời gian tích lũy mà tất cả các mẫu âm thanh và khung hình video hoàn chỉnh đã trải qua trong bộ đệm jitter, tính bằng giây.
- {{domxref("RTCInboundRtpStreamStats.jitterBufferEmittedCount", "jitterBufferEmittedCount")}}
  - : Một số nguyên dương chỉ ra tổng số mẫu âm thanh và/hoặc khung hình video đã ra khỏi bộ đệm jitter.
- {{domxref("RTCInboundRtpStreamStats.jitterBufferMinimumDelay", "jitterBufferMinimumDelay")}}
  - : Một số chỉ ra độ trễ tối thiểu có thể đạt được chỉ dựa trên các đặc tính mạng như jitter và mất gói.
- {{domxref("RTCInboundRtpStreamStats.jitterBufferTargetDelay", "jitterBufferTargetDelay")}}
  - : Một số chỉ ra tổng độ trễ mục tiêu của bộ đệm jitter tích lũy.
- {{domxref("RTCInboundRtpStreamStats.keyFramesDecoded", "keyFramesDecoded")}}
  - : Một số nguyên dương chỉ ra tổng số khung hình chính được giải mã thành công cho luồng media RTP này.
    _Không xác định đối với luồng âm thanh._
- {{domxref("RTCInboundRtpStreamStats.lastPacketReceivedTimestamp", "lastPacketReceivedTimestamp")}}
  - : Một {{domxref("DOMHighResTimeStamp")}} chỉ ra thời điểm nhận được gói cuối cùng từ nguồn này.
    Ngược lại, thuộc tính [`timestamp`](/en-US/docs/Web/API/RTCInboundRtpStreamStats/timestamp) chỉ ra thời điểm đối tượng thống kê được tạo ra.
- {{domxref("RTCInboundRtpStreamStats.mid", "mid")}}
  - : Một chuỗi xác định duy nhất cặp nguồn và đích của luồng transceiver.
    Đây là giá trị của {{domxref("RTCRtpTransceiver.mid")}} tương ứng trừ khi giá trị đó là null, trong trường hợp đó thuộc tính thống kê này không tồn tại.
- {{domxref("RTCInboundRtpStreamStats.packetsDiscarded", "packetsDiscarded")}}
  - : Một số nguyên dương chỉ ra tổng số gói RTP đã bị bộ đệm jitter loại bỏ do đến muộn hoặc sớm.
- {{domxref("RTCInboundRtpStreamStats.pauseCount", "pauseCount")}} {{experimental_inline}}
  - : Một số nguyên dương chỉ ra tổng số lần dừng video mà bộ nhận này gặp phải.
    _Không xác định đối với luồng âm thanh._
- {{domxref("RTCInboundRtpStreamStats.playoutId", "playoutId")}} {{experimental_inline}}
  - : Một chuỗi xác định {{domxref("RTCAudioPlayoutStats")}} tương ứng cho luồng âm thanh.
    _Không xác định đối với luồng video._
- {{domxref("RTCInboundRtpStreamStats.remoteId", "remoteId")}}
  - : Một chuỗi xác định đối tượng {{domxref("RTCRemoteOutboundRtpStreamStats")}} cung cấp thống kê cho peer từ xa với cùng SSRC này.
    ID này ổn định qua nhiều lần gọi `getStats()`.
- {{domxref("RTCInboundRtpStreamStats.removedSamplesForAcceleration", "removedSamplesForAcceleration")}}
  - : Một số nguyên dương chỉ ra số lượng mẫu bị loại bỏ để tăng tốc độ phát từ bộ đệm jitter.
    _Không xác định đối với luồng video._
- {{domxref("RTCInboundRtpStreamStats.silentConcealedSamples", "silentConcealedSamples")}}
  - : Một số nguyên dương chỉ ra số lượng mẫu che giấu im lặng.
    _Không xác định đối với luồng video._
- {{domxref("RTCInboundRtpStreamStats.totalAssemblyTime", "totalAssemblyTime")}} {{experimental_inline}}
  - : Một số chỉ ra tổng thời gian dành để lắp ráp các khung hình video được giải mã thành công được truyền trong nhiều gói RTP, tính bằng giây.
    _Không xác định đối với luồng âm thanh._
- {{domxref("RTCInboundRtpStreamStats.totalAudioEnergy", "totalAudioEnergy")}}
  - : Một số đại diện cho tổng năng lượng âm thanh của track được nhận trong suốt vòng đời của đối tượng thống kê.
    _Không xác định đối với luồng video._
- {{domxref("RTCInboundRtpStreamStats.totalDecodeTime", "totalDecodeTime")}}
  - : Một số chỉ ra tổng thời gian dành để giải mã các khung hình trong luồng này, tính bằng giây.
    _Không xác định đối với luồng âm thanh._
- {{domxref("RTCInboundRtpStreamStats.totalFreezesDuration", "totalFreezesDuration")}} {{experimental_inline}}
  - : Một số dương chỉ ra tổng thời gian luồng bị đóng băng, tính bằng giây.
    _Không xác định đối với luồng âm thanh._
- {{domxref("RTCInboundRtpStreamStats.totalInterFrameDelay", "totalInterFrameDelay")}}
  - : Một số dương chỉ ra tổng thời gian giữa các khung hình được hiển thị liên tiếp, được ghi lại ngay sau khi một khung hình được hiển thị.
    _Không xác định đối với luồng âm thanh._
- {{domxref("RTCInboundRtpStreamStats.totalPausesDuration", "totalPausesDuration")}} {{experimental_inline}}
  - : Một số dương chỉ ra tổng thời gian luồng ở trạng thái dừng video, tính bằng giây.
    _Không xác định đối với luồng âm thanh._
- {{domxref("RTCInboundRtpStreamStats.totalProcessingDelay", "totalProcessingDelay")}}
  - : Một số dương chỉ ra tổng thời gian xử lý các mẫu âm thanh hoặc video, tính bằng giây.
- {{domxref("RTCInboundRtpStreamStats.totalSamplesDuration", "totalSamplesDuration")}}
  - : Một số dương chỉ ra tổng thời lượng của tất cả các mẫu đã nhận được, tính bằng giây.
    _Không xác định đối với luồng video._
- {{domxref("RTCInboundRtpStreamStats.totalSamplesReceived", "totalSamplesReceived")}}
  - : Một số nguyên dương chỉ ra tổng số mẫu đã nhận trên luồng này.
    _Không xác định đối với luồng video._
- {{domxref("RTCInboundRtpStreamStats.totalSquaredInterFrameDelay", "totalSquaredInterFrameDelay")}}
  - : Một số dương chỉ ra tổng bình phương của độ trễ giữa các khung hình được hiển thị liên tiếp, được ghi lại ngay sau khi một khung hình được hiển thị.
    _Không xác định đối với luồng âm thanh._
- {{domxref("RTCInboundRtpStreamStats.trackIdentifier", "trackIdentifier")}}
  - : Một chuỗi cung cấp giá trị {{domxref("MediaStreamTrack.id", "id")}} của `MediaStreamTrack` được liên kết với luồng đến.

### Các phép đo chỉ ở cục bộ

Các thuộc tính này được tính toán cục bộ và chỉ có sẵn cho thiết bị nhận luồng media.
Mục đích chính của chúng là để xem xét khả năng chịu lỗi của kết nối, vì chúng cung cấp thông tin về các gói bị mất, khung hình bị mất và mức độ nén dữ liệu.

- {{domxref("RTCInboundRtpStreamStats.nackCount", "nackCount")}}
  - : Một số chỉ ra số lần bộ nhận thông báo cho người gửi rằng một hoặc nhiều gói RTP đã bị mất bằng cách gửi gói Negative ACKnowledgement (NACK, còn gọi là "Generic NACK") cho người gửi. Giá trị này chỉ có sẵn cho bộ nhận.
- {{domxref("RTCInboundRtpStreamStats.qpSum", "qpSum")}}
  - : Một số nguyên dương cung cấp tổng các giá trị QP cho mỗi khung hình được bộ nhận RTP này giải mã cho đến nay trên track video được mô tả bởi đối tượng thống kê này.
    _Chỉ hợp lệ đối với luồng video._

### Thống kê được đo ở đầu nhận của luồng RTP

<!-- RTCReceivedRtpStreamStats -->

Các thống kê này được đo ở đầu nhận của luồng RTP, bất kể đó là cục bộ hay từ xa.

- {{domxref("RTCInboundRtpStreamStats.packetsReceived", "packetsReceived")}}
  - : Tổng số gói RTP đã nhận cho [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCInboundRtpStreamStats/ssrc) này, bao gồm cả các lần truyền lại.
- {{domxref("RTCInboundRtpStreamStats.packetsLost", "packetsLost")}}
  - : Tổng số gói RTP bị mất cho [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCInboundRtpStreamStats/ssrc) này.
    Lưu ý rằng giá trị này có thể âm vì có thể nhận được nhiều gói hơn so với bộ nhận mong đợi.
- {{domxref("RTCInboundRtpStreamStats.jitter", "jitter")}}
  - : Jitter gói của [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCInboundRtpStreamStats/ssrc) này, được đo bằng giây.

### Thống kê luồng RTP chung

<!-- RTCRtpStreamStats -->

- {{domxref("RTCInboundRtpStreamStats.codecId", "codecId")}}
  - : Một chuỗi xác định duy nhất đối tượng được kiểm tra để tạo ra đối tượng {{domxref("RTCCodecStats")}} liên kết với luồng {{Glossary("RTP")}} này.
- {{domxref("RTCInboundRtpStreamStats.kind", "kind")}}
  - : Một chuỗi cho biết {{domxref("MediaStreamTrack")}} liên kết với luồng là track âm thanh hay video.
- {{domxref("RTCInboundRtpStreamStats.ssrc", "ssrc")}}
  - : Số nguyên 32-bit xác định nguồn của các gói RTP mà đối tượng này cung cấp.
    Giá trị này được tạo theo đặc tả {{RFC(3550)}}.
- {{domxref("RTCInboundRtpStreamStats.transportId", "transportId")}}
  - : Một chuỗi xác định duy nhất đối tượng được kiểm tra để tạo ra đối tượng {{domxref("RTCTransportStats")}} liên kết với luồng RTP này.

### Thuộc tính phiên bản chung

Các thuộc tính sau đây có ở tất cả các đối tượng thống kê WebRTC.

<!-- RTCStats -->

- {{domxref("RTCInboundRtpStreamStats.id", "id")}}
  - : Một chuỗi xác định duy nhất đối tượng đang được giám sát để tạo ra tập hợp thống kê này.
- {{domxref("RTCInboundRtpStreamStats.timestamp", "timestamp")}}
  - : Một đối tượng {{domxref("DOMHighResTimeStamp")}} chỉ ra thời điểm lấy mẫu cho đối tượng thống kê này.
- {{domxref("RTCInboundRtpStreamStats.type", "type")}}
  - : Một chuỗi có giá trị `"inbound-rtp"`, chỉ ra loại thống kê mà đối tượng chứa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCStatsReport")}}
