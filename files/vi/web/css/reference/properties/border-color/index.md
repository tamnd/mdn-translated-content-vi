---
title: border-color
slug: Web/CSS/Reference/Properties/border-color
page-type: css-shorthand-property
browser-compat: css.properties.border-color
sidebar: cssref
---

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`border-color`** trong [CSS](/en-US/docs/Web/CSS) đặt màu cho đường viền của một phần tử.

{{InteractiveExample("CSS Demo: border-color")}}

```css interactive-example-choice
border-color: red;
```

```css interactive-example-choice
border-color: red #32a1ce;
```

```css interactive-example-choice
border-color: red rgb(170 50 220 / 0.6) green;
```

```css interactive-example-choice
border-color: red yellow green hsl(60 90% 50% / 0.8);
```

```css interactive-example-choice
border-color: red yellow green transparent;
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

## Thuộc tính thành phần

Thuộc tính này là dạng viết tắt của các thuộc tính CSS sau:

- {{cssxref("border-bottom-color")}}
- {{cssxref("border-left-color")}}
- {{cssxref("border-right-color")}}
- {{cssxref("border-top-color")}}

## Cú pháp

```css
/* Giá trị <color> */
border-color: red;

/* trên và dưới | trái và phải */
border-color: red #f015ca;

/* trên | trái và phải | dưới */
border-color: red rgb(240 30 50 / 70%) green;

/* trên | phải | dưới | trái */
border-color: red yellow green blue;

/* Giá trị toàn cục */
border-color: inherit;
border-color: initial;
border-color: revert;
border-color: revert-layer;
border-color: unset;
```

Thuộc tính `border-color` có thể được chỉ định với một, hai, ba hoặc bốn giá trị.

- Khi chỉ định **một** giá trị, màu đó áp dụng cho **cả bốn cạnh**.
- Khi chỉ định **hai** giá trị, màu đầu tiên áp dụng cho **trên và dưới**, màu thứ hai cho **trái và phải**.
- Khi chỉ định **ba** giá trị, màu đầu tiên áp dụng cho **trên**, màu thứ hai cho **trái và phải**, màu thứ ba cho **dưới**.
- Khi chỉ định **bốn** giá trị, các màu áp dụng cho **trên**, **phải**, **dưới** và **trái** theo thứ tự đó (theo chiều kim đồng hồ).

### Giá trị

- {{CSSxRef("&lt;color&gt;")}}
  - : Xác định màu của đường viền.

## Mô tả

Mỗi cạnh có thể được đặt riêng lẻ bằng {{CSSxRef("border-top-color")}}, {{CSSxRef("border-right-color")}}, {{CSSxRef("border-bottom-color")}} và {{CSSxRef("border-left-color")}}; hoặc sử dụng các thuộc tính nhận biết chế độ viết: {{CSSxRef("border-block-start-color")}}, {{CSSxRef("border-block-end-color")}}, {{CSSxRef("border-inline-start-color")}} và {{CSSxRef("border-inline-end-color")}}.

Bạn có thể tìm hiểu thêm về màu sắc đường viền trong [Áp dụng màu sắc cho các phần tử HTML](/en-US/docs/Web/CSS/Guides/Colors/Applying_color#borders).

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng border-color đầy đủ

#### HTML

```html
<div id="justone">
  <p><code>border-color: red;</code> is equivalent to</p>
  <ul>
    <li><code>border-top-color: red;</code></li>
    <li><code>border-right-color: red;</code></li>
    <li><code>border-bottom-color: red;</code></li>
    <li><code>border-left-color: red;</code></li>
  </ul>
</div>
<div id="horzvert">
  <p><code>border-color: gold red;</code> is equivalent to</p>
  <ul>
    <li><code>border-top-color: gold;</code></li>
    <li><code>border-right-color: red;</code></li>
    <li><code>border-bottom-color: gold;</code></li>
    <li><code>border-left-color: red;</code></li>
  </ul>
</div>
<div id="topvertbott">
  <p><code>border-color: red cyan gold;</code> is equivalent to</p>
  <ul>
    <li><code>border-top-color: red;</code></li>
    <li><code>border-right-color: cyan;</code></li>
    <li><code>border-bottom-color: gold;</code></li>
    <li><code>border-left-color: cyan;</code></li>
  </ul>
</div>
<div id="trbl">
  <p><code>border-color: red cyan black gold;</code> is equivalent to</p>
  <ul>
    <li><code>border-top-color: red;</code></li>
    <li><code>border-right-color: cyan;</code></li>
    <li><code>border-bottom-color: black;</code></li>
    <li><code>border-left-color: gold;</code></li>
  </ul>
</div>
```

#### CSS

```css
#justone {
  border-color: red;
}

#horzvert {
  border-color: gold red;
}

#topvertbott {
  border-color: red cyan gold;
}

#trbl {
  border-color: red cyan black gold;
}

/* Set width and style for all divs */
div {
  border: solid 0.3em;
  width: auto;
  margin: 0.5em;
  padding: 0.5em;
}

ul {
  margin: 0;
  list-style: none;
}
```

#### Kết quả

{{EmbedLiveSample("Complete_border-color_usage", 600, 700)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan đến màu đường viền: {{CSSxRef("border")}}, {{CSSxRef("border-top-color")}}, {{CSSxRef("border-right-color")}}, {{CSSxRef("border-bottom-color")}}, {{CSSxRef("border-left-color")}},
- Các thuộc tính CSS liên quan đến đường viền khác: {{CSSxRef("border-width")}}, {{CSSxRef("border-style")}}
- Kiểu dữ liệu {{CSSxRef("&lt;color&gt;")}}
- Các thuộc tính liên quan đến màu sắc khác: {{CSSxRef("color")}}, {{CSSxRef("background-color")}}, {{CSSxRef("outline-color")}}, {{CSSxRef("text-decoration-color")}}, {{CSSxRef("text-emphasis-color")}}, {{CSSxRef("text-shadow")}}, {{CSSxRef("caret-color")}} và {{CSSxRef("column-rule-color")}}
- [Áp dụng màu sắc cho các phần tử HTML bằng CSS](/en-US/docs/Web/CSS/Guides/Colors/Applying_color)
