---
title: "RTCOutboundRtpStreamStats: totalEncodeTime property"
short-title: totalEncodeTime
slug: Web/API/RTCOutboundRtpStreamStats/totalEncodeTime
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.totalEncodeTime
---

{{APIRef("WebRTC")}}

Thuộc tính **`totalEncodeTime`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} biểu thị tổng số giây đã dành để mã hóa các khung hình {{domxref("RTCOutboundRtpStreamStats/framesEncoded","framesEncoded")}} cho luồng này ({{domxref("RTCRtpSender")}}).

Thời gian mã hóa trung bình có thể được tính bằng cách chia giá trị này cho `framesEncoded`. Thời gian cần để mã hóa một khung hình là thời gian giữa khi gửi khung hình đến encoder và khi encoder trả về dữ liệu đã mã hóa cho khung hình đó. Không bao gồm thời gian đóng gói dữ liệu kết quả.

> [!NOTE]
> Thuộc tính này không xác định cho các luồng âm thanh.

## Giá trị

Số biểu thị tổng thời gian dành để mã hóa các khung hình, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
