---
title: "RTCOutboundRtpStreamStats: nackCount property"
short-title: nackCount
slug: Web/API/RTCOutboundRtpStreamStats/nackCount
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.nackCount
---

{{APIRef("WebRTC")}}

Thuộc tính **`nackCount`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} là giá trị số cho biết số lần {{domxref("RTCRtpSender")}} được mô tả bởi đối tượng này nhận được gói **NACK** từ bộ nhận từ xa.

Gói NACK (Negative ACKnowledgement, còn gọi là "Generic NACK") được {{domxref("RTCRtpReceiver")}} dùng để thông báo cho bộ gửi rằng một hoặc nhiều gói {{Glossary("RTP")}} đã bị mất trong quá trình truyền.

## Giá trị

Giá trị số nguyên cho biết bộ gửi nhận được bao nhiêu gói NACK từ bộ nhận, cho biết sự mất mát của một hoặc nhiều gói dữ liệu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
