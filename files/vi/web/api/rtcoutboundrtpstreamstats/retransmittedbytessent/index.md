---
title: "RTCOutboundRtpStreamStats: retransmittedBytesSent property"
short-title: retransmittedBytesSent
slug: Web/API/RTCOutboundRtpStreamStats/retransmittedBytesSent
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.retransmittedBytesSent
---

{{APIRef("WebRTC")}}

Thuộc tính **`retransmittedBytesSent`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} biểu thị tổng số byte dữ liệu đã được truyền lại cho nguồn liên quan đến luồng này.

RTX (Retransmission) là một trong nhiều cơ chế mà WebRTC sử dụng để truyền lại byte dữ liệu bị mất, và về cơ bản đề cập đến hỗ trợ cho các gói đặc biệt được định nghĩa trong {{rfc("4588")}}. RTX phải được đàm phán giữa bộ gửi và bộ nhận trong quá trình bắt tay ban đầu. Nếu RTX chưa được đàm phán, các byte được truyền lại sẽ được gửi qua cùng một SSRC; ngược lại, các byte được gửi trên một SSRC riêng nhưng vẫn được tính vào thuộc tính này.

Các byte được truyền lại đã gửi được bao gồm trong số được báo cáo bởi {{domxref("RTCOutboundRtpStreamStats.bytesSent", "bytesSent")}}.

## Giá trị

Số nguyên dương cho biết số byte dữ liệu đã được truyền lại cho nguồn này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
