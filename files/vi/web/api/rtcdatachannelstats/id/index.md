---
title: "RTCDataChannelStats: thuộc tính id"
short-title: id
slug: Web/API/RTCDataChannelStats/id
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_data-channel.id
---

{{APIRef("WebRTC")}}

Thuộc tính **`id`** của từ điển {{domxref("RTCDataChannelStats")}} là một chuỗi nhận dạng duy nhất đối tượng mà đối tượng này cung cấp thống kê.

Sử dụng `id`, bạn có thể tương quan đối tượng thống kê này với các đối tượng khác để theo dõi thống kê theo thời gian cho một đối tượng WebRTC nhất định, chẳng hạn như {{domxref("RTCPeerConnection")}} hoặc {{domxref("RTCDataChannel")}}.

## Giá trị

Chuỗi nhận dạng duy nhất đối tượng mà đối tượng `RTCDataChannelStats` này cung cấp thống kê.

Định dạng của chuỗi ID không được đặc tả định nghĩa, vì vậy bạn không thể đáng tin cậy đưa ra bất kỳ giả định nào về nội dung của chuỗi hoặc giả định rằng định dạng của chuỗi sẽ không thay đổi đối với một loại đối tượng nhất định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
