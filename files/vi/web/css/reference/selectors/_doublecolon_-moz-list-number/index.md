---
title: ::-moz-list-number
slug: Web/CSS/Reference/Selectors/::-moz-list-number
page-type: css-pseudo-element
status:
  - experimental
  - non-standard
browser-compat: css.selectors.-moz-list-number
sidebar: cssref
---

{{Non-standard_header}}{{SeeCompatTable}}

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::-moz-list-number`** là một [phần mở rộng của Mozilla](/en-US/docs/Web/CSS/Reference/Mozilla_extensions) đại diện cho ký hiệu đánh dấu (thường là một số) của một mục danh sách ({{HTMLElement("li")}}) trong danh sách có thứ tự ({{HTMLElement("ol")}}).

## Cú pháp

```css
li::-moz-list-number {
  /* ... */
}
```

## Ví dụ

### HTML

```html
<ol>
  <li>First item</li>
  <li>Second item</li>
  <li>Third item</li>
</ol>
```

### CSS

```css
li::-moz-list-number {
  font-style: italic;
  font-weight: bold;
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("::-moz-list-bullet")}}
- {{cssxref("::marker")}}
