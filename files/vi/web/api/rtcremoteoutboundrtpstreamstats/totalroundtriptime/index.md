---
title: "RTCRemoteOutboundRtpStreamStats: thuộc tính totalRoundTripTime"
short-title: totalRoundTripTime
slug: Web/API/RTCRemoteOutboundRtpStreamStats/totalRoundTripTime
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_remote-outbound-rtp.totalRoundTripTime
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`totalRoundTripTime`** của từ điển {{domxref("RTCRemoteOutboundRtpStreamStats")}} cho biết tổng tất cả các đo lường thời gian khứ hồi (RTT) kể từ đầu phiên, tính bằng giây.

Thời gian khứ hồi riêng lẻ được tính dựa trên dấu thời gian RTCP trong khối báo cáo DLRR của Báo cáo Người gửi (SR) RTCP.
RTT trung bình có thể được tính bằng cách chia `totalRoundTripTime` cho {{domxref("RTCRemoteOutboundRtpStreamStats.roundTripTimeMeasurements","roundTripTimeMeasurements")}}.

## Giá trị

Số cho biết tổng thời gian khứ hồi cho phiên, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{rfc("3611","DLRR Report Block", "4.5")}}
