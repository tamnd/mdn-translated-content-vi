---
title: "RTCIceCandidatePairStats: requestsReceived property"
short-title: requestsReceived
slug: Web/API/RTCIceCandidatePairStats/requestsReceived
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_candidate-pair.requestsReceived
---

{{APIRef("WebRTC")}}

Thuộc tính **`requestsReceived`** của từ điển {{domxref("RTCIceCandidatePairStats")}} cho biết tổng số yêu cầu kiểm tra kết nối {{Glossary("STUN")}} đã nhận tính đến thời điểm này trên kết nối được mô tả bởi cặp ứng viên này.

## Giá trị

Giá trị số nguyên xác định số lượng yêu cầu kết nối và/hoặc chấp thuận STUN đã nhận đến ngày trên kết nối được mô tả bởi cặp ứng viên {{Glossary("ICE")}} này.

Do không có cách nào phân biệt giữa các yêu cầu kiểm tra kết nối và yêu cầu kiểm tra chấp thuận, con số trả về bao gồm cả hai loại.

> [!NOTE]
> Số lượng yêu cầu được báo cáo bao gồm cả các lần truyền lại. Nếu một yêu cầu phải được lặp lại do sự cố mạng, nó sẽ được đếm nhiều lần ở đây. Điều này khác với {{domxref("RTCIceCandidatePairStats.requestsSent", "requestsSent")}}, _không_ bao gồm các lần truyền lại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
