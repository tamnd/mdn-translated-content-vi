---
title: "RTCInboundRtpStreamStats: thuộc tính totalDecodeTime"
short-title: totalDecodeTime
slug: Web/API/RTCInboundRtpStreamStats/totalDecodeTime
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.totalDecodeTime
---

{{APIRef("WebRTC")}}

Thuộc tính **`totalDecodeTime`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng thời gian dành để giải mã các khung hình cho nguồn/luồng media này, tính bằng giây.

Thời gian để giải mã một khung hình là thời gian trôi qua giữa việc đưa khung hình vào bộ giải mã và bộ giải mã trả về dữ liệu đã giải mã cho khung hình đó.

Số khung hình đã giải mã được cho trong {{domxref("RTCInboundRtpStreamStats.framesDecoded", "framesDecoded")}}, và thời gian giải mã trung bình là `totalDecodeTime / framesDecoded`.

> [!NOTE]
> Thuộc tính này không xác định đối với luồng âm thanh.

## Giá trị

Một số dương, tính bằng giây.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats.framesDecoded", "framesDecoded")}}
