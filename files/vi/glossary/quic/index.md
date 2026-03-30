---
title: QUIC
slug: Glossary/QUIC
page-type: glossary-definition
sidebar: glossarysidebar
---

**QUIC** là một giao thức truyền tải đa luồng được triển khai trên {{glossary("UDP")}}. Nó được sử dụng thay thế {{Glossary("TCP")}} là tầng truyền tải trong {{glossary("HTTP 3", "HTTP/3")}}.

QUIC được thiết kế để cung cấp thiết lập kết nối nhanh hơn và {{glossary("latency")}} (độ trễ) thấp hơn cho các kết nối {{glossary("HTTP")}}. Cụ thể:

- Trong TCP, bắt tay TCP ban đầu được tùy chọn theo sau bởi bắt tay TLS, vốn phải hoàn thành trước khi dữ liệu có thể được truyền. Vì TLS hầu như phổ biến rộng rãi hiện nay, QUIC tích hợp bắt tay TLS vào bắt tay QUIC ban đầu, giảm số lượng thông điệp phải trao đổi trong quá trình thiết lập.

- HTTP/2 là một giao thức đa luồng, cho phép nhiều giao dịch HTTP đồng thời. Tuy nhiên, các giao dịch được ghép kênh qua một kết nối TCP duy nhất, có nghĩa là mất gói và việc truyền lại tiếp theo ở tầng TCP có thể chặn tất cả các giao dịch. QUIC tránh điều này bằng cách chạy trên UDP và triển khai phát hiện mất gói và truyền lại riêng biệt cho mỗi luồng, có nghĩa là mất gói chỉ chặn luồng cụ thể có gói bị mất.

## Xem thêm

- Các thuật ngữ liên quan
  - {{glossary("HTTP")}}, {{glossary("HTTP 2", "HTTP/2")}}, {{glossary("HTTP 3", "HTTP/3")}}
  - {{glossary("TCP")}}, {{glossary("UDP")}}
  - {{glossary("Latency")}}, {{glossary("head of line blocking", "Head-of-line blocking")}}
- {{rfc("9000", "đặc tả QUIC")}}
- {{rfc("9114", "đặc tả HTTP/3")}}
