---
title: "RTCCodecStats: channels property"
short-title: channels
slug: Web/API/RTCCodecStats/channels
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_codec.channels
---

{{APIRef("WebRTC")}}

Thuộc tính **`channels`** của từ điển {{domxref("RTCCodecStats")}} là một số dương chứa số kênh được hỗ trợ bởi codec.

Với codec âm thanh, giá trị 1 cho biết âm thanh mono, còn giá trị 2 cho biết âm thanh stereo.

## Giá trị

Một số dương cho biết số kênh.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tùy chọn `codecs.channels` trong tham số truyền vào [`RTCRtpTransceiver.setCodecPreferences()`](/en-US/docs/Web/API/RTCRtpTransceiver/setCodecPreferences#channels) và [`RTCRtpSender.setParameters()`](/en-US/docs/Web/API/RTCRtpSender/setParameters#channels).
- Thuộc tính `codecs.channels` trong đối tượng trả về bởi [`RTCRtpSender.getParameters()`](/en-US/docs/Web/API/RTCRtpSender/getParameters#channels) và [`RTCRtpReceiver.getParameters()`](/en-US/docs/Web/API/RTCRtpReceiver/getParameters#channels).
