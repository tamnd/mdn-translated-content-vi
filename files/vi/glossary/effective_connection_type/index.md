---
title: Loại kết nối hiệu quả
slug: Glossary/Effective_connection_type
page-type: glossary-definition
sidebar: glossarysidebar
---

**Loại kết nối hiệu quả** (ECT - Effective connection type) đề cập đến hiệu năng mạng được đo lường, trả về loại kết nối di động, như 3G, ngay cả khi kết nối thực tế là broadband có dây hoặc Wi-Fi, dựa trên thời gian giữa việc trình duyệt yêu cầu một trang và loại kết nối hiệu quả.

Các giá trị `slow-2g`, `2g`, `3g` và `4g` được xác định bằng cách sử dụng thời gian khứ hồi và giá trị downlink được quan sát.

| ECT       | RTT tối thiểu {{Glossary("Round Trip Time", "RTT")}} | Downlink tối đa | Giải thích                                                                                     |
| --------- | ---------------------------------------------------- | ---------------- | ---------------------------------------------------------------------------------------------- |
| `slow-2g` | 2000ms                                               | 50 Kbps          | Mạng phù hợp cho các truyền nhỏ như trang chỉ có văn bản.                                     |
| `2g`      | 1400ms                                               | 70 Kbps          | Mạng phù hợp để truyền các hình ảnh nhỏ.                                                      |
| `3g`      | 270ms                                                | 700 Kbps         | Mạng phù hợp để truyền các tài sản lớn như hình ảnh độ phân giải cao, âm thanh và video SD.   |
| `4g`      | 0ms                                                  | ∞                | Mạng phù hợp cho video HD, video thời gian thực, v.v.                                         |

[effectiveType](/en-US/docs/Web/API/NetworkInformation/effectiveType) là thuộc tính của [Network Information API](/en-US/docs/Web/API/Network_Information_API), được hiển thị với JavaScript qua đối tượng [navigator.connection](/en-US/docs/Web/API/Navigator/connection).

## Xem thêm

- [Network Information API](/en-US/docs/Web/API/Network_Information_API)
- {{domxref('NetworkInformation')}}
- {{domxref('NetworkInformation.effectiveType')}}
- {{HTTPHeader("ECT")}}
