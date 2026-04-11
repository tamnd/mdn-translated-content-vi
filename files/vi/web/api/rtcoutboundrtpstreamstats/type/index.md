---
title: "RTCOutboundRtpStreamStats: type property"
short-title: type
slug: Web/API/RTCOutboundRtpStreamStats/type
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.type
---

{{APIRef("WebRTC")}}

Thuộc tính **`type`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} là một chuỗi có giá trị `"outbound-rtp"`.

Các thống kê khác nhau được lấy bằng cách lặp qua đối tượng {{domxref("RTCStatsReport")}} được trả về bởi lệnh gọi {{domxref("RTCPeerConnection.getStats()")}}. Loại này cho biết tập hợp thống kê khả dụng thông qua đối tượng trong một bước lặp cụ thể. Giá trị `"outbound-rtp"` cho biết rằng các thống kê khả dụng trong bước hiện tại là những thống kê được định nghĩa trong {{domxref("RTCOutboundRtpStreamStats")}}.

## Giá trị

Một chuỗi có giá trị `"outbound-rtp"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
