---
title: "RTCInboundRtpStreamStats: thuộc tính keyFramesDecoded"
short-title: keyFramesDecoded
slug: Web/API/RTCInboundRtpStreamStats/keyFramesDecoded
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.keyFramesDecoded
---

{{APIRef("WebRTC")}}

Thuộc tính **`keyFramesDecoded`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} đại diện cho tổng số khung hình chính được giải mã thành công trong luồng media RTP này.
Điều này bao gồm, ví dụ, khung hình chính trong VP8 ({{rfc("6386")}}) hoặc IDR-frames trong H.264 ({{rfc("6184")}}).

Lưu ý rằng số khung delta được tính bằng cách trừ giá trị này từ tổng số khung hình ({{domxref("RTCInboundRtpStreamStats.framesDecoded","framesDecoded")}} - `keyFramesEncoded`).

> [!NOTE]
> Thuộc tính này không xác định đối với luồng âm thanh.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
