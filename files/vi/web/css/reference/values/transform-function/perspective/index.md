---
title: perspective()
slug: Web/CSS/Reference/Values/transform-function/perspective
page-type: css-function
browser-compat: css.types.transform-function.perspective
sidebar: cssref
---

Hàm **`perspective()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) định nghĩa một phép biến đổi thiết lập khoảng cách giữa
người dùng và mặt phẳng z=0, tức là góc nhìn phối cảnh từ vị trí người xem nếu giao diện 2 chiều trở thành
3 chiều. Kết quả của nó là kiểu dữ liệu {{cssxref("&lt;transform-function&gt;")}}.

{{InteractiveExample("CSS Demo: perspective()")}}

```css interactive-example-choice
transform: perspective(0);
```

```css interactive-example-choice
transform: perspective(none);
```

```css interactive-example-choice
transform: perspective(800px);
```

```css interactive-example-choice
transform: perspective(23rem);
```

```css interactive-example-choice
transform: perspective(6.5cm);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    <div class="face front">1</div>
    <div class="face back">2</div>
    <div class="face right">3</div>
    <div class="face left">4</div>
    <div class="face top">5</div>
    <div class="face bottom">6</div>
  </div>
</section>
```

```css interactive-example
#default-example {
  background: linear-gradient(skyblue, khaki);
  perspective: 800px;
  perspective-origin: 150% 150%;
}

#example-element {
  width: 100px;
  height: 100px;
  perspective: 550px;
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
  font-size: 60px;
  color: white;
}

.front {
  background: rgb(90 90 90 / 0.7);
  transform: translateZ(50px);
}

.back {
  background: rgb(0 210 0 / 0.7);
  transform: rotateY(180deg) translateZ(50px);
}

.right {
  background: rgb(210 0 0 / 0.7);
  transform: rotateY(90deg) translateZ(50px);
}

.left {
  background: rgb(0 0 210 / 0.7);
  transform: rotateY(-90deg) translateZ(50px);
}

.top {
  background: rgb(210 210 0 / 0.7);
  transform: rotateX(90deg) translateZ(50px);
}

.bottom {
  background: rgb(210 0 210 / 0.7);
  transform: rotateX(-90deg) translateZ(50px);
}
```

Hàm biến đổi `perspective()` là một phần của giá trị {{cssxref('transform')}} được áp dụng trên
phần tử được biến đổi. Điều này khác với thuộc tính {{cssxref('perspective')}} và {{cssxref('perspective-origin')}}
vốn được gắn vào phần tử cha của phần tử con được biến đổi trong không gian 3 chiều.

## Cú pháp

```css
perspective(d)
```

### Giá trị

- _d_
  - : Là một {{cssxref("&lt;length&gt;")}} biểu thị khoảng cách từ người dùng đến mặt phẳng z=0. Mặt phẳng z=0 là mặt phẳng nơi mọi thứ hiện ra trong chế độ xem 2 chiều, hay chính là màn hình. Các giá trị nhỏ hơn `1px` (kể cả không) được kẹp lại về `1px`. Giá trị âm là lỗi cú pháp.

    Các giá trị khác `none` khiến các phần tử có vị trí z dương trông lớn hơn, còn các phần tử có vị trí z âm trông nhỏ hơn. Các phần tử có vị trí z bằng hoặc lớn hơn giá trị phối cảnh sẽ biến mất như thể chúng ở phía sau người dùng. Giá trị phối cảnh lớn đại diện cho phép biến đổi nhỏ; giá trị `perspective()` nhỏ đại diện cho phép biến đổi lớn; `perspective(none)` đại diện cho phối cảnh từ khoảng cách vô hạn và không có biến đổi.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col"><a href="/vi/docs/Web/CSS/Reference/Values/transform-function#cartesian_coordinates">Tọa độ Descartes</a> trên <a href="https://en.wikipedia.org/wiki/Real_coordinate_space">ℝ^2</a></th>
      <th scope="col"><a href="https://en.wikipedia.org/wiki/Homogeneous_coordinates">Tọa độ thuần nhất</a> trên <a href="https://en.wikipedia.org/wiki/Real_projective_plane">ℝℙ^2</a></th>
      <th scope="col">Tọa độ Descartes trên <a href="https://en.wikipedia.org/wiki/Real_coordinate_space">ℝ^3</a></th>
      <th scope="col">Tọa độ thuần nhất trên <a href="https://en.wikipedia.org/wiki/Real_projective_space">ℝℙ^3</a></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <p>
          Phép biến đổi này áp dụng cho không gian 3D và không thể biểu diễn trên mặt phẳng.
        </p>
      </td>
      <td>
        Phép biến đổi này không phải là phép biến đổi tuyến tính trong ℝ^3 và không thể biểu diễn bằng ma trận tọa độ Descartes.
      </td>
      <td>
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mo>−</mo><mn>1</mn><mo>/</mo><mi>d</mi></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{cccc} 1 & 0 & 0 & 0 \\ 0 & 1 & 0 & 0 \\ 0 & 0 & 1 & 0 \\ 0 & 0 & -\frac{1}{d} & 1 \\ \end{array} \right)</annotation></semantics>
        </math>
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### HTML

```html
<p>Không có phối cảnh:</p>
<div class="no-perspective-box">
  <div class="face front">A</div>
  <div class="face top">B</div>
  <div class="face left">C</div>
</div>

<p>Có phối cảnh (9cm):</p>
<div class="perspective-box-far">
  <div class="face front">A</div>
  <div class="face top">B</div>
  <div class="face left">C</div>
</div>

<p>Có phối cảnh (4cm):</p>
<div class="perspective-box-closer">
  <div class="face front">A</div>
  <div class="face top">B</div>
  <div class="face left">C</div>
</div>
```

### CSS

```css
.face {
  position: absolute;
  width: 100px;
  height: 100px;
  line-height: 100px;
  font-size: 100px;
  text-align: center;
}

p + div {
  width: 100px;
  height: 100px;
  transform-style: preserve-3d;
  margin-left: 100px;
}
.no-perspective-box {
  transform: rotateX(-15deg) rotateY(30deg);
}

.perspective-box-far {
  transform: perspective(9cm) rotateX(-15deg) rotateY(30deg);
}

.perspective-box-closer {
  transform: perspective(4cm) rotateX(-15deg) rotateY(30deg);
}

.top {
  background-color: skyblue;
  transform: rotateX(90deg) translate3d(0, 0, 50px);
}

.left {
  background-color: pink;
  transform: rotateY(-90deg) translate3d(0, 0, 50px);
}

.front {
  background-color: limegreen;
  transform: translate3d(0, 0, 50px);
}
```

### Kết quả

{{ EmbedLiveSample('Examples', '250', '350') }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("transform")}}
- {{cssxref("&lt;transform-function&gt;")}}
- Các thuộc tính biến đổi riêng lẻ:
  - {{cssxref("translate")}}
  - {{cssxref("scale")}}
  - {{cssxref("rotate")}}
