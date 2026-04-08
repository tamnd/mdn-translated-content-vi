---
title: :local-link
slug: Web/CSS/Reference/Selectors/:local-link
page-type: css-pseudo-class
status:
  - experimental
spec-urls: https://drafts.csswg.org/selectors/#local-link-pseudo
sidebar: cssref
---

{{SeeCompatTable}}

Lớp giả **`:local-link`** [CSS](/vi/docs/Web/CSS) [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) đại diện cho một liên kết đến cùng tài liệu. Do đó, một phần tử là điểm neo nguồn của một siêu liên kết mà URL tuyệt đối của đích khớp với URL tài liệu của chính phần tử đó.

```css
/* Selects any <a> that links to the current document */
a:local-link {
  color: green;
}
```

## Cú pháp

```css
:local-link {
  /* ... */
}
```

## Ví dụ

### HTML

```html
<a href="#target">This is a link on the current page.</a><br />
<a href="https://example.com">This is an external link</a><br />
```

### CSS

```css
a:local-link {
  color: green;
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

## Xem thêm

- Các lớp giả liên quan đến liên kết: {{ cssxref(":link") }}, {{ cssxref(":visited") }}, {{ cssxref(":hover") }}, {{ cssxref(":active") }}, {{ cssxref(":any-link") }}
- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors) module
