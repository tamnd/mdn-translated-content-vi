---
title: "RTCInboundRtpStreamStats: thuộc tính audioLevel"
short-title: audioLevel
slug: Web/API/RTCInboundRtpStreamStats/audioLevel
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.audioLevel
---

{{APIRef("WebRTC")}}

Thuộc tính **`audioLevel`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết mức âm thanh của track được nhận (từ xa).

`audioLevel` được tính trung bình theo một khoảng thời gian nhỏ, sử dụng thuật toán được mô tả trong {{domxref("RTCInboundRtpStreamStats.totalAudioEnergy","totalAudioEnergy")}}.
Khoảng thời gian được sử dụng phụ thuộc vào từng bản cài đặt.

> [!NOTE]
> Giá trị này không xác định đối với luồng video.

## Giá trị

Một số thực.

Giá trị nằm trong khoảng 0..1 (tuyến tính), trong đó 1.0 biểu thị 0 dBov ([decibel so với toàn thang (DBFS)](https://en.wikipedia.org/wiki/DBFS)), 0 biểu thị im lặng, và 0.5 biểu thị xấp xỉ thay đổi 6 dB SPL trong [mức áp suất âm](https://en.wikipedia.org/wiki/Sound_pressure#Sound_pressure_level) so với 0 dBov.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCAudioSourceStats.audioLevel")}} đối với mức âm thanh của track cục bộ (đang được gửi đi)
