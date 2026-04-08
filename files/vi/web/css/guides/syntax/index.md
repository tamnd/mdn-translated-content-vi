---
title: CSS syntax
short-title: Syntax
slug: Web/CSS/Guides/Syntax
page-type: css-module
spec-urls: https://drafts.csswg.org/css-syntax
sidebar: cssref
---

Module **CSS syntax** mô tả, theo nghĩa chung, cấu trúc và cú pháp của cascading stylesheets, hay CSS. Nó định nghĩa CSS là ngôn ngữ dùng để mô tả việc hiển thị các tài liệu có cấu trúc (như HTML và XML), trên web và các nơi khác.

Module này không định nghĩa bất kỳ thuộc tính, [kiểu dữ liệu](/en-US/docs/Web/CSS/Reference/Values/Data_types), [hàm](/en-US/docs/Web/CSS/Reference/Values/Functions) hay [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) nào. Thay vào đó, nó làm rõ cách tất cả các tính năng này nên được định nghĩa và cách user agent nên phân tích cú pháp CSS.

## Tham chiếu

### At-rules và descriptor

- none

> [!NOTE]
> Module này nêu rõ rằng {{cssxref("@charset")}} không phải là at-rule thực sự, mà là một quy tắc kế thừa không được nhận dạng, cần được bỏ qua khi kiểm tra ngữ pháp stylesheet. Cách sử dụng `@charset` hợp lệ duy nhất là ở đầu stylesheet, nơi nó được hiểu là một chuỗi byte đặc biệt được loại bỏ trước khi xử lý nội dung.

### Khái niệm chính

- {{cssxref("at-rule")}}
- [character escaping](/en-US/docs/Web/CSS/Reference/Values/custom-ident#escaping_characters)
- [CSS comments](/en-US/docs/Web/CSS/Guides/Syntax/Comments)
- [CSS declaration](/en-US/docs/Web/API/CSS_Object_Model/CSS_Declaration)
- [CSS declaration block](/en-US/docs/Web/API/CSS_Object_Model/CSS_Declaration_Block)
- [CSS function](/en-US/docs/Web/CSS/Reference/Values/Functions)
- [Invalid](/en-US/docs/Web/CSS/Guides/Syntax/Error_handling)
- [Style rule](/en-US/docs/Web/API/CSSStyleRule)

### Thuật ngữ trong Glossary

- {{glossary("CSS descriptor")}}
- {{glossary("Parse")}}
- {{glossary("Stylesheet")}}
- {{glossary("Whitespace")}}

## Hướng dẫn

- [Introduction to CSS syntax: declarations, rulesets, and statements](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
  - : Giải thích cú pháp CSS tổng thể và cách các declaration, declaration block, ruleset và statement tạo nên các style rule.

- [Value definition syntax](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)
  - : Giải thích ngữ pháp hình thức để định nghĩa các giá trị hợp lệ cho các thuộc tính và hàm CSS, cùng với các ràng buộc ngữ nghĩa. Hướng dẫn hiểu các kiểu giá trị thành phần CSS, bộ kết hợp và bộ nhân.

- [CSS error handling](/en-US/docs/Web/CSS/Guides/Syntax/Error_handling)
  - : Tổng quan về cách trình duyệt xử lý CSS không hợp lệ.

- [Learn CSS first steps: CSS syntax](/en-US/docs/Learn_web_development/Core/Styling_basics/What_is_CSS#css_syntax_basics)
  - : Hướng dẫn giới thiệu về CSS, bao gồm giới thiệu về cú pháp CSS.

## Khái niệm liên quan

Module [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors):

- [CSS specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)

Module [CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade):

- At-rule {{cssxref("@import")}}
- Cờ {{cssxref("important")}}
- [Giá trị ban đầu (Initial values)](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value)
- [Giá trị tính toán (Computed values)](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value)
- [Giá trị sử dụng (Used values)](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value)
- [Giá trị thực tế (Actual values)](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#actual_value)
- [CSS inheritance](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance)
- {{Glossary("Property/CSS", "CSS property")}}

Module [CSS custom properties for cascading variables](/en-US/docs/Web/CSS/Guides/Cascading_variables):

- [custom property (`--*`)](/en-US/docs/Web/CSS/Reference/Properties/--)
- Hàm {{cssxref("var")}}

Module [CSS conditional rules](/en-US/docs/Web/CSS/Guides/Conditional_rules):

- At-rule {{cssxref("@media")}}
- At-rule {{cssxref("@supports")}}

API [CSS Object Model (CSSOM)](/en-US/docs/Web/API/CSS_Object_Model):

- Thuộc tính {{domxref("CSSValue.cssText", "cssText")}}
- Phương thức {{domxref("CSSStyleSheet.insertRule()", "insertRule(rule)")}}
- Phương thức {{domxref("CSSStyleSheet.replace()", "replace(text)")}}

Đặc tả [WHATWG](/en-US/docs/Glossary/WHATWG):

- Phần tử {{HTMLElement("style")}}
- Phần tử {{HTMLElement("link")}}
- Thuộc tính [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class)
- Thuộc tính [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel#stylesheet)

## Đặc tả

{{Specifications}}

## Xem thêm

- [CSS at-rule functions](/en-US/docs/Web/CSS/Reference/At-rules/At-rule_functions)
- Module [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors)
- Module [CSS values and units](/en-US/docs/Web/CSS/Guides/Values_and_units)
