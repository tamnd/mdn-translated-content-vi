---
title: "RTCInboundRtpStreamStats: thuộc tính jitterBufferDelay"
short-title: jitterBufferDelay
slug: Web/API/RTCInboundRtpStreamStats/jitterBufferDelay
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.jitterBufferDelay
---

{{APIRef("WebRTC")}}

Thuộc tính **`jitterBufferDelay`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng thời gian tích lũy mà tất cả các mẫu âm thanh và khung hình video hoàn chỉnh đã trải qua trong {{glossary("jitter","bộ đệm jitter")}}.

Đối với mẫu âm thanh, thời gian được tính từ lúc mẫu được bộ đệm jitter nhận ("dấu thời gian nhập"), cho đến lúc mẫu được phát ra ("dấu thời gian xuất").
Đối với khung hình video, thời gian nhập là khi gói đầu tiên trong khung được nhập cho đến lúc toàn bộ khung hình rời khỏi bộ đệm.
Lưu ý rằng nhiều mẫu âm thanh trong một gói RTP sẽ có cùng dấu thời gian nhập nhưng dấu thời gian xuất khác nhau, trong khi một khung hình video có thể được chia thành nhiều gói RTP.

`jitterBufferDelay` được tăng cùng với {{domxref("RTCInboundRtpStreamStats.jitterBufferEmittedCount", "jitterBufferEmittedCount")}} khi mẫu hoặc khung hình rời khỏi bộ đệm.
Độ trễ bộ đệm jitter trung bình là `jitterBufferDelay / jitterBufferEmittedCount`.

Bộ đệm jitter có thể giữ mẫu/khung hình trong thời gian trễ dài hơn (hoặc ngắn hơn), cho phép các mẫu tích lũy trong bộ đệm để cung cấp luồng phát mượt mà và liên tục hơn.
`jitterBufferDelay` thấp và tương đối ổn định là điều mong muốn, vì nó cho thấy bộ đệm không cần giữ nhiều khung hình/mẫu, và mạng ổn định.
Giá trị cao hơn có thể cho thấy mạng kém tin cậy hoặc khó dự đoán hơn.

Tương tự, độ trễ trung bình ổn định chỉ ra mạng ổn định hơn, trong khi độ trễ trung bình tăng dần chỉ ra độ trễ ngày càng tăng.

## Giá trị

Một số dương, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats.jitterBufferEmittedCount", "jitterBufferEmittedCount")}}
- {{domxref("RTCInboundRtpStreamStats.jitterBufferMinimumDelay", "jitterBufferMinimumDelay")}}
- {{domxref("RTCInboundRtpStreamStats.jitterBufferTargetDelay", "jitterBufferTargetDelay")}}
