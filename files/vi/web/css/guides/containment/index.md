---
title: CSS containment
short-title: Containment
slug: Web/CSS/Guides/Containment
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-contain-2/
  - https://drafts.csswg.org/css-contain-3/
sidebar: cssref
---

Module **CSS containment** định nghĩa containment và container queries.

Containment cho phép cô lập các subtree của trang khỏi phần còn lại của DOM. Trình duyệt sau đó có thể cải thiện hiệu suất bằng cách tối ưu hóa việc render các phần độc lập này.

Container queries tương tự như dimension [media queries](/en-US/docs/Web/CSS/Guides/Media_queries), ngoại trừ các truy vấn dựa trên kích thước của một container element cụ thể được định nghĩa là _containment context_, thay vì trên kích thước của viewport. Container queries cho phép truy vấn kích thước, thuộc tính, và giá trị thuộc tính của container để áp dụng có điều kiện các CSS style. Khi áp dụng các style có điều kiện này, bạn có thể sử dụng các đơn vị độ dài container query, chỉ định độ dài tương đối với kích thước của query container. Các thuộc tính bổ sung được định nghĩa để cho phép thiết lập một phần tử cụ thể làm query container và đặt tên cụ thể cho nó.

## Tham chiếu

### Thuộc tính

- {{cssxref("contain")}}
- {{cssxref("content-visibility")}}

### Sự kiện

- {{domxref("Element.contentvisibilityautostatechange_event", "contentvisibilityautostatechange")}}

### Interfaces

- {{domxref("ContentVisibilityAutoStateChangeEvent")}}
  - Thuộc tính {{domxref("ContentVisibilityAutoStateChangeEvent.skipped", "skipped")}}
- {{domxref("CSSContainerRule")}}
  - {{domxref("CSSContainerRule.containerName")}}
  - {{domxref("CSSContainerRule.containerQuery")}}

## Hướng dẫn

- [CSS container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
  - : Hướng dẫn sử dụng container queries với `@container`, bao gồm đặt tên cho containment contexts.

- [Using CSS containment](/en-US/docs/Web/CSS/Guides/Containment/Using)
  - : Mô tả các mục tiêu cơ bản của CSS containment và cách tận dụng `contain` và `content-visibility` để có trải nghiệm người dùng tốt hơn.

- [Using container size and style queries](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries)
  - : Hướng dẫn viết container size và style queries với `@container`, bao gồm style queries cho custom properties, cú pháp và tên truy vấn, và lồng ghép container queries.

## Khái niệm liên quan

- [Layout and the containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block)
- [Block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context)

- Module [CSS conditional rules](/en-US/docs/Web/CSS/Guides/Conditional_rules)
  - At-rule {{cssxref("@container")}}
  - Thuộc tính {{CSSxRef("container")}}
  - Thuộc tính {{CSSxRef("container-name")}}
  - Thuộc tính {{CSSxRef("container-type")}}

- Module [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
  - At-rule {{cssxref("@media")}}
  - [CSS logical operators](/en-US/docs/Web/CSS/Reference/At-rules/@media#logical_operators) (`not`, `or`, và `and`)

- Module [CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions)
  - At-rule {{cssxref("@starting-style")}}
  - Thuộc tính {{cssxref("transition-behavior")}}

- Module [CSS box sizing](/en-US/docs/Web/CSS/Guides/Box_sizing)
  - Thuộc tính {{CSSxRef("aspect-ratio")}}
  - Thuộc tính shorthand {{cssxref("contain-intrinsic-size")}}
  - Thuộc tính {{CSSxRef("contain-intrinsic-inline-size")}}
  - Thuộc tính {{CSSxRef("contain-intrinsic-block-size")}}
  - Thuộc tính {{CSSxRef("contain-intrinsic-width")}}
  - Thuộc tính {{CSSxRef("contain-intrinsic-height")}}

- Module [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
  - Hướng dẫn [Using CSS counters](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters)

- Module [CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting)
  - Hướng dẫn [CSS nesting at-rules](/en-US/docs/Web/CSS/Guides/Nesting/At-rules)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Using feature queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries)
- [Using CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [Understanding aspect ratios](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
- At-rule {{cssxref("@supports")}}
