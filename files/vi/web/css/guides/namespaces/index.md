---
title: CSS namespaces
short-title: Namespaces
slug: Web/CSS/Guides/Namespaces
page-type: css-module
spec-urls: https://drafts.csswg.org/css-namespaces/
sidebar: cssref
---

Module **CSS namespaces** định nghĩa cú pháp để sử dụng {{glossary("namespace", "namespaces")}} trong CSS.

CSS không chỉ dùng để tạo kiểu cho HTML. Một stylesheet có thể được sử dụng để tạo kiểu cho SVG, MathML, XML hoặc HTML, mỗi loại có namespace khác nhau hoặc một tài liệu chứa nhiều namespace.

At-rule {{cssxref("@namespace")}} được định nghĩa trong module này cho phép phân biệt giữa các phần tử cùng tên trong các namespace khác nhau. Tên thẻ phần tử không phải là duy nhất cho một ngôn ngữ duy nhất. Ví dụ, phần tử `<a>` không chỉ giới hạn ở HTML. Bạn có thể muốn tạo kiểu cho các thẻ `<a>` trong SVG khác với các liên kết trong HTML. Bạn cũng có thể muốn đảm bảo rằng {{domxref("Document.querySelectorAll", "querySelectorAll(\"a\")")}} chọn đúng loại phần tử. Namespacing có thể giúp ích.

Quy tắc `@namespace` được sử dụng để khai báo một namespace mặc định và để liên kết các namespace với các namespace prefix. Module namespaces cũng định nghĩa cú pháp để sử dụng các prefix này để biểu diễn các tên được định danh theo namespace. Chỉ vậy thôi. Ý nghĩa của một tên hoặc liệu tên đó có hợp lệ hay không phụ thuộc vào ngữ cảnh và ngôn ngữ host.

## Tham chiếu

### At-rule và descriptor

- {{cssxref("@namespace")}}

## Hướng dẫn

- [Khóa học nhanh về namespaces](/en-US/docs/Web/SVG/Guides/Namespaces_crash_course)
  - : Tìm hiểu sâu về namespace là gì và cách chúng được sử dụng trong XML và các ngôn ngữ đánh dấu dựa trên XML.

## Các khái niệm liên quan

- CSS [namespace separator (`|`)](/en-US/docs/Web/CSS/Reference/Selectors/Namespace_separator) combinator
- CSS [type selectors](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors)
- CSS [universal selector](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors)
- Interface {{DOMXRef("CSSNamespaceRule")}}
  - Thuộc tính {{DOMXRef("CSSNamespaceRule.namespaceURI")}}
  - Thuộc tính {{DOMXRef("CSSNamespaceRule.prefix")}}
- Phương thức [`Document.createAttributeNS()`](/en-US/docs/Web/API/Document/createAttributeNS)
- Phương thức [`Document.createElementNS()`](/en-US/docs/Web/API/Document/createElementNS)
- Phương thức [`Document.getElementsByTagNameNS()`](/en-US/docs/Web/API/Document/getElementsByTagNameNS)
- Phương thức [`Element.getAttributeNodeNS()`](/en-US/docs/Web/API/Element/getAttributeNodeNS)
- Phương thức [`Element.getAttributeNS()`](/en-US/docs/Web/API/Element/getAttributeNS)
- Phương thức [`Element.getElementsByTagNameNS()`](/en-US/docs/Web/API/Element/getElementsByTagNameNS)
- Phương thức [`Element.hasAttributeNS()`](/en-US/docs/Web/API/Element/hasAttributeNS)
- Thuộc tính [`Element.namespaceURI`](/en-US/docs/Web/API/Element/namespaceURI)
- Phương thức [`Element.removeAttributeNS()`](/en-US/docs/Web/API/Element/removeAttributeNS)
- Phương thức [`Element.setAttributeNS()`](/en-US/docs/Web/API/Element/setAttributeNS)
- Phương thức [`Element.setAttributeNodeNS()`](/en-US/docs/Web/API/Element/setAttributeNodeNS)
- Phương thức [`NamedNodeMap.getNamedItemNS()`](/en-US/docs/Web/API/NamedNodeMap/getNamedItemNS)
- Phương thức [`NamedNodeMap.removeNamedItemNS()`](/en-US/docs/Web/API/NamedNodeMap/removeNamedItemNS)
- Phương thức [`NamedNodeMap.setNamedItemNS()`](/en-US/docs/Web/API/NamedNodeMap/setNamedItemNS)
- Thuật ngữ glossary {{glossary("Namespace")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử SVG [`<a>`](/en-US/docs/Web/SVG/Reference/Element/a#example)
- Kiểu dữ liệu {{cssxref("url_value", "&lt;url&gt;")}}
- [CSS at-rules](/en-US/docs/Web/CSS/Guides/Syntax/At-rules)
- [CSS at-rule functions](/en-US/docs/Web/CSS/Reference/At-rules/At-rule_functions)
- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors)
