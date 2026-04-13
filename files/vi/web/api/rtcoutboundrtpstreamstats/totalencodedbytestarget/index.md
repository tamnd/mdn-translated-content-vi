---
title: "RTCOutboundRtpStreamStats: totalEncodedBytesTarget property"
short-title: totalEncodedBytesTarget
slug: Web/API/RTCOutboundRtpStreamStats/totalEncodedBytesTarget
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_outbound-rtp.totalEncodedBytesTarget
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`totalEncodedBytesTarget`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} biểu thị tổng của các kích thước khung hình mục tiêu cho tất cả các khung hình đã được mã hóa đến nay.

Codec có kích thước tối đa mục tiêu cho mỗi khung hình cần nén, tính bằng byte. Thuộc tính này cho biết tổng tích lũy của các kích thước mục tiêu cho từng khung hình tại thời điểm hiện tại. Điều này có thể khác với tổng của các kích thước khung hình thực tế. Bạn có thể so sánh với {{domxref("RTCOutboundRtpStreamStats/bytesSent","bytesSent")}} để ước tính mức độ codec đang khớp với mục tiêu của nó.

Giá trị tăng mỗi khi {{domxref("RTCOutboundRtpStreamStats/framesEncoded","framesEncoded")}} tăng.

> [!NOTE]
> Thuộc tính này không xác định cho các luồng âm thanh.

## Giá trị

Tổng của các kích thước khung hình mục tiêu tính bằng byte, được biểu thị dưới dạng số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
