---
title: border-top-style
slug: Web/CSS/Reference/Properties/border-top-style
page-type: css-property
browser-compat: css.properties.border-top-style
sidebar: cssref
---

Thuộc tính **`border-top-style`** [CSS](/en-US/docs/Web/CSS) đặt kiểu đường kẻ cho {{CSSxRef("border")}} phía trên của phần tử.

> [!NOTE]
> Thông số kỹ thuật không định nghĩa cách các đường viền có kiểu khác nhau kết nối với nhau ở các góc.

{{InteractiveExample("CSS Demo: border-top-style")}}

```css interactive-example-choice
border-top-style: none;
```

```css interactive-example-choice
border-top-style: dotted;
```

```css interactive-example-choice
border-top-style: dashed;
```

```css interactive-example-choice
border-top-style: solid;
```

```css interactive-example-choice
border-top-style: groove;
```

```css interactive-example-choice
border-top-style: inset;
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
border-top-style: none;
border-top-style: hidden;
border-top-style: dotted;
border-top-style: dashed;
border-top-style: solid;
border-top-style: double;
border-top-style: groove;
border-top-style: ridge;
border-top-style: inset;
border-top-style: outset;

/* Giá trị toàn cục */
border-top-style: inherit;
border-top-style: initial;
border-top-style: revert;
border-top-style: revert-layer;
border-top-style: unset;
```

Thuộc tính `border-top-style` được chỉ định bằng một giá trị từ khóa {{cssxref("line-style")}} duy nhất.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Đặt border-top-style

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
/* Định nghĩa giao diện của bảng */
table {
  border-width: 2px;
  background-color: #52e385;
}
tr,
td {
  padding: 3px;
}

/* Các lớp ví dụ border-top-style */
.b1 {
  border-top-style: none;
}
.b2 {
  border-top-style: hidden;
}
.b3 {
  border-top-style: dotted;
}
.b4 {
  border-top-style: dashed;
}
.b5 {
  border-top-style: solid;
}
.b6 {
  border-top-style: double;
}
.b7 {
  border-top-style: groove;
}
.b8 {
  border-top-style: ridge;
}
.b9 {
  border-top-style: inset;
}
.b10 {
  border-top-style: outset;
}
```

#### Kết quả

{{EmbedLiveSample('Examples', 300, 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính đường viền liên quan đến kiểu: {{CSSxRef("border-left-style")}}, {{CSSxRef("border-right-style")}}, {{CSSxRef("border-bottom-style")}}, và {{CSSxRef("border-style")}}.
- Các thuộc tính liên quan đến đường viền phía trên: {{CSSxRef("border-top")}}, {{CSSxRef("border-top-color")}}, và {{CSSxRef("border-top-width")}}.
