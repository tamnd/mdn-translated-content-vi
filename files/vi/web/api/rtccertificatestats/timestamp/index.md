---
title: "RTCCertificateStats: thuộc tính timestamp"
short-title: timestamp
slug: Web/API/RTCCertificateStats/timestamp
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_certificate.timestamp
---

{{APIRef("WebRTC")}}

Thuộc tính **`timestamp`** của từ điển {{domxref("RTCCertificateStats")}} là một đối tượng {{domxref("DOMHighResTimeStamp")}} chỉ định thời gian mà dữ liệu trong đối tượng được lấy mẫu.

## Giá trị

Giá trị {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm hoạt động được mô tả bởi thống kê trong đối tượng này được ghi lại, tính bằng mili giây kể từ đầu ngày 1 tháng 1 năm 1970 theo giờ UTC.

Giá trị phải chính xác trong vài mili giây nhưng có thể không hoàn toàn chính xác, do giới hạn phần cứng hoặc hệ điều hành, hoặc do bảo vệ [dấu vân tay](/en-US/docs/Glossary/Fingerprinting) bằng cách giảm độ chính xác hoặc độ phân giải của đồng hồ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
