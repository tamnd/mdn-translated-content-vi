---
title: "RTCRemoteInboundRtpStreamStats: thuộc tính roundTripTimeMeasurements"
short-title: roundTripTimeMeasurements
slug: Web/API/RTCRemoteInboundRtpStreamStats/roundTripTimeMeasurements
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp.roundTripTimeMeasurements
---

{{APIRef("WebRTC")}}

Thuộc tính **`roundTripTimeMeasurements`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} chứa một số nguyên dương đại diện cho tổng số phép đo thời gian vòng lặp hợp lệ đã nhận cho [nguồn đồng bộ hóa](/en-US/docs/Web/API/RTCRemoteInboundRtpStreamStats/ssrc) này.

Số lượng có thể được dùng như một thước đo về tính sẵn có và độ tin cậy của dữ liệu đo lường thời gian vòng lặp.

## Giá trị

Một số dương cho biết số phép đo thời gian vòng lặp hợp lệ.

Đây là số lượng _RTCP Receiver Reports (RR)_ được nhận cho [nguồn đồng bộ hóa](/en-US/docs/Web/API/RTCRemoteInboundRtpStreamStats/ssrc) này có chứa giá trị khác không trong trường "delay since last SR (DLSR)".

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{rfc("3550","RR: Receiver Report RTCP Packet", "6.4.2")}}
