---
title: "RTCRemoteInboundRtpStreamStats: thuộc tính kind"
short-title: kind
slug: Web/API/RTCRemoteInboundRtpStreamStats/kind
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp.kind
---

{{APIRef("WebRTC")}}

Thuộc tính **`kind`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} là một chuỗi cho biết liệu luồng {{Glossary("RTP")}} được mô tả chứa media âm thanh hay video.

Chuỗi này sẽ luôn giống với {{domxref("MediaStreamTrack.kind", "kind")}} của đối tượng {{domxref("MediaStreamTrack")}} được mang theo luồng.
Nó cũng sẽ khớp với loại media của codec liên kết với đối tượng thống kê này (tức là kiểu MIME của thuộc tính {{domxref("RTCCodecStats.mimeType")}} của codec liên kết).

## Giá trị

Giá trị luôn là một trong:

- `"audio"`
  - : Luồng chứa media âm thanh.
- `"video"`
  - : Luồng chứa media video.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
