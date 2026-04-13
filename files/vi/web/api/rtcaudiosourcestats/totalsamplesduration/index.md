---
title: "RTCAudioSourceStats: thuộc tính totalSamplesDuration"
short-title: totalSamplesDuration
slug: Web/API/RTCAudioSourceStats/totalSamplesDuration
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_media-source.totalSamplesDuration
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`totalSamplesDuration`** của từ điển {{domxref("RTCAudioSourceStats")}} đại diện cho tổng thời lượng của tất cả các mẫu được tạo bởi nguồn media trong suốt vòng đời của đối tượng thống kê này, tính bằng giây.
Nó không bao gồm các mẫu bị loại bỏ trước khi đến nguồn media này.

Điều này có thể được sử dụng cùng với {{domxref("RTCAudioSourceStats.totalAudioEnergy", "totalAudioEnergy")}} để tính toán [mức âm thanh trung bình theo các khoảng thời gian khác nhau](/en-US/docs/Web/API/RTCAudioSourceStats#description).

> [!NOTE]
> Để biết thời lượng âm thanh của các track từ nguồn từ xa, xem {{domxref("RTCInboundRtpStreamStats.totalSamplesDuration")}}.

## Giá trị

Một số chỉ định tổng thời lượng của tất cả các mẫu được tạo bởi nguồn này trong suốt vòng đời của đối tượng thống kê này, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
