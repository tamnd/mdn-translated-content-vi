---
title: border-right-color
slug: Web/CSS/Reference/Properties/border-right-color
page-type: css-property
browser-compat: css.properties.border-right-color
sidebar: cssref
---

Thuộc tính **`border-right-color`** trong [CSS](/en-US/docs/Web/CSS) đặt màu cho [đường viền](/en-US/docs/Web/CSS/Reference/Properties/border) phía phải của một phần tử. Nó cũng có thể được đặt bằng các thuộc tính viết tắt CSS {{cssxref("border-color")}} hoặc {{cssxref("border-right")}}.

{{InteractiveExample("CSS Demo: border-right-color")}}

```css interactive-example-choice
border-right-color: red;
```

```css interactive-example-choice
border-right-color: #32a1ce;
```

```css interactive-example-choice
border-right-color: rgb(170 50 220 / 0.6);
```

```css interactive-example-choice
border-right-color: hsl(60 90% 50% / 0.8);
```

```css interactive-example-choice
border-right-color: transparent;
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
border-right-color: red;
border-right-color: #ffbb00;
border-right-color: rgb(255 0 0);
border-right-color: hsl(100deg 50% 25% / 75%);
border-right-color: currentColor;
border-right-color: transparent;

/* Giá trị toàn cục */
border-right-color: inherit;
border-right-color: initial;
border-right-color: revert;
border-right-color: revert-layer;
border-right-color: unset;
```

Thuộc tính `border-right-color` được chỉ định bằng một giá trị duy nhất.

### Giá trị

- {{cssxref("&lt;color&gt;")}}
  - : Màu của đường viền phải.

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
  border-right-color: red;
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

- Các thuộc tính viết tắt CSS liên quan đến đường viền: {{cssxref("border")}}, {{cssxref("border-right")}}, và {{cssxref("border-color")}}.
- Các thuộc tính CSS liên quan đến màu sắc cho các đường viền khác: {{cssxref("border-left-color")}}, {{cssxref("border-bottom-color")}}, và {{cssxref("border-top-color")}}.
- Các thuộc tính CSS liên quan đến đường viền khác áp dụng cho cùng đường viền: {{cssxref("border-right-style")}} và {{cssxref("border-right-width")}}.
- Giá trị màu mặc định [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword).
