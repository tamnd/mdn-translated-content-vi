---
title: Kịch bản trang chéo (XSS)
slug: Glossary/Cross-site_scripting
page-type: glossary-definition
sidebar: glossarysidebar
---

Tấn công **kịch bản trang chéo** (XSS - Cross-site scripting) là tấn công trong đó kẻ tấn công có thể khiến trang web mục tiêu thực thi mã độc hại như thể đó là một phần của trang web. Mã có thể thực hiện bất cứ điều gì mà mã của trang web có thể làm. Ví dụ, kẻ tấn công có thể:

- Truy cập và sửa đổi tất cả nội dung của các trang đã tải của trang web và bất kỳ nội dung nào trong bộ nhớ cục bộ
- Thực hiện các yêu cầu HTTP với thông tin xác thực của người dùng, cho phép chúng mạo danh người dùng hoặc truy cập dữ liệu nhạy cảm

Tất cả các cuộc tấn công XSS đều phụ thuộc vào việc một trang web thực hiện hai điều:

1. Chấp nhận một số đầu vào có thể được tạo ra bởi kẻ tấn công
2. Đưa đầu vào này vào trang mà không làm sạch nó: tức là không đảm bảo rằng nó không thể thực thi được như JavaScript

## Xem thêm

- [Kịch bản trang chéo (XSS)](/en-US/docs/Web/Security/Attacks/XSS)
- [Cross-site scripting trên OWASP](https://owasp.org/www-community/attacks/xss/)
