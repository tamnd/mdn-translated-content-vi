---
title: "RTCOutboundRtpStreamStats: totalPacketSendDelay property"
short-title: totalPacketSendDelay
slug: Web/API/RTCOutboundRtpStreamStats/totalPacketSendDelay
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.totalPacketSendDelay
---

{{APIRef("WebRTC")}}

Thuộc tính **`totalPacketSendDelay`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} biểu thị tổng thời gian tính bằng giây mà các gói dữ liệu đã nằm trong bộ đệm cục bộ trước khi được truyền đi.

Độ trễ của từng gói là thời gian giữa việc một gói được phát ra từ bộ đóng gói RTP và việc nó được chuyển đến socket mạng của hệ điều hành. Độ trễ từng gói được cộng vào `totalPacketSendDelay` khi {{domxref("RTCOutboundRtpStreamStats/framesEncoded","packetsSent")}} tăng lên.

> [!NOTE]
> Thuộc tính này không xác định cho các luồng âm thanh.

## Giá trị

Độ trễ tính bằng giây, được biểu thị dưới dạng số.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
