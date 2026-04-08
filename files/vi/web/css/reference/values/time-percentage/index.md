---
title: <time-percentage>
slug: Web/CSS/Reference/Values/time-percentage
page-type: css-type
spec-urls: https://drafts.csswg.org/css-values/#typedef-time-percentage
sidebar: cssref
---

Kiểu dữ liệu **`<time-percentage>`** [CSS](/vi/docs/Web/CSS) [data type](/vi/docs/Web/CSS/Reference/Values/Data_types) biểu diễn một giá trị có thể là {{Cssxref("time")}} hoặc {{Cssxref("percentage")}}.

## Cú pháp

Tham khảo tài liệu về {{Cssxref("time")}} và {{Cssxref("percentage")}} để biết chi tiết về cú pháp riêng của từng kiểu.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng trong calc()

Khi `<time-percentage>` được chỉ định là kiểu được phép, điều đó có nghĩa là phần trăm được giải thành thời gian và do đó có thể dùng trong biểu thức {{cssxref("calc()")}}.

### Phần trăm hợp lệ

```plain example-good
50%
+50%        Dấu cộng tùy chọn
-50%        Phần trăm âm không hợp lệ với tất cả các thuộc tính nhận phần trăm
```

### Phần trăm không hợp lệ

```plain example-bad
50 %        Không được có khoảng trắng giữa số và ký hiệu phần trăm
```

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

## Xem thêm

- {{cssxref("&lt;percentage&gt;")}}
- {{cssxref("&lt;time&gt;")}}
- [CSS values and units](/vi/docs/Web/CSS/Guides/Values_and_units) module
