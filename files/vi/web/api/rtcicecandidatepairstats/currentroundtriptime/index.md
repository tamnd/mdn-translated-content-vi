---
title: "RTCIceCandidatePairStats: currentRoundTripTime property"
short-title: currentRoundTripTime
slug: Web/API/RTCIceCandidatePairStats/currentRoundTripTime
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_candidate-pair.currentRoundTripTime
---

{{APIRef("WebRTC")}}

Thuộc tính **`currentRoundTripTime`** của từ điển {{domxref("RTCIceCandidatePairStats")}} cho biết số giây cần thiết để dữ liệu được đầu này gửi đến đầu từ xa và quay trở lại qua kết nối được mô tả bởi cặp ứng viên {{Glossary("ICE")}} này.

## Giá trị

Một số cho biết thời gian khứ hồi tính bằng giây, cho kết nối được mô tả bởi cặp ứng viên mà đối tượng `RTCIceCandidatePairStats` này cung cấp thống kê.

Giá trị này được tính bằng cách quan sát thời gian đã trôi qua giữa lần gửi yêu cầu {{Glossary("STUN")}} gần nhất đến đầu từ xa và thời điểm nhận được phản hồi cho yêu cầu đó. Thông tin này có thể đến từ các kiểm tra kết nối STUN đang diễn ra cũng như từ các yêu cầu chấp thuận được thực hiện khi kết nối lần đầu được mở.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
