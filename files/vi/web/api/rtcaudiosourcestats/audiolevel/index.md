---
title: "RTCAudioSourceStats: thuộc tính audioLevel"
short-title: audioLevel
slug: Web/API/RTCAudioSourceStats/audioLevel
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_media-source.audioLevel
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`audioLevel`** của từ điển {{domxref("RTCAudioSourceStats")}} đại diện cho mức âm thanh của nguồn media.

Mức này được tính trung bình trong một khoảng thời gian nhỏ phụ thuộc vào triển khai. Người dùng cũng có thể tính mức âm thanh trung bình trong khoảng thời gian tùy ý bằng thuật toán được mô tả trong [phần mô tả `RTCAudioSourceStats`](/en-US/docs/Web/API/RTCAudioSourceStats#description).

> [!NOTE]
> Để biết mức âm thanh của các track được lấy từ xa, xem {{domxref("RTCInboundRtpStreamStats.audioLevel")}}.

## Giá trị

Một số trong khoảng từ 0 đến 1 (tuyến tính), trong đó 1.0 đại diện cho 0 dBov ([decibel so với full scale (DBFS)](https://en.wikipedia.org/wiki/DBFS)), 0 đại diện cho im lặng và 0.5 đại diện cho khoảng 6 dB SPL thay đổi trong [mức áp suất âm thanh](https://en.wikipedia.org/wiki/Sound_pressure#Sound_pressure_level) từ 0 dBov.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
