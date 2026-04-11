---
title: "RTCIceCandidatePairStats: bytesDiscardedOnSend property"
short-title: bytesDiscardedOnSend
slug: Web/API/RTCIceCandidatePairStats/bytesDiscardedOnSend
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_candidate-pair.bytesDiscardedOnSend
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`bytesDiscardedOnSend`** của từ điển {{domxref("RTCIceCandidatePairStats")}} cho biết tổng số byte bị loại bỏ do lỗi socket.

Các lỗi này có thể xảy ra, chẳng hạn, khi cố gắng truyền gói dữ liệu đến socket khi socket đã đầy.

## Giá trị

Giá trị số nguyên cho biết tổng số byte bị loại bỏ do lỗi socket. Giá trị này được tính như định nghĩa trong {{rfc("3550","", "6.4.1")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
