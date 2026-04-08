---
title: rotate3d()
slug: Web/CSS/Reference/Values/transform-function/rotate3d
page-type: css-function
browser-compat: css.types.transform-function.rotate3d
sidebar: cssref
---

Hàm **`rotate3d()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) định nghĩa một phép biến đổi xoay một phần tử quanh
một trục cố định trong không gian 3D mà không làm biến dạng nó. Kết quả của nó là kiểu dữ liệu {{cssxref("&lt;transform-function&gt;")}}.

{{InteractiveExample("CSS Demo: rotate3d()")}}

```css interactive-example-choice
transform: rotate3d(0, 0, 0, 0);
```

```css interactive-example-choice
transform: rotate3d(1, 1, 1, 45deg);
```

```css interactive-example-choice
transform: rotate3d(2, -1, -1, -0.2turn);
```

```css interactive-example-choice
transform: rotate3d(0, 1, 0.5, 3.142rad);
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
  perspective: 550px;
}

#example-element {
  width: 100px;
  height: 100px;
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

Trong không gian 3D, phép quay có ba bậc tự do, cùng nhau mô tả một trục quay duy nhất. Trục quay được xác định bởi một vector \[x, y, z] và đi qua gốc tọa độ (như được xác định bởi thuộc tính {{ cssxref("transform-origin") }}). Nếu, như đã chỉ định, vector không được _chuẩn hóa_ (tức là tổng bình phương ba tọa độ của nó không bằng 1), {{glossary("user agent")}} sẽ chuẩn hóa nó nội bộ. Một vector không thể chuẩn hóa, như vector không \[0, 0, 0], sẽ khiến phép quay bị bỏ qua nhưng không làm mất hiệu lực toàn bộ thuộc tính CSS.

> [!NOTE]
> Không giống như phép quay trên mặt phẳng 2D, phép hợp thành của các phép quay 3D thường
> không có tính giao hoán. Nói cách khác, thứ tự áp dụng các phép quay ảnh hưởng đến kết quả.

## Cú pháp

```css
rotate3d(x, y, z, a)
```

### Giá trị

- `x`
  - : Là một {{cssxref("&lt;number&gt;")}} mô tả tọa độ x của vector biểu thị trục quay, có thể là số dương hoặc âm.
- `y`
  - : Là một {{cssxref("&lt;number&gt;")}} mô tả tọa độ y của vector biểu thị trục quay, có thể là số dương hoặc âm.
- `z`
  - : Là một {{cssxref("&lt;number&gt;")}} mô tả tọa độ z của vector biểu thị trục quay, có thể là số dương hoặc âm.
