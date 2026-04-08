---
title: border-bottom-style
slug: Web/CSS/Reference/Properties/border-bottom-style
page-type: css-property
browser-compat: css.properties.border-bottom-style
sidebar: cssref
---

Thuộc tính **`border-bottom-style`** trong [CSS](/en-US/docs/Web/CSS) đặt kiểu đường kẻ cho {{cssxref("border")}} phía dưới của một phần tử.

> [!NOTE]
> Đặc tả kỹ thuật không định nghĩa cách các đường viền có kiểu khác nhau kết nối ở các góc.

{{InteractiveExample("CSS Demo: border-bottom-style")}}

```css interactive-example-choice
border-bottom-style: none;
```

```css interactive-example-choice
border-bottom-style: dotted;
```

```css interactive-example-choice
border-bottom-style: dashed;
```

```css interactive-example-choice
border-bottom-style: solid;
```

```css interactive-example-choice
border-bottom-style: groove;
```

```css interactive-example-choice
border-bottom-style: inset;
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
border-bottom-style: none;
border-bottom-style: hidden;
border-bottom-style: dotted;
border-bottom-style: dashed;
border-bottom-style: solid;
border-bottom-style: double;
border-bottom-style: groove;
border-bottom-style: ridge;
border-bottom-style: inset;
border-bottom-style: outset;

/* Giá trị toàn cục */
border-bottom-style: inherit;
border-bottom-style: initial;
border-bottom-style: revert;
border-bottom-style: revert-layer;
border-bottom-style: unset;
```

Thuộc tính `border-bottom-style` được chỉ định bằng một giá trị từ khóa {{cssxref("line-style")}} duy nhất.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Minh họa tất cả các kiểu đường viền

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
  border-width: 3px;
  background-color: #52e385;
}
tr,
td {
  padding: 3px;
}

/* border-bottom-style example classes */
.b1 {
  border-bottom-style: none;
}
.b2 {
  border-bottom-style: hidden;
}
.b3 {
  border-bottom-style: dotted;
}
.b4 {
  border-bottom-style: dashed;
}
.b5 {
  border-bottom-style: solid;
}
.b6 {
  border-bottom-style: double;
}
.b7 {
  border-bottom-style: groove;
}
.b8 {
  border-bottom-style: ridge;
}
.b9 {
  border-bottom-style: inset;
}
.b10 {
  border-bottom-style: outset;
}
```

#### Kết quả

{{ EmbedLiveSample('Demonstrating_all_border_styles', 300, 200) }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan đến kiểu đường viền khác: {{ Cssxref("border-left-style") }}, {{ Cssxref("border-right-style") }}, {{ Cssxref("border-top-style") }} và {{ Cssxref("border-style") }}.
- Các thuộc tính CSS liên quan đến đường viền dưới khác: {{ Cssxref("border-bottom") }}, {{ Cssxref("border-bottom-color") }} và {{ Cssxref("border-bottom-width") }}.
