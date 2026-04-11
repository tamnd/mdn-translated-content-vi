---
title: "RTCRtpTransceiver: sender property"
short-title: sender
slug: Web/API/RTCRtpTransceiver/sender
page-type: web-api-instance-property
browser-compat: api.RTCRtpTransceiver.sender
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`sender`** của giao diện {{domxref("RTCRtpTransceiver")}} trong WebRTC chỉ định {{domxref("RTCRtpSender")}} chịu trách nhiệm mã hóa và gửi dữ liệu media đi cho luồng của transceiver.

## Giá trị

Một đối tượng {{domxref("RTCRtpSender")}} dùng để mã hóa và gửi media có media ID khớp với giá trị hiện tại của {{domxref("RTCRtpTransceiver.mid", "mid")}}.

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Giới thiệu về Real-time Transport Protocol (RTP)](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP)
- {{domxref("RTCRtpSender")}}
