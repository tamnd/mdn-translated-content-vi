---
title: CSS shadow parts
short-title: Shadow parts
slug: Web/CSS/Guides/Shadow_parts
page-type: css-module
spec-urls: https://drafts.csswg.org/css-shadow-parts/
sidebar: cssref
---

Module **CSS shadow parts** định nghĩa pseudo-element {{cssxref("::part()")}} có thể được đặt trên một [shadow host](/en-US/docs/Glossary/Shadow_tree). Sử dụng pseudo-element này, bạn có thể cho phép shadow host hiển thị phần tử được chọn trong shadow tree ra ngoài trang để tạo kiểu.

Theo mặc định, các phần tử trong shadow tree chỉ có thể được tạo kiểu trong shadow root tương ứng của chúng. Module CSS shadow parts cho phép thêm thuộc tính [`part`](/en-US/docs/Web/HTML/Reference/Global_attributes/part) vào các hậu duệ của {{HTMLElement("template")}} tạo nên custom element, từ đó phơi bày node trong shadow tree ra bên ngoài để tạo kiểu thông qua pseudo-element `::part()`.

## Tham chiếu

### Selector

- {{cssxref("::part()")}}

### Thuộc tính HTML

- [`part`](/en-US/docs/Web/HTML/Reference/Global_attributes/part)
- [`exportparts`](/en-US/docs/Web/HTML/Reference/Global_attributes/exportparts)

### Định nghĩa

- {{glossary("Shadow tree")}}

## Hướng dẫn

- [CSS pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements)
  - : Danh sách theo thứ tự chữ cái các pseudo-element được định nghĩa trong tất cả đặc tả CSS và WebVTT.

- [Web components](/en-US/docs/Web/API/Web_components)
  - : Tổng quan về các API khác nhau cho phép tạo các custom element hay web component có thể tái sử dụng.

## Khái niệm liên quan

- HTML {{HTMLElement("template")}} element
- HTML {{HTMLElement("slot")}} element
- {{domxref("Element.part")}} property
- {{domxref("Element.shadowRoot")}} property
- {{domxref("Element.attachShadow()")}} method
- {{domxref("ShadowRoot")}} interface
- [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping) module
  - {{CSSXref(":host")}}
  - {{cssxref(":host()")}}
  - {{cssxref(":host-context()")}}
  - {{CSSXref("::slotted")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [CSS pseudo elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements) module
- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors) module
- [Using shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
- [Templates: Styling outside of the current scope](https://web.dev/learn/html/template/#styling_outside_of_the_current_scope) on web.dev (2023)
