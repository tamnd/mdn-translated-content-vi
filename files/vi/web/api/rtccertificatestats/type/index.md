---
title: "RTCCertificateStats: thuộc tính type"
short-title: type
slug: Web/API/RTCCertificateStats/type
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_certificate.type
---

{{APIRef("WebRTC")}}

Thuộc tính **`type`** của từ điển {{domxref("RTCCertificateStats")}} là một chuỗi có giá trị `"certificate"`.

Các thống kê khác nhau được lấy bằng cách lặp qua đối tượng {{domxref("RTCStatsReport")}} được trả về bởi lời gọi đến {{domxref("RTCPeerConnection.getStats()")}}. Loại cho biết tập hợp thống kê có sẵn thông qua đối tượng trong một bước lặp cụ thể. Giá trị `"certificate"` cho biết các thống kê có sẵn trong bước hiện tại là những thống kê được định nghĩa trong {{domxref("RTCCertificateStats")}}.

## Giá trị

Một chuỗi có giá trị `"certificate"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
