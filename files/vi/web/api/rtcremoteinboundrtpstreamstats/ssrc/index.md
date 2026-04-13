---
title: "RTCRemoteInboundRtpStreamStats: thuộc tính ssrc"
short-title: ssrc
slug: Web/API/RTCRemoteInboundRtpStreamStats/ssrc
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp.ssrc
---

{{APIRef("WebRTC")}}

Thuộc tính **`ssrc`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} chứa một số nguyên dương xác định nguồn đồng bộ hóa (SSRC) của luồng gói {{Glossary("RTP")}} này.

Nguồn có thể là thứ gì đó như micro, hoặc ứng dụng mixer kết hợp nhiều nguồn.
Tất cả các gói từ cùng một nguồn có cùng nguồn thời gian và không gian thứ tự, vì vậy có thể sắp xếp chúng tương đối với nhau.
Lưu ý rằng hai luồng với cùng giá trị `ssrc` đề cập đến cùng một nguồn.

## Giá trị

Một số nguyên 32-bit dương xác định duy nhất SSRC của các gói RTP được bao phủ bởi đối tượng {{domxref("RTCRemoteInboundRtpStreamStats")}} này.

Cách tạo ra giá trị SSRC không được quy định bởi đặc tả, mặc dù nó có đưa ra các khuyến nghị.
Bạn không nên đưa ra bất kỳ giả định nào dựa trên giá trị của `ssrc` ngoài việc bất kỳ hai đối tượng nào có cùng `ssrc` đều đề cập đến cùng một nguồn.
Xem {{RFC("3550", "", "8")}} để biết thêm thông tin về `ssrc`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCRtpReceiver.getSynchronizationSources()")}}
- {{domxref("RTCEncodedAudioFrame.getMetadata()")}}
