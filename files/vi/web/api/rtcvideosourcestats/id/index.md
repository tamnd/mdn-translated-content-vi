---
title: "RTCVideoSourceStats: id property"
short-title: id
slug: Web/API/RTCVideoSourceStats/id
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_media-source.id
---

{{APIRef("WebRTC")}}

Thuộc tính **`id`** của từ điển {{domxref("RTCVideoSourceStats")}} là một chuỗi định danh duy nhất cho đối tượng mà đối tượng này cung cấp thống kê.

Sử dụng `id`, bạn có thể liên kết đối tượng thống kê này với các đối tượng khác, nhằm theo dõi thống kê theo thời gian cho một đối tượng WebRTC cụ thể, chẳng hạn như {{domxref("RTCPeerConnection")}} hoặc {{domxref("RTCDataChannel")}}.

## Giá trị

Một chuỗi định danh duy nhất cho đối tượng mà `RTCVideoSourceStats` này cung cấp thống kê.

Định dạng của chuỗi ID không được quy định trong thông số kỹ thuật, vì vậy bạn không thể đưa ra giả định đáng tin cậy về nội dung của chuỗi, cũng như không thể cho rằng định dạng của chuỗi sẽ không thay đổi cho một loại đối tượng nhất định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
