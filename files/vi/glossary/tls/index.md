---
title: Transport Layer Security (TLS)
slug: Glossary/TLS
page-type: glossary-definition
sidebar: glossarysidebar
---

**Transport Layer Security (TLS)**, trước đây được biết đến là {{Glossary("SSL", "Secure Sockets Layer (SSL)")}}, là một {{Glossary("protocol", "giao thức")}} được các ứng dụng sử dụng để giao tiếp bảo mật qua mạng, ngăn chặn giả mạo và nghe lén email, duyệt web, nhắn tin và các giao thức khác. Cả TLS lẫn SSL đều là các giao thức client/server đảm bảo bảo mật thông tin liên lạc bằng cách sử dụng các giao thức mật mã để cung cấp tính bảo mật qua mạng. Khi máy chủ và client giao tiếp bằng TLS, nó đảm bảo không có bên thứ ba nào có thể nghe lén hay giả mạo bất kỳ tin nhắn nào.

Tất cả các trình duyệt hiện đại đều hỗ trợ giao thức TLS, yêu cầu máy chủ cung cấp {{Glossary("Digital certificate", "chứng chỉ số")}} hợp lệ xác nhận danh tính của nó để thiết lập kết nối bảo mật. Cả client và máy chủ đều có thể xác thực lẫn nhau nếu cả hai bên cung cấp chứng chỉ số riêng của mình.

> [!NOTE]
> Tất cả các trình duyệt lớn bắt đầu xóa hỗ trợ cho TLS 1.0 và 1.1 vào đầu năm 2020; bạn cần đảm bảo rằng máy chủ web của mình hỗ trợ TLS 1.2 hoặc 1.3 từ nay trở đi. Từ phiên bản 74 trở đi, Firefox sẽ trả về lỗi [Secure Connection Failed](https://support.mozilla.org/en-US/kb/secure-connection-failed-firefox-did-not-connect) khi kết nối đến các máy chủ sử dụng các phiên bản TLS cũ hơn ([Firefox bug 1606734](https://bugzil.la/1606734)).

## Xem thêm

- [Transport Layer Security](https://en.wikipedia.org/wiki/Transport_Layer_Security) (Wikipedia)
- [RFC 8446](https://datatracker.ietf.org/doc/html/rfc8446) (Giao thức Transport Layer Security, Phiên bản 1.3)
- [RFC 5246](https://datatracker.ietf.org/doc/html/rfc5246) (Giao thức Transport Layer Security, Phiên bản 1.2)
- [Transport Layer Security](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security)
- [Transport Layer Security Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Transport_Layer_Security_Cheat_Sheet.html) (OWASP)
- Các thuật ngữ liên quan:
  - {{Glossary("HTTPS")}}
  - {{Glossary("SSL")}}
