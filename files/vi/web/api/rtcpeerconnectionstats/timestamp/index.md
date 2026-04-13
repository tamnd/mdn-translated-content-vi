---
title: "RTCPeerConnectionStats: thuộc tính timestamp"
short-title: timestamp
slug: Web/API/RTCPeerConnectionStats/timestamp
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_peer-connection.timestamp
---

{{APIRef("WebRTC")}}

Thuộc tính **`timestamp`** của dictionary {{domxref("RTCPeerConnectionStats")}} là một đối tượng {{domxref("DOMHighResTimeStamp")}} chỉ định thời gian tại đó dữ liệu trong đối tượng được lấy mẫu.

## Giá trị

Một giá trị {{domxref("DOMHighResTimeStamp")}} cho biết thời gian tại đó hoạt động được mô tả bởi các thống kê trong đối tượng này được ghi lại, tính bằng mili giây tính từ đầu ngày 1 tháng 1 năm 1970, UTC.

Giá trị phải chính xác trong vòng vài mili giây nhưng có thể không hoàn toàn chính xác, vì lý do giới hạn phần cứng hoặc hệ điều hành hoặc vì [fingerprinting](/en-US/docs/Glossary/Fingerprinting) bảo vệ dưới dạng giảm độ chính xác hoặc độ chính xác đồng hồ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
