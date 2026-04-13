---
title: "RTCIceCandidatePairStats: writable property"
short-title: writable
slug: Web/API/RTCIceCandidatePairStats/writable
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.RTCStatsReport.type_candidate-pair.writable
---

{{APIRef("WebRTC")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính **`writable`** của từ điển {{domxref("RTCIceCandidatePairStats")}} cho biết liệu kết nối được mô tả bởi cặp ứng viên có thể ghi hay không.

## Giá trị

`true` nếu kết nối được mô tả bởi cặp ứng viên này đã nhận được xác nhận nhận (ACK) cho ít nhất một yêu cầu ICE _và_ chấp thuận {{Glossary("STUN")}} chưa hết hạn.

> [!NOTE]
> Thuộc tính này đã lỗi thời. Thay vào đó, bạn có thể xác định liệu yêu cầu ICE đến có sẵn để đọc hay không bằng cách kiểm tra xem {{domxref("RTCIceCandidatePairStats.responsesReceived", "responsesReceived")}} có lớn hơn 0 và thời gian được chỉ định bởi {{domxref("RTCIceCandidatePairStats.consentExpiredTimestamp", "consentExpiredTimestamp")}} chưa qua:
>
> ```js
> if (
>   icpStats.responsesReceived > 0 &&
>   icpStats.consentExpiredTimestamp < performance.now()
> ) {
>   /* at least one ICE response has been received */
> }
> ```

## Thông số kỹ thuật

Thuộc tính này đã bị xóa khỏi đặc tả vào đầu năm 2017.

## Tương thích trình duyệt

{{Compat}}
