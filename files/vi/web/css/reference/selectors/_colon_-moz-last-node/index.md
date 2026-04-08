---
title: :-moz-last-node
slug: Web/CSS/Reference/Selectors/:-moz-last-node
page-type: css-pseudo-class
status:
  - experimental
  - non-standard
browser-compat: css.selectors.-moz-last-node
sidebar: cssref
---

{{Non-standard_header}}{{SeeCompatTable}}

**`:-moz-last-node`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) là một [phần mở rộng Mozilla](/vi/docs/Web/CSS/Reference/Mozilla_extensions) đại diện cho bất kỳ phần tử nào là nút con cuối cùng của một phần tử khác. Nó khác với {{cssxref(":last-child")}} ở chỗ nó không khớp với phần tử con cuối cùng có văn bản (không phải khoảng trắng) đứng sau nó.

> [!NOTE]
> Mọi khoảng trắng ở cuối một phần tử đều bị bỏ qua khi xác định `:-moz-last-node`.

## Cú pháp

```css
:-moz-last-node {
  /* ... */
}
```

## Ví dụ

### CSS

```css
span:-moz-last-node {
  background-color: lime;
}
```

### HTML

```html
<p>
  <span>This does not match.</span>
  <span>This matches!</span>
</p>

<p>
  <span>This doesn't match because it's followed by text.</span>
  Blahblah.
</p>
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":-moz-first-node")}}
- {{cssxref(":last-child")}}
