---
title: border-block
slug: Web/CSS/Reference/Properties/border-block
page-type: css-shorthand-property
browser-compat: css.properties.border-block
sidebar: cssref
---

Thuộc tính **`border-block`** [CSS](/en-US/docs/Web/CSS) là [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) để đặt các giá trị thuộc tính đường viền khối logic riêng lẻ ở một nơi trong bảng kiểu.

{{InteractiveExample("CSS Demo: border-block")}}

```css interactive-example-choice
border-block: solid;
writing-mode: horizontal-tb;
```

```css interactive-example-choice
border-block: dashed red;
writing-mode: vertical-rl;
```

```css interactive-example-choice
border-block: 1rem solid;
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

Thuộc tính này là dạng viết tắt cho các thuộc tính CSS sau:

- {{cssxref("border-block-color")}}
- {{cssxref("border-block-style")}}
- {{cssxref("border-block-width")}}

## Cú pháp

```css
border-block: 1px;
border-block: 2px dotted;
border-block: medium dashed blue;

/* Giá trị toàn cục */
border-block: inherit;
border-block: initial;
border-block: revert;
border-block: revert-layer;
border-block: unset;
```

### Giá trị

`border-block` được chỉ định với một hoặc nhiều giá trị sau, theo bất kỳ thứ tự nào:

- `<'border-width'>`
  - : Chiều rộng của đường viền. Xem {{cssxref("border-width")}}.
- `<'border-style'>`
  - : Kiểu đường của đường viền. Xem {{cssxref("border-style")}}.
- {{CSSXref("&lt;color&gt;")}}
  - : Màu của đường viền.

## Mô tả

`border-block` có thể được dùng để đặt các giá trị cho một hoặc nhiều trong số {{cssxref("border-block-width")}}, {{cssxref("border-block-style")}}, và {{cssxref("border-block-color")}}, đặt cả đầu và cuối theo chiều khối cùng lúc. Các đường viền vật lý mà nó ánh xạ phụ thuộc vào chế độ viết, hướng và hướng văn bản của phần tử. Nó tương ứng với {{cssxref("border-top")}} và {{cssxref("border-bottom")}} hoặc {{cssxref("border-right")}} và {{cssxref("border-left")}} tùy thuộc vào các giá trị được xác định cho {{cssxref("writing-mode")}}, {{cssxref("direction")}}, và {{cssxref("text-orientation")}}.

Các đường viền theo chiều còn lại có thể được đặt bằng {{cssxref("border-inline")}}, đặt {{cssxref("border-inline-start")}} và {{cssxref("border-inline-end")}}.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

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
  border-block: 5px dashed blue;
}
```

#### Kết quả

{{EmbedLiveSample("Border_with_vertical_text", 140, 140)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Logical Properties and Values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Thuộc tính này ánh xạ đến một trong các thuộc tính đường viền vật lý: {{cssxref("border-top")}}, {{cssxref("border-right")}}, {{cssxref("border-bottom")}}, hoặc {{cssxref("border-left")}}.
- {{cssxref("writing-mode")}}, {{cssxref("direction")}}, {{cssxref("text-orientation")}}
