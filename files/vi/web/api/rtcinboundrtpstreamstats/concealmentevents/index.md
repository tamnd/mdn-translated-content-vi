---
title: "RTCInboundRtpStreamStats: thuộc tính concealmentEvents"
short-title: concealmentEvents
slug: Web/API/RTCInboundRtpStreamStats/concealmentEvents
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.concealmentEvents
---

{{APIRef("WebRTC")}}

Thuộc tính **`concealmentEvents`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng số sự kiện che giấu cho track âm thanh được nhận trong suốt vòng đời của đối tượng thống kê này.

Mẫu bị che giấu là mẫu bị mất hoặc đến quá muộn để phát, do đó phải được thay thế bằng một mẫu tổng hợp được tạo ra cục bộ.
Bất kỳ số lượng mẫu bị che giấu liên tiếp nào theo sau một mẫu không bị che giấu đều tạo thành một sự kiện che giấu duy nhất.
Do đó giá trị trong thuộc tính này sẽ nhỏ hơn hoặc bằng {{domxref("RTCInboundRtpStreamStats.concealedSamples", "concealedSamples")}}, vốn đếm từng mẫu riêng lẻ.

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
- {{domxref("RTCInboundRtpStreamStats.silentConcealedSamples")}}
- [Packet loss concealment](https://en.wikipedia.org/wiki/Packet_loss_concealment) trên Wikipedia
