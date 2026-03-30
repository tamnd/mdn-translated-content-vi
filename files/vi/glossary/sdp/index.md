---
title: SDP
slug: Glossary/SDP
page-type: glossary-definition
sidebar: glossarysidebar
---

**SDP** (Session Description {{glossary("Protocol")}} - Giao thức mô tả phiên) là tiêu chuẩn mô tả kết nối {{Glossary("P2P","ngang hàng (peer-to-peer)")}}. SDP chứa thông tin về {{Glossary("codec")}}, địa chỉ nguồn và thời gian của âm thanh và video.

Đây là một thông điệp SDP điển hình:

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

SDP không bao giờ được sử dụng một mình, mà bởi các giao thức như {{Glossary("RTP")}} và {{Glossary("RTSP")}}. SDP cũng là thành phần của {{Glossary("WebRTC")}}, sử dụng SDP như một cách mô tả phiên.

## Xem thêm

- [Các giao thức WebRTC](/en-US/docs/Web/API/WebRTC_API/Protocols)
- [Session Description Protocol](https://en.wikipedia.org/wiki/Session_Description_Protocol) trên Wikipedia
