---
title: "RTCIceCandidatePairStats: responsesSent property"
short-title: responsesSent
slug: Web/API/RTCIceCandidatePairStats/responsesSent
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_candidate-pair.responsesSent
---

{{APIRef("WebRTC")}}

Thuộc tính **`responsesSent`** của từ điển {{domxref("RTCIceCandidatePairStats")}} cho biết tổng số phản hồi kiểm tra kết nối {{Glossary("STUN")}} đã gửi tính đến thời điểm này trên kết nối được mô tả bởi cặp ứng viên này.

## Giá trị

Giá trị số nguyên cho biết số lần đã gửi phản hồi cho yêu cầu kiểm tra kết nối {{Glossary("STUN")}}.

> [!NOTE]
> Vì không thể phân biệt giữa yêu cầu kiểm tra kết nối và yêu cầu chấp thuận, giá trị này bao gồm cả hai loại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
