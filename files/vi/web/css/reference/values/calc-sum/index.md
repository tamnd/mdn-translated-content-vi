---
title: <calc-sum>
slug: Web/CSS/Reference/Values/calc-sum
page-type: css-type
spec-urls: https://drafts.csswg.org/css-values/#typedef-calc-sum
sidebar: cssref
---

Kiểu dữ liệu **`<calc-sum>`** trong [CSS](/vi/docs/Web/CSS) là [kiểu dữ liệu](/vi/docs/Web/CSS/Reference/Values/Data_types) đại diện cho một biểu thức thực hiện phép tính trong bất kỳ [hàm toán học CSS](/vi/docs/Web/CSS/Reference/Values/Functions#math_functions) nào. Biểu thức thực hiện phép tính số học cơ bản là cộng và trừ giữa hai giá trị.

## Cú pháp

Kiểu `<calc-sum>` xác định hai giá trị số và một trong các [toán tử số học](/vi/docs/Learn_web_development/Core/Scripting/Math#arithmetic_operators) sau giữa chúng.

- `+`
  - : Cộng hai số lại với nhau.

- `-`
  - : Trừ số bên phải từ số bên trái.

### Cú pháp chính thức

{{CSSSyntax}}

## Mô tả

Các toán hạng trong biểu thức có thể là bất kỳ giá trị cú pháp {{cssxref("&lt;length&gt;")}} nào. Bạn có thể sử dụng {{cssxref("&lt;length&gt;")}}, {{cssxref("&lt;frequency&gt;")}}, {{cssxref("angle")}}, {{cssxref("&lt;time&gt;")}}, {{cssxref("&lt;percentage&gt;")}}, {{cssxref("&lt;number&gt;")}}, hoặc {{cssxref("&lt;integer&gt;")}}.

Kiểu của hai toán hạng phải nhất quán. Đối với độ dài, bạn không thể dùng `0` để có nghĩa là `0px` (hoặc đơn vị độ dài khác). Thay vào đó, bạn phải thêm đơn vị rõ ràng: `margin-top: calc(0px + 20px);` là hợp lệ, trong khi `margin-top: calc(0 + 20px);` là không hợp lệ. Các kiểu giá trị phần trăm được xử lý dựa trên ngữ cảnh. Ví dụ, `margin-top: calc(50% + 20px);` là hợp lệ vì `margin-top` chuyển đổi phần trăm thành độ dài.

Việc bao gồm [biến CSS](/vi/docs/Web/CSS/Guides/Cascading_variables) trong biểu thức `calc-sum` cũng được phép. Đoạn mã sau `calc(10px + var(--variable))` là một biểu thức hợp lệ.

Các toán tử `+` và `-` **phải được bao quanh bởi {{Glossary("whitespace")}}**. Ví dụ, `calc(50% -8px)` sẽ được phân tích là "một phần trăm theo sau bởi một độ dài âm" — đây là một biểu thức không hợp lệ — trong khi `calc(50% - 8px)` là "một phần trăm theo sau bởi toán tử trừ và một độ dài". Tương tự, `calc(8px + -50%)` được coi là "một độ dài theo sau bởi toán tử cộng và một phần trăm âm".

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- {{CSSxRef("&lt;calc-product&gt;")}}
- {{CSSxRef("&lt;calc-value&gt;")}}
- {{CSSxRef("&lt;calc-keyword&gt;")}}
