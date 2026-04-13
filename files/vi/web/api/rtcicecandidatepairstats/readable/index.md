---
title: "RTCIceCandidatePairStats: readable property"
short-title: readable
slug: Web/API/RTCIceCandidatePairStats/readable
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.RTCStatsReport.type_candidate-pair.readable
---

{{APIRef("WebRTC")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính **`readable`** của từ điển {{domxref("RTCIceCandidatePairStats")}} báo cáo liệu kết nối được mô tả bởi cặp ứng viên có nhận được ít nhất một yêu cầu ICE đến hợp lệ hay không.

## Giá trị

Giá trị Boolean là `true` nếu kết nối được mô tả bởi cặp ứng viên này đã nhận được ít nhất một yêu cầu ICE hợp lệ, và do đó sẵn sàng để đọc.

> [!NOTE]
> Thay vì sử dụng giá trị này, bạn nên xác định liệu kết nối có thể đọc được hay không bằng cách kiểm tra xem {{domxref("RTCIceCandidatePairStats.requestsReceived", "requestsReceived")}} có lớn hơn 0 không:
>
> ```js
> if (icpStats.requestsReceived > 0) {
>   /* at least one ICE request has been received */
> }
> ```

## Thông số kỹ thuật

Thuộc tính này đã bị xóa khỏi đặc tả vào đầu năm 2017.

## Tương thích trình duyệt

{{Compat}}
