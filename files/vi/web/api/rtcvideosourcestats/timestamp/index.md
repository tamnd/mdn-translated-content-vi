---
title: "RTCVideoSourceStats: timestamp property"
short-title: timestamp
slug: Web/API/RTCVideoSourceStats/timestamp
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_media-source.timestamp
---

{{APIRef("WebRTC")}}

Thuộc tính **`timestamp`** của từ điển {{domxref("RTCVideoSourceStats")}} là một đối tượng {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm dữ liệu trong đối tượng được lấy mẫu.

Thời gian được biểu thị bằng mili giây tính từ thời điểm đầu tiên của ngày 1 tháng 1 năm 1970, UTC (còn gọi là [Unix time](/en-US/docs/Glossary/Unix_time)).

## Giá trị

Một giá trị {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm hoạt động được mô tả bởi thống kê trong đối tượng này được ghi lại, tính bằng mili giây kể từ đầu ngày 1 tháng 1 năm 1970, UTC.

Giá trị này phải chính xác trong vài mili giây nhưng có thể không hoàn toàn chính xác, do giới hạn phần cứng hoặc hệ điều hành, hoặc do biện pháp bảo vệ [fingerprinting](/en-US/docs/Glossary/Fingerprinting) dưới dạng giảm độ chính xác của đồng hồ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
