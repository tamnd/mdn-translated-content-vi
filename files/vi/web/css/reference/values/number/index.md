---
title: <number>
slug: Web/CSS/Reference/Values/number
page-type: css-type
browser-compat: css.types.number
sidebar: cssref
---

Kiểu dữ liệu **`<number>`** trong [CSS](/vi/docs/Web/CSS) là một [kiểu dữ liệu](/vi/docs/Web/CSS/Reference/Values/Data_types) đại diện cho một số, có thể là số nguyên, số có phần thập phân, hoặc số mũ cơ số mười trong ký hiệu khoa học.

## Cú pháp

Cú pháp của `<number>` mở rộng cú pháp của {{CSSxRef("&lt;integer&gt;")}}. Giá trị thập phân được biểu diễn bằng dấu `.` theo sau là một hoặc nhiều chữ số thập phân, và có thể được gắn vào một số nguyên. Một `<number>` cũng có thể kết thúc bằng chữ `e` hoặc `E` theo sau là một số nguyên, biểu thị số mũ cơ số mười trong ký hiệu khoa học. Không có đơn vị nào đi kèm với các số.

Như với số nguyên, ký tự đầu tiên của số có thể được đặt trước ngay lập tức bởi - hoặc + để chỉ dấu của số: số là dương hay âm.

## Nội suy

Khi được hoạt ảnh, các giá trị của kiểu dữ liệu CSS `<number>` được nội suy như các số thực dấu phẩy động. Tốc độ nội suy được xác định bởi [hàm easing](/vi/docs/Web/CSS/Reference/Values/easing-function) liên kết với hoạt ảnh.

## Ví dụ

### Số hợp lệ

```plain example-good
12          Một <integer> thuần túy cũng là <number>.
4.01        Phần thập phân dương
-456.8      Phần thập phân âm
0.0         Số không
+0.0        Số không, với dấu + đứng trước
-0.0        Số không, với dấu - đứng trước
.60         Số thập phân không có số không đứng trước
10e3        Ký hiệu khoa học
-3.4e-2     Ký hiệu khoa học phức tạp
```

### Số không hợp lệ

```plain example-bad
12.         Dấu thập phân phải được theo sau bởi ít nhất một chữ số.
+-12.2      Chỉ được phép có một dấu +/- đứng trước.
12.1.1      Chỉ được phép có một dấu thập phân.
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("integer")}}
- {{CSSxRef("ratio")}}
- Module [giá trị và đơn vị CSS](/vi/docs/Web/CSS/Guides/Values_and_units)
