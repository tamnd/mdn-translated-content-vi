---
title: "RTCOutboundRtpStreamStats: headerBytesSent property"
short-title: headerBytesSent
slug: Web/API/RTCOutboundRtpStreamStats/headerBytesSent
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.headerBytesSent
---

{{APIRef("WebRTC")}}

Thuộc tính **`headerBytesSent`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} cho biết tổng số byte header RTP và byte đệm đã gửi cho [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCOutboundRtpStreamStats/ssrc) này.

Lưu ý rằng tổng số byte đã gửi dưới dạng dữ liệu qua transport bằng: `headerBytesSent` + {{domxref("RTCOutboundRtpStreamStats.bytesSent","bytesSent")}}.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
