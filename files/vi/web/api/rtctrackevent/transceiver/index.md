---
title: "RTCTrackEvent: thuộc tính transceiver"
short-title: transceiver
slug: Web/API/RTCTrackEvent/transceiver
page-type: web-api-instance-property
browser-compat: api.RTCTrackEvent.transceiver
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`transceiver`** của giao diện {{domxref("RTCTrackEvent")}} của WebRTC API cho biết {{domxref("RTCRtpTransceiver")}} liên kết với {{domxref("RTCTrackEvent.track", "track")}} của sự kiện.

Transceiver ghép {{domxref("RTCTrackEvent.receiver", "receiver")}} của track với một {{domxref("RTCRtpSender")}}.

## Giá trị

{{domxref("RTCRtpTransceiver")}} ghép `receiver` với một sender và các thuộc tính khác để thiết lập một luồng {{Glossary("RTP", "SRTP")}} hai chiều duy nhất để sử dụng bởi {{domxref("RTCTrackEvent.track", "track")}} được liên kết với `RTCTrackEvent`.

> [!NOTE]
> {{domxref("RTCRtpReceiver")}} được tham chiếu bởi thuộc tính {{domxref("RTCRtpTransceiver.receiver", "receiver")}} của `RTCRtpReceiver` này luôn luôn giống với thuộc tính {{domxref("RTCTrackEvent.receiver", "receiver")}} của {{domxref("RTCTrackEvent")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
