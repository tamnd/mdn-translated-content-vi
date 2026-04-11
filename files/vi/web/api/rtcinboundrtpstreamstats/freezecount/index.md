---
title: "RTCInboundRtpStreamStats: thuộc tính freezeCount"
short-title: freezeCount
slug: Web/API/RTCInboundRtpStreamStats/freezeCount
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_inbound-rtp.freezeCount
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`freezeCount`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng số lần đóng băng video mà bộ nhận này gặp phải.

Một lần đóng băng được tính nếu khoảng thời gian giữa hai khung hình được hiển thị bằng hoặc lớn hơn giá trị lớn hơn trong hai giá trị: "ba lần thời lượng trung bình" hoặc "trung bình cộng 150ms".
Điều này đảm bảo rằng độ trễ cần thiết để tăng số lần đóng băng tương ứng phù hợp với tốc độ khung hình.

> [!NOTE]
> Giá trị này không xác định đối với luồng âm thanh.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats.totalFreezesDuration", "totalFreezesDuration")}}
