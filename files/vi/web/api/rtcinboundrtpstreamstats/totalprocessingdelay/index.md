---
title: "RTCInboundRtpStreamStats: thuộc tính totalProcessingDelay"
short-title: totalProcessingDelay
slug: Web/API/RTCInboundRtpStreamStats/totalProcessingDelay
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.totalProcessingDelay
---

{{APIRef("WebRTC")}}

Thuộc tính **`totalProcessingDelay`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng thời gian tích lũy dành để xử lý các mẫu âm thanh hoặc video, tính bằng giây.

Thời gian xử lý cho mỗi mẫu âm thanh hoặc video được tính từ thời điểm gói RTP đầu tiên được nhận (dấu thời gian nhận) đến thời điểm mẫu hoặc khung hình tương ứng được giải mã (dấu thời gian giải mã).
Tại thời điểm này, mẫu âm thanh hoặc khung hình video đã được bộ giải mã giải mã hoàn toàn và sẵn sàng phát bởi {{domxref("MediaStreamTrack")}}.

Đối với luồng âm thanh, một gói RTP có thể chứa nhiều mẫu âm thanh: chúng sẽ có cùng dấu thời gian nhận.
Đối với luồng video, một khung hình hoàn chỉnh có thể đến trong nhiều gói RTP, và dấu thời gian nhận là của gói RTP đầu tiên được nhận chứa dữ liệu cho khung hình.
Trong cả hai trường hợp, dấu thời gian giải mã là thời điểm mẫu hoặc khung hình sẵn sàng để phát.

Đối với video, thuộc tính chỉ tích lũy cho các khung hình được giải mã (không phải những khung bị bỏ).
Độ trễ xử lý trung bình có thể được tính bằng cách chia `totalProcessingDelay` với {{domxref("RTCInboundRtpStreamStats.framesDecoded","framesDecoded")}}.

## Giá trị

Một số dương, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
