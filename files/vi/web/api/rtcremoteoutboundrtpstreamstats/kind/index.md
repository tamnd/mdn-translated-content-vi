---
title: "RTCRemoteOutboundRtpStreamStats: thuộc tính kind"
short-title: kind
slug: Web/API/RTCRemoteOutboundRtpStreamStats/kind
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-outbound-rtp.kind
---

{{APIRef("WebRTC")}}

Thuộc tính **`kind`** của từ điển {{domxref("RTCRemoteOutboundRtpStreamStats")}} là một chuỗi cho biết liệu luồng {{Glossary("RTP")}} được mô tả có chứa phương tiện âm thanh hay video.

Chuỗi này luôn giống với {{domxref("MediaStreamTrack.kind", "kind")}} của đối tượng {{domxref("MediaStreamTrack")}} được mang bởi luồng.
Nó cũng khớp với kiểu phương tiện của thuộc tính {{domxref("RTCCodecStats.codec")}} trong đối tượng thống kê.

## Giá trị

Giá trị luôn là một trong:

- `"audio"`
  - : Luồng chứa phương tiện âm thanh.
- `"video"`
  - : Luồng chứa phương tiện video.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
