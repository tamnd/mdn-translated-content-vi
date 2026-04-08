---
title: "@namespace"
slug: Web/CSS/Reference/At-rules/@namespace
page-type: css-at-rule
browser-compat: css.at-rules.namespace
sidebar: cssref
---

**`@namespace`** là một [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) định nghĩa các [namespace](/en-US/docs/Glossary/Namespace) XML để sử dụng trong một [CSS](/en-US/docs/Glossary/CSS) [style sheet](/en-US/docs/Web/API/StyleSheet).

{{InteractiveExample("CSS Demo: @namespace", "tabbed-shorter")}}

```css interactive-example
@namespace svg url("http://www.w3.org/2000/svg");

a {
  color: orangered;
  text-decoration: underline dashed;
  font-weight: bold;
}

svg|a {
  fill: blueviolet;
  text-decoration: underline solid;
  text-transform: uppercase;
}
```

```html interactive-example
<p>
  <a href="#">This is an ordinary HTML link</a>
</p>

<svg width="250px" viewBox="0 0 250 20" xmlns="http://www.w3.org/2000/svg">
  <a href="#">
    <text x="0" y="15">This is a link created in SVG</text>
  </a>
</svg>
```

## Cú pháp

```css
/* Default namespace */
@namespace url("XML-namespace-URL");
@namespace "XML-namespace-URL";

/* Prefixed namespace */
@namespace prefix url("XML-namespace-URL");
@namespace prefix "XML-namespace-URL";
```

## Mô tả

Các namespace được định nghĩa có thể được dùng để giới hạn các [bộ chọn](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors) [toàn cục](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors), [kiểu](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors) và [thuộc tính](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) chỉ chọn các phần tử trong namespace đó. Quy tắc `@namespace` thường chỉ hữu ích khi xử lý các tài liệu chứa nhiều namespace — chẳng hạn như HTML với SVG hoặc MathML nội tuyến, hoặc XML kết hợp nhiều từ vựng.

Bất kỳ quy tắc `@namespace` nào cũng phải đứng sau tất cả các quy tắc {{cssxref("@charset")}} và {{cssxref("@import")}}, và đứng trước tất cả các at-rule khác và [khai báo kiểu](/en-US/docs/Web/API/CSSStyleDeclaration) trong style sheet.

`@namespace` có thể được dùng để định nghĩa **namespace mặc định** cho style sheet. Khi namespace mặc định được định nghĩa, tất cả các bộ chọn toàn cục và kiểu (nhưng không phải bộ chọn thuộc tính, xem ghi chú bên dưới) chỉ áp dụng cho các phần tử trong namespace đó.

Quy tắc `@namespace` cũng có thể được dùng để định nghĩa **tiền tố namespace**. Khi bộ chọn toàn cục, kiểu hoặc thuộc tính được gắn tiền tố namespace, thì bộ chọn đó chỉ khớp nếu namespace _và_ tên của phần tử hoặc thuộc tính trùng khớp.

Trong HTML, các [phần tử ngoại lai](https://html.spec.whatwg.org/multipage/syntax.html#foreign-elements) đã biết sẽ được tự động gán namespace. Điều này có nghĩa là các phần tử HTML sẽ hoạt động như thể chúng nằm trong namespace XHTML (`http://www.w3.org/1999/xhtml`), ngay cả khi không có thuộc tính `xmlns` nào trong tài liệu, và các phần tử [`<svg>`](/en-US/docs/Web/SVG/Reference/Element/svg) và [`<math>`](/en-US/docs/Web/MathML/Reference/Element/math) sẽ được gán các namespace thích hợp của chúng (`http://www.w3.org/2000/svg` và `http://www.w3.org/1998/Math/MathML`, tương ứng).

> [!NOTE]
> Trong XML, trừ khi tiền tố được định nghĩa trực tiếp trên thuộc tính (_ví dụ:_ `xlink:href`), thuộc tính đó không có namespace. Nói cách khác, thuộc tính không kế thừa namespace của phần tử chứa nó. Để phù hợp với hành vi này, namespace mặc định trong CSS không áp dụng cho bộ chọn thuộc tính.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Chỉ định namespace mặc định và namespace có tiền tố

```css
@namespace url("http://www.w3.org/1999/xhtml");
@namespace svg url("http://www.w3.org/2000/svg");

/* This matches all XHTML <a> elements, as XHTML is the default unprefixed namespace */
a {
}

/* This matches all SVG <a> elements */
svg|a {
}

/* This matches both XHTML and SVG <a> elements */
*|a {
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Namespaces crash course](/en-US/docs/Web/SVG/Guides/Namespaces_crash_course)
- [CSS at-rule functions](/en-US/docs/Web/CSS/Reference/At-rules/At-rule_functions)
