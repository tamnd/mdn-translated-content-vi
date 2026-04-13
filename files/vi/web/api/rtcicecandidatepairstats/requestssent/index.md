---
title: "RTCIceCandidatePairStats: requestsSent property"
short-title: requestsSent
slug: Web/API/RTCIceCandidatePairStats/requestsSent
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_candidate-pair.requestsSent
---

{{APIRef("WebRTC")}}

Thuộc tính **`requestsSent`** của từ điển {{domxref("RTCIceCandidatePairStats")}} cho biết tổng số yêu cầu kiểm tra kết nối {{Glossary("STUN")}} đã gửi tính đến thời điểm này trên kết nối được mô tả bởi cặp ứng viên này.

## Giá trị

Giá trị số nguyên xác định số lượng yêu cầu kết nối STUN đã gửi đến ngày trên kết nối được mô tả bởi cặp ứng viên {{Glossary("ICE")}} này.

> [!NOTE]
> Số lượng yêu cầu được báo cáo _không_ bao gồm các lần truyền lại. Nếu một yêu cầu phải được lặp lại do sự cố mạng, nó sẽ được đếm nhiều lần ở đây. Điều này khác với {{domxref("RTCIceCandidatePairStats.requestsReceived", "requestsReceived")}}, _có_ bao gồm các lần truyền lại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
