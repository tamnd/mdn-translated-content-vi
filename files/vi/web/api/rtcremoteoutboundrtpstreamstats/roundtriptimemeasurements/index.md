---
title: "RTCRemoteOutboundRtpStreamStats: thuộc tính roundTripTimeMeasurements"
short-title: roundTripTimeMeasurements
slug: Web/API/RTCRemoteOutboundRtpStreamStats/roundTripTimeMeasurements
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_remote-outbound-rtp.roundTripTimeMeasurements
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`roundTripTimeMeasurements`** của từ điển {{domxref("RTCRemoteOutboundRtpStreamStats")}} là một số nguyên dương đại diện cho tổng số đo lường thời gian khứ hồi hợp lệ nhận được cho [nguồn đồng bộ (SSRC)](/en-US/docs/Web/API/RTCRemoteOutboundRtpStreamStats/ssrc) này.

Số đếm có thể được sử dụng như một thước đo về tính sẵn có và độ tin cậy của dữ liệu đo lường thời gian khứ hồi.

## Giá trị

Số dương cho biết số lần đo thời gian khứ hồi hợp lệ.

Đây là số _Báo cáo Người gửi RTCP (SR)_ được nhận cho SSRC này có chứa trường "delay since last RR (DLRR)" từ đó có thể suy ra thời gian khứ hồi hợp lệ (theo {{rfc("3611","DLRR Report Block", "4.5")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
