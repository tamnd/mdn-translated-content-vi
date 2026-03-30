---
title: Giảm cấp khéo léo
slug: Glossary/Graceful_degradation
page-type: glossary-definition
sidebar: glossarysidebar
---

**Graceful degradation** là triết lý thiết kế tập trung vào việc xây dựng trang web/ứng dụng hiện đại hoạt động tốt nhất trên các trình duyệt mới nhất, nhưng vẫn cung cấp nội dung và chức năng thiết yếu cho người dùng trình duyệt cũ hơn, dù trải nghiệm có thể kém hơn.

{{Glossary("Polyfill","Polyfill")}} có thể được dùng để bổ sung các tính năng còn thiếu bằng JavaScript, nhưng cũng nên cung cấp các giải pháp thay thế phù hợp cho các tính năng như kiểu dáng và bố cục khi có thể, ví dụ bằng cách tận dụng cascade CSS hoặc hành vi dự phòng của HTML.

Đây là kỹ thuật hữu ích giúp nhà phát triển web tập trung xây dựng những trang web tốt nhất có thể, dù biết rằng chúng sẽ được truy cập từ nhiều loại trình duyệt khác nhau. {{Glossary("Progressive enhancement")}} có liên quan nhưng khác biệt — thường được xem là đi theo hướng ngược lại với graceful degradation. Trên thực tế, cả hai cách tiếp cận đều hợp lệ và thường có thể bổ trợ cho nhau.

## Xem thêm

- [Graceful degradation](https://en.wikipedia.org/wiki/Graceful_degradation) trên Wikipedia
- [Triển khai phát hiện tính năng](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection)
- Các thuật ngữ liên quan:
  - {{Glossary("Polyfill")}}
  - {{Glossary("Progressive enhancement")}}
