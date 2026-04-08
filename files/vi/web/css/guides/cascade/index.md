---
title: CSS cascading and inheritance
short-title: Cascading and inheritance
slug: Web/CSS/Guides/Cascade
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-cascade/
  - https://drafts.csswg.org/css-cascade-5/
  - https://drafts.csswg.org/css-cascade-6/
sidebar: cssref
---

Module **CSS cascading and inheritance** định nghĩa các quy tắc gán giá trị cho các thuộc tính thông qua cascading và inheritance. Module này chỉ định các quy tắc để tìm giá trị đã chỉ định cho tất cả các thuộc tính trên tất cả các phần tử.

Một trong những nguyên tắc thiết kế cơ bản của CSS là cascading của các quy tắc. Nó cho phép nhiều style sheet ảnh hưởng đến cách trình bày của một tài liệu. Các khai báo property-value trong CSS định nghĩa cách một tài liệu được render. Nhiều khai báo có thể đặt các giá trị khác nhau cho cùng một sự kết hợp giữa phần tử và thuộc tính, nhưng chỉ một giá trị có thể được áp dụng cho bất kỳ thuộc tính CSS nào. Module CSS cascade định nghĩa cách giải quyết các xung đột này.

Điều ngược lại cũng xảy ra. Đôi khi không có khai báo nào định nghĩa giá trị của một thuộc tính. Module CSS cascade định nghĩa cách thiết lập các giá trị còn thiếu này thông qua inheritance hoặc từ giá trị ban đầu của thuộc tính.

> [!NOTE]
> Các quy tắc để tìm giá trị đã chỉ định trong ngữ cảnh trang và các margin box của nó được mô tả trong [module CSS page](/en-US/docs/Web/CSS/Guides/Paged_media).

## Tham chiếu

### Thuộc tính

- {{cssxref("all")}}

### At-rules và descriptor

- {{cssxref("@import")}}
- {{cssxref("@layer")}}

### Từ khóa

- {{cssxref("initial")}}
- {{cssxref("inherit")}}
- {{cssxref("revert")}}
- {{cssxref("revert-layer")}}
- {{cssxref("unset")}}
- Cờ {{cssxref("important", "!important")}}

### Interface

- {{DOMXRef("CSSLayerBlockRule")}}
- {{DOMXRef("CSSGroupingRule")}}
- {{DOMXRef("CSSLayerStatementRule")}}
- {{DOMXRef("CSSRule")}}

### Thuật ngữ và định nghĩa bảng chú giải

- [Actual value](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#actual_value)
- [Anonymous layer](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers#the_layer_block_at-rule_for_named_and_anonymous_layers)
- [Author origin](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#author_stylesheets)
- [Cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction)
- [Computed value](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value)
- [Initial value](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value)
- [Named layer](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers#the_layer_statement_at-rule_for_named_layers)
- [Resolved value](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#resolved_value)
- [Shorthand properties](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties)
- [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
- [Specified value](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#specified_value)
- {{glossary("style origin")}}
- [Used value](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value)
- [User origin](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#user_stylesheets)
- [User-agent origin](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#user-agent_stylesheets)

## Hướng dẫn

- [Giới thiệu về CSS Cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction)
  - : Hướng dẫn về thuật toán cascade định nghĩa cách user agent kết hợp các giá trị thuộc tính có nguồn gốc từ các nguồn khác nhau.

- [CSS inheritance](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance)
  - : Hướng dẫn về CSS inheritance.

- [Học: Xử lý xung đột](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts)
  - : Các khái niệm cơ bản nhất của CSS — cascade, specificity và inheritance — kiểm soát cách CSS được áp dụng cho HTML và cách giải quyết xung đột.

- [Học: Cascade layers](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers)
  - : Giới thiệu về [cascade layers](/en-US/docs/Web/CSS/Reference/At-rules/@layer), một tính năng nâng cao hơn được xây dựng trên các khái niệm cơ bản của [CSS cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction) và [CSS specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity).

## Khái niệm liên quan

- [Element-attached styles](/en-US/docs/Web/HTML/Reference/Global_attributes/style)
- [Inline styles và cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#inline_styles)
- [Conditional rules cho @imports](/en-US/docs/Web/CSS/Reference/At-rules/@import#importing_css_rules_conditional_on_media_queries)
- [Value definition syntax](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)

## Đặc tả

{{Specifications}}

## Xem thêm

- [Module CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors)
- [Module CSS pseudo-elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements)
- [Module CSS paged media](/en-US/docs/Web/CSS/Guides/Paged_media)
- [Module CSS conditional rules](/en-US/docs/Web/CSS/Guides/Conditional_rules)
- [Module CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting)
- [Shorthand properties](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties)
