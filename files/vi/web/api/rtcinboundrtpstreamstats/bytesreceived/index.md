---
title: "RTCInboundRtpStreamStats: thuộc tính bytesReceived"
short-title: bytesReceived
slug: Web/API/RTCInboundRtpStreamStats/bytesReceived
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.bytesReceived
---

{{APIRef("WebRTC")}}

Thuộc tính **`bytesReceived`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng số byte đã nhận được từ nguồn đồng bộ hóa (SSRC) này cho đến nay, không bao gồm byte tiêu đề và đệm.

Giá trị có thể được dùng để tính toán xấp xỉ tốc độ dữ liệu media trung bình:

```js
avgDataRate = rtcInboundRtpStreamStats.bytesReceived / elapsedTime;
```

Giá trị thuộc tính được đặt lại về 0 nếu định danh SSRC của người gửi thay đổi vì bất kỳ lý do nào.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
