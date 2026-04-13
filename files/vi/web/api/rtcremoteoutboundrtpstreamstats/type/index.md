---
title: "RTCRemoteOutboundRtpStreamStats: thuộc tính type"
short-title: type
slug: Web/API/RTCRemoteOutboundRtpStreamStats/type
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-outbound-rtp.type
---

{{APIRef("WebRTC")}}

Thuộc tính **`type`** của từ điển {{domxref("RTCRemoteOutboundRtpStreamStats")}} là một chuỗi có giá trị `"remote-outbound-rtp"`.

Các thống kê khác nhau được lấy bằng cách lặp qua đối tượng {{domxref("RTCStatsReport")}} được trả về bởi lần gọi {{domxref("RTCPeerConnection.getStats()")}}.
Kiểu cho biết tập hợp thống kê có sẵn thông qua đối tượng trong một bước lặp cụ thể.
Giá trị `"remote-outbound-rtp"` cho biết rằng các thống kê có sẵn trong bước hiện tại là những thống kê được định nghĩa trong {{domxref("RTCRemoteOutboundRtpStreamStats")}}.

## Giá trị

Chuỗi có giá trị `"remote-outbound-rtp"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
