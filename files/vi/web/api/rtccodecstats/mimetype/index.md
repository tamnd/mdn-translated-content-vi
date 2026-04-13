---
title: "RTCCodecStats: mimeType property"
short-title: mimeType
slug: Web/API/RTCCodecStats/mimeType
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_codec.mimeType
---

{{APIRef("WebRTC")}}

Thuộc tính **`mimeType`** của từ điển {{domxref("RTCCodecStats")}} là một chuỗi chứa {{glossary("MIME type")}} và subtype của codec.

Chuỗi này có dạng `"type/subtype"`, chẳng hạn như "video/VP8" hoặc "audio/opus", theo định nghĩa trong [registry IANA của các MIME type hợp lệ](https://www.iana.org/assignments/rtp-parameters/rtp-parameters.xhtml#rtp-parameters-2).

## Giá trị

Một chuỗi cho biết MIME type/subtype của codec.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tùy chọn `codecs.mimeType` trong tham số truyền vào [`RTCRtpTransceiver.setCodecPreferences()`](/en-US/docs/Web/API/RTCRtpTransceiver/setCodecPreferences#mimetype) và [`RTCRtpSender.setParameters()`](/en-US/docs/Web/API/RTCRtpSender/setParameters#mimetype).
- Thuộc tính `codecs.mimeType` trong đối tượng trả về bởi [`RTCRtpSender.getParameters()`](/en-US/docs/Web/API/RTCRtpSender/getParameters#mimetype) và [`RTCRtpReceiver.getParameters()`](/en-US/docs/Web/API/RTCRtpReceiver/getParameters#mimetype).
