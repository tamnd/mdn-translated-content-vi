---
title: "RTCTrackEvent: thuộc tính receiver"
short-title: receiver
slug: Web/API/RTCTrackEvent/receiver
page-type: web-api-instance-property
browser-compat: api.RTCTrackEvent.receiver
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`receiver`** của giao diện {{domxref("RTCTrackEvent")}} cho biết {{domxref("RTCRtpReceiver")}} được sử dụng để nhận dữ liệu chứa phương tiện cho {{domxref("RTCTrackEvent.track", "track")}} mà sự kiện tham chiếu.

## Giá trị

{{domxref("RTCRtpReceiver")}} ghép `receiver` với một sender và các thuộc tính khác để thiết lập một luồng {{Glossary("RTP", "SRTP")}} hai chiều duy nhất để sử dụng bởi {{domxref("RTCTrackEvent.track", "track")}} được liên kết với `RTCTrackEvent`.

> [!NOTE]
> {{domxref("RTCTrackEvent.transceiver", "transceiver")}} bao gồm thuộc tính {{domxref("RTCRtpTransceiver.receiver", "receiver")}} riêng của nó, luôn luôn là cùng một {{domxref("RTCRtpReceiver")}} như cái này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
