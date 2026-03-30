---
title: Fetch directive
slug: Glossary/Fetch_directive
page-type: glossary-definition
sidebar: glossarysidebar
---

**Chỉ thị fetch của {{Glossary("CSP")}}** được dùng trong tiêu đề {{HTTPHeader("Content-Security-Policy")}} để kiểm soát các nguồn mà từ đó một số loại tài nguyên nhất định có thể được tải. Ví dụ, {{CSP("script-src")}} cho phép nhà phát triển chỉ định các nguồn script tin cậy được phép thực thi trên trang, trong khi {{CSP("font-src")}} kiểm soát nguồn của phông chữ web.

Tất cả các chỉ thị fetch đều dự phòng về {{CSP("default-src")}}. Nghĩa là nếu một chỉ thị fetch không có trong tiêu đề CSP, trình duyệt sẽ tìm kiếm chỉ thị `default-src`.

Xem [Fetch directives](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#fetch_directives) để có danh sách đầy đủ.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("CSP")}}
  - {{Glossary("Reporting directive")}}
  - {{Glossary("Document directive")}}
  - {{Glossary("Navigation directive")}}
- Tài liệu tham khảo
  - Đặc tả [Fetch directives](https://w3c.github.io/webappsec-csp/#directives-fetch)
  - {{HTTPHeader("Content-Security-Policy/upgrade-insecure-requests", "upgrade-insecure-requests")}}
  - {{HTTPHeader("Content-Security-Policy/block-all-mixed-content", "block-all-mixed-content")}}
  - {{HTTPHeader("Content-Security-Policy")}}
