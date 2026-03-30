---
title: HSTS
slug: Glossary/HSTS
page-type: glossary-definition
sidebar: glossarysidebar
---

**HTTP Strict Transport Security** cho phép một trang web thông báo cho trình duyệt rằng nó không bao giờ nên tải trang web bằng HTTP và nên tự động chuyển đổi tất cả các lần thử truy cập trang web bằng HTTP sang các yêu cầu HTTPS. Nó bao gồm một HTTP header, {{HTTPHeader("Strict-Transport-Security")}}, được gửi bởi máy chủ cùng với tài nguyên.

Nói cách khác, nó yêu cầu trình duyệt thay đổi giao thức từ HTTP sang HTTPS trong URL hoạt động (và an toàn hơn) và yêu cầu trình duyệt thực hiện điều đó cho mọi yêu cầu.

## Xem thêm

- {{HTTPHeader("Strict-Transport-Security")}}
- Bài viết OWASP: [HTTP Strict Transport Security](https://cheatsheetseries.owasp.org/cheatsheets/HTTP_Strict_Transport_Security_Cheat_Sheet.html)
- Wikipedia: [HTTP Strict Transport Security](https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security)
