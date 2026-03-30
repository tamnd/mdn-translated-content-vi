---
title: Long task
slug: Glossary/Long_task
page-type: glossary-definition
sidebar: glossarysidebar
---

**Tác vụ dài** (long task) là một tác vụ mất hơn 50ms để hoàn thành.

Đó là khoảng thời gian không bị gián đoạn mà {{Glossary("main thread","luồng UI chính")}} bận rộn trong 50 ms trở lên. Các ví dụ phổ biến bao gồm các trình xử lý sự kiện chạy lâu, các thao tác {{Glossary("reflow","reflow")}} và re-render tốn kém, và các công việc mà trình duyệt thực hiện giữa các lượt của vòng lặp sự kiện vượt quá 50 ms.

## Xem thêm

- [Long Tasks API](/en-US/docs/Web/API/PerformanceLongTaskTiming)
- [Long Animation Frames API](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
