---
title: <frequency-percentage>
slug: Web/CSS/Reference/Values/frequency-percentage
page-type: css-type
spec-urls: https://drafts.csswg.org/css-values/#typedef-frequency-percentage
sidebar: cssref
---

Kiểu dữ liệu **`<frequency-percentage>`** trong [CSS](/vi/docs/Web/CSS) đại diện cho một giá trị có thể là {{Cssxref("frequency")}} hoặc {{Cssxref("percentage")}}. Các giá trị tần số, ví dụ như cao độ của giọng nói, hiện không được dùng trong bất kỳ thuộc tính CSS nào.

## Cú pháp

Giá trị của `<frequency-percentage>` là một {{Cssxref("frequency")}} hoặc một {{Cssxref("percentage")}}; xem các trang tham chiếu riêng của chúng để biết chi tiết về cú pháp.

## Mô tả

### Sử dụng trong calc()

Khi `<frequency-percentage>` được chỉ định là kiểu cho phép, điều này có nghĩa là phần trăm phân giải thành một tần số và do đó có thể được dùng trong biểu thức [`calc()`](/vi/docs/Web/CSS/Reference/Values/calc).

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Giá trị phần trăm hợp lệ

```plain example-good
90% Phần trăm dương
+90% Phần trăm dương với dấu + phía trước
-90% Phần trăm âm — không hợp lệ cho tất cả các thuộc tính dùng phần trăm
```

### Giá trị phần trăm không hợp lệ

```plain example-bad
90 % Không được có khoảng trắng giữa số và đơn vị
```

### Giá trị tần số hợp lệ

```plain example-good
12Hz     Số nguyên dương
4.3Hz    Số thực
14KhZ    Đơn vị không phân biệt hoa thường, dù không khuyến khích dùng kiểu viết hoa không theo SI.
+0Hz     Số không, có dấu + và đơn vị
-0kHz    Số không, có dấu - và đơn vị
```

### Giá trị tần số không hợp lệ

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

- [Các kiểu dữ liệu CSS](/vi/docs/Web/CSS/Reference/Values/Data_types)
- Module [CSS values and units](/vi/docs/Web/CSS/Guides/Values_and_units)
- Các kiểu dữ liệu CSS liên quan:
  - {{cssxref("frequency", "&lt;frequency&gt;")}}
  - {{cssxref("percentage", "&lt;percentage&gt;")}}
