---
title: "RTCInboundRtpStreamStats: thuộc tính estimatedPlayoutTimestamp"
short-title: estimatedPlayoutTimestamp
slug: Web/API/RTCInboundRtpStreamStats/estimatedPlayoutTimestamp
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_inbound-rtp.estimatedPlayoutTimestamp
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`estimatedPlayoutTimestamp`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết thời gian phát ước tính của track ở bộ nhận này.

Đây là dấu thời gian [Network Time Protocol (NTP)](https://en.wikipedia.org/wiki/Network_Time_Protocol) của mẫu âm thanh có thể phát cuối cùng hoặc khung hình video có dấu thời gian đã biết, được ngoại suy với thời gian đã trôi qua kể từ khi nó sẵn sàng để phát.
Nói cách khác, đây là thời gian phát hiện tại ước tính của track theo đồng hồ NTP của người gửi, và có thể tồn tại ngay cả khi không có âm thanh nào đang phát.

Có thể sử dụng điều này để ước tính mức độ không đồng bộ của các track âm thanh và video từ cùng một nguồn.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
