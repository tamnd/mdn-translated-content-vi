---
title: "RTCAudioSourceStats: thuộc tính kind"
short-title: kind
slug: Web/API/RTCAudioSourceStats/kind
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_media-source.kind
---

{{APIRef("WebRTC")}}

Thuộc tính **`kind`** của từ điển {{domxref("RTCAudioSourceStats")}} là một chuỗi với giá trị `audio`.

`kind` được sử dụng để phân biệt giữa nguồn media âm thanh và video khi duyệt qua {{domxref("RTCStatsReport")}}, cả hai đều có {{domxref("RTCAudioSourceStats.type", "type")}} là `media-source` (`kind` là `video` cho biết đối tượng {{domxref("RTCVideoSourceStats")}}).

## Giá trị

Một chuỗi với giá trị `audio`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
