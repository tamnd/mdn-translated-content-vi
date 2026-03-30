---
title: Cross-site request forgery (CSRF)
slug: Glossary/CSRF
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong cuộc tấn công **cross-site request forgery** (CSRF), kẻ tấn công lừa trình duyệt thực hiện yêu cầu HTTP đến trang web mục tiêu từ một trang web độc hại. Yêu cầu mang theo thông tin xác thực của người dùng và khiến máy chủ thực hiện một hành động gây hại, trong khi tưởng rằng người dùng đã có ý định thực hiện điều đó.

Tấn công CSRF có thể xảy ra nếu một trang web:

- Sử dụng các yêu cầu HTTP để thay đổi một số trạng thái trên máy chủ
- Chỉ sử dụng cookie để xác nhận rằng yêu cầu đến từ một người dùng đã được xác thực
- Chỉ sử dụng các tham số trong yêu cầu mà kẻ tấn công có thể dự đoán

Có một số biện pháp phòng thủ chống lại các cuộc tấn công CSRF, bao gồm [CSRF tokens](/en-US/docs/Web/Security/Attacks/CSRF#csrf_tokens), sử dụng [fetch metadata](/en-US/docs/Web/Security/Attacks/CSRF#fetch_metadata) để chặn một số yêu cầu trang chéo, và [đặt thuộc tính `SameSite`](/en-US/docs/Web/Security/Attacks/CSRF#defense_in_depth_samesite_cookies) trên cookie được sử dụng để xác thực các yêu cầu nhạy cảm.

## Xem thêm

- [Cross-site request forgery](/en-US/docs/Web/Security/Attacks/CSRF)
- [Hướng dẫn phòng ngừa Cross-Site Request Forgery](https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html) tại [owasp.org](https://owasp.org/)
