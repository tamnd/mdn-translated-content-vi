---
title: "RTCInboundRtpStreamStats: thuộc tính fecPacketsDiscarded"
short-title: fecPacketsDiscarded
slug: Web/API/RTCInboundRtpStreamStats/fecPacketsDiscarded
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.fecPacketsDiscarded
---

{{APIRef("WebRTC")}}

Thuộc tính **`fecPacketsDiscarded`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết số gói {{Glossary("RTP")}} Forward Error Correction (FEC) đã bị bỏ qua.

Gói FEC cung cấp thông tin chẵn lẻ có thể dùng để cố gắng tái tạo các gói dữ liệu RTP bị hỏng trong quá trình truyền.
Loại gói này có thể bị bỏ qua nếu tất cả các gói mà nó bao phủ đã được nhận hoặc phục hồi bằng một gói FEC khác, hoặc nếu gói FEC đến ngoài cửa sổ phục hồi và các gói RTP bị mất đã bị bỏ qua trong khi phát.
Giá trị của {{domxref("RTCInboundRtpStreamStats/fecPacketsReceived","fecPacketsReceived")}} bao gồm các gói bị bỏ qua này.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
