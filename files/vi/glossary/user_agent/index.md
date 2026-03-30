---
title: Tác nhân người dùng
slug: Glossary/User_agent
page-type: glossary-definition
sidebar: glossarysidebar
---

Tác nhân người dùng (user agent) là một chương trình máy tính đại diện cho người dùng, ví dụ như {{Glossary("Browser","trình duyệt")}} trong ngữ cảnh {{Glossary("World Wide Web", "Web")}}.

Ngoài trình duyệt, tác nhân người dùng còn có thể là một bot thu thập dữ liệu trang web, trình quản lý tải xuống, hoặc ứng dụng khác truy cập Web. Cùng với mỗi yêu cầu họ gửi đến máy chủ, các trình duyệt bao gồm {{HTTPHeader("User-Agent")}} {{Glossary("HTTP")}} header tự nhận dạng, gọi là chuỗi tác nhân người dùng (UA). Chuỗi này thường xác định trình duyệt, số phiên bản và hệ điều hành máy chủ của nó.

Các bot spam, trình quản lý tải xuống và một số trình duyệt thường gửi chuỗi UA giả để tự giới thiệu mình là một client khác. Điều này được gọi là _giả mạo tác nhân người dùng_ (user agent spoofing).

Chuỗi tác nhân người dùng có thể được truy cập bằng {{Glossary("JavaScript")}} ở phía client bằng cách sử dụng thuộc tính {{domxref("navigator.userAgent")}}.

Một chuỗi tác nhân người dùng điển hình trông như thế này: `"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:124.0) Gecko/20100101 Firefox/124.0"`.

## Xem thêm

- [User agent](https://en.wikipedia.org/wiki/User_agent) trên Wikipedia
- {{domxref("navigator.userAgent")}}
- [Phát hiện trình duyệt bằng tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent)
- {{RFC(2616, "", "14.43")}}: Header `User-Agent`
- Các thuật ngữ liên quan:
  - {{Glossary("Browser")}}
- HTTP Headers
  - {{HTTPHeader("User-agent")}}
