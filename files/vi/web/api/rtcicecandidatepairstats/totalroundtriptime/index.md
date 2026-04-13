---
title: "RTCIceCandidatePairStats: totalRoundTripTime property"
short-title: totalRoundTripTime
slug: Web/API/RTCIceCandidatePairStats/totalRoundTripTime
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_candidate-pair.totalRoundTripTime
---

{{APIRef("WebRTC")}}

Thuộc tính **`totalRoundTripTime`** của từ điển {{domxref("RTCIceCandidatePairStats")}} cho biết tổng thời gian đã trôi qua giữa việc gửi các yêu cầu {{Glossary("STUN")}} và nhận phản hồi, cho tất cả các yêu cầu như vậy đã được thực hiện đến thời điểm này trên cặp ứng viên được mô tả bởi đối tượng `RTCIceCandidatePairStats` này.

Giá trị này bao gồm cả yêu cầu kiểm tra kết nối và yêu cầu kiểm tra chấp thuận.

## Giá trị

Số thực này cho biết tổng số giây đã trôi qua giữa việc gửi các yêu cầu kiểm tra kết nối và chấp thuận STUN và nhận phản hồi của chúng, cho tất cả các yêu cầu như vậy được thực hiện đến thời điểm này trên kết nối được mô tả bởi cặp ứng viên này.

Bạn có thể tính thời gian khứ hồi (RTT) trung bình bằng cách chia giá trị này cho giá trị của thuộc tính {{domxref("RTCIceCandidatePairStats.responsesReceived", "responsesReceived")}}:

```js
rtt =
  rtcIceCandidatePairStats.totalRoundTripTime /
  rtcIceCandidatePairStats.responsesReceived;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
