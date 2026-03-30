---
title: RTP (Real-time Transport Protocol) and SRTP (Secure RTP)
slug: Glossary/RTP
page-type: glossary-definition
sidebar: glossarysidebar
---

**Real-time Transport Protocol** (**RTP**) là giao thức mạng mô tả cách truyền tải các loại nội dung đa phương tiện (âm thanh, video) từ một điểm cuối đến điểm cuối khác theo thời gian thực. RTP phù hợp cho các ứng dụng phát trực tuyến video, điện thoại qua {{glossary("IP")}} như Skype và các công nghệ hội nghị.

Phiên bản bảo mật của RTP, **SRTP**, được sử dụng bởi [WebRTC](/en-US/docs/Web/API/WebRTC_API), sử dụng mã hóa và xác thực để giảm thiểu nguy cơ tấn công từ chối dịch vụ và vi phạm bảo mật.

RTP hiếm khi được sử dụng một mình; thay vào đó, nó được sử dụng kết hợp với các giao thức khác như {{glossary("RTSP")}} và {{glossary("SDP")}}.

## Xem thêm

- [Giới thiệu về Real-time Transport Protocol](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP)
- [RTP](https://en.wikipedia.org/wiki/Real-time_Transport_Protocol) trên Wikipedia
- {{RFC(3550)}} (một trong những tài liệu xác định chính xác cách giao thức hoạt động)
