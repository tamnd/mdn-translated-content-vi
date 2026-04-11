---
title: "RTCIceCandidateStats: thuộc tính type"
short-title: type
slug: Web/API/RTCIceCandidateStats/type
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_local-candidate.type
---

{{APIRef("WebRTC")}}

Thuộc tính **`type`** của từ điển {{domxref("RTCIceCandidateStats")}} là một chuỗi có giá trị `"local-candidate"`.

Các thống kê khác nhau được lấy bằng cách duyệt qua đối tượng {{domxref("RTCStatsReport")}} được trả về bởi lời gọi đến {{domxref("RTCPeerConnection.getStats()")}}.
Loại cho biết tập hợp thống kê có sẵn thông qua đối tượng ở bước lặp cụ thể.
Giá trị `"local-candidate"` cho biết rằng thống kê có sẵn trong bước hiện tại là những thống kê được định nghĩa trong {{domxref("RTCIceCandidateStats")}}.

## Giá trị

Một chuỗi có giá trị `"local-candidate"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
