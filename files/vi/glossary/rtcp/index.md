---
title: RTCP (RTP Control Protocol)
slug: Glossary/RTCP
page-type: glossary-definition
sidebar: glossarysidebar
---

**RTP Control Protocol** (**RTCP**) là giao thức đồng hành với {{Glossary("RTP")}}. RTCP được dùng để cung cấp thông tin kiểm soát và thống kê về phiên truyền phát nội dung đa phương tiện RTP.

Điều này cho phép các gói kiểm soát và thống kê được tách riêng về mặt logic và chức năng khỏi quá trình truyền phát nội dung đa phương tiện, trong khi vẫn sử dụng cùng lớp truyền gói để truyền tín hiệu RTCP cũng như nội dung RTP và đa phương tiện.

RTCP định kỳ truyền các gói điều khiển đến tất cả người tham gia trong một phiên RTP, sử dụng cùng cơ chế truyền gói dữ liệu. Giao thức nền xử lý việc ghép kênh các gói dữ liệu và điều khiển, đồng thời có thể sử dụng các cổng mạng riêng biệt cho từng loại gói.

## Xem thêm

- [Giới thiệu về Real-time Transport Protocol](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP)
- [RTP Control Protocol](https://en.wikipedia.org/wiki/RTP_Control_Protocol)
- {{RFC(3550, "RFC 3550 Section 6", 6)}}
