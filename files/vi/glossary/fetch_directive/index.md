---
title: Fetch directive
slug: Glossary/Fetch_directive
page-type: glossary-definition
sidebar: glossarysidebar
---

**Chỉ thị fetch của {{Glossary("CSP")}}** được sử dụng trong tiêu đề {{HTTPHeader("Content-Security-Policy")}} và kiểm soát các vị trí mà từ đó một số loại tài nguyên nhất định có thể được tải. Ví dụ, {{CSP("script-src")}} cho phép các nhà phát triển cho phép các nguồn script tin cậy thực thi trên trang, trong khi {{CSP("font-src")}} kiểm soát các nguồn của phông chữ web.

Tất cả các chỉ thị fetch đều dự phòng về {{CSP("default-src")}}. Điều đó có nghĩa là, nếu một chỉ thị fetch vắng mặt trong tiêu đề CSP, tác nhân người dùng sẽ tìm kiếm chỉ thị `default-src`.

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
