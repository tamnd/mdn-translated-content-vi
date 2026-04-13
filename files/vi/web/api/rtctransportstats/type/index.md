---
title: "RTCTransportStats: thuộc tính type"
short-title: type
slug: Web/API/RTCTransportStats/type
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_transport.type
---

{{APIRef("WebRTC")}}

Thuộc tính **`type`** của từ điển {{domxref("RTCTransportStats")}} là một chuỗi có giá trị `"transport"`.

Các thống kê khác nhau được lấy bằng cách duyệt qua đối tượng {{domxref("RTCStatsReport")}} được trả về bởi lệnh gọi {{domxref("RTCPeerConnection.getStats()")}}.
Kiểu chỉ ra tập hợp thống kê có sẵn thông qua đối tượng trong một bước duyệt cụ thể.
Giá trị `"transport"` chỉ ra rằng các thống kê có sẵn trong bước hiện tại là các thống kê được xác định trong {{domxref("RTCTransportStats")}}.

## Giá trị

Một chuỗi có giá trị `"transport"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
