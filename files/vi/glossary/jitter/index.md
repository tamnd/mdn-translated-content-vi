---
title: Jitter
slug: Glossary/Jitter
page-type: glossary-definition
sidebar: glossarysidebar
---

**Jitter** (biến động trễ) là thuật ngữ trong mạng máy tính để chỉ [biến động trễ gói tin](https://en.wikipedia.org/wiki/Packet_delay_variation) — sự biến đổi trong tốc độ đến của các gói tin tại đích (là trung bình của bình phương độ lệch so với tốc độ đến trung bình).

"Jitter cao" cho thấy các gói tin đang đến với tốc độ biến động đáng kể, có thể do tắc nghẽn mạng, mất gói tin và việc định tuyến các gói tin trong một luồng qua các đường dẫn khác nhau.
Jitter cao có thể làm giảm đáng kể hiệu năng của các ứng dụng web thời gian thực, bao gồm phát trực tuyến thoại/video và trò chơi trực tuyến.

## Bộ đệm jitter

Các giao thức và ứng dụng mạng, như WebRTC, sử dụng "bộ đệm jitter" để giảm thiểu ảnh hưởng của biến động trễ gói tin.
Bộ đệm jitter lưu trữ tạm thời các gói tin đến và sau đó giải phóng chúng với tốc độ ổn định, đồng bộ.
Chúng cũng có thể sử dụng sửa lỗi chuyển tiếp để sửa các gói bị hỏng, yêu cầu lại các gói bị thiếu, [chèn các mẫu âm thanh để che giấu các gói bị thiếu](https://en.wikipedia.org/wiki/Packet_loss_concealment), làm chậm hoặc tăng tốc độ phát lại mẫu, v.v.
Quá trình này làm mượt thời gian đến của các gói tin và đảm bảo phát lại âm thanh và video thời gian thực nhất quán hơn.

## Xem thêm

- [How WebRTC's NetEQ Jitter Buffer Provides Smooth Audio](https://webrtchacks.com/how-webrtcs-neteq-jitter-buffer-provides-smooth-audio/#post-4560-_mv3ivinthkf5) (webrtchacks.com, tháng 6 năm 2025)
