---
title: UDP (User Datagram Protocol)
slug: Glossary/UDP
page-type: glossary-definition
sidebar: glossarysidebar
---

**UDP** (User Datagram Protocol — Giao thức Gói dữ liệu Người dùng) là một {{glossary("protocol", "giao thức")}} lâu đời được sử dụng kết hợp với {{glossary("IPv6","IP")}} để gửi dữ liệu khi tốc độ và hiệu quả truyền tải quan trọng hơn bảo mật và độ tin cậy.

UDP sử dụng mô hình [giao tiếp không kết nối](https://en.wikipedia.org/wiki/Connectionless_communication) đơn giản với cơ chế giao thức tối thiểu. UDP cung cấp [checksums](https://en.wikipedia.org/wiki/Checksum) để kiểm tra tính toàn vẹn dữ liệu, và [số cổng](https://en.wikipedia.org/wiki/Port_numbers) để định địa chỉ các chức năng khác nhau ở nguồn và đích của datagram. Nó không có các cuộc đối thoại [bắt tay](https://en.wikipedia.org/wiki/Handshaking), do đó phơi bày chương trình của người dùng trước bất kỳ [sự không đáng tin cậy](<https://en.wikipedia.org/wiki/Reliability_(computer_networking)>) của mạng cơ bản; không có đảm bảo nào về việc gửi, thứ tự, hoặc bảo vệ chống trùng lặp. Nếu cần cơ sở sửa lỗi ở cấp độ giao diện mạng, một ứng dụng có thể sử dụng [Transmission Control Protocol](https://en.wikipedia.org/wiki/Transmission_Control_Protocol) (TCP) hoặc [Stream Control Transmission Protocol](https://en.wikipedia.org/wiki/Stream_Control_Transmission_Protocol) (SCTP) được thiết kế cho mục đích này.

UDP phù hợp cho các mục đích mà kiểm tra và sửa lỗi không cần thiết hoặc được thực hiện trong ứng dụng; UDP tránh chi phí xử lý như vậy trong [ngăn xếp giao thức](https://en.wikipedia.org/wiki/Protocol_stack). Các ứng dụng nhạy cảm với thời gian thường sử dụng UDP vì việc bỏ gói tin là ưu tiên hơn chờ các gói tin bị trễ do [truyền lại](<https://en.wikipedia.org/wiki/Retransmission_(data_networks)>), điều này có thể không khả thi trong [hệ thống thời gian thực](https://en.wikipedia.org/wiki/Real-time_system).

## Xem thêm

- [User Datagram Protocol](https://en.wikipedia.org/wiki/User_Datagram_Protocol) trên Wikipedia
- [Đặc tả kỹ thuật](https://datatracker.ietf.org/doc/html/rfc768)
