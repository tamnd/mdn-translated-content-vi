---
title: "RTCIceCandidatePairStats: packetsDiscardedOnSend property"
short-title: packetsDiscardedOnSend
slug: Web/API/RTCIceCandidatePairStats/packetsDiscardedOnSend
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_candidate-pair.packetsDiscardedOnSend
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`packetsDiscardedOnSend`** của từ điển {{domxref("RTCIceCandidatePairStats")}} cho biết tổng số gói dữ liệu bị loại bỏ do lỗi socket.

Các lỗi này có thể xảy ra, chẳng hạn, khi cố gắng truyền gói dữ liệu đến socket khi socket đã đầy.

## Giá trị

Giá trị số nguyên cho biết tổng số gói dữ liệu bị loại bỏ do lỗi socket.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCIceCandidatePairStats.bytesDiscardedOnSend")}}
