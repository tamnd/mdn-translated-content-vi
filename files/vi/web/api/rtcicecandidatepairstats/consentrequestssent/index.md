---
title: "RTCIceCandidatePairStats: consentRequestsSent property"
short-title: consentRequestsSent
slug: Web/API/RTCIceCandidatePairStats/consentRequestsSent
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_candidate-pair.consentRequestsSent
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`consentRequestsSent`** của từ điển {{domxref("RTCIceCandidatePairStats")}} cho biết tổng số yêu cầu chấp thuận đã gửi trên cặp ứng viên này.

Nếu một hoặc cả hai đầu trong cặp truy cập Internet qua [Chuyển đổi địa chỉ mạng](/en-US/docs/Web/API/WebRTC_API/Protocols#nat) (NAT), đầu kia sẽ cần định kỳ gửi yêu cầu [Session Traversal Utilities for NAT (STUN)](/en-US/docs/Web/API/WebRTC_API/Protocols#stun) đến tường lửa NAT để xin phép cho lưu lượng đi qua. Thuộc tính này đếm số lượng yêu cầu đó. {{rfc("7675")}} cung cấp thêm thông tin về NAT và chấp thuận.

## Giá trị

Giá trị số nguyên cho biết tổng số yêu cầu chấp thuận đã gửi đến các đầu trong cặp ứng viên.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
