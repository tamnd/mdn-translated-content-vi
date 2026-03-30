---
title: RGB
slug: Glossary/RGB
page-type: glossary-definition
sidebar: glossarysidebar
---

_Red-Green-Blue_ (**RGB** - Đỏ-Xanh lá-Xanh dương) là mô hình màu biểu diễn màu sắc dưới dạng hỗn hợp của ba thành phần (hay kênh) cơ bản: _đỏ_ (red), _xanh lá_ (green), và _xanh dương_ (blue). Mô hình này mô tả một màu sắc bằng một dãy ba số (thường nằm trong khoảng 0.0 đến 1.0 hoặc từ 0 đến 255). Mỗi số đại diện cho cường độ (hay mức đóng góp) khác nhau của màu cơ bản trong việc xác định màu cuối cùng.

Một giá trị RGB tự nó không mang ý nghĩa gì. Chính mô hình màu mới xác định cách ba thành phần tương tác với nhau trong một {{glossary("color space")}} để tạo thành màu. Về mặt đồ họa, một điểm trong lưới không gian ba chiều hay hình lập phương đại diện cho một màu. Mỗi chiều (hay trục) tương ứng với một kênh khác nhau. Mô hình màu RGB do đó là hệ tọa độ _hình lập phương_ hay _Descartes_ của không gian màu bên dưới.

![Mô hình màu RGB như một hình lập phương với các trục đỏ, xanh dương và xanh lá](rgb_color_cube.png)

Đối với web, không gian màu nền cho giá trị RGB là _sRGB_ (Standard RGB - RGB tiêu chuẩn), và mỗi thành phần RGB là một số trong khoảng từ 0 đến 1.

Lưu ý rằng `sRGB` chỉ là một trong [nhiều không gian màu RGB](/en-US/docs/Glossary/Color_space#rgb_color_spaces). Các không gian màu RGB khác, như không gian màu _Adobe RGB_, có thể biểu diễn {{glossary("gamut")}} màu rộng hơn so với _sRGB_. Tọa độ trong _sRGB_ và _Adobe RGB_ là khác nhau.

Có nhiều cách để mô tả các thành phần RGB của một màu. Trong {{Glossary("CSS")}}, chúng có thể được biểu diễn theo nhiều cách: dạng [thập lục phân](/en-US/docs/Web/CSS/Reference/Values/hex-color) dưới dạng một số nguyên 24-bit (ví dụ: `#add8e6` là màu xanh nhạt) hoặc dạng hàm qua {{cssxref("color_value/rgb")}} với ba giá trị phần trăm hoặc số từ `0` đến `255` (ví dụ: `rgb(46 139 87)` là màu xanh lá). CSS cũng hỗ trợ các không gian màu `srgb`, `srgb-linear`, `a98-rgb` và `prophoto-rgb` cho hàm {{cssxref("color_value/color")}}.

RGB không phải là mô hình màu duy nhất có thể biểu diễn {{glossary("color space")}} `sRGB`. Các hệ tọa độ hình trụ như [`HSL`](/en-US/docs/Web/CSS/Reference/Values/color_value/hsl) (_hue-saturation-lightness_ - màu sắc-độ bão hòa-độ sáng) hay [`HWB`](/en-US/docs/Web/CSS/Reference/Values/color_value/hwb) (_hue-whiteness-blackness_ - màu sắc-độ trắng-độ đen) cũng được dùng để biểu diễn màu `sRGB` trên web.

## Xem thêm

- Kiểu dữ liệu CSS {{cssxref("&lt;color&gt;")}}
- [ColorAide: sRGB color space](https://facelessuser.github.io/coloraide/colors/srgb/)
- [Mô hình màu RGB](https://en.wikipedia.org/wiki/RGB_color_model) trên Wikipedia
- [Không gian màu sRGB](https://en.wikipedia.org/wiki/SRGB) trên Wikipedia
- [Không gian màu Adobe RGB](https://en.wikipedia.org/wiki/Adobe_RGB_color_space) trên Wikipedia
