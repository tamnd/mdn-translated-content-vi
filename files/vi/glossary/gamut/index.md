---
title: Gamut
slug: Glossary/Gamut
page-type: glossary-definition
sidebar: glossarysidebar
---

**Gamut** màu sắc là một tập hợp con của các màu sắc, thường đại diện cho các màu mà màn hình hoặc thiết bị in ấn có thể tái tạo.

Không có màn hình hoặc máy in nào có thể tái tạo toàn bộ phạm vi màu sắc mà mắt người có thể nhận biết. _Gamut_ của thiết bị đại diện cho tập hợp màu mà nó hỗ trợ.

Theo truyền thống, trong phát triển web, gamut duy nhất được sử dụng là _[sRGB](https://en.wikipedia.org/wiki/SRGB)_ (Standard Red-Green-Blue), trong đó mỗi màu được mô tả bằng ba byte, một byte cho mỗi màu chính. Tuy nhiên, màn hình "wide-color" và máy in chuyên nghiệp hỗ trợ phạm vi màu rộng hơn, không thể được biểu diễn bằng gamut này.

Từ năm 2021, các trình duyệt đã bắt đầu cung cấp chức năng cho các gamut khác, như _[Display-P3](/en-US/docs/Glossary/Color_space#display-p3)_, được sử dụng rộng rãi trong ngành điện ảnh, và _[rec2020](/en-US/docs/Glossary/Color_space#rec2020)_.

Các nhà phát triển có thể định nghĩa các tập hợp màu khác nhau cho các thiết bị hỗ trợ gamut lớn hơn bằng cách sử dụng tính năng media {{cssxref("@media/color-gamut")}} [media feature](/en-US/docs/Web/CSS/Guides/Media_queries/Using). Họ có thể mô tả các màu ngoài gamut RGB bằng cách sử dụng các hàm CSS cụ thể như {{cssxref("color_value/lch")}} cho hệ tọa độ hình trụ LCH, hoặc {{cssxref("color_value/lab")}} cho hệ tọa độ Lab.

## Xem thêm

- [_Gamut_](https://en.wikipedia.org/wiki/Gamut) trên _Wikipedia_.
