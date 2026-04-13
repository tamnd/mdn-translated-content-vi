---
title: "RTCTransportStats: thuộc tính id"
short-title: id
slug: Web/API/RTCTransportStats/id
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_transport.id
---

{{APIRef("WebRTC")}}

Thuộc tính **`id`** của từ điển {{domxref("RTCTransportStats")}} là một chuỗi xác định duy nhất đối tượng mà đối tượng này cung cấp thống kê.

Sử dụng `id`, bạn có thể tương quan đối tượng thống kê này với các đối tượng khác, để giám sát thống kê theo thời gian cho một đối tượng WebRTC nhất định, chẳng hạn như {{domxref("RTCDtlsTransport")}} hoặc {{domxref("RTCPeerConnection")}}.

## Giá trị

Một chuỗi xác định duy nhất đối tượng mà đối tượng `RTCTransportStats` này cung cấp thống kê.

Định dạng của chuỗi ID không được xác định bởi đặc tả, vì vậy bạn không thể tin tưởng vào bất kỳ giả định nào về nội dung của chuỗi, hoặc giả định rằng định dạng của chuỗi sẽ không thay đổi với một loại đối tư���ng nhất định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
