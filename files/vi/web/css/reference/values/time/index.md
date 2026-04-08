---
title: <time>
slug: Web/CSS/Reference/Values/time
page-type: css-type
browser-compat: css.types.time
sidebar: cssref
---

Kiểu dữ liệu **`<time>`** [CSS](/vi/docs/Web/CSS) [data type](/vi/docs/Web/CSS/Reference/Values/Data_types) biểu diễn giá trị thời gian tính bằng giây hoặc mili giây. Nó được dùng trong các thuộc tính {{cssxref("animation")}}, {{cssxref("transition")}} và các thuộc tính liên quan.

## Cú pháp

Kiểu dữ liệu `<time>` bao gồm một {{cssxref("&lt;number&gt;")}} theo sau là một trong các đơn vị liệt kê bên dưới. Tùy chọn, nó có thể được đặt trước bởi dấu `+` hoặc `-` đơn lẻ. Như với tất cả các đại lượng có đơn vị, không có khoảng trắng giữa ký hiệu đơn vị và số.

> [!NOTE]
> Mặc dù số `0` luôn giống nhau bất kể đơn vị, đơn vị không thể bị bỏ qua. Nói cách khác, `0` không hợp lệ và không biểu diễn `0s` hoặc `0ms`.

### Đơn vị

- `s`
  - : Biểu diễn thời gian tính bằng giây. Ví dụ: `0s`, `1.5s`, `-60s`.
- `ms`
  - : Biểu diễn thời gian tính bằng mili giây. Ví dụ: `0ms`, `150.25ms`, `-60000ms`.

> [!NOTE]
> Quy đổi giữa `s` và `ms` theo công thức `1s` = `1000ms`.

## Ví dụ

### Thời gian hợp lệ

```plain example-good
12s         Số nguyên dương
-456ms      Số nguyên âm
4.3ms       Số không nguyên
14mS        Đơn vị không phân biệt hoa thường, tuy nhiên không khuyến nghị dùng chữ hoa.
+0s         Số không có dấu + phía trước và đơn vị
-0ms        Số không có dấu - phía trước và đơn vị
```

### Thời gian không hợp lệ

```plain example-bad
0           Dù số không không có đơn vị được phép cho <length>, nó không hợp lệ với <time>.
12.0        Đây là <number>, không phải <time>, vì thiếu đơn vị.
7 ms        Không được có khoảng trắng giữa số và đơn vị.
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("&lt;time-percentage&gt;")}}
- [CSS values and units](/vi/docs/Web/CSS/Guides/Values_and_units) module
