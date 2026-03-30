---
title: Thời gian khứ hồi (RTT)
slug: Glossary/Round_Trip_Time
page-type: glossary-definition
sidebar: glossarysidebar
---

**Round Trip Time** (**RTT** - Thời gian khứ hồi) là khoảng thời gian để một gói dữ liệu được gửi đến đích cộng với thời gian nhận lại xác nhận của gói đó về nguồn. RTT giữa mạng và máy chủ có thể được xác định bằng lệnh `ping`.

```bash
ping example.com
```

Lệnh này sẽ cho ra kết quả tương tự như:

```plain
PING example.com (216.58.194.174): 56 data bytes
64 bytes from 216.58.194.174: icmp_seq=0 ttl=55 time=25.050 ms
64 bytes from 216.58.194.174: icmp_seq=1 ttl=55 time=23.781 ms
64 bytes from 216.58.194.174: icmp_seq=2 ttl=55 time=24.287 ms
64 bytes from 216.58.194.174: icmp_seq=3 ttl=55 time=34.904 ms
64 bytes from 216.58.194.174: icmp_seq=4 ttl=55 time=26.119 ms
--- google.com ping statistics ---
5 packets transmitted, 5 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 23.781/26.828/34.904/4.114 ms
```

Trong ví dụ trên, thời gian khứ hồi trung bình được hiển thị ở dòng cuối là 26.8ms.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("Time to First Byte")}} (TTFB)
  - {{Glossary("Latency")}}
