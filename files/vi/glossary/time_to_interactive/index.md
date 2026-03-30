---
title: Time to Interactive (TTI)
slug: Glossary/Time_to_interactive
page-type: glossary-definition
sidebar: glossarysidebar
---

**Time to Interactive** (**TTI**) là một chỉ số "tiến trình" hiệu suất web không được chuẩn hóa, được định nghĩa là điểm thời gian khi [Long Task](/en-US/docs/Web/API/PerformanceLongTaskTiming) cuối cùng kết thúc và được theo sau bởi 5 giây không hoạt động của mạng và luồng chính.

TTI, được đề xuất bởi Web Incubator Community Group vào năm 2018, được thiết kế để cung cấp một chỉ số mô tả thời điểm một trang hoặc ứng dụng chứa nội dung hữu ích và luồng chính ở trạng thái nhàn rỗi, sẵn sàng phản hồi tương tác người dùng, bao gồm cả việc đăng ký các trình xử lý sự kiện.

## Lưu ý

TTI được dẫn xuất bằng cách tận dụng thông tin từ [Long Task API](/en-US/docs/Web/API/PerformanceLongTaskTiming). Mặc dù có trong một số công cụ giám sát hiệu suất, TTI không phải là một phần của bất kỳ thông số kỹ thuật web chính thức nào.

## Xem thêm

- [Định nghĩa TTI](https://github.com/WICG/time-to-interactive) từ Web Incubator Community Group
- [Time to Interactive — focusing on human-centric metrics](https://calibreapp.com/blog/time-to-interactive) của Radimir Bitsov
- {{glossary("Time_to_first_byte", "Time to first byte (TTFB)")}}
