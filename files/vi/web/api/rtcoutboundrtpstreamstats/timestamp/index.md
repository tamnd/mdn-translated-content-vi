---
title: "RTCOutboundRtpStreamStats: timestamp property"
short-title: timestamp
slug: Web/API/RTCOutboundRtpStreamStats/timestamp
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.timestamp
---

{{APIRef("WebRTC")}}

Thuộc tính **`timestamp`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} là đối tượng {{domxref("DOMHighResTimeStamp")}} xác định thời điểm dữ liệu trong đối tượng được lấy mẫu.

## Giá trị

Giá trị {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm hoạt động được mô tả bởi các thống kê trong đối tượng này được ghi lại, tính bằng mili giây kể từ đầu ngày 1 tháng 1 năm 1970, UTC.

Giá trị nên chính xác trong vài mili giây nhưng có thể không hoàn toàn chính xác, do giới hạn phần cứng hoặc hệ điều hành, hoặc do biện pháp bảo vệ [lấy dấu vân tay](/en-US/docs/Glossary/Fingerprinting) dưới dạng giảm độ chính xác hoặc độ phân giải đồng hồ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
