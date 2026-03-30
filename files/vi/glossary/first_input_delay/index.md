---
title: First Input Delay (FID)
slug: Glossary/First_input_delay
page-type: glossary-definition
status:
  - deprecated
sidebar: glossarysidebar
---

**First input delay** (FID - Độ trễ đầu vào đầu tiên) đo thời gian từ khi người dùng lần đầu tương tác với trang web của bạn (ví dụ, khi họ nhấp vào một liên kết, nhấn vào một nút, hoặc sử dụng điều khiển tùy chỉnh được hỗ trợ bởi JavaScript) đến khi trình duyệt thực sự có thể phản hồi với tương tác đó.

> [!WARNING]
> FID được Google thiết kế như một trong các chỉ số [Core Web Vital](https://web.dev/articles/vitals) nhưng đã bị thay thế bởi {{Glossary("Interaction to Next Paint")}} (INP) [vào tháng 5 năm 2024](https://web.dev/blog/inp-cwv-launch).

Đây là khoảng thời gian, tính bằng mili giây, giữa lần tương tác đầu tiên của người dùng trên một trang web và phản hồi của trình duyệt với tương tác đó. Cuộn trang và thu phóng không được bao gồm trong chỉ số này.

Thời gian giữa khi nội dung được vẽ lên trang và khi tất cả các chức năng trở nên phản hồi với tương tác của người dùng thường thay đổi dựa trên kích thước và độ phức tạp của JavaScript cần được tải xuống, phân tích cú pháp và thực thi trên luồng chính, và trên tốc độ thiết bị hoặc sự thiếu hụt đó (hãy nghĩ đến các thiết bị di động cấp thấp). Độ trễ càng lâu, trải nghiệm người dùng càng tệ. Giảm thời gian khởi tạo trang và loại bỏ [các tác vụ dài](/en-US/docs/Web/API/PerformanceLongTaskTiming) có thể giúp loại bỏ độ trễ đầu vào đầu tiên.

## Xem thêm

- [Interaction to Next Paint is officially a Core Web Vital](https://web.dev/blog/inp-cwv-launch) trên web.dev (2024)
