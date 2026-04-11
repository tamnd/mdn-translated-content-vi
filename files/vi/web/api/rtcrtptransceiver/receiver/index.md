---
title: "RTCRtpTransceiver: receiver property"
short-title: receiver
slug: Web/API/RTCRtpTransceiver/receiver
page-type: web-api-instance-property
browser-compat: api.RTCRtpTransceiver.receiver
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`receiver`** của giao diện {{domxref("RTCRtpTransceiver")}} trong WebRTC chỉ định {{domxref("RTCRtpReceiver")}} chịu trách nhiệm nhận và giải mã dữ liệu media đến cho luồng của transceiver.

## Giá trị

Một đối tượng {{domxref("RTCRtpReceiver")}} chịu trách nhiệm nhận và giải mã dữ liệu media đến, có media ID giống với giá trị hiện tại của {{domxref("RTCRtpTransceiver.mid", "mid")}}.

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Giới thiệu về Real-time Transport Protocol (RTP)](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP)
- {{domxref("RTCRtpReceiver")}}