- `a`
  - : Là một {{ cssxref("&lt;angle&gt;") }} biểu thị góc quay. Góc dương biểu thị xoay theo chiều kim đồng hồ, góc âm biểu thị xoay ngược chiều kim đồng hồ.

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="col"><a href="/vi/docs/Web/CSS/Reference/Values/transform-function#cartesian_coordinates">Tọa độ Descartes</a> trên <a href="https://en.wikipedia.org/wiki/Real_coordinate_space">ℝ^2</a></th>
      <td rowspan="2">
        Phép biến đổi này áp dụng cho không gian 3D và không thể biểu diễn trên mặt phẳng.
      </td>
    </tr>
    <tr>
      <th scope="col"><a href="https://en.wikipedia.org/wiki/Homogeneous_coordinates">Tọa độ thuần nhất</a> trên <a href="https://en.wikipedia.org/wiki/Real_projective_plane">ℝℙ^2</a></th>
    </tr>
    <tr>
      <th scope="col">Tọa độ Descartes trên <a href="https://en.wikipedia.org/wiki/Real_coordinate_space">ℝ^3</a></th>
      <td>
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable displaystyle="false" rowspacing="0.5ex"><mtr><mtd><mn>1</mn><mo>+</mo><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo><mo stretchy="false">(</mo><msup><mi>x</mi><mn>2</mn></msup><mo>−</mo><mn>1</mn><mo stretchy="false">)</mo></mtd><mtd><mi>z</mi><mo>⋅</mo><mo lspace="0em" rspace="0em">sin</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo>+</mo><mi>x</mi><mi>y</mi><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo></mtd><mtd><mo>−</mo><mi>y</mi><mo>⋅</mo><mo lspace="0em" rspace="0em">sin</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo>+</mo><mi>x</mi><mi>z</mi><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo></mtd></mtr><mtr><mtd><mo>−</mo><mi>z</mi><mo>⋅</mo><mo lspace="0em" rspace="0em">sin</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo>+</mo><mi>x</mi><mi>y</mi><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo></mtd><mtd><mn>1</mn><mo>+</mo><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo><mo stretchy="false">(</mo><msup><mi>y</mi><mn>2</mn></msup><mo>−</mo><mn>1</mn><mo stretchy="false">)</mo></mtd><mtd><mi>x</mi><mo>⋅</mo><mo lspace="0em" rspace="0em">sin</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo>+</mo><mi>y</mi><mi>z</mi><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo></mtd></mtr><mtr><mtd><mi>y</mi><mo>⋅</mo><mo lspace="0em" rspace="0em">sin</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo>+</mo><mi>x</mi><mi>z</mi><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo></mtd><mtd><mo>−</mo><mi>x</mi><mo>⋅</mo><mo lspace="0em" rspace="0em">sin</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo>+</mo><mi>y</mi><mi>z</mi><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo></mtd><mtd><mn>1</mn><mo>+</mo><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo><mo stretchy="false">(</mo><msup><mi>z</mi><mn>2</mn></msup><mo>−</mo><mn>1</mn><mo stretchy="false">)</mo></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\begin{pmatrix}1 + (1 - \cos(a))(x^2 - 1) & z\cdot \sin(a) + xy(1 - \cos(a)) & -y\cdot \sin(a) + xz(1 - \cos(a))\\-z\cdot \sin(a) + xy(1 - \cos(a)) & 1 + (1 - \cos(a))(y^2 - 1) & x\cdot \sin(a) + yz(1 - \cos(a))\\y\cdot \sin(a) + xz(1 - \cos(a)) & -x\cdot \sin(a) + yz(1 - \cos(a)) & 1 + (1 - \cos(a))(z^2 - 1)\end{pmatrix}</annotation></semantics>
        </math>
      </td>
    </tr>
    <tr>
      <th scope="col">Tọa độ thuần nhất trên <a href="https://en.wikipedia.org/wiki/Real_projective_space">ℝℙ^3</a></th>
      <td>
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable displaystyle="false" rowspacing="0.5ex"><mtr><mtd><mn>1</mn><mo>+</mo><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo><mo stretchy="false">(</mo><msup><mi>x</mi><mn>2</mn></msup><mo>−</mo><mn>1</mn><mo stretchy="false">)</mo></mtd><mtd><mi>z</mi><mo>⋅</mo><mo lspace="0em" rspace="0em">sin</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo>+</mo><mi>x</mi><mi>y</mi><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo></mtd><mtd><mo>−</mo><mi>y</mi><mo>⋅</mo><mo lspace="0em" rspace="0em">sin</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo>+</mo><mi>x</mi><mi>z</mi><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mo>−</mo><mi>z</mi><mo>⋅</mo><mo lspace="0em" rspace="0em">sin</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo>+</mo><mi>x</mi><mi>y</mi><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo></mtd><mtd><mn>1</mn><mo>+</mo><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo><mo stretchy="false">(</mo><msup><mi>y</mi><mn>2</mn></msup><mo>−</mo><mn>1</mn><mo stretchy="false">)</mo></mtd><mtd><mi>x</mi><mo>⋅</mo><mo lspace="0em" rspace="0em">sin</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo>+</mo><mi>y</mi><mi>z</mi><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mi>y</mi><mo>⋅</mo><mo lspace="0em" rspace="0em">sin</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo>+</mo><mi>x</mi><mi>z</mi><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo></mtd><mtd><mo>−</mo><mi>x</mi><mo>⋅</mo><mo lspace="0em" rspace="0em">sin</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo>+</mo><mi>y</mi><mi>z</mi><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo></mtd><mtd><mn>1</mn><mo>+</mo><mo stretchy="false">(</mo><mn>1</mn><mo>−</mo><mo lspace="0em" rspace="0em">cos</mo><mo stretchy="false">(</mo><mi>a</mi><mo stretchy="false">)</mo><mo stretchy="false">)</mo><mo stretchy="false">(</mo><msup><mi>z</mi><mn>2</mn></msup><mo>−</mo><mn>1</mn><mo stretchy="false">)</mo></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\begin{pmatrix}1 + (1 - \cos(a))(x^2 - 1) & z\cdot \sin(a) + xy(1 - \cos(a)) & -y\cdot \sin(a) + xz(1 - \cos(a)) & 0\\-z\cdot \sin(a) + xy(1 - \cos(a)) & 1 + (1 - \cos(a))(y^2 - 1) & x\cdot \sin(a) + yz(1 - \cos(a)) & 0\\y\cdot \sin(a) + xz(1 - \cos(a)) & -x\cdot \sin(a) + yz(1 - \cos(a)) & 1 + (1 - \cos(a))(z^2 - 1) & 0\\0 & 0 & 0 & 1\end{pmatrix}</annotation></semantics>
        </math>
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Xoay theo trục y

#### HTML

```html
<div>Bình thường</div>
<div class="rotated">Đã xoay</div>
```

#### CSS

```css
body {
  perspective: 800px;
}

div {
  width: 80px;
  height: 80px;
  background-color: skyblue;
}

.rotated {
  transform: rotate3d(0, 1, 0, 60deg);
  background-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample("Rotating_on_the_y-axis", "auto", 180)}}

### Xoay theo trục tùy chỉnh

#### HTML

```html
<div>Bình thường</div>
<div class="rotated">Đã xoay</div>
```

#### CSS

```css
body {
  perspective: 800px;
}

div {
  width: 80px;
  height: 80px;
  background-color: skyblue;
}

.rotated {
  transform: rotate3d(1, 2, -1, 192deg);
  background-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample("Rotating_on_a_custom_axis", "auto", 180)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{cssxref("transform")}}
- Thuộc tính {{cssxref("rotate")}}
- {{cssxref("&lt;transform-function&gt;")}}
