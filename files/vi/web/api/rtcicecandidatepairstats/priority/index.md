---
title: "RTCIceCandidatePairStats: priority property"
short-title: priority
slug: Web/API/RTCIceCandidatePairStats/priority
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.RTCStatsReport.type_candidate-pair.priority
---

{{APIRef("WebRTC")}}{{deprecated_header}}{{non-standard_header}}

Thuộc tính **`priority`** của từ điển {{domxref("RTCIceCandidatePairStats")}} báo cáo mức ưu tiên của cặp ứng viên dưới dạng giá trị số nguyên.

Giá trị càng cao, lớp WebRTC càng có khả năng chọn cặp ứng viên khi đến lúc thiết lập (hoặc thiết lập lại) kết nối giữa hai đầu.

## Giá trị

Giá trị số nguyên cho biết mức ưu tiên của cặp ứng viên này so với các cặp khác trên cùng kết nối. Giá trị này càng cao thì lớp WebRTC cho rằng cặp ứng viên này càng tốt so với các cặp khác, và cặp đó càng có khả năng được chọn để sử dụng.

> [!NOTE]
> Thuộc tính này đã bị xóa khỏi đặc tả vì giá trị của nó không thể đảm bảo được biểu diễn chính xác trong một số JavaScript. Bạn có thể tính giá trị của nó bằng thuật toán được mô tả trong {{RFC(5245, "", "5.7.2")}} nếu bạn cần thông tin này và có thể chấp nhận rủi ro rằng kết quả có thể không hoàn toàn chính xác.

## Thông số kỹ thuật

Thuộc tính này đã bị xóa khỏi đặc tả.

## Tương thích trình duyệt

{{Compat}}
