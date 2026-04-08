---
title: CSS conditional rules
short-title: Conditional rules
slug: Web/CSS/Guides/Conditional_rules
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-conditional-5/
  - https://drafts.csswg.org/css-conditional-4/
  - https://drafts.csswg.org/css-conditional-3/
sidebar: cssref
---

Module **CSS conditional rules** định nghĩa media query và supports query CSS, cho phép bạn định nghĩa các style chỉ được áp dụng nếu các điều kiện cụ thể được thỏa mãn. Các conditional rules được định nghĩa trong module này dựa trên khả năng của thiết bị, user-agent, và viewport. Với conditional rules, bạn có thể nhắm mục tiêu các CSS style dựa trên giá trị truy vấn hay tính năng trình duyệt và thiết bị, độc lập với tài liệu đang được render.

Các conditional rules CSS đầu tiên là [media types](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_types) chỉ định media đích cho các style được liên kết, ví dụ `screen` hoặc `print`. Chúng được đặt làm giá trị của thuộc tính `media` của phần tử HTML {{HTMLElement("link")}} và {{HTMLElement("style")}} hoặc như danh sách media types được phân tách bằng dấu phẩy trong câu lệnh hoặc at-rule {{cssxref("@import")}}. Khả năng áp dụng có điều kiện các quy tắc CSS đã được mở rộng đáng kể kể từ các triển khai CSS 2.1 và HTML 4.01 giới hạn truy vấn có điều kiện cho một vài media types.

CSS conditional rules hiện bao gồm feature queries; at-rule `@supports` cho phép nhắm mục tiêu CSS style dựa trên khả năng CSS của user-agent. Các điều kiện bổ sung bao gồm selector, font-format, và font-tech nào được hỗ trợ.

Module CSS conditional rules cũng mở rộng `@media` để cho phép lồng ghép at-rules, với module [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries) liên quan loại bỏ các media type không được sử dụng và thêm nhiều media features và điều kiện có thể nhắm mục tiêu.

[Module CSS container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries) định nghĩa các conditional rules tương tự, nhưng dựa trên parent của phần tử thay vì viewport.

Có kế hoạch mở rộng thêm các truy vấn có thể bằng cách thêm conditional rule tổng quát `@when` và conditional rule chuỗi `@else`. Hai at-rule này chưa được hỗ trợ.

## Tham chiếu

### Thuộc tính

- {{cssxref("container")}}
- {{cssxref("container-name")}}
- {{cssxref("container-type")}}

### At-rules và descriptors

