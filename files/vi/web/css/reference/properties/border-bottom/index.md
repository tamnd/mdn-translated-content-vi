---
title: border-bottom
slug: Web/CSS/Reference/Properties/border-bottom
page-type: css-shorthand-property
browser-compat: css.properties.border-bottom
sidebar: cssref
---

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`border-bottom`** trong [CSS](/en-US/docs/Web/CSS) đặt [đường viền](/en-US/docs/Web/CSS/Reference/Properties/border) phía dưới của một phần tử. Nó đặt các giá trị của {{cssxref("border-bottom-width")}}, {{cssxref("border-bottom-style")}} và {{cssxref("border-bottom-color")}}.

{{InteractiveExample("CSS Demo: border-bottom")}}

```css interactive-example-choice
border-bottom: solid;
```

```css interactive-example-choice
border-bottom: dashed red;
```

```css interactive-example-choice
border-bottom: 1rem solid;
```

```css interactive-example-choice
border-bottom: thick double #32a1ce;
```

```css interactive-example-choice
border-bottom: 4mm ridge rgb(211 220 50 / 0.6);
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

- {{cssxref("border-bottom-color")}}
- {{cssxref("border-bottom-style")}}
- {{cssxref("border-bottom-width")}}

## Cú pháp

```css
border-bottom: 1px;
border-bottom: 2px dotted;
border-bottom: medium dashed blue;

/* Giá trị toàn cục */
border-bottom: inherit;
border-bottom: initial;
border-bottom: revert;
border-bottom: revert-layer;
border-bottom: unset;
```

Ba giá trị của thuộc tính viết tắt có thể được chỉ định theo bất kỳ thứ tự nào, và một hoặc hai trong số chúng có thể được bỏ qua.

### Giá trị

- `<br-width>`
  - : Xem {{cssxref("border-bottom-width")}}.
- `<br-style>`
  - : Xem {{cssxref("border-bottom-style")}}.
- {{cssxref("&lt;color&gt;")}}
  - : Xem {{cssxref("border-bottom-color")}}.

## Mô tả

Giống như tất cả các thuộc tính viết tắt, `border-bottom` luôn đặt giá trị cho tất cả các thuộc tính mà nó có thể đặt, ngay cả khi chúng không được chỉ định. Những thuộc tính không được chỉ định sẽ được đặt về giá trị mặc định của chúng. Hãy xem xét đoạn code sau:

```css
border-bottom-style: dotted;
border-bottom: thick green;
```

Nó thực sự giống như đoạn này:

```css
border-bottom-style: dotted;
border-bottom: none thick green;
```

Giá trị của {{cssxref("border-bottom-style")}} được đặt trước `border-bottom` sẽ bị bỏ qua. Vì giá trị mặc định của {{cssxref("border-bottom-style")}} là `none`, không chỉ định phần `border-style` sẽ dẫn đến không có đường viền.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Áp dụng đường viền dưới

#### HTML

```html
<div>This box has a border on the bottom side.</div>
```

#### CSS

```css
div {
  border-bottom: 4px dashed blue;
  background-color: gold;
  height: 100px;
  width: 100px;
  font-weight: bold;
  text-align: center;
}
```

#### Kết quả

{{EmbedLiveSample('Applying_a_bottom_border')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("border")}}
- {{cssxref("border-block")}}
- {{cssxref("outline")}}
