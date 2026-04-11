---
title: "RTCOutboundRtpStreamStats: frameWidth property"
short-title: frameWidth
slug: Web/API/RTCOutboundRtpStreamStats/frameWidth
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.frameWidth
---

{{APIRef("WebRTC")}}

Thuộc tính **`frameWidth`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} là số nguyên dương cho biết chiều rộng của khung hình được mã hóa cuối cùng, tính bằng pixel.

Lưu ý rằng độ phân giải của khung hình được mã hóa có thể thấp hơn độ phân giải của nguồn phương tiện, được cung cấp trong {{domxref("RTCVideoSourceStats.width")}}.

> [!NOTE]
> Giá trị này không tồn tại cho âm thanh, hoặc trước khi khung hình đầu tiên được mã hóa.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
