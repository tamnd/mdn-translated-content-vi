---
title: "RTCInboundRtpStreamStats: thuộc tính headerBytesReceived"
short-title: headerBytesReceived
slug: Web/API/RTCInboundRtpStreamStats/headerBytesReceived
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.headerBytesReceived
---

{{APIRef("WebRTC")}}

Thuộc tính **`headerBytesReceived`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng số byte tiêu đề và đệm RTP đã nhận cho [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCInboundRtpStreamStats/ssrc) này, bao gồm cả những byte được gửi trong các lần truyền lại.

Lưu ý rằng tổng số byte nhận được dưới dạng tải trọng qua kênh truyền bằng: `headerBytesReceived` + {{domxref("RTCInboundRtpStreamStats.bytesReceived","bytesReceived")}}.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
