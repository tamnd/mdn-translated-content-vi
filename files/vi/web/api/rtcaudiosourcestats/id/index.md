---
title: "RTCAudioSourceStats: thuộc tính id"
short-title: id
slug: Web/API/RTCAudioSourceStats/id
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_media-source.id
---

{{APIRef("WebRTC")}}

Thuộc tính **`id`** của từ điển {{domxref("RTCAudioSourceStats")}} là một chuỗi xác định duy nhất đối tượng mà đối tượng này cung cấp thống kê.

Sử dụng `id`, bạn có thể liên kết đối tượng thống kê này với các đối tượng khác để theo dõi thống kê theo thời gian cho một đối tượng WebRTC cụ thể, chẳng hạn như {{domxref("RTCPeerConnection")}} hoặc {{domxref("RTCDataChannel")}}.

## Giá trị

Một chuỗi xác định duy nhất đối tượng mà đối tượng `RTCAudioSourceStats` này cung cấp thống kê.

Định dạng của chuỗi ID không được xác định bởi thông số kỹ thuật, vì vậy bạn không thể đưa ra giả định về nội dung của chuỗi hoặc giả định rằng định dạng chuỗi sẽ không thay đổi đối với một loại đối tượng cụ thể.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
