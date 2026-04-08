---
title: border-block-start
slug: Web/CSS/Reference/Properties/border-block-start
page-type: css-shorthand-property
browser-compat: css.properties.border-block-start
sidebar: cssref
---

Thuộc tính **`border-block-start`** trong [CSS](/en-US/docs/Web/CSS) là [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) để thiết lập các giá trị thuộc tính viền bắt đầu khối logic riêng lẻ tại một chỗ trong stylesheet.

{{InteractiveExample("CSS Demo: border-block-start")}}

```css interactive-example-choice
border-block-start: solid;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-block-start: dashed red;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-block-start: 1rem solid;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-block-start: thick double #32a1ce;
writing-mode: vertical-lr;
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
  color: darkmagenta;
  padding: 0.75em;
  width: 80%;
  height: 100px;
  unicode-bidi: bidi-override;
}
```

## Thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("border-block-start-color")}}
- {{cssxref("border-block-start-style")}}
- {{cssxref("border-block-start-width")}}

## Cú pháp

```css
border-block-start: 1px;
border-block-start: 2px dotted;
border-block-start: medium dashed blue;

/* Giá trị toàn cục */
border-block-start: inherit;
border-block-start: initial;
border-block-start: revert;
border-block-start: revert-layer;
border-block-start: unset;
```

`border-block-start` có thể được dùng để thiết lập giá trị cho một hoặc nhiều thuộc tính trong số {{cssxref("border-block-start-width")}}, {{cssxref("border-block-start-style")}} và {{cssxref("border-block-start-color")}}. Viền vật lý mà thuộc tính này ánh xạ tới phụ thuộc vào chế độ viết, chiều hướng và hướng văn bản của phần tử. Thuộc tính này tương ứng với {{cssxref("border-top")}}, {{cssxref("border-right")}}, {{cssxref("border-bottom")}} hoặc {{cssxref("border-left")}} tùy theo giá trị được định nghĩa cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

Các thuộc tính liên quan là {{cssxref("border-block-end")}}, {{cssxref("border-inline-start")}} và {{cssxref("border-inline-end")}}, xác định các viền còn lại của phần tử.

### Giá trị

`border-block-start` được chỉ định với một hoặc nhiều giá trị sau, theo bất kỳ thứ tự nào:

- `<'border-width'>`
  - : Độ rộng của đường viền. Xem {{cssxref("border-width")}}.
- `<'border-style'>`
  - : Kiểu đường viền. Xem {{cssxref("border-style")}}.
- {{CSSXref("&lt;color&gt;")}}
  - : Màu sắc của đường viền.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Viền với văn bản dọc

#### HTML

```html
<div>
  <p class="exampleText">Example text</p>
</div>
```

#### CSS

```css
div {
  background-color: yellow;
  width: 120px;
  height: 120px;
}

.exampleText {
  writing-mode: vertical-rl;
  border-block-start: 5px dashed blue;
}
```

{{EmbedLiveSample("Border_with_vertical_text", 140, 140)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Logical Properties and Values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Thuộc tính này ánh xạ tới một trong các thuộc tính viền vật lý: {{cssxref("border-top")}}, {{cssxref("border-right")}}, {{cssxref("border-bottom")}} hoặc {{cssxref("border-left")}}.
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
