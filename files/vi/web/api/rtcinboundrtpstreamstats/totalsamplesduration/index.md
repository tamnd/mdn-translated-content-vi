---
title: "RTCInboundRtpStreamStats: thuộc tính totalSamplesDuration"
short-title: totalSamplesDuration
slug: Web/API/RTCInboundRtpStreamStats/totalSamplesDuration
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.totalSamplesDuration
---

{{APIRef("WebRTC")}}

Thuộc tính **`totalSamplesDuration`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} cho biết tổng thời lượng của tất cả các mẫu âm thanh đã nhận được.
Nói cách khác, thời lượng hiện tại của track.

Có thể sử dụng điều này cùng với {{domxref("RTCInboundRtpStreamStats/totalAudioEnergy","totalAudioEnergy")}} để tính toán mức âm thanh trung bình theo các khoảng thời gian khác nhau.

> [!NOTE]
> Giá trị này không xác định đối với luồng video.

## Giá trị

Một số dương, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCAudioSourceStats.totalSamplesDuration")}} đối với thời lượng âm thanh của các mẫu được gửi đi.
- {{domxref("RTCInboundRtpStreamStats/totalSamplesReceived","totalSamplesReceived")}}
