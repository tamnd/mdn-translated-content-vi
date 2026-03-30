---
title: TCP slow start
slug: Glossary/TCP_slow_start
page-type: glossary-definition
sidebar: glossarysidebar
---

Khởi động chậm {{glossary('TCP')}} (TCP slow start) là một thuật toán giúp khám phá băng thông mạng sẵn có cho việc truyền gói tin, và cân bằng tốc độ truyền theo năng lực của mạng. Cơ chế này nhanh chóng tăng lượng thông tin được gửi từ mức rất thấp lên đến một ngưỡng. Nếu phát hiện tắc nghẽn, ngưỡng sẽ được đặt lại ở mức thấp hơn nhiều và quá trình khởi động chậm bắt đầu lại. Điều này giúp ngăn chặn tắc nghẽn khi năng lực mạng chưa được biết hoặc bị vượt quá — ở đầu kết nối, sau một khoảng thời gian không hoạt động, hoặc sau khi phát hiện tắc nghẽn — mà bản thân nó không gây ra tắc nghẽn.

Tắc nghẽn mạng xảy ra khi nhiều dữ liệu được gửi hơn khả năng truyền tải của mạng giữa các nút tại bất kỳ thời điểm nào. Khi mạng bị tắc nghẽn, các máy trong mạng sẽ gặp phải chất lượng dịch vụ giảm sút, bao gồm truyền dữ liệu chậm và mất gói tin.

Thuật toán khởi động chậm là một phần quan trọng của kiểm soát tắc nghẽn TCP, vì nó đảm bảo rằng các kết nối mới tăng dần tốc độ dữ liệu và không làm quá tải các nút khác.

## Xem thêm

- [Hiển thị trang: trình duyệt hoạt động như thế nào](/en-US/docs/Web/Performance/Guides/How_browsers_work)
- [Tổng quan về HTTP](/en-US/docs/Web/HTTP/Guides/Overview)
