---
title: CSS custom functions and mixins
short-title: Custom functions and mixins
slug: Web/CSS/Guides/Custom_functions_and_mixins
page-type: css-module
spec-urls: https://drafts.csswg.org/css-mixins-1/
sidebar: cssref
---

Module **CSS custom functions and mixins** cho phép các nhà phát triển tạo các khối mã CSS có thể tái sử dụng, chấp nhận các đối số, chứa logic phức tạp (được định nghĩa bằng các tính năng như các hàm CSS {{cssxref("if()")}} và at-rules {{cssxref("@media")}}), và trả về các giá trị dựa trên logic đó.

CSS custom functions được định nghĩa trong at-rules {{cssxref("@function")}} và được gọi bằng cú pháp {{cssxref("&lt;dashed-function>")}} trông rất giống cú pháp [CSS custom property](/en-US/docs/Web/CSS/Reference/Properties/--*) ngoại trừ nó bao gồm dấu ngoặc đơn ở cuối chứa các đối số (ví dụ: `--my-function(30px, 3)`). CSS custom functions có thể được gọi trong bất kỳ giá trị thuộc tính nào và sẽ trả về một giá trị dựa trên các đối số được truyền vào hàm và logic bên trong nó.

CSS mixins được định nghĩa trong at-rules `@mixin` và được áp dụng bằng at-rules `@apply` được lồng bên trong các rulesets. CSS mixins định nghĩa một tập hợp các thuộc tính có thể được tái sử dụng trong nhiều rulesets và tùy chỉnh với các đối số và logic.

CSS custom functions và mixins có thể được gán các kiểu dữ liệu tùy chọn cho các đối số và giá trị trả về của chúng, để hạn chế các giá trị được truyền vào và trả về từ chúng.

> [!NOTE]
> Hiện tại, chỉ CSS custom functions mới có hỗ trợ trình duyệt. CSS mixins hiện không được hỗ trợ trong bất kỳ trình duyệt nào.

## Tài liệu tham khảo

### At-rules và descriptors

- {{cssxref("@function")}}
  - {{cssxref("@function#result", "result")}}

Module CSS custom functions and mixins cũng giới thiệu các at-rules `@mixin`, `@apply`, `@contents`, và `@env`. Hiện tại, không có trình duyệt nào hỗ trợ các tính năng này.

### Kiểu dữ liệu và giá trị

- {{cssxref("dashed-function")}}

### Hàm

- {{cssxref("type")}}

### Interfaces

- {{domxref("CSSFunctionRule")}}
- {{domxref("CSSFunctionDeclarations")}}
- {{domxref("CSSFunctionDescriptors")}}

## Hướng dẫn

- [Using CSS custom functions](/en-US/docs/Web/CSS/Guides/Custom_functions_and_mixins/Using_custom_functions)
  - : Hướng dẫn này dạy bạn cách sử dụng CSS custom functions và trình bày một số trường hợp sử dụng điển hình.

## Các khái niệm liên quan

[CSS values and units](/en-US/docs/Web/CSS/Guides/Values_and_units)

- {{cssxref("abs()")}}
- {{cssxref("acos()")}}
- {{cssxref("asin()")}}
- {{cssxref("atan()")}}
- {{cssxref("atan2()")}}
- {{cssxref("calc()")}}
- {{cssxref("clamp()")}}
- {{cssxref("cos()")}}
- {{cssxref("exp()")}}
- {{cssxref("log()")}}
- {{cssxref("max()")}}
- {{cssxref("min()")}}
- {{cssxref("mod()")}}
- {{cssxref("pow()")}}
- {{cssxref("rem()")}}
- {{cssxref("round()")}}
- {{cssxref("sign()")}}
- {{cssxref("sin()")}}
- {{cssxref("sqrt()")}}
- {{cssxref("tan()")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- {{cssxref("if()")}}
- {{cssxref("@media")}}
