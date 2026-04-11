---
title: "RTCInboundRtpStreamStats: thuộc tính type"
short-title: type
slug: Web/API/RTCInboundRtpStreamStats/type
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.type
---

{{APIRef("WebRTC")}}

Thuộc tính **`type`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} là một chuỗi có giá trị `"inbound-rtp"`.

Các thống kê khác nhau được lấy bằng cách duyệt qua đối tượng {{domxref("RTCStatsReport")}} được trả về bởi lời gọi đến {{domxref("RTCPeerConnection.getStats()")}}.
Loại cho biết tập hợp thống kê có sẵn thông qua đối tượng ở bước lặp cụ thể.
Giá trị `"inbound-rtp"` cho biết rằng thống kê có sẵn trong bước hiện tại là những thống kê được định nghĩa trong {{domxref("RTCInboundRtpStreamStats")}}.

## Giá trị

Một chuỗi có giá trị `"inbound-rtp"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
