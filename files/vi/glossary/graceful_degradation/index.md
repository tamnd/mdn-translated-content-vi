---
title: Graceful degradation
slug: Glossary/Graceful_degradation
page-type: glossary-definition
sidebar: glossarysidebar
---

**Graceful degradation** (giảm cấp độ linh hoạt) là một triết lý thiết kế tập trung vào việc xây dựng trang web/ứng dụng hiện đại hoạt động tốt trên các trình duyệt mới nhất, nhưng rơi xuống một trải nghiệm, mặc dù không tốt bằng, vẫn cung cấp nội dung và chức năng thiết yếu trên các trình duyệt cũ hơn.

{{Glossary("Polyfill","Polyfills")}} có thể được sử dụng để xây dựng các tính năng bị thiếu bằng JavaScript, nhưng các giải pháp thay thế chấp nhận được cho các tính năng như kiểu dáng và bố cục nên được cung cấp khi có thể, ví dụ như bằng cách sử dụng cascade CSS hoặc hành vi dự phòng HTML.

Đây là một kỹ thuật hữu ích cho phép các nhà phát triển web tập trung vào việc phát triển các trang web tốt nhất có thể, biết rằng những trang web đó được truy cập bởi nhiều tác nhân người dùng không xác định. {{Glossary("Progressive enhancement")}} có liên quan nhưng khác nhau — thường được coi là đi theo hướng ngược lại với graceful degradation. Trên thực tế, cả hai cách tiếp cận đều hợp lệ và thường có thể bổ sung cho nhau.

## Xem thêm

- [Graceful degradation](https://en.wikipedia.org/wiki/Graceful_degradation) trên Wikipedia
- [Triển khai phát hiện tính năng](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection)
- Các thuật ngữ liên quan:
  - {{Glossary("Polyfill")}}
  - {{Glossary("Progressive enhancement")}}
