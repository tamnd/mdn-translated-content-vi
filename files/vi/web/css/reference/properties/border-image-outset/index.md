---
title: border-image-outset
slug: Web/CSS/Reference/Properties/border-image-outset
page-type: css-property
browser-compat: css.properties.border-image-outset
sidebar: cssref
---

Thuộc tính **`border-image-outset`** trong [CSS](/en-US/docs/Web/CSS) đặt khoảng cách mà [hình ảnh đường viền](/en-US/docs/Web/CSS/Reference/Properties/border-image) của một phần tử được đẩy ra ngoài hộp đường viền.

Các phần của hình ảnh đường viền được hiển thị bên ngoài hộp đường viền của phần tử với `border-image-outset` sẽ không kích hoạt thanh cuộn tràn và không bắt các sự kiện chuột.

{{InteractiveExample("CSS Demo: border-image-outset")}}

```css interactive-example-choice
border-image-outset: 0;
```

```css interactive-example-choice
border-image-outset: 15px;
```

```css interactive-example-choice
border-image-outset: 30px;
```

```css interactive-example-choice
border-image-outset: 40px;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">This is a box with a border around it.</div>
</section>
```

```css interactive-example
#example-element {
  width: 80%;
  height: 80%;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 50px;
  background: #fff3d4;
  color: black;
  border: 30px solid;
  border-image: url("/shared-assets/images/examples/border-diamonds.png") 30
    round;
  font-size: 1.2em;
}
```

## Cú pháp

```css
/* Giá trị <length> */
border-image-outset: 1rem;

/* Giá trị <number> */
border-image-outset: 1.5;

/* trên và dưới | trái và phải */
border-image-outset: 1 1.2;

/* trên | trái và phải | dưới */
border-image-outset: 30px 2 45px;

/* trên | phải | dưới | trái */
border-image-outset: 7px 12px 14px 5px;

/* Giá trị toàn cục */
border-image-outset: inherit;
border-image-outset: initial;
border-image-outset: revert;
border-image-outset: revert-layer;
border-image-outset: unset;
```

Thuộc tính `border-image-outset` có thể được chỉ định với một, hai, ba hoặc bốn giá trị. Mỗi giá trị là {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;number&gt;")}}. Giá trị âm không hợp lệ và sẽ khiến khai báo `border-image-outset` bị bỏ qua.

1. Nếu chỉ định **một** giá trị, nó áp dụng cho **cả bốn cạnh**.
2. Nếu chỉ định **hai** giá trị, giá trị đầu tiên áp dụng cho **trên và dưới**, giá trị thứ hai cho **trái và phải**.
3. Nếu chỉ định **ba** giá trị, giá trị đầu tiên áp dụng cho **trên**, giá trị thứ hai cho **trái và phải**, giá trị thứ ba cho **dưới**.
4. Nếu chỉ định **bốn** giá trị, chúng áp dụng cho **trên**, **phải**, **dưới** và **trái** theo thứ tự đó (theo chiều kim đồng hồ).

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Kích thước của outset `border-image` dưới dạng kích thước — một số kèm đơn vị.
- {{cssxref("&lt;number&gt;")}}
  - : Kích thước của outset `border-image` dưới dạng bội số của {{cssxref("border-width")}} tương ứng của phần tử. Ví dụ, nếu một phần tử có `border-width: 1em 2px 0 1.5rem` và `border-image-outset: 2`, thì `border-image-outset` cuối cùng sẽ được tính là `2em 4px 0 3rem`.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đẩy hình ảnh đường viền ra ngoài

#### HTML

```html
<div id="outset">This element has an outset border image!</div>
```

#### CSS

```css
#outset {
  width: 10rem;
  background: #cceeff;
  border: 1.4rem solid;
  border-image: radial-gradient(#ffff22, #5555ff) 40;
  border-image-outset: 1.5; /* 1.5 × 1.4rem = 2.1rem */
  margin: 2.1rem;
}
```

#### Kết quả

{{EmbedLiveSample("Outsetting_a_border_image", "auto", 200)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Nền và đường viền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)
- [Học CSS: Nền và đường viền](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders)
- [Hình ảnh đường viền trong CSS: Trọng tâm chính cho Interop 2023](/en-US/blog/border-images-interop-2023/) trên MDN blog (2023)
