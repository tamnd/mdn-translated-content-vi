---
title: -webkit-text-fill-color
slug: Web/CSS/Reference/Properties/-webkit-text-fill-color
page-type: css-property
browser-compat: css.properties.-webkit-text-fill-color
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`-webkit-text-fill-color`** chỉ định [màu](/en-US/docs/Web/CSS/Reference/Values/color_value) tô của các ký tự văn bản. Nếu thuộc tính này không được đặt, giá trị của thuộc tính {{cssxref("color")}} sẽ được dùng.

## Cú pháp

```css
/* Giá trị <color> */
-webkit-text-fill-color: red;
-webkit-text-fill-color: #123456;
-webkit-text-fill-color: rgb(100 200 0);

/* Giá trị toàn cục */
-webkit-text-fill-color: inherit;
-webkit-text-fill-color: initial;
-webkit-text-fill-color: revert;
-webkit-text-fill-color: revert-layer;
-webkit-text-fill-color: unset;
```

### Giá trị

- `<color>`
  - : Màu tô phần trước của nội dung văn bản phần tử.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thay đổi màu tô

#### CSS

```css
p {
  margin: 0;
  font-size: 3em;
  -webkit-text-fill-color: green;
}
```

#### HTML

```html
<p>This text is green.</p>
```

#### Kết quả

{{EmbedLiveSample("Changing_the_fill_color", "380px", "60px")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Introducing Text-Stroke](https://webkit.org/blog/85/introducing-text-stroke/) trên webkit.org (2006)
- [Bài viết CSS-Tricks giải thích tính năng này](https://css-tricks.com/adding-stroke-to-web-text/)
- {{cssxref("-webkit-text-stroke-color")}}
- {{cssxref("-webkit-text-stroke-width")}}
- {{cssxref("-webkit-text-stroke")}}
