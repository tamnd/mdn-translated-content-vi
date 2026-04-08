---
title: background-position-y
slug: Web/CSS/Reference/Properties/background-position-y
page-type: css-property
browser-compat: css.properties.background-position-y
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`background-position-y`** đặt vị trí dọc ban đầu cho mỗi ảnh nền. Vị trí tương đối so với lớp vị trí được đặt bởi {{cssxref("background-origin")}}.

Giá trị của thuộc tính này bị ghi đè bởi bất kỳ khai báo nào của thuộc tính viết tắt {{cssxref("background")}} hoặc {{cssxref("background-position")}} được áp dụng cho phần tử sau đó.

{{InteractiveExample("CSS Demo: background-position-y")}}

```css interactive-example-choice
background-position-y: top;
```

```css interactive-example-choice
background-position-y: center;
```

```css interactive-example-choice
background-position-y: 25%;
```

```css interactive-example-choice
background-position-y: 2rem;
```

```css interactive-example-choice
background-position-y: bottom 32px;
```

```html interactive-example
<section class="display-block" id="default-example">
  <div class="transition-all" id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  background-color: navajowhite;
  background-image: url("/shared-assets/images/examples/star.png");
  background-repeat: no-repeat;
  height: 100%;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
background-position-y: top;
background-position-y: center;
background-position-y: bottom;

/* Giá trị <percentage> */
background-position-y: 25%;

/* Giá trị <length> */
background-position-y: 0px;
background-position-y: 1cm;
background-position-y: 8em;

/* Giá trị tương đối theo cạnh */
background-position-y: bottom 3px;
background-position-y: bottom 10%;

/* Nhiều giá trị */
background-position-y: 0px, center;

/* Giá trị toàn cục */
background-position-y: inherit;
background-position-y: initial;
background-position-y: revert;
background-position-y: revert-layer;
background-position-y: unset;
```

Thuộc tính `background-position-y` được chỉ định bằng một hoặc nhiều giá trị, phân cách bằng dấu phẩy.

### Giá trị

- `top`
  - : Căn cạnh trên của ảnh nền với cạnh trên của lớp vị trí nền.
- `center`
  - : Căn giữa theo chiều dọc của ảnh nền với giữa theo chiều dọc của lớp vị trí nền.
- `bottom`
  - : Căn cạnh dưới của ảnh nền với cạnh dưới của lớp vị trí nền.
- {{cssxref("&lt;length&gt;")}}
  - : Offset của cạnh ngang của ảnh nền được cho từ cạnh ngang trên tương ứng của lớp vị trí nền. (Một số trình duyệt cho phép gán cạnh dưới để offset).
- {{cssxref("&lt;percentage&gt;")}}
  - : Offset của vị trí dọc của ảnh nền được cho tương đối so với container. Giá trị 0% có nghĩa là cạnh trên của ảnh nền được căn với cạnh trên của container, và giá trị 100% có nghĩa là cạnh _dưới_ của ảnh nền được căn với cạnh _dưới_ của container, vì vậy giá trị 50% căn giữa theo chiều dọc ảnh nền.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

Ví dụ sau đây minh họa triển khai ảnh nền, với background-position-x và background-position-y được dùng để định nghĩa vị trí ngang và dọc của ảnh riêng biệt.

#### HTML

```html
<div></div>
```

#### CSS

```css
div {
  width: 300px;
  height: 300px;
  background-color: skyblue;
  background-image: url("https://mdn.dev/archives/media/attachments/2020/07/29/17350/3b4892b7e820122ac6dd7678891d4507/firefox.png");
  background-repeat: no-repeat;
  background-position-x: center;
  background-position-y: bottom;
}
```

#### Kết quả

{{EmbedLiveSample('Basic_example', '100%', 300)}}

### Giá trị tương đối theo cạnh

Ví dụ sau đây minh họa hỗ trợ cú pháp offset tương đối theo cạnh, cho phép nhà phát triển offset nền từ bất kỳ cạnh nào.

#### HTML

```html
<div></div>
```

#### CSS

```css
div {
  width: 300px;
  height: 300px;
  background-color: seagreen;
  background-image: url("https://mdn.dev/archives/media/attachments/2020/07/29/17350/3b4892b7e820122ac6dd7678891d4507/firefox.png");
  background-repeat: no-repeat;
  background-position-x: right 20px;
  background-position-y: bottom 10px;
}
```

#### Kết quả

{{EmbedLiveSample('Side-relative_values', '100%', 300)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("background-position")}}
- {{cssxref("background-position-x")}}
- [Sử dụng nhiều nền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds)
