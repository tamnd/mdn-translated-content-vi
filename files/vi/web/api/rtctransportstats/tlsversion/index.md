---
title: "RTCTransportStats: thuộc tính tlsVersion"
short-title: tlsVersion
slug: Web/API/RTCTransportStats/tlsVersion
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_transport.tlsVersion
---

{{APIRef("WebRTC")}}

Thuộc tính **`tlsVersion`** của từ điển {{domxref("RTCTransportStats")}} chỉ ra phiên bản TLS đã đàm phán của transport DTLS bên dưới.

Nó chỉ có mặt với các transport DTLS, và chỉ tồn tại sau khi DTLS đã được đàm phán.

Giá trị đến từ `ServerHello.version` của DTLS handshake, và được biểu diễn dưới dạng bốn chữ số thập lục phân viết hoa, trong đó các chữ số biểu diễn hai byte của phiên bản.
Tuy nhiên, lưu ý rằng các byte có thể không ánh xạ trực tiếp đến số phiên bản.
Ví dụ, DTLS biểu diễn phiên bản 1.2 là `'FEFD'` tương đương số là `{254, 253}`.

## Giá trị

Một chuỗi chỉ ra phiên bản transport DTLS đã đàm phán.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
