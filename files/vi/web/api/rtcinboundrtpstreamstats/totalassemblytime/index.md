---
title: "RTCInboundRtpStreamStats: thuộc tính totalAssemblyTime"
short-title: totalAssemblyTime
slug: Web/API/RTCInboundRtpStreamStats/totalAssemblyTime
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_inbound-rtp.totalAssemblyTime
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`totalAssemblyTime`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng thời gian dành để lắp ráp các khung hình video được giải mã thành công được truyền trong nhiều gói RTP.

> [!NOTE]
> Giá trị này không xác định đối với luồng âm thanh.

## Giá trị

Một số, tính bằng giây.

## Mô tả

Thuộc tính được cập nhật mỗi khi một khung hình video được truyền trong nhiều gói RTP được giải mã thành công.
Số gia thời gian được tính bằng cách trừ dấu thời gian của gói RTP cuối cùng và đầu tiên chứa dữ liệu khung hình video.
Thời gian không được cập nhật cho các khung hình video không được giải mã, hoặc được truyền hoàn toàn trong một gói RTP.

Thời gian lắp ráp trung bình có thể được xác định bằng cách chia `totalAssemblyTime` cho {{domxref("RTCInboundRtpStreamStats/framesAssembledFromMultiplePackets","framesAssembledFromMultiplePackets")}}.
Thời gian lắp ráp trung bình cao hơn có thể cho thấy sự cố mạng hoặc không hiệu quả trong quy trình nhận.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
