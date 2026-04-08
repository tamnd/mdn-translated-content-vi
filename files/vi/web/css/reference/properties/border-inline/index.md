---
title: border-inline
slug: Web/CSS/Reference/Properties/border-inline
page-type: css-shorthand-property
browser-compat: css.properties.border-inline
sidebar: cssref
---

Thuộc tính **`border-inline`** [CSS](/en-US/docs/Web/CSS) là [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) để đặt các giá trị thuộc tính đường viền nội tuyến logic riêng lẻ ở một chỗ trong bảng kiểu.

{{InteractiveExample("CSS Demo: border-inline")}}

```css interactive-example-choice
border-inline: solid;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-inline: dashed red;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-inline: 1rem solid;
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

- {{cssxref("border-inline-color")}}
- {{cssxref("border-inline-style")}}
- {{cssxref("border-inline-width")}}

## Cú pháp

```css
border-inline: 1px;
border-inline: 2px dotted;
border-inline: medium dashed blue;

/* Giá trị toàn cục */
border-inline: inherit;
border-inline: initial;
border-inline: revert;
border-inline: revert-layer;
border-inline: unset;
```

### Giá trị

`border-inline` được chỉ định với một hoặc nhiều giá trị sau, theo bất kỳ thứ tự nào:

- `<'border-width'>`
  - : Chiều rộng của đường viền. Xem {{cssxref("border-width")}}.
- `<'border-style'>`
  - : Kiểu đường của đường viền. Xem {{cssxref("border-style")}}.
- {{CSSXref("&lt;color&gt;")}}
  - : Màu sắc của đường viền.

## Mô tả

Các đường viền vật lý mà `border-inline` ánh xạ tới phụ thuộc vào chế độ viết, hướng và hướng văn bản của phần tử. Nó tương ứng với các thuộc tính {{cssxref("border-top")}} và {{cssxref("border-bottom")}} hoặc {{cssxref("border-right")}} và {{cssxref("border-left")}}, tùy thuộc vào các giá trị được xác định cho {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}.

Các đường viền ở chiều kia có thể được đặt bằng {{cssxref("border-block")}}, để đặt {{cssxref("border-block-start")}} và {{cssxref("border-block-end")}}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đường viền với văn bản dọc

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
  border-inline: 5px dashed blue;
}
```

#### Kết quả

{{EmbedLiveSample("Border_with_vertical_text", 140, 140)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính và giá trị logic CSS](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Thuộc tính này ánh xạ tới một trong các thuộc tính đường viền vật lý: {{cssxref("border-top")}}, {{cssxref("border-right")}}, {{cssxref("border-bottom")}}, hoặc {{cssxref("border-left")}}.
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
