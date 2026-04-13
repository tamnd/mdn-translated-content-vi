---
title: "RTCPeerConnectionStats: thuộc tính type"
short-title: type
slug: Web/API/RTCPeerConnectionStats/type
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_peer-connection.type
---

{{APIRef("WebRTC")}}

Thuộc tính **`type`** của dictionary {{domxref("RTCPeerConnectionStats")}} là một chuỗi với giá trị `"peer-connection"`.

Các thống kê khác nhau được lấy bằng cách lặp đối tượng {{domxref("RTCStatsReport")}} được trả về bởi lời gọi {{domxref("RTCPeerConnection.getStats()")}}.
Loại cho biết tập hợp thống kê có sẵn thông qua đối tượng trong một bước lặp cụ thể.
Giá trị `"peer-connection"` cho biết rằng các thống kê có sẵn trong bước hiện tại là những thống kê được định nghĩa trong {{domxref("RTCPeerConnectionStats")}}.

## Giá trị

Một chuỗi với giá trị `"peer-connection"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
