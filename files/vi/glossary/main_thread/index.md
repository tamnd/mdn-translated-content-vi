---
title: Luồng chính
slug: Glossary/Main_thread
page-type: glossary-definition
sidebar: glossarysidebar
---

**Luồng chính** (main thread) là nơi trình duyệt xử lý các sự kiện người dùng và vẽ trang. Theo mặc định, trình duyệt sử dụng một luồng duy nhất để chạy tất cả JavaScript trong trang của bạn, cũng như để thực hiện bố cục, reflow và thu dọn bộ nhớ. Điều này có nghĩa là các hàm JavaScript chạy lâu có thể chặn luồng, dẫn đến trang không phản hồi và trải nghiệm người dùng kém.

Trừ khi cố ý sử dụng [web worker](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers), chẳng hạn như [service worker](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers), JavaScript chạy trên luồng chính, vì vậy một script dễ dàng gây ra độ trễ trong xử lý sự kiện hoặc vẽ trang. Luồng chính càng ít công việc, thì luồng đó càng có thể phản hồi các sự kiện người dùng, vẽ trang, và nói chung phản hồi tốt hơn với người dùng.

## Xem thêm

- [JavaScript bất đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS)
- [Web worker API](/en-US/docs/Web/API/Web_Workers_API)
- [Service worker API](/en-US/docs/Web/API/Service_Worker_API)
- Các thuật ngữ liên quan:
  - {{Glossary("Thread")}}
