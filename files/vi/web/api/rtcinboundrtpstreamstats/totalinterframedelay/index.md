---
title: "RTCInboundRtpStreamStats: thuộc tính totalInterFrameDelay"
short-title: totalInterFrameDelay
slug: Web/API/RTCInboundRtpStreamStats/totalInterFrameDelay
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.totalInterFrameDelay
---

{{APIRef("WebRTC")}}

Thuộc tính **`totalInterFrameDelay`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng thời gian tích lũy giữa các khung hình được hiển thị liên tiếp, tính bằng giây.
Được ghi lại ngay sau khi mỗi khung hình được hiển thị.

Phương sai độ trễ giữa các khung hình có thể được tính từ `totalInterFrameDelay`, {{domxref("RTCInboundRtpStreamStats.totalSquaredInterFrameDelay","totalSquaredInterFrameDelay")}}, và {{domxref("RTCInboundRtpStreamStats.framesRendered","framesRendered")}} theo công thức: `(totalSquaredInterFrameDelay - totalInterFrameDelay^2/ framesRendered)/framesRendered`.

> [!NOTE]
> Thuộc tính này không xác định đối với luồng âm thanh.

## Giá trị

Một số dương, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
