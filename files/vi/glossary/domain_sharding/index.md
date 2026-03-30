---
title: Phân tách tên miền
slug: Glossary/Domain_sharding
page-type: glossary-definition
sidebar: glossarysidebar
---

Trình duyệt giới hạn số lượng kết nối hoạt động cho mỗi miền. Để cho phép tải xuống đồng thời các tài sản vượt quá giới hạn đó, **phân mảnh miền** (domain sharding) chia nội dung trên nhiều tên miền phụ. Khi nhiều miền được sử dụng để phục vụ nhiều tài sản, trình duyệt có thể tải xuống nhiều tài nguyên hơn đồng thời, dẫn đến thời gian tải trang nhanh hơn và cải thiện trải nghiệm người dùng.

Vấn đề với phân mảnh miền, về mặt hiệu năng, là chi phí tra cứu DNS thêm cho mỗi miền và overhead của việc thiết lập mỗi kết nối TCP.

HTTP/2 hỗ trợ số lượng yêu cầu đồng thời không giới hạn, khiến phân mảnh miền trở nên lỗi thời khi HTTP/2 được bật.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("TLS")}}
  - {{Glossary("DNS")}}
  - {{Glossary("HTTP 2", "HTTP/2")}}
