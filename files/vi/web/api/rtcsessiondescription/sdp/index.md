---
title: "RTCSessionDescription: thuộc tính sdp"
short-title: sdp
slug: Web/API/RTCSessionDescription/sdp
page-type: web-api-instance-property
browser-compat: api.RTCSessionDescription.sdp
---

{{APIRef("WebRTC")}}

Thuộc tính **`RTCSessionDescription.sdp`** là một chuỗi chỉ đọc chứa {{Glossary("SDP")}} mô tả phiên.

## Giá trị

Giá trị là một chuỗi chứa thông báo SDP như sau:

```plain
v=0
o=alice 2890844526 2890844526 IN IP4 host.anywhere.com
s=
c=IN IP4 host.anywhere.com
t=0 0
m=audio 49170 RTP/AVP 0
a=rtpmap:0 PCMU/8000
m=video 51372 RTP/AVP 31
a=rtpmap:31 H261/90000
m=video 53000 RTP/AVP 32
a=rtpmap:32 MPV/90000
```

## Ví dụ

```js
// Mô tả từ xa đã được thiết lập trước đó trên pc, một RTCPeerConnection

alert(pc.remoteDescription.sdp);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- Tiêu chuẩn về việc sử dụng SDP trong giao thức offer/answer {{rfc("3264")}}.
