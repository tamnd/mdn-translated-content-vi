---
title: "RTCInboundRtpStreamStats: thuộc tính packetsLost"
short-title: packetsLost
slug: Web/API/RTCInboundRtpStreamStats/packetsLost
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.packetsLost
---

{{APIRef("WebRTC")}}

Thuộc tính **`packetsLost`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} trả về tổng số gói {{Glossary("RTP")}} bị mất từ [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCInboundRtpStreamStats/ssrc) kể từ khi bắt đầu nhận.

Lưu ý rằng giá trị này có thể âm.

## Giá trị

Một giá trị số nguyên.

Giá trị được xác định bằng cách lấy số gói nhận được trừ đi số gói dự kiến.
Số gói dự kiến được tính theo cách giả định rằng tất cả các gói chỉ cần gửi một lần (dựa trên số thứ tự), trong khi số gói nhận được cũng bao gồm bất kỳ gói nào phải được gửi lại (do đó có thể lớn hơn).
Để biết thêm thông tin, xem phần "cumulative number of packets lost" trong {{RFC("3550", "", "6.4.1")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats.ssrc")}}
- {{domxref("RTCRemoteInboundRtpStreamStats.packetsLost")}}
- {{domxref("RTCInboundRtpStreamStats.packetsDiscarded", "packetsDiscarded")}}
