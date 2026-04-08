---
title: CSS scoping
short-title: Scoping
slug: Web/CSS/Guides/Scoping
page-type: css-module
spec-urls: https://drafts.csswg.org/css-scoping/
sidebar: cssref
---

Module **CSS scoping** định nghĩa các cơ chế scoping và đóng gói CSS, tập trung vào cơ chế [scoping](https://css.oddbird.net/scope/) của [Shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM).

Các style CSS có phạm vi toàn cục hoặc được scoped vào một {{Glossary("shadow tree")}}. Các style toàn cục áp dụng cho tất cả các phần tử trong cây node khớp với selector, bao gồm các custom element trong cây đó, nhưng không áp dụng cho các shadow tree tạo nên mỗi custom element. Các selector và định nghĩa style liên quan của chúng không rò rỉ giữa các scope.

Trong CSS của một shadow tree, các selector không chọn các phần tử bên ngoài cây, dù trong phạm vi toàn cục hay trong các shadow tree khác. Mỗi custom element có shadow tree riêng của nó, chứa tất cả các thành phần tạo nên custom element đó (nhưng không bao gồm chính custom element, hay "host").

Đôi khi sẽ hữu ích khi có thể tạo style cho một host từ bên trong ngữ cảnh shadow tree. Module CSS scoping làm điều này có thể bằng cách định nghĩa các selector:

- Cho phép một shadow tree tạo style cho host của nó.
- Cho phép CSS bên ngoài tạo style cho các phần tử trong một Shadow DOM (nhưng chỉ khi custom element liên quan được thiết lập để chấp nhận style bên ngoài).

## Tham khảo

### Selectors

- {{CSSXref(":host")}}
- {{CSSXref(":host()")}}
- {{cssxref(":host-context()")}}
- {{CSSXref("::slotted")}}

## Hướng dẫn

- [Web components](/en-US/docs/Web/API/Web_components)
  - : Giới thiệu về các công nghệ khác nhau được dùng để tạo các web component có thể tái sử dụng — các custom element có chức năng được đóng gói riêng biệt với phần còn lại của code.

- [Using shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
  - : Các kiến thức cơ bản về Shadow DOM, bao gồm việc gắn Shadow DOM vào một phần tử, thêm vào cây Shadow DOM và tạo style.

- [Using templates and slots](/en-US/docs/Web/API/Web_components/Using_templates_and_slots)
  - : Định nghĩa cấu trúc HTML có thể tái sử dụng bằng các phần tử {{htmlelement("template")}} và {{htmlelement("slot")}}, và sử dụng cấu trúc đó bên trong các web component.

- [Using custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements)
  - : Giới thiệu về Custom Elements API, JavaScript API được dùng để tạo các custom element đóng gói chức năng.

## Khái niệm liên quan

- Pseudo-class CSS {{CSSXref(":defined")}}
- Pseudo-element CSS {{CSSXref("::part")}}

- Phần tử HTML {{HTMLElement("template")}}
- Phần tử HTML {{HTMLElement("slot")}}
- Thuộc tính HTML [`slot`](/en-US/docs/Web/HTML/Reference/Global_attributes/slot)

- Thuật ngữ glossary {{Glossary("Shadow tree")}}
- Thuật ngữ glossary {{Glossary("DOM")}}
- Thuật ngữ [Compound selector](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#compound_selector)
- Thuật ngữ [Selector list](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list)

- Interfaces, thuộc tính và phương thức của [Web components](/en-US/docs/Web/API/Web_components)
  - Interface {{DOMxRef("CustomElementRegistry")}}
  - API {{DOMxRef("Element")}}
    - Thuộc tính {{DOMxRef("Element.slot")}}
    - Thuộc tính {{DOMxRef("Element.assignedSlot")}}
    - Phương thức {{DOMxRef("Element.attachShadow()")}}
  - Interface {{DOMxRef("HTMLSlotElement")}}
  - Interface {{DOMxRef("HTMLTemplateElement")}}
  - Interface {{DOMxRef("ShadowRoot")}}

> [!NOTE]
> Mặc dù có tên như vậy, pseudo-class {{CSSXref(":scope")}}, đại diện cho các phần tử là điểm tham chiếu (hay scope) để các selector khớp với, được định nghĩa trong module [Selectors](/en-US/docs/Web/CSS/Guides/Selectors). Nó không liên quan đến module CSS scoping, vốn tập trung vào scoping liên quan đến cơ chế scoping Shadow DOM.

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors) module
- [CSS pseudo elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements) module
- [CSS namespaces](/en-US/docs/Web/CSS/Guides/Namespaces) module
- [CSS shadow-parts](/en-US/docs/Web/CSS/Guides/Shadow_parts) module
- [Template, slot, and shadow](https://web.dev/learn/html/template/) on web.dev (2023)
- [Custom element best practices](https://web.dev/articles/custom-elements-best-practices) on web.dev (2019)
