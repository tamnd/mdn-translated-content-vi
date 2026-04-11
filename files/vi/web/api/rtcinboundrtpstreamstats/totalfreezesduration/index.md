---
title: "RTCInboundRtpStreamStats: thuộc tính totalFreezesDuration"
short-title: totalFreezesDuration
slug: Web/API/RTCInboundRtpStreamStats/totalFreezesDuration
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_inbound-rtp.totalFreezesDuration
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`totalFreezesDuration`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} cho biết tổng thời gian video trong luồng này bị đóng băng, tính bằng giây.

Một lần đóng băng được tính nếu khoảng thời gian giữa hai khung hình được hiển thị bằng hoặc lớn hơn giá trị lớn hơn trong hai giá trị: "ba lần thời lượng trung bình" hoặc "trung bình cộng 150ms", và thời gian trôi qua giữa các khung hình được cộng vào `totalFreezesDuration`.

Thời lượng đóng băng trung bình có thể được tính bằng `totalFreezesDuration / freezeCount`.

> [!NOTE]
> Thuộc tính này không xác định đối với luồng âm thanh.

## Giá trị

Một số dương, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats.freezeCount", "freezeCount")}}
