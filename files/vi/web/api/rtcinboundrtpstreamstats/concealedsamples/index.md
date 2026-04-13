---
title: "RTCInboundRtpStreamStats: thuộc tính concealedSamples"
short-title: concealedSamples
slug: Web/API/RTCInboundRtpStreamStats/concealedSamples
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.concealedSamples
---

{{APIRef("WebRTC")}}

Thuộc tính **`concealedSamples`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng số mẫu bị che giấu cho track âm thanh được nhận trong suốt vòng đời của đối tượng thống kê này.

Mẫu bị che giấu là mẫu bị mất hoặc đến quá muộn để phát, do đó phải được thay thế bằng một mẫu tổng hợp được tạo ra cục bộ.
Lưu ý rằng các mẫu bị mất được báo cáo trong {{domxref("RTCInboundRtpStreamStats.packetsLost", "packetsLost")}}, trong khi các gói đến muộn được báo cáo trong {{domxref("RTCInboundRtpStreamStats.fecPacketsDiscarded", "fecPacketsDiscarded")}}.

> [!NOTE]
> Giá trị này không xác định đối với luồng video.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats.silentConcealedSamples")}}
- {{domxref("RTCInboundRtpStreamStats.concealmentEvents")}}
- [Packet loss concealment](https://en.wikipedia.org/wiki/Packet_loss_concealment) trên Wikipedia
