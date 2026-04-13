---
title: "RTCPeerConnectionStats: thuộc tính id"
short-title: id
slug: Web/API/RTCPeerConnectionStats/id
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_peer-connection.id
---

{{APIRef("WebRTC")}}

Thuộc tính **`id`** của dictionary {{domxref("RTCPeerConnectionStats")}} là một chuỗi xác định duy nhất đối tượng mà đối tượng này cung cấp thống kê.

Sử dụng `id`, bạn có thể tương quan đối tượng thống kê này với các đối tượng khác, để theo dõi thống kê theo thời gian cho một đối tượng WebRTC nhất định, chẳng hạn như {{domxref("RTCPeerConnection")}}, hoặc {{domxref("RTCDataChannel")}}.

## Giá trị

Một chuỗi xác định duy nhất đối tượng mà đối tượng `RTCPeerConnectionStats` này cung cấp thống kê.

Định dạng của chuỗi ID không được định nghĩa bởi thông số kỹ thuật, vì vậy bạn không thể đáng tin cậy đưa ra bất kỳ giả định nào về nội dung của chuỗi, hoặc giả định rằng định dạng của chuỗi sẽ giữ nguyên cho một loại đối tượng nhất định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
