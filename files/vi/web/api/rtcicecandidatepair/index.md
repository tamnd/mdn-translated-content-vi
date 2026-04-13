---
title: RTCIceCandidatePair
slug: Web/API/RTCIceCandidatePair
page-type: web-api-interface
browser-compat: api.RTCIceCandidatePair
---

{{APIRef("WebRTC")}}

Từ điển **`RTCIceCandidatePair`** mô tả một cặp ứng viên ICE cùng nhau tạo thành mô tả về một kết nối khả thi giữa hai điểm cuối WebRTC. Nó được sử dụng làm giá trị trả về từ {{domxref("RTCIceTransport.getSelectedCandidatePair()")}} để xác định cặp ứng viên hiện được chọn bởi ICE agent.

## Thuộc tính phiên bản

- {{domxref("RTCIceCandidatePair.local", "local")}}
  - : Một {{domxref("RTCIceCandidate")}} mô tả cấu hình của đầu cục bộ của kết nối.
- {{domxref("RTCIceCandidatePair.remote", "remote")}}
  - : **`RTCIceCandidate`** mô tả cấu hình của đầu từ xa của kết nối.

## Ví dụ

Xem [`RTCIceTransport.onselectedcandidatepairchange`](/en-US/docs/Web/API/RTCIceTransport/selectedcandidatepairchange_event#examples) để biết mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
