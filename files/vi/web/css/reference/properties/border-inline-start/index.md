---
title: border-inline-start
slug: Web/CSS/Reference/Properties/border-inline-start
page-type: css-shorthand-property
browser-compat: css.properties.border-inline-start
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`border-inline-start`** là [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) dùng để thiết lập các giá trị riêng lẻ của đường viền logic phía đầu theo chiều ngang nội tuyến trong một khai báo duy nhất trong style sheet.

{{InteractiveExample("CSS Demo: border-inline-start")}}

```css interactive-example-choice
border-inline-start: solid;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-inline-start: dashed red;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-inline-start: 1rem solid;
writing-mode: horizontal-tb;
direction: rtl;
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

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("border-inline-start-color")}}
- {{cssxref("border-inline-start-style")}}
- {{cssxref("border-inline-start-width")}}

## Cú pháp

```css
border-inline-start: 1px;
border-inline-start: 2px dotted;
border-inline-start: medium dashed green;

/* Giá trị toàn cục */
border-inline-start: inherit;
border-inline-start: initial;
border-inline-start: revert;
border-inline-start: revert-layer;
border-inline-start: unset;
```

Đường viền vật lý mà `border-inline-start` ánh xạ tới phụ thuộc vào chế độ viết, chiều hướng và hướng văn bản của phần tử. Nó tương ứng với thuộc tính {{cssxref("border-top")}}, {{cssxref("border-right")}}, {{cssxref("border-bottom")}}, hoặc {{cssxref("border-left")}} tùy theo các giá trị được xác định cho {{cssxref("writing-mode")}}, {{cssxref("direction")}}, và {{cssxref("text-orientation")}}.

Các thuộc tính liên quan là {{cssxref("border-block-start")}}, {{cssxref("border-block-end")}}, và {{cssxref("border-inline-end")}}, xác định các đường viền còn lại của phần tử.

### Giá trị

Thuộc tính `border-inline-start` được chỉ định với một hoặc nhiều giá trị sau, theo bất kỳ thứ tự nào:

- `<'border-width'>`
  - : Độ rộng của đường viền. Xem {{cssxref("border-width")}}.
- `<'border-style'>`
  - : Kiểu đường của đường viền. Xem {{cssxref("border-style")}}.
- {{CSSXref("&lt;color&gt;")}}
  - : Màu sắc của đường viền.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### HTML

```html
<div>
  <p class="exampleText">Example text</p>
</div>
```

### CSS

```css
div {
  background-color: yellow;
  width: 120px;
  height: 120px;
}

.exampleText {
  writing-mode: vertical-rl;
  border-inline-start: 5px dashed blue;
}
```

{{EmbedLiveSample("Examples", 140, 140)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Thuộc tính này ánh xạ tới một trong các thuộc tính đường viền vật lý: {{cssxref("border-top")}}, {{cssxref("border-right")}}, {{cssxref("border-bottom")}}, hoặc {{cssxref("border-left")}}.
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
