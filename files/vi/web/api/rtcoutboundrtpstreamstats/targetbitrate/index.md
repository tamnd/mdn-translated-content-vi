---
title: "RTCOutboundRtpStreamStats: targetBitrate property"
short-title: targetBitrate
slug: Web/API/RTCOutboundRtpStreamStats/targetBitrate
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.targetBitrate
---

{{APIRef("WebRTC")}}

Thuộc tính **`targetBitrate`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} biểu thị tốc độ bit mục tiêu hiện tại của codec đang được sử dụng bởi luồng.

Giá trị là động, phản ánh cài đặt encoder và các yếu tố khác như điều kiện mạng và băng thông khả dụng. Nó nên tương quan chặt chẽ với số byte dữ liệu được gửi mỗi giây (không bao gồm các lần truyền lại).

## Giá trị

Số biểu thị tốc độ mục tiêu tính bằng bit mỗi giây. Điều này được định nghĩa theo cách giống như tốc độ bit {{rfc("3890","Transport Independent Application Specific (TIAS)")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCOutboundRtpStreamStats.bytesSent")}}
- {{domxref("RTCOutboundRtpStreamStats.retransmittedBytesSent")}}
