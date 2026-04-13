---
title: "RTCOutboundRtpStreamStats: scalabilityMode property"
short-title: scalabilityMode
slug: Web/API/RTCOutboundRtpStreamStats/scalabilityMode
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_outbound-rtp.scalabilityMode
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`scalabilityMode`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} biểu thị chế độ khả năng mở rộng cho luồng RTP, nếu có cấu hình. Nếu không được cấu hình, thuộc tính này không xác định.

Chế độ này được sử dụng trong [Scalable Video Coding (SVC)](https://w3c.github.io/webrtc-svc/) để định nghĩa cách một luồng video có thể được mã hóa để cho phép thích ứng với các điều kiện mạng khác nhau và khả năng của bộ nhận. Các codec khác nhau cho phép các loại khả năng mở rộng khác nhau, chẳng hạn như cung cấp độ phân giải, tốc độ khung hình hoặc mức chất lượng khác nhau cho một video cụ thể.

Chế độ có thể được cấu hình, ví dụ, bằng cách chỉ định chế độ khả năng mở rộng như một tùy chọn tham số trong {{domxref("VideoEncoder.configure()")}}, {{domxref("RTCRtpSender.setParameters()")}}, hoặc {{domxref("RTCPeerConnection.addTransceiver()")}}.

> [!NOTE]
> Thuộc tính này không xác định cho các luồng âm thanh.

## Giá trị

Chuỗi cho biết chế độ khả năng mở rộng đã được cấu hình, chẳng hạn như "L1T1". Nếu không có chế độ nào được cấu hình, thuộc tính này không xác định.

Tập hợp các chế độ được phép được định nghĩa trong [Scalable Video Coding (SVC) Extension for WebRTC](https://w3c.github.io/webrtc-svc/#scalabilitymodes*) (w3c.github.io/webrtc-svc).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
