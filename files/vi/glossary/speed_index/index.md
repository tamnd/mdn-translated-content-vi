---
title: Speed index
slug: Glossary/Speed_index
page-type: glossary-definition
sidebar: glossarysidebar
---

**Speed Index** (SI - Chỉ số tốc độ) là chỉ số hiệu năng tải trang đo lường mức độ nhanh chóng nội dung của một trang được điền vào một cách trực quan. Speed Index phụ thuộc vào kích thước của viewport và được biểu thị bằng mili giây: lượng thời gian càng thấp thì điểm càng tốt.

Speed Index được giới thiệu để giải quyết các vấn đề với các mốc và chỉ số khác và cung cấp thước đo trải nghiệm người dùng thực tế. Speed Index đã được triển khai trong một số công cụ kiểm tra phổ biến bao gồm [WebPageTest](https://github.com/catchpoint/WebPageTest.docs/blob/main/src/metrics/SpeedIndex.md) và [Lighthouse](https://github.com/paulirish/speedline).

Speed Index được tính bằng tỷ lệ phần trăm của trang được hoàn thành về mặt hình ảnh tại mỗi khoảng thời gian 100ms cho đến khi trang hoàn thành về mặt hình ảnh. Điểm tổng thể là tổng của các khoảng 10 lần mỗi giây của phần trăm màn hình chưa được hoàn thành về mặt hình ảnh.

_Sơ đồ cho thấy cách nội dung trên màn hình có thể tải trước sự kiện tải trang và được đo bởi Speed Index_:
![Tính toán SpeedIndex](speedindex.png)

## Xem thêm

- [Học: Hiệu năng web](/en-US/docs/Learn_web_development/Extensions/Performance)
