---
title: background-position-x
slug: Web/CSS/Reference/Properties/background-position-x
page-type: css-property
browser-compat: css.properties.background-position-x
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`background-position-x`** đặt vị trí ngang ban đầu cho mỗi ảnh nền. Vị trí tương đối so với lớp vị trí được đặt bởi {{cssxref("background-origin")}}.

Giá trị của thuộc tính này bị ghi đè bởi bất kỳ khai báo nào của thuộc tính viết tắt {{cssxref("background")}} hoặc {{cssxref("background-position")}} được áp dụng cho phần tử sau đó.

{{InteractiveExample("CSS Demo: background-position-x")}}

```css interactive-example-choice
background-position-x: left;
```

```css interactive-example-choice
background-position-x: center;
```

```css interactive-example-choice
background-position-x: 25%;
```

```css interactive-example-choice
background-position-x: 2rem;
```

```css interactive-example-choice
background-position-x: right 32px;
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
background-position-x: left;
background-position-x: center;
background-position-x: right;

/* Giá trị <percentage> */
background-position-x: 25%;

/* Giá trị <length> */
background-position-x: 0px;
background-position-x: 1cm;
background-position-x: 8em;

/* Giá trị tương đối theo cạnh */
background-position-x: right 3px;
background-position-x: left 25%;

/* Nhiều giá trị */
background-position-x: 0px, center;

/* Giá trị toàn cục */
background-position-x: inherit;
background-position-x: initial;
background-position-x: revert;
background-position-x: revert-layer;
background-position-x: unset;
```

Thuộc tính `background-position-x` được chỉ định bằng một hoặc nhiều giá trị, phân cách bằng dấu phẩy.

### Giá trị

- `left`
  - : Căn cạnh trái của ảnh nền với cạnh trái của lớp vị trí nền.
- `center`
  - : Căn giữa ảnh nền với giữa lớp vị trí nền.
- `right`
  - : Căn cạnh phải của ảnh nền với cạnh phải của lớp vị trí nền.
- {{cssxref("&lt;length&gt;")}}
  - : Offset của cạnh dọc trái của ảnh nền được cho từ cạnh dọc trái của lớp vị trí nền. (Một số trình duyệt cho phép gán cạnh phải để offset).
- {{cssxref("&lt;percentage&gt;")}}
  - : Offset của vị trí ngang của ảnh nền được cho tương đối so với container. Giá trị 0% có nghĩa là cạnh trái của ảnh nền được căn với cạnh trái của container, và giá trị 100% có nghĩa là cạnh _phải_ của ảnh nền được căn với cạnh _phải_ của container, vì vậy giá trị 50% căn giữa theo chiều ngang ảnh nền.

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
- {{cssxref("background-position-y")}}
- [Sử dụng nhiều nền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds)
