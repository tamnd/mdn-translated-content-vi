---
title: background-origin
slug: Web/CSS/Reference/Properties/background-origin
page-type: css-property
browser-compat: css.properties.background-origin
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`background-origin`** đặt điểm gốc của nền: từ đầu viền, bên trong viền, hoặc bên trong padding.

Lưu ý rằng `background-origin` bị bỏ qua khi {{cssxref("background-attachment")}} là `fixed`.

{{InteractiveExample("CSS Demo: background-origin")}}

```css interactive-example-choice
background-origin: border-box;
background-repeat: no-repeat;
```

```css interactive-example-choice
background-origin: padding-box;
background-repeat: no-repeat;
```

```css interactive-example-choice
background-origin: content-box;
background-repeat: no-repeat;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">This is the content of the element.</div>
</section>
```

```css interactive-example
#example-element {
  background-image: url("/shared-assets/images/examples/leopard.jpg");
  color: #d73611;
  text-shadow: 2px 2px black;
  padding: 20px;
  border: 10px dashed #333333;
  font-size: 2em;
  font-weight: bold;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
background-origin: border-box;
background-origin: padding-box;
background-origin: content-box;

/* Giá trị toàn cục */
background-origin: inherit;
background-origin: initial;
background-origin: revert;
background-origin: revert-layer;
background-origin: unset;
```

Thuộc tính `background-origin` được chỉ định bằng một trong các giá trị từ khóa được liệt kê bên dưới.

### Giá trị

- `border-box`
  - : Nền được định vị tương đối so với hộp viền.
- `padding-box`
  - : Nền được định vị tương đối so với hộp padding. Giá trị mặc định.
- `content-box`
  - : Nền được định vị tương đối so với hộp nội dung.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt điểm gốc nền

```css
.example {
  border: 10px double;
  padding: 10px;
  background: url("image.jpg");
  background-position: center left;
  background-origin: content-box;
}
```

```css
#example2 {
  border: 4px solid black;
  padding: 10px;
  background: url("image.gif");
  background-repeat: no-repeat;
  background-origin: border-box;
}
```

```css
div {
  background-image:
    url("logo.jpg"), url("main-back.png"); /* Áp dụng hai ảnh cho nền */
  background-position:
    top right,
    0px 0px;
  background-origin: content-box, padding-box;
}
```

### Sử dụng hai gradient

Trong ví dụ này, hộp có viền chấm dày. Gradient đầu tiên sử dụng `padding-box` làm `background-origin` và do đó nền nằm bên trong viền. Gradient thứ hai sử dụng `content-box` nên chỉ hiển thị phía sau nội dung.

```css
.box {
  margin: 10px 0;
  color: white;
  background:
    linear-gradient(
      90deg,
      rgb(131 58 180 / 100%) 0%,
      rgb(253 29 29 / 60%) 60%,
      rgb(252 176 69 / 100%) 100%
    ),
    radial-gradient(circle, white 0%, black 28%);
  border: 20px dashed black;
  padding: 20px;
  width: 400px;
  background-origin: padding-box, content-box;
  background-repeat: no-repeat;
}
```

```html
<div class="box">Hello!</div>
```

{{EmbedLiveSample('Using_two_gradients', 420, 140)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("background-clip")}}
