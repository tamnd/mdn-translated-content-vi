---
title: "RTCIceCandidatePairStats: nominated property"
short-title: nominated
slug: Web/API/RTCIceCandidatePairStats/nominated
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_candidate-pair.nominated
---

{{APIRef("WebRTC")}}

Thuộc tính **`nominated`** của từ điển {{domxref("RTCIceCandidatePairStats")}} xác định liệu cặp ứng viên được mô tả bởi `RTCIceCandidatePair` bên dưới có được đề xuất để sử dụng làm cấu hình cho kết nối WebRTC hay không.

## Giá trị

Giá trị Boolean được lớp ICE đặt thành `true` nếu tác nhân người dùng điều khiển đã chỉ ra rằng cặp ứng viên nên được dùng để cấu hình kết nối WebRTC giữa hai đầu.

> [!NOTE]
> Nếu có nhiều hơn một cặp ứng viên được đề xuất cùng một lúc, cặp có mức ưu tiên cao hơn sẽ được chọn để sử dụng.

Khi một cặp ứng viên đã được đề xuất và cả hai đầu đã tự cấu hình lại để sử dụng cấu hình đã chỉ định, quá trình đàm phán ICE có thể kết thúc (hoặc có thể tiếp tục, để cho phép kết nối thích ứng với các điều kiện thay đổi).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
