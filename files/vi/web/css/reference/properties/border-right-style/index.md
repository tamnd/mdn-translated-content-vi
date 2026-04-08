---
title: border-right-style
slug: Web/CSS/Reference/Properties/border-right-style
page-type: css-property
browser-compat: css.properties.border-right-style
sidebar: cssref
---

Thuộc tính **`border-right-style`** trong [CSS](/en-US/docs/Web/CSS) đặt kiểu đường kẻ cho {{cssxref("border")}} phía phải của một phần tử.

> [!NOTE]
> Đặc tả kỹ thuật không định nghĩa cách các đường viền có kiểu khác nhau kết nối ở các góc.

{{InteractiveExample("CSS Demo: border-right-style")}}

```css interactive-example-choice
border-right-style: none;
```

```css interactive-example-choice
border-right-style: dotted;
```

```css interactive-example-choice
border-right-style: dashed;
```

```css interactive-example-choice
border-right-style: solid;
```

```css interactive-example-choice
border-right-style: groove;
```

```css interactive-example-choice
border-right-style: inset;
```

```html interactive-example
<section id="default-example">
  <div class="transition-all" id="example-element">
    This is a box with a border around it.
  </div>
</section>
```

```css interactive-example
#example-element {
  background-color: #eeeeee;
  color: black;
  border: 0.75em solid;
  padding: 0.75em;
  width: 80%;
  height: 100px;
}

body {
  background-color: white;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
border-right-style: none;
border-right-style: hidden;
border-right-style: dotted;
border-right-style: dashed;
border-right-style: solid;
border-right-style: double;
border-right-style: groove;
border-right-style: ridge;
border-right-style: inset;
border-right-style: outset;

/* Giá trị toàn cục */
border-right-style: inherit;
border-right-style: initial;
border-right-style: revert;
border-right-style: revert-layer;
border-right-style: unset;
```

Thuộc tính `border-right-style` được chỉ định bằng một giá trị từ khóa {{cssxref("line-style")}} duy nhất.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Các kiểu đường viền

#### HTML

```html
<table>
  <tbody>
    <tr>
      <td class="b1">none</td>
      <td class="b2">hidden</td>
      <td class="b3">dotted</td>
      <td class="b4">dashed</td>
    </tr>
    <tr>
      <td class="b5">solid</td>
      <td class="b6">double</td>
      <td class="b7">groove</td>
      <td class="b8">ridge</td>
    </tr>
    <tr>
      <td class="b9">inset</td>
      <td class="b10">outset</td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
/* Define look of the table */
table {
  border-width: 2px;
  background-color: #52e385;
}
tr,
td {
  padding: 3px;
}

/* border-right-style example classes */
.b1 {
  border-right-style: none;
}
.b2 {
  border-right-style: hidden;
}
.b3 {
  border-right-style: dotted;
}
.b4 {
  border-right-style: dashed;
}
.b5 {
  border-right-style: solid;
}
.b6 {
  border-right-style: double;
}
.b7 {
  border-right-style: groove;
}
.b8 {
  border-right-style: ridge;
}
.b9 {
  border-right-style: inset;
}
.b10 {
  border-right-style: outset;
}
```

#### Kết quả

{{ EmbedLiveSample('Border_styles') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan đến kiểu đường viền khác: {{Cssxref("border-bottom-style")}}, {{Cssxref("border-left-style")}}, {{Cssxref("border-top-style")}}, và {{Cssxref("border-style")}}.
- Các thuộc tính CSS liên quan đến đường viền phải khác: {{Cssxref("border-right")}}, {{Cssxref("border-right-color")}}, và {{Cssxref("border-right-width")}}.
