---
title: "RTCCodecStats: type property"
short-title: type
slug: Web/API/RTCCodecStats/type
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_codec.type
---

{{APIRef("WebRTC")}}

Thuộc tính **`type`** của từ điển {{domxref("RTCCodecStats")}} là một chuỗi có giá trị `"codec"`.

Các loại thống kê khác nhau được lấy bằng cách duyệt qua đối tượng {{domxref("RTCStatsReport")}} trả về từ lời gọi {{domxref("RTCPeerConnection.getStats()")}}.
Type cho biết tập thống kê có sẵn thông qua đối tượng ở bước duyệt hiện tại.
Giá trị `"codec"` cho biết thống kê có sẵn trong bước hiện tại là những thống kê được định nghĩa trong {{domxref("RTCCodecStats")}}.

## Giá trị

Một chuỗi có giá trị `"codec"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
