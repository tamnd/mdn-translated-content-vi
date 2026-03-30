---
title: Thời gian tải trang
slug: Glossary/Page_load_time
page-type: glossary-definition
sidebar: glossarysidebar
---

**Thời gian tải trang** (Page load time) là thời gian cần thiết để một trang tải xong, được đo từ [thời điểm bắt đầu điều hướng](/en-US/docs/Web/API/PerformanceTiming/navigationStart) đến [thời điểm bắt đầu sự kiện load](/en-US/docs/Web/API/PerformanceTiming/loadEventStart).

```js
let time = performance.timing;

let pageloadTime = time.loadEventStart - time.navigationStart;
```

Dù thời gian tải trang "nghe có vẻ" là chỉ số hiệu năng web hoàn hảo, nhưng thực tế không phải vậy. Thời gian tải có thể khác nhau rất nhiều giữa các người dùng tùy thuộc vào khả năng thiết bị, điều kiện mạng, và ở mức độ nhỏ hơn là khoảng cách tới máy chủ. Môi trường phát triển nơi đo thời gian tải trang thường là trải nghiệm tối ưu, không phản ánh thực tế của người dùng. Ngoài ra, hiệu năng web không chỉ là về thời điểm sự kiện load xảy ra. Nó còn liên quan đến {{Glossary("perceived performance")}} (hiệu năng cảm nhận), khả năng phản hồi, {{Glossary("jank")}} và jitter.

## Xem thêm

- [Navigation and resource timing](/en-US/docs/Web/Performance/Guides/Navigation_and_resource_timings)
- {{domxref("PerformanceNavigationTiming")}}
- {{domxref("PerformanceResourceTiming")}},
