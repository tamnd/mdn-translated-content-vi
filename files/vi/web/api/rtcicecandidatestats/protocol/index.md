---
title: "RTCIceCandidateStats: thuộc tính protocol"
short-title: protocol
slug: Web/API/RTCIceCandidateStats/protocol
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_local-candidate.protocol
---

{{APIRef("WebRTC")}}

Thuộc tính **`protocol`** của từ điển {{domxref("RTCIceCandidateStats")}} cho biết giao thức mà ứng viên được chỉ định sẽ sử dụng để giao tiếp với peer từ xa.

## Giá trị

Giá trị là một trong các chuỗi sau:

- `tcp`
  - : Ứng viên, nếu được chọn, sẽ sử dụng {{Glossary("TCP")}} làm giao thức truyền tải cho dữ liệu của nó.
    Thuộc tính {{domxref("RTCIceCandidate.tcpType", "tcpType")}} cung cấp thêm thông tin về loại ứng viên TCP được biểu diễn bởi đối tượng.
- `udp`
  - : Ứng viên sẽ sử dụng giao thức truyền tải {{Glossary("UDP")}} cho dữ liệu của nó.
    Đây là giao thức ưu tiên cho các tương tác media vì hồ sơ hiệu suất tốt hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
