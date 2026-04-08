---
title: flex-wrap
slug: Web/CSS/Reference/Properties/flex-wrap
page-type: css-property
browser-compat: css.properties.flex-wrap
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`flex-wrap`** xác định liệu các flex item có bị buộc nằm trên một dòng hay có thể bao sang nhiều dòng. Nếu cho phép bao dòng, nó xác định hướng xếp chồng các dòng.

{{InteractiveExample("CSS Demo: flex-wrap")}}

```css interactive-example-choice
flex-wrap: nowrap;
```

```css interactive-example-choice
flex-wrap: wrap;
```

```css interactive-example-choice
flex-wrap: wrap-reverse;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    <div>Item One</div>
    <div>Item Two</div>
    <div>Item Three</div>
    <div>Item Four</div>
    <div>Item Five</div>
    <div>Item Six</div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  width: 80%;
  display: flex;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
  width: 60px;
  margin: 10px;
}
```

Thuộc tính viết tắt {{cssxref("flex-flow")}} có thể được dùng để thiết lập cả {{CSSXRef("flex-direction")}} và `flex-wrap`, xác định trục chính và trục chéo của flex container.

## Cú pháp

```css
flex-wrap: nowrap; /* Giá trị mặc định */
flex-wrap: wrap;
flex-wrap: wrap-reverse;

/* Giá trị toàn cục */
flex-wrap: inherit;
flex-wrap: initial;
flex-wrap: revert;
flex-wrap: revert-layer;
flex-wrap: unset;
```

### Giá trị

Thuộc tính `flex-wrap` được xác định bằng một từ khóa duy nhất chọn từ các giá trị dưới đây:

- `nowrap`
  - : Các flex item được sắp xếp trên một dòng duy nhất, có thể khiến flex container bị tràn. Cross-start tương đương với [inline-start hoặc block-start](/en-US/docs/Glossary/Flow_relative_values), tùy thuộc vào giá trị {{cssxref("flex-direction")}}. Đây là giá trị mặc định.
- `wrap`
  - : Các flex item tách thành nhiều dòng. Cross-start tương đương với [inline-start hoặc block-start](/en-US/docs/Glossary/Flow_relative_values), tùy thuộc vào [chế độ viết](/en-US/docs/Web/CSS/Guides/Writing_modes) hiện tại và giá trị {{cssxref("flex-direction")}}.
- `wrap-reverse`
  - : Hoạt động giống `wrap`, nhưng cross-start và cross-end bị đảo ngược.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập giá trị bao dòng cho flex container

#### HTML

```html
<h4>This is an example for flex-wrap:wrap</h4>
<div class="content">
  <div class="red">1</div>
  <div class="green">2</div>
  <div class="blue">3</div>
</div>
<h4>This is an example for flex-wrap:nowrap</h4>
<div class="content1">
  <div class="red">1</div>
  <div class="green">2</div>
  <div class="blue">3</div>
</div>
<h4>This is an example for flex-wrap:wrap-reverse</h4>
<div class="content2">
  <div class="red">1</div>
  <div class="green">2</div>
  <div class="blue">3</div>
</div>
```

#### CSS

```css
/* Common Styles */
.content,
.content1,
.content2 {
  color: white;
  font: 100 24px/100px sans-serif;
  height: 150px;
  width: 897px;
  text-align: center;
}

.content div,
.content1 div,
.content2 div {
  height: 50%;
  width: 300px;
}
.red {
  background: orangered;
}
.green {
  background: yellowgreen;
}
.blue {
  background: steelblue;
}

/* Flexbox Styles */
.content {
  display: flex;
  flex-wrap: wrap;
}
.content1 {
  display: flex;
  flex-wrap: nowrap;
}
.content2 {
  display: flex;
  flex-wrap: wrap-reverse;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting flex container wrap values', '', '700') }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSXRef("flex-direction")}}
- Thuộc tính viết tắt {{CSSXRef("flex-flow")}}
- [Khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Làm chủ việc bao dòng flex item](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Wrapping_items)
- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
