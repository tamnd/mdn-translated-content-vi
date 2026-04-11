---
title: "RTCInboundRtpStreamStats: thuộc tính totalSquaredInterFrameDelay"
short-title: totalSquaredInterFrameDelay
slug: Web/API/RTCInboundRtpStreamStats/totalSquaredInterFrameDelay
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.totalSquaredInterFrameDelay
---

{{APIRef("WebRTC")}}

Thuộc tính **`totalSquaredInterFrameDelay`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng bình phương của từng độ trễ giữa các khung hình được hiển thị liên tiếp.
Được ghi lại ngay sau khi mỗi khung hình được hiển thị.

Phương sai độ trễ giữa các khung hình có thể được tính từ {{domxref("RTCInboundRtpStreamStats.totalInterFrameDelay","totalInterFrameDelay")}}, `totalSquaredInterFrameDelay`, và {{domxref("RTCInboundRtpStreamStats.framesRendered","framesRendered")}}, theo công thức: `(totalSquaredInterFrameDelay - totalInterFrameDelay^2/ framesRendered)/framesRendered`.

> [!NOTE]
> Thuộc tính này không xác định đối với luồng âm thanh.

## Giá trị

Một số dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
