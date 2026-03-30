---
title: Giám sát tổng hợp
slug: Glossary/Synthetic_monitoring
page-type: glossary-definition
sidebar: glossarysidebar
---

**Giám sát tổng hợp** (Synthetic monitoring) là việc theo dõi hiệu năng của một trang trong môi trường "phòng thí nghiệm", thường sử dụng các công cụ tự động hóa trong môi trường nhất quán nhất có thể.

Với đường cơ sở nhất quán, giám sát tổng hợp rất hữu ích để đo lường tác động của các thay đổi mã nguồn đến hiệu năng. Tuy nhiên, nó không nhất thiết phản ánh những gì người dùng thực sự trải nghiệm.

Giám sát tổng hợp bao gồm việc triển khai các tập lệnh để mô phỏng luồng mà người dùng cuối có thể thực hiện qua một ứng dụng web, và báo cáo lại hiệu năng mà trình giả lập trải nghiệm. Các ví dụ về công cụ giám sát tổng hợp phổ biến bao gồm [WebPageTest](https://www.webpagetest.org/) và [Lighthouse](https://developer.chrome.com/docs/lighthouse/overview/). Lưu lượng được đo lường không phải từ người dùng thực, mà là lưu lượng được tạo ra tổng hợp để thu thập dữ liệu về hiệu năng trang.

Khác với {{Glossary("Real User Monitoring", "RUM")}}, giám sát tổng hợp cung cấp góc nhìn hẹp về hiệu năng, không tính đến sự khác biệt giữa người dùng, nhưng rất hữu ích để thu thập dữ liệu cơ bản về hiệu năng ứng dụng và kiểm tra nhanh hiệu năng trong môi trường phát triển. Kết hợp với các công cụ khác, như giới hạn băng thông mạng, có thể cung cấp cái nhìn sâu sắc về các vấn đề tiềm ẩn.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("Real User Monitoring")}} (RUM)
  - {{Glossary("Beacon")}}
- [Real User Monitoring (RUM) so với Giám sát tổng hợp](/en-US/docs/Web/Performance/Guides/Rum-vs-Synthetic)
