---
title: border-bottom-color
slug: Web/CSS/Reference/Properties/border-bottom-color
page-type: css-property
browser-compat: css.properties.border-bottom-color
sidebar: cssref
---

Thuộc tính **`border-bottom-color`** trong [CSS](/en-US/docs/Web/CSS) đặt màu cho [đường viền](/en-US/docs/Web/CSS/Reference/Properties/border) phía dưới của một phần tử. Nó cũng có thể được đặt bằng các thuộc tính viết tắt CSS {{cssxref("border-color")}} hoặc {{cssxref("border-bottom")}}.

{{InteractiveExample("CSS Demo: border-bottom-color")}}

```css interactive-example-choice
border-bottom-color: red;
```

```css interactive-example-choice
border-bottom-color: #32a1ce;
```

```css interactive-example-choice
border-bottom-color: rgb(170 50 220 / 0.6);
```

```css interactive-example-choice
border-bottom-color: hsl(60 90% 50% / 0.8);
```

```css interactive-example-choice
border-bottom-color: transparent;
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
border-bottom-color: red;
border-bottom-color: #ffbb00;
border-bottom-color: rgb(255 0 0);
border-bottom-color: hsl(100deg 50% 25% / 75%);
border-bottom-color: currentColor;
border-bottom-color: transparent;

/* Giá trị toàn cục */
border-bottom-color: inherit;
border-bottom-color: initial;
border-bottom-color: revert;
border-bottom-color: revert-layer;
border-bottom-color: unset;
```

Thuộc tính `border-bottom-color` được chỉ định bằng một giá trị duy nhất.

### Giá trị

- {{cssxref("&lt;color&gt;")}}
  - : Màu của đường viền dưới.

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
  border-bottom-color: red;
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

- Các thuộc tính viết tắt CSS liên quan đến đường viền: {{Cssxref("border")}}, {{Cssxref("border-bottom")}}, và {{Cssxref("border-color")}}.
- Các thuộc tính CSS liên quan đến màu sắc cho các đường viền khác: {{Cssxref("border-right-color")}}, {{Cssxref("border-top-color")}} và {{Cssxref("border-left-color")}}.
- Các thuộc tính CSS liên quan đến đường viền khác áp dụng cho cùng đường viền: {{cssxref("border-bottom-style")}} và {{cssxref("border-bottom-width")}}.
- Giá trị màu mặc định [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword).
