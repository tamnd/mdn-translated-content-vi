---
title: "RTCInboundRtpStreamStats: thuộc tính frameWidth"
short-title: frameWidth
slug: Web/API/RTCInboundRtpStreamStats/frameWidth
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.frameWidth
---

{{APIRef("WebRTC")}}

Thuộc tính **`frameWidth`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết chiều rộng của khung hình được giải mã gần nhất, tính bằng pixel.

Lưu ý rằng độ phân giải của khung hình được mã hóa có thể thấp hơn so với nguồn media, được cung cấp trong {{domxref("RTCVideoSourceStats.width")}}.

> [!NOTE]
> Giá trị này không xác định đối với luồng âm thanh hoặc trước khi khung hình đầu tiên được mã hóa.

## Giá trị

Một số nguyên dương, tính bằng pixel.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
