---
title: border-image-source
slug: Web/CSS/Reference/Properties/border-image-source
page-type: css-property
browser-compat: css.properties.border-image-source
sidebar: cssref
---

Thuộc tính **`border-image-source`** [CSS](/en-US/docs/Web/CSS) đặt hình ảnh nguồn được sử dụng để tạo [hình ảnh đường viền](/en-US/docs/Web/CSS/Reference/Properties/border-image) của phần tử.

Thuộc tính {{cssxref("border-image-slice")}} được sử dụng để chia hình ảnh nguồn thành các vùng, sau đó được áp dụng động vào hình ảnh đường viền cuối cùng.

{{InteractiveExample("CSS Demo: border-image-source")}}

```css interactive-example-choice
border-image-source: url("/shared-assets/images/examples/border-diamonds.png");
```

```css interactive-example-choice
border-image-source: url("/shared-assets/images/examples/border-stars.png");
```

```css interactive-example-choice
border-image-source: repeating-linear-gradient(
  45deg,
  transparent,
  #4d9f0c 20px
);
```

```css interactive-example-choice
border-image-source: none;
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
/* Giá trị từ khóa */
border-image-source: none;

/* Giá trị <image> */
border-image-source: url("image.jpg");
border-image-source: linear-gradient(to top, red, yellow);

/* Giá trị toàn cục */
border-image-source: inherit;
border-image-source: initial;
border-image-source: revert;
border-image-source: revert-layer;
border-image-source: unset;
```

### Giá trị

- `none`
  - : Không sử dụng hình ảnh đường viền. Thay vào đó, giao diện được xác định bởi {{cssxref("border-style")}} sẽ được hiển thị.
- {{cssxref("image")}}
  - : Tham chiếu hình ảnh để sử dụng cho đường viền.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

```css
.box {
  border-image-source: url("image.png");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("border")}}
- {{cssxref("outline")}}
- {{cssxref("box-shadow")}}
- {{cssxref("background-image")}}
- {{cssxref("url_value", "&lt;url&gt;")}} type
- [Border images in CSS: A key focus area for Interop 2023](/en-US/blog/border-images-interop-2023/) trên blog MDN (2023)
