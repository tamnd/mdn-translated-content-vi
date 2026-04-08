---
title: border-right
slug: Web/CSS/Reference/Properties/border-right
page-type: css-shorthand-property
browser-compat: css.properties.border-right
sidebar: cssref
---

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`border-right`** trong [CSS](/en-US/docs/Web/CSS) đặt tất cả các thuộc tính của [đường viền](/en-US/docs/Web/CSS/Reference/Properties/border) phía phải của một phần tử.

{{InteractiveExample("CSS Demo: border-right")}}

```css interactive-example-choice
border-right: solid;
```

```css interactive-example-choice
border-right: dashed red;
```

```css interactive-example-choice
border-right: 1rem solid;
```

```css interactive-example-choice
border-right: thick double #32a1ce;
```

```css interactive-example-choice
border-right: 4mm ridge rgb(211 220 50 / 0.6);
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

- {{cssxref("border-right-color")}}
- {{cssxref("border-right-style")}}
- {{cssxref("border-right-width")}}

## Cú pháp

```css
border-right: 1px;
border-right: 2px dotted;
border-right: medium dashed green;

/* Giá trị toàn cục */
border-right: inherit;
border-right: initial;
border-right: revert;
border-right: revert-layer;
border-right: unset;
```

Ba giá trị của thuộc tính viết tắt có thể được chỉ định theo bất kỳ thứ tự nào, và một hoặc hai trong số chúng có thể được bỏ qua.

### Giá trị

- `<br-width>`
  - : Xem {{cssxref("border-right-width")}}.
- `<br-style>`
  - : Xem {{cssxref("border-right-style")}}.
- {{cssxref("&lt;color&gt;")}}
  - : Xem {{cssxref("border-right-color")}}.

## Mô tả

Giống như tất cả các thuộc tính viết tắt, `border-right` luôn đặt giá trị cho tất cả các thuộc tính mà nó có thể đặt, ngay cả khi chúng không được chỉ định. Những thuộc tính không được chỉ định sẽ được đặt về giá trị mặc định của chúng. Hãy xem xét đoạn code sau:

```css
border-right-style: dotted;
border-right: thick green;
```

Nó thực sự giống như đoạn này:

```css
border-right-style: dotted;
border-right: none thick green;
```

Giá trị của {{cssxref("border-right-style")}} được đặt trước `border-right` sẽ bị bỏ qua. Vì giá trị mặc định của {{cssxref("border-right-style")}} là `none`, không chỉ định phần `border-style` sẽ dẫn đến không có đường viền.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Áp dụng đường viền phải

#### HTML

```html
<div>This box has a border on the right side.</div>
```

#### CSS

```css
div {
  border-right: 4px dashed blue;
  background-color: gold;
  height: 100px;
  width: 100px;
  font-weight: bold;
  text-align: center;
}
```

#### Kết quả

{{EmbedLiveSample('Applying_a_right_border')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("border")}}
- {{cssxref("border-block")}}
- {{cssxref("outline")}}
