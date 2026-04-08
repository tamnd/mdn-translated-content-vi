---
title: :only-child
slug: Web/CSS/Reference/Selectors/:only-child
page-type: css-pseudo-class
browser-compat: css.selectors.only-child
sidebar: cssref
---

**`:only-child`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) đại diện cho một phần tử không có anh chị em nào. Điều này tương đương với `:first-child:last-child` hoặc `:nth-child(1):nth-last-child(1)`, nhưng với độ đặc hiệu thấp hơn.

{{InteractiveExample("CSS Demo: :only-child", "tabbed-shorter")}}

```css interactive-example
li:only-child {
  color: fuchsia;
}

b:only-child {
  text-decoration: underline;
}
```

```html interactive-example
<p>Stars expected to attend:</p>
<ol>
  <li>Robert Downey, Jr.</li>
</ol>

<p>Stars yet to confirm:</p>
<ol>
  <li>Scarlett Johansson</li>
  <li>Samuel L. Jackson</li>
  <li>Chris Pratt</li>
</ol>

<p>The ceremony is going to be held in <b>The Dolby Theatre</b>.</p>
```

## Cú pháp

```css
:only-child {
  /* ... */
}
```

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<div>
  <div>I am an only child.</div>
</div>

<div>
  <div>I am the 1st sibling.</div>
  <div>I am the 2nd sibling.</div>
  <div>
    I am the 3rd sibling,
    <div>but this is an only child.</div>
  </div>
</div>
```

#### CSS

```css
div:only-child {
  color: red;
}

div {
  display: inline-block;
  margin: 6px;
  outline: 1px solid;
}
```

#### Kết quả

{{EmbedLiveSample('Basic_example','100%',180)}}

### Ví dụ danh sách

#### HTML

```html
<ol>
  <li>
    First
    <ul>
      <li>This list has just one element.</li>
    </ul>
  </li>
  <li>
    Second
    <ul>
      <li>This list has three elements.</li>
      <li>This list has three elements.</li>
      <li>This list has three elements.</li>
    </ul>
  </li>
</ol>
```

#### CSS

```css
li li {
  list-style-type: disc;
}

li:only-child {
  color: red;
  list-style-type: square;
}
```

#### Kết quả

{{EmbedLiveSample('A_list_example', '100%', 210)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref(":only-of-type")}}
- {{Cssxref(":first-child")}}
- {{Cssxref(":last-child")}}
- {{Cssxref(":nth-child")}}
