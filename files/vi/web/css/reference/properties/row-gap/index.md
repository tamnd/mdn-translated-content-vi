---
title: row-gap
slug: Web/CSS/Reference/Properties/row-gap
page-type: css-property
browser-compat: css.properties.row-gap
sidebar: cssref
---

Thuộc tính **`row-gap`** của [CSS](/vi/docs/Web/CSS) đặt kích thước khoảng trống ({{glossary("gutters","gutter")}}) giữa các hàng của một phần tử.

Các phiên bản đặc tả trước gọi thuộc tính này là `grid-row-gap`, và để duy trì tương thích với các trang web cũ, trình duyệt vẫn chấp nhận `grid-row-gap` như một bí danh của `row-gap`.

{{InteractiveExample("CSS Demo: row-gap")}}

```css interactive-example-choice
row-gap: 0;
```

```css interactive-example-choice
row-gap: 1ch;
```

```css interactive-example-choice
row-gap: 1em;
```

```css interactive-example-choice
row-gap: 20px;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">
      <div>One</div>
      <div>Two</div>
      <div>Three</div>
      <div>Four</div>
      <div>Five</div>
    </div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  display: grid;
  grid-template-columns: 1fr 1fr;
  width: 200px;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}
```

## Cú pháp

```css
/* Giá trị <length> */
row-gap: 20px;
row-gap: 1em;
row-gap: 3vmin;
row-gap: 0.5cm;

/* Giá trị <percentage> */
row-gap: 10%;

/* Giá trị toàn cục */
row-gap: inherit;
row-gap: initial;
row-gap: revert;
row-gap: revert-layer;
row-gap: unset;
```

### Giá trị

- `<length-percentage>`
  - : Là chiều rộng của khoảng trống ngăn cách các hàng. Giá trị {{CSSxRef("&lt;percentage&gt;")}} tương đối so với kích thước của phần tử.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Bố cục Flex

#### HTML

```html
<div id="flexbox">
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
</div>
```

#### CSS

```css
#flexbox {
  display: flex;
  flex-wrap: wrap;
  width: 300px;
  row-gap: 20px;
}

#flexbox > div {
  border: 1px solid green;
  background-color: lime;
  flex: 1 1 auto;
  width: 100px;
  height: 50px;
}
```

#### Kết quả

{{EmbedLiveSample('Flex_layout', "auto", "120px")}}

### Bố cục Grid

#### HTML

```html
<div id="grid">
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
</div>
```

#### CSS

```css
#grid {
  display: grid;
  height: 200px;
  grid-template-columns: 150px 1fr;
  grid-template-rows: repeat(3, 1fr);
  row-gap: 20px;
}

#grid > div {
  border: 1px solid green;
  background-color: lime;
}
```

#### Kết quả

{{EmbedLiveSample('Grid_layout', 'auto', 120)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("column-gap")}}
- {{CSSxRef("gap")}}
- [Basic concepts of grid layout: gutters](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts#gutters)
