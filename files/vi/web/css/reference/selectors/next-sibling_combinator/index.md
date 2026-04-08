---
title: Next-sibling combinator
slug: Web/CSS/Reference/Selectors/Next-sibling_combinator
page-type: css-combinator
browser-compat: css.selectors.next-sibling
sidebar: cssref
---

**Bộ kết hợp anh em liền kề** (`+`) phân tách hai bộ chọn và khớp với phần tử thứ hai chỉ khi nó _liền ngay sau_ phần tử đầu tiên, và cả hai đều là con của cùng một {{DOMxRef("element")}} cha.

```css
/* Paragraphs that come immediately after any image */
img + p {
  font-weight: bold;
}
```

## Cú pháp

```css-nolint
/* The white space around the + combinator is optional but recommended. */
former_element + target_element { style properties }
```

## Ví dụ

### Cách sử dụng cơ bản

Ví dụ này minh họa cách chọn anh em liền kề nếu anh em liền kề đó thuộc một kiểu cụ thể.

#### CSS

Chúng ta chỉ tạo kiểu cho `<li>` liền ngay sau một `<li>` là phần tử đầu tiên trong kiểu của nó:

```css
li:first-of-type + li {
  color: red;
  font-weight: bold;
}
```

#### HTML

```html
<ul>
  <li>One</li>
  <li>Two!</li>
  <li>Three</li>
</ul>
```

#### Kết quả

{{EmbedLiveSample("Basic usage", "100%", 100)}}

### Chọn anh em liền trước

Bộ kết hợp anh em liền kề có thể được bao gồm trong bộ chọn hàm {{cssxref(":has()")}} để chọn anh em liền trước.

#### CSS

Chúng ta chỉ tạo kiểu cho `<li>` có anh em liền kế là một `<li>` cuối cùng trong kiểu của nó:

```css
li:has(+ li:last-of-type) {
  color: red;
  font-weight: bold;
}
```

#### HTML

```html
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three!</li>
  <li>Four</li>
</ul>
```

#### Kết quả

{{EmbedLiveSample("Selecting a previous sibling", "100%", 100)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Subsequent-sibling combinator](/en-US/docs/Web/CSS/Reference/Selectors/Subsequent-sibling_combinator)
