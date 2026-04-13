---
title: "RTCIceCandidateStats: thuộc tính url"
short-title: url
slug: Web/API/RTCIceCandidateStats/url
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_local-candidate.url
---

{{APIRef("WebRTC")}}

Thuộc tính **`url`** của từ điển {{domxref("RTCIceCandidateStats")}} chỉ định URL của máy chủ {{Glossary("ICE")}} từ đó ứng viên được mô tả đã được lấy. Thuộc tính này _chỉ_ có sẵn cho ứng viên cục bộ.

## Giá trị

Một chuỗi chỉ định URL của máy chủ ICE từ đó ứng viên được mô tả bởi `RTCIceCandidateStats` đã được lấy. Đây là cùng URL mà sẽ được nhận trong sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} thuộc tính {{domxref("RTCPeerConnectionIceEvent.url", "url")}}.

> [!NOTE]
> Thuộc tính này không tồn tại đối với ứng viên từ xa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
