---
title: "RTCIceCandidateStats: thuộc tính relayProtocol"
short-title: relayProtocol
slug: Web/API/RTCIceCandidateStats/relayProtocol
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_local-candidate.relayProtocol
---

{{APIRef("WebRTC")}}

Thuộc tính **`relayProtocol`** của từ điển {{domxref("RTCIceCandidateStats")}} chỉ định giao thức đang được sử dụng bởi ứng viên {{Glossary("ICE")}} cục bộ để giao tiếp với máy chủ {{Glossary("TURN")}}.

Giao thức ICE đang được sử dụng bởi ứng viên có thể lấy từ thuộc tính {{domxref("RTCIceCandidateStats.protocol", "protocol")}}.

## Giá trị

Một chuỗi xác định giao thức đang được sử dụng bởi điểm cuối để giao tiếp với máy chủ TURN. Các giá trị có thể là:

- `tcp`
  - : TCP (Transmission Control Protocol) đang được sử dụng để giao tiếp với máy chủ TURN.
- `tls`
  - : TLS (Transport Layer Security) đang được sử dụng để giao tiếp với máy chủ TURN.
- `udp`
  - : UDP (User Datagram Protocol) đang được sử dụng để giao tiếp với máy chủ TURN.

> [!NOTE]
> Thuộc tính này chỉ có mặt trên các đối tượng {{domxref("RTCIceCandidateStats")}} đại diện cho ứng viên cục bộ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
