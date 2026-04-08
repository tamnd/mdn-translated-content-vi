---
title: -webkit-mask-position-x
slug: Web/CSS/Reference/Properties/-webkit-mask-position-x
page-type: css-property
status:
  - non-standard
browser-compat: css.properties.-webkit-mask-position-x
sidebar: cssref
---

{{Non-standard_header}}

Thuộc tính CSS `-webkit-mask-position-x` thiết lập vị trí ngang ban đầu của hình ảnh mặt nạ.

## Cú pháp

```css
/* Giá trị từ khóa */
-webkit-mask-position-x: left;
-webkit-mask-position-x: center;
-webkit-mask-position-x: right;

/* Giá trị <percentage> */
-webkit-mask-position-x: 100%;
-webkit-mask-position-x: -50%;

/* Giá trị <length> */
-webkit-mask-position-x: 50px;
-webkit-mask-position-x: -1cm;

/* Nhiều giá trị */
-webkit-mask-position-x:
  50px,
  25%,
  -3em;

/* Giá trị toàn cục */
-webkit-mask-position-x: inherit;
-webkit-mask-position-x: initial;
-webkit-mask-position-x: revert;
-webkit-mask-position-x: revert-layer;
-webkit-mask-position-x: unset;
```

### Giá trị

- `<length-percentage>`
  - : Độ dài chỉ định vị trí cạnh trái của hình ảnh so với cạnh padding trái của hộp. Phần trăm được tính dựa trên kích thước ngang của khu vực padding hộp. Nghĩa là, giá trị `0%` có nghĩa là cạnh trái của hình ảnh căn với cạnh padding trái của hộp và giá trị `100%` có nghĩa là cạnh phải của hình ảnh căn với cạnh padding phải của hộp.
- `left`
  - : Tương đương với `0%`.
- `center`
  - : Tương đương với `50%`.
- `right`
  - : Tương đương với `100%`.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`-webkit-mask-position-x = [ <length-percentage> | left | center | right ]#`)}}

## Ví dụ

### Định vị ngang hình ảnh mặt nạ

```css
.exampleOne {
  -webkit-mask-image: url("mask.png");
  -webkit-mask-position-x: right;
}

.exampleTwo {
  -webkit-mask-image: url("mask.png");
  -webkit-mask-position-x: 25%;
}
```

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

{{cssxref("mask-position", "-webkit-mask-position")}}, {{cssxref("-webkit-mask-position-y")}}, {{cssxref("mask-origin", "-webkit-mask-origin")}}
