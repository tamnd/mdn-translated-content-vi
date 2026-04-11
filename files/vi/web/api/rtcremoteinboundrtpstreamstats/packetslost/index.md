---
title: "RTCRemoteInboundRtpStreamStats: thuộc tính packetsLost"
short-title: packetsLost
slug: Web/API/RTCRemoteInboundRtpStreamStats/packetsLost
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp.packetsLost
---

{{APIRef("WebRTC")}}

Thuộc tính **`packetsLost`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} trả về tổng số gói {{Glossary("RTP")}} bị mất từ [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCRemoteInboundRtpStreamStats/ssrc), được báo cáo bởi điểm cuối từ xa, kể từ khi bắt đầu nhận.

## Giá trị

Một giá trị số nguyên cho biết số gói RTP bị mất.

Giá trị này có thể âm.
Nó được xác định bằng cách lấy số gói nhận được trừ đi số gói dự kiến.
Số gói dự kiến được tính theo cách giả định rằng tất cả các gói chỉ cần gửi một lần (dựa trên số thứ tự), trong khi số gói nhận được cũng bao gồm bất kỳ gói nào phải được gửi lại (do đó có thể lớn hơn).
Để biết thêm thông tin, xem phần "cumulative number of packets lost" trong {{RFC("3550", "", "6.4.1")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCRemoteInboundRtpStreamStats.ssrc")}}
- {{domxref("RTCInboundRtpStreamStats.packetsLost")}}
