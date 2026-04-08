---
title: border-inline-end
slug: Web/CSS/Reference/Properties/border-inline-end
page-type: css-shorthand-property
browser-compat: css.properties.border-inline-end
sidebar: cssref
---

Thuộc tính **`border-inline-end`** [CSS](/en-US/docs/Web/CSS) là [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) để đặt các giá trị thuộc tính đường viền cuối nội tuyến logic riêng lẻ ở một chỗ trong bảng kiểu.

{{InteractiveExample("CSS Demo: border-inline-end")}}

```css interactive-example-choice
border-inline-end: solid;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-inline-end: dashed red;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-inline-end: 1rem solid;
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

## Các thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("border-inline-end-color")}}
- {{cssxref("border-inline-end-style")}}
- {{cssxref("border-inline-end-width")}}

## Cú pháp

```css
border-inline-end: 1px;
border-inline-end: 2px dashed;
border-inline-end: medium dashed blue;

/* Giá trị toàn cục */
border-inline-end: inherit;
border-inline-end: initial;
border-inline-end: revert;
border-inline-end: revert-layer;
border-inline-end: unset;
```

Đường viền vật lý mà `border-inline-end` ánh xạ tới phụ thuộc vào chế độ viết, hướng và hướng văn bản của phần tử. Nó tương ứng với thuộc tính {{cssxref("border-top")}}, {{cssxref("border-right")}}, {{cssxref("border-bottom")}}, hoặc {{cssxref("border-left")}} tùy thuộc vào các giá trị được xác định cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

Các thuộc tính liên quan là {{cssxref("border-block-start")}}, {{cssxref("border-block-end")}} và {{cssxref("border-inline-start")}}, xác định các đường viền khác của phần tử.

### Giá trị

`border-inline-end` được chỉ định với một hoặc nhiều giá trị sau, theo bất kỳ thứ tự nào:

- `<'border-width'>`
  - : Chiều rộng của đường viền. Xem {{cssxref("border-width")}}.
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
  border-inline-end: 5px dashed blue;
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
