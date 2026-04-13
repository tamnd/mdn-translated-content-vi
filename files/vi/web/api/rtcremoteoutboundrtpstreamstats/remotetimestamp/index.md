---
title: "RTCRemoteOutboundRtpStreamStats: thuộc tính remoteTimestamp"
short-title: remoteTimestamp
slug: Web/API/RTCRemoteOutboundRtpStreamStats/remoteTimestamp
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-outbound-rtp.remoteTimestamp
---

{{APIRef("WebRTC")}}

Thuộc tính **`remoteTimestamp`** của {{domxref("RTCRemoteOutboundRtpStreamStats")}} cho biết dấu thời gian trên đối tác từ xa tại đó các thống kê này được gửi.
Điều này khác với `timestamp`, cho biết thời điểm thống kê được tạo hoặc nhận cục bộ.

## Giá trị

Giá trị {{domxref("DOMHighResTimeStamp")}} cho biết dấu thời gian trên đối tác từ xa tại đó nó đã gửi các thống kê này.
Điều này khác với giá trị `timestamp`, cho biết thời điểm thống kê được tạo hoặc nhận bởi đối tác cục bộ.

Nếu thuộc tính này có mặt, nó đến từ khối Báo cáo Người gửi (SR) {{Glossary("RTCP")}}, phản ánh đồng hồ trên đối tác từ xa tại thời điểm gửi thông điệp.
Hãy nhớ rằng điều này có nghĩa là đồng hồ có thể không được đồng bộ với đồng hồ cục bộ, và cả thời gian hiện tại lẫn tốc độ đồng hồ chạy đều có thể khác biệt ở một mức độ nào đó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
