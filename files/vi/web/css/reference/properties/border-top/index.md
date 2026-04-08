---
title: border-top
slug: Web/CSS/Reference/Properties/border-top
page-type: css-shorthand-property
browser-compat: css.properties.border-top
sidebar: cssref
---

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`border-top`** trong [CSS](/en-US/docs/Web/CSS) đặt tất cả các thuộc tính của [đường viền](/en-US/docs/Web/CSS/Reference/Properties/border) phía trên của một phần tử.

{{InteractiveExample("CSS Demo: border-top")}}

```css interactive-example-choice
border-top: solid;
```

```css interactive-example-choice
border-top: dashed red;
```

```css interactive-example-choice
border-top: 1rem solid;
```

```css interactive-example-choice
border-top: thick double #32a1ce;
```

```css interactive-example-choice
border-top: 4mm ridge rgb(211 220 50 / 0.6);
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
}
```

## Thuộc tính thành phần

Thuộc tính này là dạng viết tắt cho các thuộc tính CSS sau:

- {{cssxref("border-top-color")}}
- {{cssxref("border-top-style")}}
- {{cssxref("border-top-width")}}

## Cú pháp

```css
border-top: 1px;
border-top: 2px dotted;
border-top: medium dashed green;

/* Giá trị toàn cục */
border-top: inherit;
border-top: initial;
border-top: revert;
border-top: revert-layer;
border-top: unset;
```

Ba giá trị của thuộc tính viết tắt có thể được chỉ định theo bất kỳ thứ tự nào, và một hoặc hai trong số chúng có thể được bỏ qua.

### Giá trị

- `<br-width>`
  - : Xem {{cssxref("border-top-width")}}.
- `<br-style>`
  - : Xem {{cssxref("border-top-style")}}.
- {{cssxref("&lt;color&gt;")}}
  - : Xem {{cssxref("border-top-color")}}.

## Mô tả

Giống như tất cả các thuộc tính viết tắt, `border-top` luôn đặt giá trị cho tất cả các thuộc tính mà nó có thể đặt, ngay cả khi chúng không được chỉ định. Những thuộc tính không được chỉ định sẽ được đặt về giá trị mặc định của chúng. Hãy xem xét đoạn code sau:

```css
border-top-style: dotted;
border-top: thick green;
```

Nó thực sự giống như đoạn này:

```css
border-top-style: dotted;
border-top: none thick green;
```

Giá trị của {{cssxref("border-top-style")}} được đặt trước `border-top` sẽ bị bỏ qua. Vì giá trị mặc định của {{cssxref("border-top-style")}} là `none`, không chỉ định phần `border-style` sẽ dẫn đến không có đường viền.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Áp dụng đường viền trên

#### HTML

```html
<div>This box has a border on the top side.</div>
```

#### CSS

```css
div {
  border-top: 4px dashed blue;
  background-color: gold;
  height: 100px;
  width: 100px;
  font-weight: bold;
  text-align: center;
}
```

#### Kết quả

{{EmbedLiveSample('Applying_a_top_border')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("border")}}
- {{cssxref("border-block")}}
- {{cssxref("outline")}}
