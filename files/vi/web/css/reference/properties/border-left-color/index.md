---
title: border-left-color
slug: Web/CSS/Reference/Properties/border-left-color
page-type: css-property
browser-compat: css.properties.border-left-color
sidebar: cssref
---

Thuộc tính **`border-left-color`** trong [CSS](/en-US/docs/Web/CSS) đặt màu cho [đường viền](/en-US/docs/Web/CSS/Reference/Properties/border) phía trái của một phần tử. Nó cũng có thể được đặt bằng các thuộc tính viết tắt CSS {{cssxref("border-color")}} hoặc {{cssxref("border-left")}}.

{{InteractiveExample("CSS Demo: border-left-color")}}

```css interactive-example-choice
border-left-color: red;
```

```css interactive-example-choice
border-left-color: #32a1ce;
```

```css interactive-example-choice
border-left-color: rgb(170 50 220 / 0.6);
```

```css interactive-example-choice
border-left-color: hsl(60 90% 50% / 0.8);
```

```css interactive-example-choice
border-left-color: transparent;
```

```html interactive-example
<section class="default-example" id="default-example">
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
```

## Cú pháp

```css
/* Giá trị <color> */
border-left-color: red;
border-left-color: #ffbb00;
border-left-color: rgb(255 0 0);
border-left-color: hsl(100deg 50% 25% / 75%);
border-left-color: currentColor;
border-left-color: transparent;

/* Giá trị toàn cục */
border-left-color: inherit;
border-left-color: initial;
border-left-color: revert;
border-left-color: revert-layer;
border-left-color: unset;
```

Thuộc tính `border-left-color` được chỉ định bằng một giá trị duy nhất.

### Giá trị

- {{cssxref("&lt;color&gt;")}}
  - : Màu của đường viền trái.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Một div có đường viền

#### HTML

```html
<div class="my-box">
  <p>
    This is a box with a border around it. Note which side of the box is
    <span class="red-text">red</span>.
  </p>
</div>
```

#### CSS

```css
.my-box {
  border: solid 0.3em gold;
  border-left-color: red;
  width: auto;
}

.red-text {
  color: red;
}
```

#### Kết quả

{{EmbedLiveSample('A_div_with_a_border')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính viết tắt CSS liên quan đến đường viền: {{Cssxref("border")}}, {{Cssxref("border-left")}}, và {{Cssxref("border-color")}}.
- Các thuộc tính CSS liên quan đến màu sắc cho các đường viền khác: {{Cssxref("border-right-color")}}, {{Cssxref("border-bottom-color")}}, và {{Cssxref("border-top-color")}}.
- Các thuộc tính CSS liên quan đến đường viền khác áp dụng cho cùng đường viền: {{cssxref("border-left-style")}} và {{cssxref("border-left-width")}}.
- Giá trị màu mặc định [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword).
