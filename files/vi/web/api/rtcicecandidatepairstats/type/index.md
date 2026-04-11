---
title: "RTCIceCandidatePairStats: type property"
short-title: type
slug: Web/API/RTCIceCandidatePairStats/type
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_candidate-pair.type
---

{{APIRef("WebRTC")}}

Thuộc tính **`type`** của từ điển {{domxref("RTCIceCandidatePairStats")}} là một chuỗi có giá trị `"candidate-pair"`.

Các thống kê khác nhau được lấy bằng cách lặp qua đối tượng {{domxref("RTCStatsReport")}} được trả về bởi lệnh gọi {{domxref("RTCPeerConnection.getStats()")}}. Loại này cho biết tập hợp thống kê khả dụng thông qua đối tượng trong một bước lặp cụ thể. Giá trị `"candidate-pair"` cho biết rằng các thống kê khả dụng trong bước hiện tại là những thống kê được định nghĩa trong {{domxref("RTCIceCandidatePairStats")}}.

## Giá trị

Một chuỗi có giá trị `"candidate-pair"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
