---
title: <alpha-value>
slug: Web/CSS/Reference/Values/alpha-value
page-type: css-type
spec-urls: https://drafts.csswg.org/css-color/#typedef-color-alpha-value
sidebar: cssref
---

Kiểu dữ liệu **`<alpha-value>`** trong [CSS](/vi/docs/Web/CSS) là một [kiểu dữ liệu](/vi/docs/Web/CSS/Reference/Values/Data_types) đại diện cho một giá trị có thể là {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}, xác định **{{Glossary("alpha", "kênh alpha")}}** hay **độ trong suốt** của màu sắc.

## Cú pháp

Giá trị của `<alpha-value>` được cho dưới dạng {{cssxref("number")}} hoặc {{cssxref("percentage")}}.

Nếu cho dưới dạng số, khoảng giá trị hữu ích là 0 (hoàn toàn trong suốt) đến 1.0 (hoàn toàn mờ đục), với các giá trị thập phân ở giữa; tức là 0.5 có nghĩa là dùng một nửa màu nền trước và một nửa màu nền sau. Các giá trị nằm ngoài khoảng 0 đến 1 được phép, nhưng sẽ bị [kẹp](<https://en.wikipedia.org/wiki/Clamping_(graphics)>) vào khoảng 0 đến 1.

Nếu giá trị alpha được cho dưới dạng phần trăm, 0% tương ứng với hoàn toàn trong suốt còn 100% là hoàn toàn mờ đục.

## Cú pháp chính thức

{{csssyntax}}

## Nội suy

Khi tạo hoạt ảnh, các giá trị của kiểu dữ liệu CSS `<alpha-value>` được {{Glossary("interpolation", "nội suy")}} dưới dạng số thực dấu phẩy động. Tốc độ nội suy được xác định bởi [hàm easing](/vi/docs/Web/CSS/Reference/Values/easing-function) liên kết với hoạt ảnh đó.

## Ví dụ

### Đặt độ mờ cho màu chữ

Hàm [`rgb()`](/vi/docs/Web/CSS/Reference/Values/color_value/rgb) chấp nhận một giá trị thứ tư tùy chọn để xác định giá trị alpha.
Ví dụ dưới đây cho thấy cách áp dụng màu với độ mờ 60% sử dụng giá trị alpha:

```css
/* <rgb()> */
color: rgb(34 12 64 / 60%);
```

### Đặt ngưỡng hình ảnh cho shape

Ở đây một giá trị alpha được dùng để xác định phần nào của hình ảnh được coi là thuộc về một shape:

```css
/* shape-image-threshold */
shape-image-threshold: 70%;
shape-image-threshold: 0.7;
```

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Học: Định dạng văn bản và phông chữ cơ bản](/vi/docs/Learn_web_development/Core/Text_styling/Fundamentals)
- [Các kiểu dữ liệu CSS](/vi/docs/Web/CSS/Reference/Values/Data_types)
- [Màu sắc trong CSS](/vi/docs/Web/CSS/Guides/Colors)
- {{cssxref("&lt;color&gt;")}}
