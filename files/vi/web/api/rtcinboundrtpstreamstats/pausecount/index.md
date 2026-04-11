---
title: "RTCInboundRtpStreamStats: thuộc tính pauseCount"
short-title: pauseCount
slug: Web/API/RTCInboundRtpStreamStats/pauseCount
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_inbound-rtp.pauseCount
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`pauseCount`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} cho biết tổng số lần dừng mà bộ nhận này gặp phải.

Một lần dừng được tính khi một khung hình mới được hiển thị hơn 5 giây sau khi khung hình cuối cùng được hiển thị.

Thời lượng dừng trung bình có thể được tính bằng `totalPausesDuration / pauseCount`.

> [!NOTE]
> Thuộc tính này không xác định đối với luồng âm thanh.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats.totalPausesDuration", "totalPausesDuration")}}
