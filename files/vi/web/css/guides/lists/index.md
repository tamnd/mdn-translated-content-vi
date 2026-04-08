---
title: CSS lists and counters
short-title: Lists and counters
slug: Web/CSS/Guides/Lists
page-type: css-module
spec-urls: https://drafts.csswg.org/css-lists/
sidebar: cssref
---

Module **CSS lists and counters** cho phép định style và định vị các dấu đầu dòng (bullet) của list item và thao tác với giá trị của chúng bằng cách kết hợp các chuỗi, counters và các tính năng khác.

Marker của một list item, dù là ký hiệu bullet hay counter thứ tự, là đặc điểm nhận dạng của nó. List items không chỉ giới hạn ở các phần tử {{HTMLElement("li")}} được lồng trong các phần tử {{HTMLElement("ol")}} hoặc {{HTMLElement("ul")}}. Thay vào đó, list items là bất kỳ phần tử nào có `display: list-item` được đặt.

Module này định nghĩa các tính năng CSS để đặt và đặt lại counters của danh sách, chỉ định [counter-styles](/en-US/docs/Web/CSS/Guides/Counter_styles) hoặc ký hiệu nào sẽ dùng làm markers, và định vị các markers đó. Nó cũng cung cấp cho các nhà phát triển khả năng tạo các markers tùy chỉnh.

## Tham khảo

### Thuộc tính

- {{cssxref("counter-increment")}}
- {{cssxref("counter-reset")}}
- {{cssxref("counter-set")}}
- {{cssxref("list-style-image")}}
- {{cssxref("list-style-type")}}
- {{cssxref("list-style-position")}}
- {{cssxref("list-style")}} shorthand

Ngoài ra còn có thuộc tính `marker-side`, chưa được định nghĩa đầy đủ hoặc triển khai.

### Pseudo-elements

- {{cssxref("::marker")}}

### Hàm

- {{cssxref("counter")}}
- {{cssxref("counters")}}

### Kiểu dữ liệu

- [`<counter>`](/en-US/docs/Web/CSS/Reference/Properties/content#counter)
- [`<counter-name>`](/en-US/docs/Web/CSS/Reference/Values/counter#counter-name)
- [`<counter-style>`](/en-US/docs/Web/CSS/Reference/Values/counter#counter-style)

## Hướng dẫn

- [Consistent list indentation](/en-US/docs/Web/CSS/Guides/Lists/Indenting)
  - : Giải thích cách đạt được thụt lề danh sách nhất quán trên các trình duyệt khác nhau.

- [Using CSS Counters](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters)
  - : Giải thích cách sử dụng các thuộc tính counter của CSS để kiểm soát list counters.

## Khái niệm liên quan

- [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
  - At-rule {{cssxref("@counter-style")}}
  - Kiểu dữ liệu [`<counter-style-name>`](/en-US/docs/Web/CSS/Reference/At-rules/@counter-style#counter-style-name)
  - Kiểu dữ liệu [`<symbol>`](/en-US/docs/Web/CSS/Reference/At-rules/@counter-style/symbols#values)
  - Hàm {{cssxref("symbols()")}}

- Thuộc tính `start`, `reversed` và `type` của {{HTMLElement("ol")}}
- Thuộc tính `type` của {{HTMLElement("ul")}}
- Thuộc tính `type` và `value` của {{HTMLElement("li")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
- Module [CSS pseudo-elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements)
- Module [CSS generated content](/en-US/docs/Web/CSS/Guides/Generated_content)
