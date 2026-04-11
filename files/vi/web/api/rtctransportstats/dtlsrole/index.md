---
title: "RTCTransportStats: thuộc tính dtlsRole"
short-title: dtlsRole
slug: Web/API/RTCTransportStats/dtlsRole
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_transport.dtlsRole
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`dtlsRole`** của từ điển {{domxref("RTCTransportStats")}} là một chuỗi chỉ ra vai trò của {{domxref("RTCPeerConnection")}} liên quan trong quá trình đàm phán DTLS.

Cụ thể, cho biết nó hoạt động như một máy chủ và lắng nghe kết nối, hay như một máy khách và khởi tạo kết nối, hoặc là đàm phán chưa bắt đầu.

## Giá trị

Một chuỗi chỉ ra vai trò DTLS.
Đây sẽ là một trong các giá trị sau:

- `client`
  - : Peer đã khởi tạo DTLS handshake.
- `server`
  - : Peer đã chờ DTLS handshake.
- `unknown`
  - : Đàm phán DTLS chưa bắt đầu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
