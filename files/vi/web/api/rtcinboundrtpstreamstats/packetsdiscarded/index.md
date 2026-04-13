---
title: "RTCInboundRtpStreamStats: thuộc tính packetsDiscarded"
short-title: packetsDiscarded
slug: Web/API/RTCInboundRtpStreamStats/packetsDiscarded
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.packetsDiscarded
---

{{APIRef("WebRTC")}}

Thuộc tính **`packetsDiscarded`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng số gói {{Glossary("RTP")}} bị bộ đệm {{glossary("jitter","jitter")}} loại bỏ do đến muộn hoặc sớm và do đó không được phát.

Giá trị không bao gồm các gói bị loại bỏ do trùng lặp gói.

## Giá trị

Một số nguyên dương.

Được tính theo định nghĩa trong {{rfc("7002",,"3.2")}} (và phụ lục A.a.).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCRemoteInboundRtpStreamStats.packetsLost", "packetsLost")}}
- {{domxref("RTCRemoteInboundRtpStreamStats.packetsReceived", "packetsReceived")}}
