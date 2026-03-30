---
title: HTTPS RR
slug: Glossary/HTTPS_RR
page-type: glossary-definition
sidebar: glossarysidebar
---

**HTTPS RR** (**_HTTPS Resource Records_**) là một loại bản ghi DNS cung cấp thông tin cấu hình và các tham số về cách truy cập một dịch vụ thông qua {{Glossary("HTTPS")}}.

Một _HTTPS RR_ có thể được sử dụng để tối ưu hóa quá trình kết nối với một dịch vụ sử dụng HTTPS. Hơn nữa, sự hiện diện của _HTTPS RR_ báo hiệu rằng tất cả các tài nguyên {{Glossary("HTTP")}} hữu ích trên origin có thể truy cập qua HTTPS, điều đó có nghĩa là trình duyệt có thể nâng cấp an toàn các kết nối đến tên miền từ HTTP sang HTTPS.

## Xem thêm

- {{RFC(9460, "Service Binding and Parameter Specification via the DNS (SVCB and HTTPS Resource Records)")}}
- [Strict Transport Security vs. HTTPS Resource Records: the showdown](https://emilymstark.com/2020/10/24/strict-transport-security-vs-https-resource-records-the-showdown.html) (Blog của Emily M. Stark)
- Các thuật ngữ liên quan:
  - {{glossary("TLS")}}
