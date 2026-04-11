---
title: "RTCInboundRtpStreamStats: thuộc tính totalPausesDuration"
short-title: totalPausesDuration
slug: Web/API/RTCInboundRtpStreamStats/totalPausesDuration
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_inbound-rtp.totalPausesDuration
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`totalPausesDuration`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} cho biết tổng thời gian video trong luồng này bị dừng, tính bằng giây.

Một lần dừng được tính khi một khung hình mới được hiển thị hơn 5 giây sau khi khung hình cuối cùng được hiển thị, và thời gian trôi qua giữa các khung hình được cộng vào `totalPausesDuration`.

Thời lượng dừng trung bình có thể được tính bằng `totalPausesDuration / pauseCount`.

> [!NOTE]
> Thuộc tính này không xác định đối với luồng âm thanh.

## Giá trị

Một số dương, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats.pauseCount", "pauseCount")}}
