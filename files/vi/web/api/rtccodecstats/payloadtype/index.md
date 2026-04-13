---
title: "RTCCodecStats: payloadType property"
short-title: payloadType
slug: Web/API/RTCCodecStats/payloadType
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_codec.payloadType
---

{{APIRef("WebRTC")}}

Thuộc tính **`payloadType`** của từ điển {{domxref("RTCCodecStats")}} là một số nguyên dương trong khoảng từ 0 đến 127 mô tả định dạng của payload {{glossary("RTP")}} được sử dụng trong mã hóa hoặc giải mã RTP.

## Giá trị

Một số nguyên dương trong khoảng từ 0 đến 127.

Ánh xạ giữa các giá trị và định dạng được định nghĩa trong RFC3550, cụ thể hơn trong [Phần 6: Payload Type Definitions](https://www.rfc-editor.org/rfc/rfc3551#section-6) của RFC3551.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính `payloadType` trả về bởi [`RTCEncodedAudioFrame.getMetadata()`](/en-US/docs/Web/API/RTCEncodedAudioFrame/getMetadata#payloadtype)
- Thuộc tính `payloadType` trả về bởi [`RTCEncodedVideoFrame.getMetadata()`](/en-US/docs/Web/API/RTCEncodedVideoFrame/getMetadata#payloadtype)
- Tùy chọn `codecs.payloadType` trong tham số truyền vào [`RTCRtpSender.setParameters()`](/en-US/docs/Web/API/RTCRtpSender/setParameters#payloadtype).
- Thuộc tính `codecs.payloadType` trong đối tượng trả về bởi [`RTCRtpSender.getParameters()`](/en-US/docs/Web/API/RTCRtpSender/getParameters#payloadtype) và [`RTCRtpReceiver.getParameters()`](/en-US/docs/Web/API/RTCRtpReceiver/getParameters#payloadtype).
