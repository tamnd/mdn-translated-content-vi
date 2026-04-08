---
title: border-left
slug: Web/CSS/Reference/Properties/border-left
page-type: css-shorthand-property
browser-compat: css.properties.border-left
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) viết tắt **`border-left`** thiết lập tất cả các thuộc tính của [đường viền](/en-US/docs/Web/CSS/Reference/Properties/border) bên trái của một phần tử.

{{InteractiveExample("CSS Demo: border-left")}}

```css interactive-example-choice
border-left: solid;
```

```css interactive-example-choice
border-left: dashed red;
```

```css interactive-example-choice
border-left: 1rem solid;
```

```css interactive-example-choice
border-left: thick double #32a1ce;
```

```css interactive-example-choice
border-left: 4mm ridge rgb(211 220 50 / 0.6);
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

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("border-left-color")}}
- {{cssxref("border-left-style")}}
- {{cssxref("border-left-width")}}

## Cú pháp

```css
border-left: 1px;
border-left: 2px dotted;
border-left: medium dashed blue;

/* Giá trị toàn cục */
border-left: inherit;
border-left: initial;
border-left: revert;
border-left: revert-layer;
border-left: unset;
```

Ba giá trị của thuộc tính viết tắt có thể được chỉ định theo bất kỳ thứ tự nào, và một hoặc hai trong số chúng có thể được bỏ qua.

### Giá trị

- `<br-width>`
  - : Xem {{cssxref("border-left-width")}}.
- `<br-style>`
  - : Xem {{cssxref("border-left-style")}}.
- {{cssxref("&lt;color&gt;")}}
  - : Xem {{cssxref("border-left-color")}}.

## Mô tả

Như với tất cả các thuộc tính viết tắt, `border-left` luôn thiết lập giá trị của tất cả các thuộc tính mà nó có thể thiết lập, ngay cả khi chúng không được chỉ định. Những thuộc tính không được chỉ định sẽ được đặt về giá trị mặc định. Xét đoạn code sau:

```css
border-left-style: dotted;
border-left: thick green;
```

Thực ra nó tương đương với:

```css
border-left-style: dotted;
border-left: none thick green;
```

Giá trị của {{cssxref("border-left-style")}} được đặt trước `border-left` sẽ bị bỏ qua. Vì giá trị mặc định của {{cssxref("border-left-style")}} là `none`, nên nếu không chỉ định phần `border-style`, sẽ không có đường viền nào được hiển thị.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Áp dụng đường viền bên trái

#### HTML

```html
<div>This box has a border on the left side.</div>
```

#### CSS

```css
div {
  border-left: 4px dashed blue;
  background-color: gold;
  height: 100px;
  width: 100px;
  font-weight: bold;
  text-align: center;
}
```

#### Kết quả

{{EmbedLiveSample('Applying_a_left_border')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("border")}}
- {{cssxref("border-block")}}
- {{cssxref("outline")}}
- [Nền và đường viền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)
- [Học CSS: Nền và đường viền](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders)
