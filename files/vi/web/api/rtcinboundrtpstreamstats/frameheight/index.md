---
title: "RTCInboundRtpStreamStats: thuộc tính frameHeight"
short-title: frameHeight
slug: Web/API/RTCInboundRtpStreamStats/frameHeight
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.frameHeight
---

{{APIRef("WebRTC")}}

Thuộc tính **`frameHeight`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết chiều cao của khung hình được giải mã gần nhất, tính bằng pixel.

Lưu ý rằng độ phân giải của khung hình được mã hóa có thể thấp hơn so với nguồn media, được cung cấp trong {{domxref("RTCVideoSourceStats.height")}}.

> [!NOTE]
> Thuộc tính này không xác định đối với luồng âm thanh và trước khi khung hình đầu tiên được giải mã.

## Giá trị

Một số nguyên dương, tính bằng pixel.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
