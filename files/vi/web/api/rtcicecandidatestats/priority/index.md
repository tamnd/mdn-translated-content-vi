---
title: "RTCIceCandidateStats: thuộc tính priority"
short-title: priority
slug: Web/API/RTCIceCandidateStats/priority
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_local-candidate.priority
---

{{APIRef("WebRTC")}}

Thuộc tính **`priority`** của từ điển {{domxref("RTCIceCandidateStats")}} là một số nguyên dương cho biết mức độ ưu tiên (hay mức độ mong muốn) của ứng viên được mô tả.

## Giá trị

Một số nguyên dương cho biết mức độ ưu tiên của {{domxref("RTCIceCandidate")}} được mô tả bởi đối tượng `RTCIceCandidateStats`.
Giá trị có thể nằm trong khoảng từ 1 đến 2.147.483.647.

## Mô tả

Trong quá trình thương lượng {{Glossary("ICE")}} khi thiết lập kết nối peer WebRTC, các giá trị ưu tiên được báo cáo cho peer từ xa bởi {{Glossary("user agent")}} được sử dụng để xác định ứng viên nào được coi là "mong muốn hơn".
Giá trị càng cao, ứng viên càng mong muốn.

### Xác định mức độ ưu tiên

Đặc tả ICE mô tả cách các tác nhân người dùng và phần mềm khác sử dụng WebRTC nên tính toán mức độ ưu tiên.
Mức độ ưu tiên của một ứng viên được tính bằng các biến đầu vào sau:

- Mức độ ưa thích của loại ứng viên (cục bộ, phản chiếu máy chủ, phản chiếu peer, hoặc chuyển tiếp)
- Mức độ ưa thích của địa chỉ IP cụ thể của ứng viên (đối với tác nhân đa homed)
- ID thành phần của ứng viên (1 cho RTP, 2 cho RTCP)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{RFC(5245, "", "4.1.2.1")}}: Mục Recommended Formula trong đặc tả ICE