- {{cssxref("@container")}}
  - [`aspect-ratio`](/en-US/docs/Web/CSS/Reference/At-rules/@container#aspect-ratio)
  - [`block-size`](/en-US/docs/Web/CSS/Reference/At-rules/@container#block-size)
  - [`fallback`](/en-US/docs/Web/CSS/Reference/At-rules/@container#fallback)
  - [`height`](/en-US/docs/Web/CSS/Reference/At-rules/@container#height)
  - [`inline-size`](/en-US/docs/Web/CSS/Reference/At-rules/@container#inline-size)
  - [`orientation`](/en-US/docs/Web/CSS/Reference/At-rules/@container#orientation)
  - [`scrollable`](/en-US/docs/Web/CSS/Reference/At-rules/@container#scrollable)
  - [`snapped`](/en-US/docs/Web/CSS/Reference/At-rules/@container#snapped)
  - [`stuck`](/en-US/docs/Web/CSS/Reference/At-rules/@container#stuck)
  - [`width`](/en-US/docs/Web/CSS/Reference/At-rules/@container#width)
- {{cssxref("@media")}}
- {{cssxref("@supports")}}

Module CSS conditional rules cũng giới thiệu at-rule `@else` và `@when`. Hiện tại, không có trình duyệt nào hỗ trợ các tính năng này.

### Hàm

- [`anchored()`](/en-US/docs/Web/CSS/Reference/At-rules/@container#anchored_container_descriptors)
- [`style()`](/en-US/docs/Web/CSS/Reference/At-rules/@container#container_style_queries)
- [`font-tech()`](/en-US/docs/Web/CSS/Reference/At-rules/@supports#font-tech)
- [`font-format()`](/en-US/docs/Web/CSS/Reference/At-rules/@supports#font-format)
- [`scroll-state()`](/en-US/docs/Web/CSS/Reference/At-rules/@container#scroll-state_container_descriptors)
- [`selector()`](/en-US/docs/Web/CSS/Reference/At-rules/@supports#function_syntax)
- [`supports()`](/en-US/docs/Web/CSS/Reference/At-rules/@import#supports-condition)

Module CSS conditional rules cũng giới thiệu hàm CSS `media()`. Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

### Kiểu dữ liệu

- [`<container-name>`](/en-US/docs/Web/CSS/Reference/At-rules/@container#container-name)
- [`<style-feature>`](/en-US/docs/Web/CSS/Reference/At-rules/@container#container_style_queries)
- [Đơn vị `<length>` tương đối container](/en-US/docs/Web/CSS/Reference/Values/length#container_query_length_units)
- [`<media-query>`](/en-US/docs/Web/CSS/Guides/Media_queries/Using#syntax)
- [`<supports-condition>`](/en-US/docs/Web/CSS/Reference/At-rules/@import#importing_css_rules_conditional_on_feature_support)
- `<supports-feature>` (xem [`supports()`](/en-US/docs/Web/CSS/Reference/At-rules/@import#supports-condition))

### Interfaces

- {{domxref("CSSConditionRule")}}
- {{domxref("CSSMediaRule")}}
- {{domxref("CSSSupportsRule")}}
- Phương thức {{domxref("CSS.supports_static", "supports()")}}

### Thuật ngữ và định nghĩa glossary

- {{glossary("media/CSS", "Media")}}
- Supports query (Xem [feature query](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries))

## Hướng dẫn

- [Using CSS feature queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries)
  - : Áp dụng có chọn lọc các CSS rule sau khi kiểm tra hỗ trợ trình duyệt cho các thuộc tính và giá trị được chỉ định thông qua feature queries.

- [Using CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
  - : Giới thiệu media queries, cú pháp của chúng, và các toán tử và media features được dùng để xây dựng biểu thức media query.

- [Supporting older browsers: feature queries](/en-US/docs/Learn_web_development/Core/CSS_layout/Supporting_Older_Browsers#feature_queries)
  - : Cách sử dụng feature queries để nhắm mục tiêu CSS dựa trên mức độ hỗ trợ của trình duyệt cho các tính năng web.

- [Browser feature detection: CSS `@supports`](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection#supports)
  - : Tìm hiểu về JavaScript và CSS feature detection, bao gồm CSS `@supports`.

- [Using container scroll-state queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries)
  - : Sử dụng container scroll-state queries, với ví dụ của từng loại.

## Khái niệm liên quan

- Module [CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)
  - At-rule {{cssxref("@import")}}

- Module [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
  - [`<media-feature>`](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_features)
  - [`<media-type>`](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_types)
  - [`<media-condition>`](/en-US/docs/Web/CSS/Reference/At-rules/@media#logical_operators)
  - [`<media-query-list>`](/en-US/docs/Web/SVG/Reference/Attribute/media)
  - [CSS logical operators](/en-US/docs/Web/CSS/Reference/At-rules/@media#logical_operators) (`not`, `or`, và `and`)

- Module [CSSOM view](/en-US/docs/Web/CSS/Guides/CSSOM_view)
  - API {{domxref("CSS")}}
  - API {{domxref("CSSGroupingRule")}}
  - API {{domxref("MediaQueryList")}}
  - API {{domxref("CSSRule")}}
  - Interface {{domxref("MediaList")}}
    - Thuộc tính {{domxref("MediaList.mediaText")}}

- Module [CSS syntax](/en-US/docs/Web/CSS/Guides/Syntax)
  - Khai báo {{cssxref("@charset")}}
  - Thuật ngữ {{cssxref("at-rule")}}
  - Thuật ngữ [`invalid`](/en-US/docs/Web/CSS/Guides/Syntax/Error_handling)
  - Thuật ngữ {{glossary("parse")}}
  - Thuật ngữ [style rule](/en-US/docs/Web/API/CSSStyleRule)

- Module [CSS namespaces](/en-US/docs/Web/CSS/Guides/Namespaces)
  - At-rule {{cssxref("@namespace")}}

- Module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
  - [Using anchored container queries](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Anchored_container_queries)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Module [CSS container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- Module [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
- Module [CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)
