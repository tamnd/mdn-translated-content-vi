---
title: "RTCOutboundRtpStreamStats: active property"
short-title: active
slug: Web/API/RTCOutboundRtpStreamStats/active
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_outbound-rtp.active
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`active`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} là giá trị boolean cho biết liệu luồng RTP này có được cấu hình để gửi hay đã bị vô hiệu hóa.

Ví dụ, giá trị này sẽ là `false` nếu track tương ứng với luồng có thuộc tính {{domxref("MediaStreamTrack.enabled")}} được đặt thành `false`. Lưu ý rằng một luồng đang hoạt động vẫn có thể không gửi dữ liệu nếu, chẳng hạn, luồng bị giới hạn bởi điều kiện mạng.

## Giá trị

`true` nếu luồng được bật để gửi, `false` nếu không.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
