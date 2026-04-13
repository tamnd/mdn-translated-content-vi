---
title: "RTCRemoteInboundRtpStreamStats: thuộc tính packetsReceived"
short-title: packetsReceived
slug: Web/API/RTCRemoteInboundRtpStreamStats/packetsReceived
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp.packetsReceived
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`packetsReceived`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} trả về tổng số gói {{Glossary("RTP")}} được nhận từ [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCRemoteInboundRtpStreamStats/ssrc) của luồng này bởi điểm cuối từ xa, bao gồm cả các lần truyền lại.

## Giá trị

Một số nguyên dương cho biết tổng số gói RTP đã nhận ở điểm cuối từ xa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCRemoteInboundRtpStreamStats.ssrc")}}
- {{domxref("RTCInboundRtpStreamStats.packetsReceived")}}
