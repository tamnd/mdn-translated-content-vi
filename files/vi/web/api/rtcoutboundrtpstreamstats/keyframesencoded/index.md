---
title: "RTCOutboundRtpStreamStats: keyFramesEncoded property"
short-title: keyFramesEncoded
slug: Web/API/RTCOutboundRtpStreamStats/keyFramesEncoded
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_outbound-rtp.keyFramesEncoded
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`keyFramesEncoded`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} biểu thị tổng số khung hình chính được mã hóa thành công trong luồng phương tiện RTP này. Bao gồm, ví dụ, khung hình chính trong VP8 ({{rfc("6386")}}) hoặc IDR-frame trong H.264 ({{rfc("6184")}}).

Lưu ý rằng số lượng khung hình delta được tính bằng cách trừ giá trị này khỏi tổng số khung hình ({{domxref("RTCOutboundRtpStreamStats.framesEncoded","framesEncoded")}} - `keyFramesEncoded`).

> [!NOTE]
> Giá trị này không tồn tại cho âm thanh.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
