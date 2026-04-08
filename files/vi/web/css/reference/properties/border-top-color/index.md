---
title: border-top-color
slug: Web/CSS/Reference/Properties/border-top-color
page-type: css-property
browser-compat: css.properties.border-top-color
sidebar: cssref
---

Thuộc tính **`border-top-color`** trong [CSS](/en-US/docs/Web/CSS) đặt màu cho [đường viền](/en-US/docs/Web/CSS/Reference/Properties/border) phía trên của một phần tử. Nó cũng có thể được đặt thông qua các thuộc tính viết tắt CSS {{cssxref("border-color")}} hoặc {{cssxref("border-top")}}.

{{InteractiveExample("CSS Demo: border-top-color")}}

```css interactive-example-choice
border-top-color: red;
```

```css interactive-example-choice
border-top-color: #32a1ce;
```

```css interactive-example-choice
border-top-color: rgb(170 50 220 / 0.6);
```

```css interactive-example-choice
border-top-color: hsl(60 90% 50% / 0.8);
```

```css interactive-example-choice
border-top-color: transparent;
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
border-top-color: red;
border-top-color: #ffbb00;
border-top-color: rgb(255 0 0);
border-top-color: hsl(100deg 50% 25% / 75%);
border-top-color: currentColor;
border-top-color: transparent;

/* Giá trị toàn cục */
border-top-color: inherit;
border-top-color: initial;
border-top-color: revert;
border-top-color: revert-layer;
border-top-color: unset;
```

Thuộc tính `border-top-color` được chỉ định với một giá trị duy nhất.

### Giá trị

- {{cssxref("&lt;color&gt;")}}
  - : Màu của đường viền trên.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Một div với đường viền

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
  border-top-color: red;
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

- Các thuộc tính viết tắt CSS liên quan đến đường viền: {{cssxref("border")}}, {{cssxref("border-top")}}, và {{cssxref("border-color")}}.
- Các thuộc tính CSS liên quan đến màu sắc cho các đường viền khác: {{cssxref("border-right-color")}}, {{cssxref("border-bottom-color")}}, và {{cssxref("border-left-color")}}.
- Các thuộc tính CSS liên quan đến đường viền khác áp dụng cho cùng cạnh: {{cssxref("border-top-style")}} và {{cssxref("border-top-width")}}.
- Giá trị màu mặc định [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword).
