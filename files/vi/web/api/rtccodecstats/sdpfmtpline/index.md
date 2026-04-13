---
title: "RTCCodecStats: sdpFmtpLine property"
short-title: sdpFmtpLine
slug: Web/API/RTCCodecStats/sdpFmtpLine
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_codec.sdpFmtpLine
---

{{APIRef("WebRTC")}}

Thuộc tính **`sdpFmtpLine`** của từ điển {{domxref("RTCCodecStats")}} là một chuỗi chứa các tham số dành riêng cho định dạng của codec.

Đây là các giá trị trong dòng `"a=fmtp"` trong {{Glossary("SDP")}} của codec (nếu có) sau số payload type (xem [phần 5.8 của đặc tả IETF cho JSEP](https://datatracker.ietf.org/doc/html/draft-ietf-rtcweb-jsep-24#section-5.8)).

## Giá trị

Một chuỗi chứa các tham số dành riêng cho định dạng của codec.

## Mô tả

Dòng `"a=fmtp"` trong {{Glossary("SDP")}} của codec có định dạng sau, trong đó payload type (xem {{domxref("RTCCodecStats.payloadType")}}) và các tham số phụ thuộc vào codec:

```plain
a=fmtp:<payload_type_number> param1=value1; ...; paramN=valueN
```

Ví dụ, dòng sau cho biết codec "opus" có `payloadType` là 99 có các tham số dành riêng cho định dạng là `maxplaybackrate` và `stereo`:

```plain
a=fmtp:99 maxplaybackrate=16000; stereo=1;
```

Với codec này, giá trị trong `sdpFmtpLine` sẽ là `maxplaybackrate=16000; stereo=1;`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tùy chọn `codecs.sdpFmtpLine` trong tham số truyền vào [`RTCRtpTransceiver.setCodecPreferences()`](/en-US/docs/Web/API/RTCRtpTransceiver/setCodecPreferences#sdpfmtpline) và [`RTCRtpSender.setParameters()`](/en-US/docs/Web/API/RTCRtpSender/setParameters#sdpfmtpline).
- Thuộc tính `codecs.sdpFmtpLine` trong đối tượng trả về bởi [`RTCRtpSender.getParameters()`](/en-US/docs/Web/API/RTCRtpSender/getParameters#sdpfmtpline) và [`RTCRtpReceiver.getParameters()`](/en-US/docs/Web/API/RTCRtpReceiver/getParameters#sdpfmtpline).
