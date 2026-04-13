---
title: "RTCVideoSourceStats: kind property"
short-title: kind
slug: Web/API/RTCVideoSourceStats/kind
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_media-source.kind
---

{{APIRef("WebRTC")}}

Thuộc tính **`kind`** của từ điển {{domxref("RTCVideoSourceStats")}} là một chuỗi có giá trị `video`.

`kind` được dùng để phân biệt giữa nguồn media âm thanh và video khi duyệt qua {{domxref("RTCStatsReport")}}, vì cả hai đều có {{domxref("RTCVideoSourceStats.type", "type")}} là `media-source` (giá trị `kind` là `audio` cho biết đây là đối tượng {{domxref("RTCAudioSourceStats")}}).

## Giá trị

Một chuỗi có giá trị `video`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
