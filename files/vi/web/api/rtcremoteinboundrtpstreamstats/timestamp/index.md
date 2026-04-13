---
title: "RTCRemoteInboundRtpStreamStats: thuộc tính timestamp"
short-title: timestamp
slug: Web/API/RTCRemoteInboundRtpStreamStats/timestamp
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp.timestamp
---

{{APIRef("WebRTC")}}

Thuộc tính **`timestamp`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} là đối tượng {{domxref("DOMHighResTimeStamp")}} chỉ ra thời điểm dữ liệu trong đối tượng được lấy mẫu.

Đối với đối tượng này, dấu thời gian là thời điểm _RTCP Receiver Report (RR)_ được nhận ở đầu cục bộ của kết nối (báo cáo RR được định nghĩa trong {{rfc("3550","", "6.4.2")}}).

## Giá trị

Giá trị {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm hoạt động được mô tả bởi thống kê trong đối tượng này được ghi lại, tính bằng mili giây kể từ ngày 1 tháng 1 năm 1970 theo UTC.

Giá trị nên chính xác trong vài mili giây nhưng có thể không hoàn toàn chính xác, do giới hạn phần cứng hoặc hệ điều hành hoặc do bảo vệ [lấy dấu vân tay](/en-US/docs/Glossary/Fingerprinting) dưới dạng giảm độ chính xác hoặc độ chính xác của đồng hồ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
