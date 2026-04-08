---
title: margin-inline
slug: Web/CSS/Reference/Properties/margin-inline
page-type: css-shorthand-property
browser-compat: css.properties.margin-inline
sidebar: cssref
---

Thuộc tính **`margin-inline`** [CSS](/en-US/docs/Web/CSS) là [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) xác định cả lề logic bắt đầu và kết thúc theo chiều ngang của phần tử, ánh xạ tới các lề vật lý tùy theo chế độ viết, hướng và hướng văn bản của phần tử.

{{InteractiveExample("CSS Demo: margin-inline")}}

```css interactive-example-choice
margin-inline: 5% 10%;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
margin-inline: 10px 40px;
writing-mode: vertical-rl;
```

```css interactive-example-choice
margin-inline: 5% 10%;
writing-mode: horizontal-tb;
direction: rtl;
```

```html interactive-example
<section id="default-example">
  <div id="container">
    <div class="col">One</div>
    <div class="col transition-all" id="example-element">Two</div>
    <div class="col">Three</div>
  </div>
</section>
```

```css interactive-example
#container {
  width: 300px;
  height: 200px;
  display: flex;
  align-content: flex-start;
  justify-content: flex-start;
}

.col {
  width: 33.33%;
  border: solid #ce7777 10px;
  background-color: #2b3a55;
  color: white;
  flex-shrink: 0;
}

#example-element {
  border: solid 10px #ffbf00;
  background-color: #2b3a55;
  unicode-bidi: bidi-override;
}
```

## Các thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("margin-inline-start")}}
- {{cssxref("margin-inline-end")}}

## Cú pháp

```css
/* Giá trị <length> */
margin-inline: 10px 20px; /* Độ dài tuyệt đối */
margin-inline: 1em 2em; /* Tương đối với kích thước văn bản */
margin-inline: 5% 2%; /* Tương đối với chiều rộng của khối chứa gần nhất */
margin-inline: 10px; /* Đặt cả giá trị bắt đầu và kết thúc */
margin-inline: anchor-size(width);
margin-inline: calc(anchor-size(self-block) / 5) auto;

/* Giá trị từ khóa */
margin-inline: auto;

/* Giá trị toàn cục */
margin-inline: inherit;
margin-inline: initial;
margin-inline: revert;
margin-inline: revert-layer;
margin-inline: unset;
```

Thuộc tính này tương ứng với {{CSSxRef("margin-top")}} và {{CSSxRef("margin-bottom")}}, hoặc {{CSSxRef("margin-right")}} và {{CSSxRef("margin-left")}}, tùy thuộc vào các giá trị được định nghĩa cho {{CSSxRef("writing-mode")}}, {{CSSxRef("direction")}}, và {{CSSxRef("text-orientation")}}.

Thuộc tính `margin-inline` có thể được chỉ định bằng một hoặc hai giá trị.

- Khi chỉ định **một** giá trị, nó áp dụng cùng một lề cho **cả bắt đầu và kết thúc**.
- Khi chỉ định **hai** giá trị, lề đầu tiên áp dụng cho **bắt đầu**, giá trị thứ hai cho **kết thúc**.

### Giá trị

Thuộc tính `margin-inline` nhận các giá trị giống như thuộc tính {{CSSxRef("margin-top", "", "#values")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt lề bắt đầu và kết thúc theo chiều ngang

#### CSS

```css
div {
  background-color: yellow;
  width: 120px;
  height: auto;
  border: 1px solid green;
}

p {
  margin: 0;
  margin-inline: 20px 40px;
  background-color: tan;
}

.verticalExample {
  writing-mode: vertical-rl;
}
```

#### HTML

```html
<div>
  <p>Example text</p>
</div>
<div class="verticalExample">
  <p>Example text</p>
</div>
```

#### Kết quả

{{EmbedLiveSample("Setting_inline_start_and_end_margins", 140, 240)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Các thuộc tính vật lý được ánh xạ: {{CSSxRef("margin-top")}}, {{CSSxRef("margin-right")}}, {{CSSxRef("margin-bottom")}}, và {{CSSxRef("margin-left")}}
- {{CSSxRef("writing-mode")}}, {{CSSxRef("direction")}}, {{CSSxRef("text-orientation")}}
