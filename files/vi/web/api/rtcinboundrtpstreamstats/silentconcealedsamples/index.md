---
title: "RTCInboundRtpStreamStats: thuộc tính silentConcealedSamples"
short-title: silentConcealedSamples
slug: Web/API/RTCInboundRtpStreamStats/silentConcealedSamples
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.silentConcealedSamples
---

{{APIRef("WebRTC")}}

Thuộc tính **`silentConcealedSamples`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng số mẫu che giấu im lặng cho track âm thanh được nhận trong suốt vòng đời của đối tượng thống kê này.

Mẫu bị che giấu là mẫu bị mất hoặc đến quá muộn để phát, do đó phải được thay thế bằng một mẫu tổng hợp được tạo ra cục bộ.
Mẫu che giấu im lặng là mẫu mà mẫu được chèn vào là im lặng hoặc là [tiếng ồn tiện nghi](https://en.wikipedia.org/wiki/Comfort_noise).

> [!NOTE]
> Giá trị này không xác định đối với luồng video.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats.concealedSamples")}}
- {{domxref("RTCInboundRtpStreamStats.concealmentEvents")}}
- [Packet loss concealment](https://en.wikipedia.org/wiki/Packet_loss_concealment) trên Wikipedia
