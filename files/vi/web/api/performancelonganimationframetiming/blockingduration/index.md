---
title: "PerformanceLongAnimationFrameTiming: thuộc tính blockingDuration"
short-title: blockingDuration
slug: Web/API/PerformanceLongAnimationFrameTiming/blockingDuration
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceLongAnimationFrameTiming.blockingDuration
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`blockingDuration`** của giao diện {{domxref("PerformanceLongAnimationFrameTiming")}} trả về {{domxref("DOMHighResTimeStamp")}} cho biết tổng thời gian tính bằng mili giây mà luồng chính bị chặn không phản hồi các tác vụ ưu tiên cao, chẳng hạn như đầu vào người dùng.

## Mô tả

`blockingDuration` được tính bằng cách lấy tất cả các [tác vụ dài](/en-US/docs/Web/API/PerformanceLongTaskTiming#description) trong LoAF có `duration` hơn `50ms`, trừ đi `50ms` từ mỗi tác vụ, cộng thêm thời gian kết xuất vào thời gian tác vụ dài nhất, và tổng kết các kết quả.

Sự khác biệt giữa `duration` và `blockingDuration` của LoAF có thể được tóm tắt như sau:

- `duration` là thước đo tổng thời gian phản hồi của LoAF, hữu ích để hiểu liệu layout, painting của khung có mất nhiều thời gian hay không.
- `blockingDuration` là thước đo tổng thời gian LoAF ngăn luồng chính phản hồi các tác vụ ưu tiên cao, chẳng hạn như tương tác người dùng, có thể khiến UI cảm thấy [giật cục](/en-US/docs/Glossary/Jank).

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}}.

## Ví dụ

Xem [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#examples) để biết các ví dụ liên quan đến Long Animation Frames API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- {{domxref("PerformanceScriptTiming")}}
- [Optimize long tasks](https://web.dev/articles/optimize-long-tasks) trên web.dev (2024)
