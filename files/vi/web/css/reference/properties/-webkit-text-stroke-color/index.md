---
title: -webkit-text-stroke-color
slug: Web/CSS/Reference/Properties/-webkit-text-stroke-color
page-type: css-property
browser-compat: css.properties.-webkit-text-stroke-color
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`-webkit-text-stroke-color`** chỉ định [màu](/en-US/docs/Web/CSS/Reference/Values/color_value) nét viền của các ký tự văn bản. Nếu thuộc tính này không được đặt, giá trị của thuộc tính {{cssxref("color")}} sẽ được dùng.

## Cú pháp

```css
/* Giá trị <color> */
-webkit-text-stroke-color: red;
-webkit-text-stroke-color: #e08ab4;
-webkit-text-stroke-color: rgb(200 100 0);

/* Giá trị toàn cục */
-webkit-text-stroke-color: inherit;
-webkit-text-stroke-color: initial;
-webkit-text-stroke-color: revert;
-webkit-text-stroke-color: revert-layer;
-webkit-text-stroke-color: unset;
```

### Giá trị

- `<color>`
  - : Màu sắc của nét viền.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thay đổi màu nét viền

#### HTML

```html
<p>Text with stroke</p>
<input type="color" value="#ff0000" />
```

#### CSS

```css
p {
  margin: 0;
  font-size: 4em;
  -webkit-text-stroke-width: 3px;
  -webkit-text-stroke-color: red; /* Can be changed in the live sample */
}
```

```js hidden
const colorPicker = document.querySelector("input");
colorPicker.addEventListener("change", (evt) => {
  document.querySelector("p").style.webkitTextStrokeColor = evt.target.value;
});
```

#### Kết quả

{{EmbedLiveSample("Varying_the_stroke_color", "500px", "100px")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Introducing Text-Stroke](https://webkit.org/blog/85/introducing-text-stroke/) trên webkit.org (2006)
- [Bài viết CSS-Tricks giải thích tính năng này](https://css-tricks.com/adding-stroke-to-web-text/)
- {{cssxref("-webkit-text-fill-color")}}
- {{cssxref("-webkit-text-stroke-width")}}
- {{cssxref("-webkit-text-stroke")}}
