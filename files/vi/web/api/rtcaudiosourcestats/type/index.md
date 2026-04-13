---
title: "RTCAudioSourceStats: thuộc tính type"
short-title: type
slug: Web/API/RTCAudioSourceStats/type
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_media-source.type
---

{{APIRef("WebRTC")}}

Thuộc tính **`type`** của từ điển {{domxref("RTCAudioSourceStats")}} là chuỗi có giá trị `media-source`.

Loại `media-source` xác định loại thống kê là {{domxref("RTCAudioSourceStats")}} hoặc {{domxref("RTCVideoSourceStats")}} khi lặp qua {{domxref("RTCStatsReport")}} được trả về bởi {{domxref("RTCRtpSender.getStats()")}} hoặc {{domxref("RTCPeerConnection.getStats()")}}.
Loại thống kê có thể được phân biệt thêm bằng thuộc tính {{domxref("RTCAudioSourceStats.kind", "kind")}}, giá trị `audio` dành cho `RTCAudioSourceStats`.

## Giá trị

Một chuỗi có giá trị `media-source`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
