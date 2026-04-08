---
title: :-moz-first-node
slug: Web/CSS/Reference/Selectors/:-moz-first-node
page-type: css-pseudo-class
status:
  - experimental
  - non-standard
browser-compat: css.selectors.-moz-first-node
sidebar: cssref
---

{{Non-standard_header}}{{SeeCompatTable}}

**`:-moz-first-node`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) là một [phần mở rộng Mozilla](/vi/docs/Web/CSS/Reference/Mozilla_extensions) đại diện cho bất kỳ phần tử nào là nút con đầu tiên của một phần tử khác. Nó khác với {{Cssxref(":first-child")}} ở chỗ nó không khớp với phần tử con đầu tiên có văn bản (không phải khoảng trắng) đứng trước nó.

> [!NOTE]
> Mọi khoảng trắng ở đầu một phần tử đều bị bỏ qua khi xác định `:-moz-first-node`.

## Cú pháp

```css
:-moz-first-node {
  /* ... */
}
```

## Ví dụ

### CSS

```css
span:-moz-first-node {
  background-color: lime;
}
```

### HTML

```html
<p>
  <span>This matches!</span>
  <span>This doesn't match.</span>
</p>

<p>
  Blahblah.
  <span>This doesn't match because it's preceded by text.</span>
</p>
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":-moz-last-node")}}
- {{cssxref(":first-child")}}
