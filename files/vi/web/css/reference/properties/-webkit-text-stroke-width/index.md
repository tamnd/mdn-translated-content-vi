---
title: -webkit-text-stroke-width
slug: Web/CSS/Reference/Properties/-webkit-text-stroke-width
page-type: css-property
browser-compat: css.properties.-webkit-text-stroke-width
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`-webkit-text-stroke-width`** xác định độ rộng của đường viền (stroke) cho văn bản.

## Cú pháp

```css
/* Giá trị từ khóa */
-webkit-text-stroke-width: thin;
-webkit-text-stroke-width: medium;
-webkit-text-stroke-width: thick;

/* Giá trị <length> */
-webkit-text-stroke-width: 2px;
-webkit-text-stroke-width: 0.1em;
-webkit-text-stroke-width: 1mm;
-webkit-text-stroke-width: 5pt;

/* Giá trị toàn cục */
-webkit-text-stroke-width: inherit;
-webkit-text-stroke-width: initial;
-webkit-text-stroke-width: revert;
-webkit-text-stroke-width: revert-layer;
-webkit-text-stroke-width: unset;
```

### Giá trị

- `<line-width>`
  - : Độ rộng của đường viền.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Các độ rộng đường viền khác nhau

#### CSS

```css
p {
  margin: 0;
  font-size: 4em;
  -webkit-text-stroke-color: red;
}

#thin {
  -webkit-text-stroke-width: thin;
}

#medium {
  -webkit-text-stroke-width: 3px;
}

#thick {
  -webkit-text-stroke-width: 1.5mm;
}
```

#### HTML

```html
<p id="thin">Thin stroke</p>
<p id="medium">Medium stroke</p>
<p id="thick">Thick stroke</p>
```

#### Kết quả

{{EmbedLiveSample("Varying_stroke_widths", "450px", "230px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Introducing Text-Stroke](https://webkit.org/blog/85/introducing-text-stroke/) trên webkit.org (2006)
- [Bài viết CSS-Tricks giải thích tính năng này](https://css-tricks.com/adding-stroke-to-web-text/)
- {{cssxref("-webkit-text-stroke-color")}}
- {{cssxref("-webkit-text-stroke")}}
- {{cssxref("-webkit-text-fill-color")}}
