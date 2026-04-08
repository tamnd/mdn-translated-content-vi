---
title: flex-flow
slug: Web/CSS/Reference/Properties/flex-flow
page-type: css-shorthand-property
browser-compat: css.properties.flex-flow
sidebar: cssref
---

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) [CSS](/en-US/docs/Web/CSS) **`flex-flow`** xác định hướng của flex container cũng như hành vi bao dòng của nó.

{{InteractiveExample("CSS Demo: flex-flow")}}

```css interactive-example-choice
flex-flow: row wrap;
```

```css interactive-example-choice
flex-flow: row-reverse nowrap;
```

```css interactive-example-choice
flex-flow: column wrap-reverse;
```

```css interactive-example-choice
flex-flow: column wrap;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    <div>Item One</div>
    <div>Item Two</div>
    <div>Item Three</div>
    <div>Item Four</div>
    <div>Item Five</div>
    <div>Item Six</div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  width: 80%;
  max-height: 300px;
  display: flex;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
  width: 60px;
  margin: 10px;
}
```

## Các thuộc tính thành phần

Thuộc tính này là dạng viết tắt của các thuộc tính CSS sau:

- {{cssxref("flex-direction")}}
- {{cssxref("flex-wrap")}}

## Cú pháp

```css
/* flex-flow: <'flex-direction'> */
flex-flow: row;
flex-flow: row-reverse;
flex-flow: column;
flex-flow: column-reverse;

/* flex-flow: <'flex-wrap'> */
flex-flow: nowrap;
flex-flow: wrap;
flex-flow: wrap-reverse;

/* flex-flow: <'flex-direction'> và <'flex-wrap'> */
flex-flow: row nowrap;
flex-flow: column wrap;
flex-flow: column-reverse wrap-reverse;

/* Giá trị toàn cục */
flex-flow: inherit;
flex-flow: initial;
flex-flow: revert;
flex-flow: revert-layer;
flex-flow: unset;
```

### Giá trị

Xem {{cssxref("flex-direction")}} và {{cssxref("flex-wrap")}} để biết chi tiết về các giá trị.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập column-reverse và wrap

Trong ví dụ này, trục chính là hướng khối với điểm main-start và main-end được đảo ngược. Các flex item được phép bao dòng, tạo ra các dòng mới nếu cần.

```css
.container {
  flex-flow: column-reverse wrap;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Sắp xếp thứ tự các flex item](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Ordering_items)
