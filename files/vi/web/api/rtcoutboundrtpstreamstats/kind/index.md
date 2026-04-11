---
title: "RTCOutboundRtpStreamStats: kind property"
short-title: kind
slug: Web/API/RTCOutboundRtpStreamStats/kind
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.kind
---

{{APIRef("WebRTC")}}

Thuộc tính **`kind`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} là một chuỗi cho biết liệu luồng {{Glossary("RTP")}} được mô tả có chứa phương tiện âm thanh hay video.

Chuỗi này luôn giống với {{domxref("MediaStreamTrack.kind", "kind")}} của đối tượng {{domxref("MediaStreamTrack")}} được mang bởi luồng. Nó cũng sẽ khớp với loại phương tiện của codec liên quan đến đối tượng thống kê này (tức là loại MIME của {{domxref("RTCCodecStats.mimeType")}} của codec liên quan).

## Giá trị

Loại luôn là một trong:

- `"audio"`
  - : Luồng chứa phương tiện âm thanh.
- `"video"`
  - : Luồng chứa phương tiện video.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
