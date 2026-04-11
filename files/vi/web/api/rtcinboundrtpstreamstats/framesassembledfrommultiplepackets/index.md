---
title: "RTCInboundRtpStreamStats: thuộc tính framesAssembledFromMultiplePackets"
short-title: framesAssembledFromMultiplePackets
slug: Web/API/RTCInboundRtpStreamStats/framesAssembledFromMultiplePackets
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_inbound-rtp.framesAssembledFromMultiplePackets
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`framesAssembledFromMultiplePackets`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng số khung hình được giải mã đúng trong luồng RTP này được lắp ráp từ nhiều hơn một gói RTP.

Thuộc tính này có thể được dùng cùng với {{domxref("RTCInboundRtpStreamStats/totalAssemblyTime","totalAssemblyTime")}} để xác định thời gian lắp ráp trung bình: `totalAssemblyTime / framesAssembledFromMultiplePackets`.
Thời gian lắp ráp trung bình cao hơn có thể cho thấy sự cố mạng hoặc không hiệu quả trong quy trình nhận.

> [!NOTE]
> Giá trị này không xác định đối với luồng âm thanh.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
