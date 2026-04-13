---
title: "RTCRemoteInboundRtpStreamStats: thuộc tính totalRoundTripTime"
short-title: totalRoundTripTime
slug: Web/API/RTCRemoteInboundRtpStreamStats/totalRoundTripTime
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp.totalRoundTripTime
---

{{APIRef("WebRTC")}}

Thuộc tính **`totalRoundTripTime`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} cho biết tổng tích lũy của tất cả các phép đo thời gian vòng lặp (RTT) kể từ đầu phiên, tính bằng giây.

Thời gian vòng lặp riêng lẻ được tính dựa trên các dấu thời gian RTCP trong RTCP Receiver Report (RR), do đó yêu cầu giá trị DLSR khác 0.
RTT trung bình có thể được tính bằng cách chia `totalRoundTripTime` cho {{domxref("RTCRemoteInboundRtpStreamStats.roundTripTimeMeasurements","roundTripTimeMeasurements")}}.

## Giá trị

Một số cho biết tổng thời gian vòng lặp cho phiên, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{rfc("3550","RR: Receiver Report RTCP Packet", "6.4.2")}}
