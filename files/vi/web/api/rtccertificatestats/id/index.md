---
title: "RTCCertificateStats: thuộc tính id"
short-title: id
slug: Web/API/RTCCertificateStats/id
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_certificate.id
---

{{APIRef("WebRTC")}}

Thuộc tính **`id`** của từ điển {{domxref("RTCCertificateStats")}} là một chuỗi xác định duy nhất đối tượng mà đối tượng này cung cấp thống kê.

Sử dụng `id`, bạn có thể liên kết đối tượng thống kê này với các đối tượng khác, để theo dõi thống kê theo thời gian cho một đối tượng WebRTC cụ thể, chẳng hạn như {{domxref("RTCPeerConnection")}} hoặc {{domxref("RTCDataChannel")}}.

## Giá trị

Một chuỗi xác định duy nhất đối tượng mà đối tượng `RTCCertificateStats` này cung cấp thống kê.

Định dạng của chuỗi ID không được định nghĩa bởi thông số kỹ thuật, vì vậy bạn không thể đưa ra bất kỳ giả định đáng tin cậy nào về nội dung của chuỗi, hay giả định rằng định dạng của chuỗi sẽ không thay đổi đối với một loại đối tượng nhất định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
