---
title: "RTCInboundRtpStreamStats: thuộc tính id"
short-title: id
slug: Web/API/RTCInboundRtpStreamStats/id
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.id
---

{{APIRef("WebRTC")}}

Thuộc tính **`id`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} là một chuỗi xác định duy nhất đối tượng mà đối tượng này cung cấp thống kê.

Sử dụng `id`, bạn có thể liên kết đối tượng thống kê này với các đối tượng khác để theo dõi thống kê theo thời gian cho một đối tượng WebRTC nhất định, chẳng hạn như {{domxref("RTCPeerConnection")}} hoặc {{domxref("RTCDataChannel")}}.

## Giá trị

Một chuỗi xác định duy nhất đối tượng mà đối tượng `RTCInboundRtpStreamStats` này cung cấp thống kê.

Định dạng của chuỗi ID không được xác định bởi đặc tả, do đó bạn không thể tin tưởng vào bất kỳ giả định nào về nội dung của chuỗi, hoặc cho rằng định dạng của chuỗi sẽ không thay đổi đối với một loại đối tượng nhất định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
