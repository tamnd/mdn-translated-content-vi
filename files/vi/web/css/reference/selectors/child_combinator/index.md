---
title: Child combinator
slug: Web/CSS/Reference/Selectors/Child_combinator
page-type: css-combinator
browser-compat: css.selectors.child
sidebar: cssref
---

**Bộ kết hợp con** (`>`) được đặt giữa hai bộ chọn CSS. Nó chỉ khớp những phần tử khớp với bộ chọn thứ hai mà là phần tử con trực tiếp của các phần tử khớp với bộ chọn đầu tiên.

```css
/* List items that are children of the "my-things" list */
ul.my-things > li {
  margin: 2em;
}
```

Các phần tử khớp với bộ chọn thứ hai phải là phần tử con trực tiếp của các phần tử khớp với bộ chọn đầu tiên. Điều này nghiêm ngặt hơn so với [bộ kết hợp hậu duệ](/en-US/docs/Web/CSS/Reference/Selectors/Descendant_combinator), vốn khớp tất cả các phần tử được bộ chọn thứ hai chọn mà có một phần tử tổ tiên khớp với bộ chọn đầu tiên, bất kể số "bước nhảy" lên DOM.

## Cú pháp

```css-nolint
/* The white space around the > combinator is optional but recommended. */
selector1 > selector2 { /* style properties */ }
```

## Ví dụ

### CSS

```css
span {
  background-color: aqua;
}

div > span {
  background-color: yellow;
}
```

### HTML

```html
<div>
  <span>
    Span #1, in the div.
    <span>Span #2, in the span that's in the div.</span>
  </span>
</div>
<span>Span #3, not in the div at all.</span>
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 100)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Bộ kết hợp hậu duệ](/en-US/docs/Web/CSS/Reference/Selectors/Descendant_combinator)
