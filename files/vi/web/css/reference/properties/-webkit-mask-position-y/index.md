---
title: -webkit-mask-position-y
slug: Web/CSS/Reference/Properties/-webkit-mask-position-y
page-type: css-property
status:
  - non-standard
browser-compat: css.properties.-webkit-mask-position-y
sidebar: cssref
---

{{Non-standard_header}}

Thuộc tính CSS `-webkit-mask-position-y` đặt vị trí dọc ban đầu của một hình ảnh mặt nạ.

## Cú pháp

```css
/* Giá trị từ khóa */
-webkit-mask-position-y: top;
-webkit-mask-position-y: center;
-webkit-mask-position-y: bottom;

/* Giá trị <percentage> */
-webkit-mask-position-y: 100%;
-webkit-mask-position-y: -50%;

/* Giá trị <length> */
-webkit-mask-position-y: 50px;
-webkit-mask-position-y: -1cm;

/* Nhiều giá trị */
-webkit-mask-position-y:
  50px,
  25%,
  -3em;

/* Giá trị toàn cục */
-webkit-mask-position-y: inherit;
-webkit-mask-position-y: initial;
-webkit-mask-position-y: revert;
-webkit-mask-position-y: revert-layer;
-webkit-mask-position-y: unset;
```

### Giá trị

- `<length-percentage>`
  - : Một độ dài chỉ định vị trí cạnh trên của hình ảnh so với cạnh trên vùng đệm của hộp. Tỷ lệ phần trăm được tính theo chiều dọc của vùng đệm hộp. Giá trị `0%` có nghĩa là cạnh trên của hình ảnh căn chỉnh với cạnh trên vùng đệm của hộp, và giá trị `100%` có nghĩa là cạnh dưới của hình ảnh căn chỉnh với cạnh dưới vùng đệm của hộp.
- `top`
  - : Tương đương với `0%`.
- `bottom`
  - : Tương đương với `100%`.
- `center`
  - : Tương đương với `50%`.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`-webkit-mask-position-y = [ <length-percentage> | top | center | bottom ]#`)}}

## Ví dụ

### Định vị dọc hình ảnh mặt nạ

```css
.exampleOne {
  -webkit-mask-image: url("mask.png");
  -webkit-mask-position-y: bottom;
}

.exampleTwo {
  -webkit-mask-image: url("mask.png");
  -webkit-mask-position-y: 25%;
}
```

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

{{cssxref("mask-position", "-webkit-mask-position")}}, {{cssxref("-webkit-mask-position-x")}}, {{cssxref("mask-origin", "-webkit-mask-origin")}}
