---
title: "RTCRemoteInboundRtpStreamStats: thuộc tính localId"
short-title: localId
slug: Web/API/RTCRemoteInboundRtpStreamStats/localId
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp.localId
---

{{APIRef("WebRTC")}}

Thuộc tính **`localId`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} là một chuỗi có thể được dùng để xác định đối tượng {{domxref("RTCOutboundRtpStreamStats")}} có {{domxref("RTCOutboundRtpStreamStats.remoteId", "remoteId")}} khớp với giá trị này.

Cùng nhau, hai đối tượng này cung cấp thống kê về phía đến và đi của cùng [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCRemoteInboundRtpStreamStats/ssrc).

## Giá trị

Một chuỗi có thể được so sánh với giá trị của thuộc tính {{domxref("RTCOutboundRtpStreamStats.remoteId", "remoteId")}} của đối tượng {{domxref("RTCOutboundRtpStreamStats")}} để xem liệu chúng đại diện cho thống kê của mỗi phía của cùng tập dữ liệu được gửi bởi peer cục bộ hay không.

## Ghi chú sử dụng

Bạn có thể nghĩ về chế độ xem cục bộ và từ xa của cùng luồng RTP như các cặp, mỗi cặp có tham chiếu trở lại cái kia.
Do đó, nếu {{domxref("RTCStatsReport")}} bao gồm đối tượng thống kê `remote-inbound-rtp` (kiểu `RTCRemoteInboundRtpStreamStats`), nó cũng nên có đối tượng `outbound-rtp` tương ứng.

Cả hai đều cung cấp thông tin về cùng một lô gói được gửi từ thiết bị cục bộ tới peer từ xa.
Sự khác biệt là `outbound-rtp` cung cấp thống kê về dữ liệu đi từ góc nhìn của peer cục bộ, trong khi `remote-inbound-rtp` cung cấp thống kê về cùng dữ liệu từ góc nhìn của peer từ xa khi nó được nhận.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
