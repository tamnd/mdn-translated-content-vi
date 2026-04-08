---
title: ::-moz-list-bullet
slug: Web/CSS/Reference/Selectors/::-moz-list-bullet
page-type: css-pseudo-element
status:
  - experimental
  - non-standard
browser-compat: css.selectors.-moz-list-bullet
sidebar: cssref
---

{{Non-standard_header}}{{SeeCompatTable}}

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::-moz-list-bullet`** là một [phần mở rộng của Mozilla](/en-US/docs/Web/CSS/Reference/Mozilla_extensions) đại diện cho ký hiệu đánh dấu (thường là dấu chấm tròn) của một mục danh sách ({{htmlelement("li")}}) trong danh sách không có thứ tự ({{htmlelement("ul")}}).

## Cú pháp

```css
li::-moz-list-bullet {
  /* ... */
}
```

## Ví dụ

### Tạo kiểu cho ký hiệu đánh dấu mục danh sách

#### HTML

```html
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
</ul>
```

#### CSS

```css
::-moz-list-bullet {
  color: red;
  font-size: 1.5em;
}
```

#### Kết quả

{{ EmbedLiveSample('Styling list item markers') }}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("::-moz-list-number")}}
- {{cssxref("::marker")}}
