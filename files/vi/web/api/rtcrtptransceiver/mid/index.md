---
title: "RTCRtpTransceiver: mid property"
short-title: mid
slug: Web/API/RTCRtpTransceiver/mid
page-type: web-api-instance-property
browser-compat: api.RTCRtpTransceiver.mid
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`mid`** của giao diện {{domxref("RTCRtpTransceiver")}}
chỉ định media ID (`mid`) đã được thương lượng mà các phía cục bộ và từ xa đã thống nhất để nhận dạng duy nhất cặp sender và receiver của luồng.

## Giá trị

Một chuỗi nhận dạng duy nhất cặp nguồn và đích của luồng transceiver. Giá trị này được lấy từ media ID của m-line SDP.
Giá trị này là `null` nếu quá trình thương lượng chưa hoàn tất.

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Giới thiệu về Real-time Transport Protocol (RTP)](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP)
