---
title: "RTCRemoteInboundRtpStreamStats: thuộc tính roundTripTime"
short-title: roundTripTime
slug: Web/API/RTCRemoteInboundRtpStreamStats/roundTripTime
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp.roundTripTime
---

{{APIRef("WebRTC")}}

Thuộc tính **`roundTripTime`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} cho biết thời gian vòng lặp (RTT) ước tính cho [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCRemoteInboundRtpStreamStats/ssrc) này, tính bằng giây.

Thời gian vòng lặp được tính dựa trên các dấu thời gian RTCP trong RTCP Sender Report (SR), và yêu cầu một báo cáo với khối Delay Since Last SR (DLSR) có giá trị khác 0.
Thuộc tính này không tồn tại cho đến khi nhận được một báo cáo như vậy.

Lưu ý rằng RTT _trung bình_ cho phiên có thể được tính bằng cách chia {{domxref("RTCRemoteInboundRtpStreamStats.totalRoundTripTime","totalRoundTripTime")}} cho {{domxref("RTCRemoteInboundRtpStreamStats.roundTripTimeMeasurements","roundTripTimeMeasurements")}}.

## Giá trị

Một số cho biết thời gian vòng lặp ước tính hiện tại, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{rfc("3550","SR: Sender Report RTCP Packet", "6.4.1")}}
