---
title: <frequency>
slug: Web/CSS/Reference/Values/frequency
page-type: css-type
spec-urls: https://drafts.csswg.org/css-values/#frequency-value
sidebar: cssref
---

Kiểu dữ liệu **`<frequency>`** trong [CSS](/vi/docs/Web/CSS) đại diện cho một kích thước tần số, chẳng hạn như cao độ của giọng nói. Hiện tại nó không được dùng trong bất kỳ thuộc tính CSS nào.

## Cú pháp

Kiểu dữ liệu `<frequency>` bao gồm một {{cssxref("&lt;number&gt;")}} theo sau là một trong các đơn vị liệt kê bên dưới. Như với tất cả các kích thước CSS, không có khoảng trắng giữa ký tự đơn vị và số.

### Đơn vị

- `Hz`
  - : Đại diện cho tần số tính bằng hertz. Ví dụ: `0Hz`, `1500Hz`, `10000Hz`.
- `kHz`
  - : Đại diện cho tần số tính bằng kilohertz. Ví dụ: `0kHz`, `1.5kHz`, `10kHz`.

> [!NOTE]
> Mặc dù số `0` luôn giống nhau bất kể đơn vị, đơn vị không được bỏ qua. Nói cách khác, `0` không hợp lệ và không đại diện cho `0Hz` hay `0kHz`. Mặc dù các đơn vị không phân biệt hoa thường, nên dùng chữ "H" hoa cho `Hz` và `kHz`, như được chỉ định trong [SI](https://en.wikipedia.org/wiki/International_System_of_Units).

## Ví dụ

Các giá trị tần số hợp lệ:

```plain example-good
12Hz     Số nguyên dương
4.3Hz    Số thực
14KhZ    Đơn vị không phân biệt hoa thường, dù không khuyến khích dùng kiểu viết hoa không theo SI.
+0Hz     Số không, có dấu + và đơn vị
-0kHz    Số không, có dấu - và đơn vị
```

Các giá trị tần số không hợp lệ:

```plain example-bad
12.0     Đây là <number>, không phải <frequency>, vì thiếu đơn vị.
7 Hz     Không được có khoảng trắng giữa số và đơn vị.
0        Mặc dù số không không có đơn vị là <length> hợp lệ, nhưng là <frequency> không hợp lệ.
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

Hiện tại không có trình duyệt nào hỗ trợ tính năng này.

## Xem thêm

- {{cssxref("&lt;frequency-percentage&gt;")}}
- Module [CSS values and units](/vi/docs/Web/CSS/Guides/Values_and_units)
