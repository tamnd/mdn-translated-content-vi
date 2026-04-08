---
title: backface-visibility
slug: Web/CSS/Reference/Properties/backface-visibility
page-type: css-property
browser-compat: css.properties.backface-visibility
sidebar: cssref
---

Thuộc tính **`backface-visibility`** [CSS](/en-US/docs/Web/CSS) xác định xem mặt sau của phần tử có hiển thị khi quay về phía người dùng hay không.

Mặt sau của phần tử là hình ảnh phản chiếu của mặt trước. Dù vô hình trong 2D, mặt sau có thể trở nên hiển thị khi một phép biến đổi khiến phần tử xoay trong không gian 3D. (Thuộc tính này không có hiệu ứng trên các phép biến đổi 2D, vốn không có phối cảnh.)

{{InteractiveExample("CSS Demo: backface-visibility")}}

```css interactive-example-choice
backface-visibility: visible;
```

```css interactive-example-choice
backface-visibility: hidden;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div id="example-element">
    <div class="face front">1</div>
    <div class="face back">2</div>
    <div class="face right">3</div>
    <div class="face bottom">6</div>
  </div>
</section>
```

```css interactive-example
#default-example {
  background: linear-gradient(skyblue, khaki);
}

#example-element {
  width: 100px;
  height: 100px;
  perspective: 550px;
  perspective-origin: 220% 220%;
  transform-style: preserve-3d;
}

.face {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
  position: absolute;
  backface-visibility: inherit;
  background: rgb(0 0 0 / 0.4);
  font-size: 60px;
  color: white;
}

.front {
  transform: translateZ(50px);
}

.back {
  background: rgb(230 0 0);
  color: white;
  transform: rotateY(180deg) translateZ(50px);
}

.right {
  background: rgb(0 0 0 / 0.6);
  transform: rotateY(90deg) translateZ(50px);
}

.bottom {
  background: rgb(0 0 0 / 0.6);
  transform: rotateX(-90deg) translateZ(50px);
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
backface-visibility: visible;
backface-visibility: hidden;

/* Giá trị toàn cục */
backface-visibility: inherit;
backface-visibility: initial;
backface-visibility: revert;
backface-visibility: revert-layer;
backface-visibility: unset;
```

Thuộc tính `backface-visibility` được chỉ định là một trong các từ khóa liệt kê dưới đây.

### Giá trị

- `visible`
  - : Mặt sau hiển thị khi quay về phía người dùng.
- `hidden`
  - : Mặt sau bị ẩn, thực chất làm phần tử vô hình khi quay ra xa người dùng.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Khối lập phương với các mặt trong suốt và mờ đục

Ví dụ này minh họa khối lập phương với các mặt trong suốt và một khối với các mặt mờ đục.

#### HTML

```html
<table>
  <thead>
    <tr>
      <th><code>backface-visibility: visible;</code></th>
      <th><code>backface-visibility: hidden;</code></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <div class="container">
          <div class="cube show-bf">
            <div class="face front">1</div>
            <div class="face back">2</div>
            <div class="face right">3</div>
            <div class="face left">4</div>
            <div class="face top">5</div>
            <div class="face bottom">6</div>
          </div>
        </div>
        <p>
          Since all faces are partially transparent, the back faces (2, 4, 5)
          are visible through the front faces (1, 3, 6).
        </p>
      </td>
      <td>
        <div class="container">
          <div class="cube hide-bf">
            <div class="face front">1</div>
            <div class="face back">2</div>
            <div class="face right">3</div>
            <div class="face left">4</div>
            <div class="face top">5</div>
            <div class="face bottom">6</div>
          </div>
        </div>
        <p>The three back faces (2, 4, 5) are hidden.</p>
      </td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
/* Classes that will show or hide the
   three back faces of the "cube" */
.show-bf div {
  backface-visibility: visible;
}

.hide-bf div {
  backface-visibility: hidden;
}

/* Define the container div, the cube div, and a generic face */
.container {
  width: 150px;
  height: 150px;
  margin: 75px 0 0 75px;
  border: none;
}

.cube {
  width: 100%;
  height: 100%;
  perspective: 550px;
  perspective-origin: 150% 150%;
  transform-style: preserve-3d;
}

.face {
  display: block;
  position: absolute;
  width: 100px;
  height: 100px;
  border: none;
  line-height: 100px;
  font-family: sans-serif;
  font-size: 60px;
  color: white;
  text-align: center;
}

/* Define each face based on direction */
.front {
  background: rgb(0 0 0 / 30%);
  transform: translateZ(50px);
}

.back {
  background: lime;
  color: black;
  transform: rotateY(180deg) translateZ(50px);
}

.right {
  background: rgb(196 0 0 / 70%);
  transform: rotateY(90deg) translateZ(50px);
}

.left {
  background: rgb(0 0 196 / 70%);
  transform: rotateY(-90deg) translateZ(50px);
}

.top {
  background: rgb(196 196 0 / 70%);
  transform: rotateX(90deg) translateZ(50px);
}

.bottom {
  background: rgb(196 0 196 / 70%);
  transform: rotateX(-90deg) translateZ(50px);
}

/* Make the table a little nicer */
th,
p,
td {
  background-color: #eeeeee;
  margin: 0px;
  padding: 6px;
  font-family: sans-serif;
  text-align: left;
}
```

#### Kết quả

{{EmbedLiveSample('Cube_with_transparent_and_opaque_faces', '100%', 360)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using)
