---
title: Interaction to Next Paint (INP)
slug: Glossary/Interaction_to_next_paint
page-type: glossary-definition
sidebar: glossarysidebar
---

**Interaction to Next Paint** (INP) đo lường khả năng phản hồi của trang web đối với các tương tác của người dùng (ví dụ: khi họ nhấp vào liên kết, chạm vào nút, hoặc sử dụng điều khiển tùy chỉnh được xây dựng bằng JavaScript).

INP được Google thiết kế như một trong các chỉ số [Core Web Vital](https://web.dev/articles/vitals), thay thế {{Glossary("First Input Delay")}} (FID) vào tháng 5 năm 2024. Có hai điểm khác biệt chính giữa FID và INP khiến INP đo lường khả năng phản hồi của trang chính xác hơn:

- FID chỉ đo lần tương tác đầu tiên của người dùng, trong khi INP xem xét tất cả các tương tác.
- FID chỉ đo độ trễ đầu vào của tương tác, trong khi INP đo trong khoảng thời gian dài hơn: bắt đầu từ độ trễ đầu vào, tiếp theo là thời gian xử lý các trình xử lý sự kiện, và thời gian trình duyệt vẽ khung tiếp theo.

INP đo thời gian dài nhất (trừ một số ngoại lệ), tính bằng mili giây, giữa tương tác của người dùng với trang web và lần vẽ khung tiếp theo sau khi tương tác đó được xử lý. Cuộn trang và thu phóng không được tính vào chỉ số này. INP được tính toán bằng [Event Timing API](/en-US/docs/Web/API/PerformanceEventTiming). Các hoạt động bất đồng bộ như tải tài nguyên qua mạng hay đọc tệp thường không làm chậm INP vì việc vẽ có thể xảy ra trong khi các hoạt động đó đang được xử lý.

Tất cả các tương tác hợp lệ trong suốt vòng đời trang đều được xem xét. Với các trang có nhiều tương tác từ 50 trở lên, phần trăm thứ 98 được sử dụng để loại trừ những giá trị ngoại lệ không phản ánh khả năng phản hồi tổng thể của trang. Giá trị {{domxref("Performance.interactionCount")}} có thể dùng để truy vấn số lượng tương tác nhằm xác định khi nào đã xảy ra nhiều tương tác trên trang.

Độ trễ càng lớn, trải nghiệm người dùng càng tệ. [Long Animation Frames API](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing) có thể giúp xác định nguyên nhân của INP cao.

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- [PerformanceEventTiming](/en-US/docs/Web/API/PerformanceEventTiming)
- {{domxref("Performance.interactionCount")}}
- [INP](https://web.dev/articles/inp) trên web.dev (2023)
- [Optimize Interaction to Next Paint](https://web.dev/articles/optimize-inp) trên web.dev (2023)
- [Interaction to Next Paint is officially a Core Web Vital](https://web.dev/blog/inp-cwv-launch) trên web.dev (2024)
