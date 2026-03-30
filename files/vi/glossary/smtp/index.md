---
title: SMTP
slug: Glossary/SMTP
page-type: glossary-definition
sidebar: glossarysidebar
---

**SMTP** (Simple Mail Transfer Protocol - Giao thức truyền thư đơn giản) là {{glossary("protocol","giao thức")}} dùng để gửi email mới. Giống như {{glossary("POP")}} và {{glossary("NNTP")}}, đây là giao thức điều khiển bởi {{Glossary("state machine","máy trạng thái")}}.

Giao thức này tương đối đơn giản. Các phức tạp chính bao gồm việc hỗ trợ nhiều cơ chế xác thực khác nhau ([GSSAPI](https://en.wikipedia.org/wiki/Generic_Security_Services_Application_Program_Interface), [CRAM-MD5](https://en.wikipedia.org/wiki/CRAM-MD5), [NTLM](https://en.wikipedia.org/wiki/NTLM), MSN, AUTH LOGIN, AUTH PLAIN, v.v.), xử lý phản hồi lỗi và quay lui khi các cơ chế xác thực thất bại (ví dụ: máy chủ tuyên bố hỗ trợ một cơ chế, nhưng thực sự không hỗ trợ).

## Xem thêm

- [SMTP](https://en.wikipedia.org/wiki/SMTP) (Wikipedia)
- Các thuật ngữ liên quan:
  - {{glossary("NNTP")}}
  - {{glossary("POP")}}
  - {{glossary("protocol")}}
  - {{Glossary("state machine")}}
