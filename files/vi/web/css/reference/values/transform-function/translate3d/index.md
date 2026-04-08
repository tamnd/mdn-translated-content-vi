---
title: translate3d()
slug: Web/CSS/Reference/Values/transform-function/translate3d
page-type: css-function
browser-compat: css.types.transform-function.translate3d
sidebar: cssref
---

Hàm **`translate3d()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) định vị lại một phần tử trong không gian 3D. Kết quả của nó là
kiểu dữ liệu {{cssxref("&lt;transform-function&gt;")}}.

{{InteractiveExample("CSS Demo: translate3d()")}}

```css interactive-example-choice
transform: translate3d(0, 0, 0);
```

```css interactive-example-choice
transform: translate3d(42px, -62px, -135px);
```

```css interactive-example-choice
transform: translate3d(-2.7rem, 0, 1rem);
```

```css interactive-example-choice
transform: translate3d(5ch, 0.4in, 5em);
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

Phép biến đổi này được đặc trưng bởi một vector ba chiều [tx, ty, tz]. Các tọa độ của nó xác định phần tử di chuyển bao nhiêu
theo mỗi hướng.

## Cú pháp

```css
translate3d(tx, ty, tz)
```

### Giá trị

- `tx`
  - : Là một {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} biểu thị hoành độ (ngang, thành phần x) của
    vector dịch chuyển [tx, ty, tz].
- `ty`
  - : Là một {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} biểu thị tung độ (dọc, thành phần y) của
    vector dịch chuyển [tx, ty, tz].
- `tz`
  - : Là một {{cssxref("&lt;length&gt;")}} biểu thị thành phần z của vector dịch chuyển. Nó không thể là
    giá trị {{cssxref("&lt;percentage&gt;")}}; trong trường hợp đó, thuộc tính chứa transform được coi là không hợp lệ [tx, ty, tz].

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
        Phép dịch chuyển không phải là phép biến đổi tuyến tính trong ℝ^3 và không thể biểu diễn bằng ma trận tọa độ Descartes.
      </td>
      <td>
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mi>tx</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mi>ty</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mi>tz</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{cccc} 1 & 0 & 0 & tx \\ 0 & 1 & 0 & ty \\ 0 & 0 & 1 & tz \\ 0 & 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Sử dụng dịch chuyển một trục

#### HTML

```html
<div>Tĩnh</div>
<div class="moved">Đã di chuyển</div>
<div>Tĩnh</div>
```

#### CSS

```css
div {
  width: 60px;
  height: 60px;
  background-color: skyblue;
}

.moved {
  /* Equivalent to perspective(500px) translateX(10px) */
  transform: perspective(500px) translate3d(10px, 0, 0px);
  background-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample("Using_a_single_axis_translation", 250, 250)}}

### Kết hợp dịch chuyển trục z và trục x

#### HTML

```html
<div>Tĩnh</div>
<div class="moved">Đã di chuyển</div>
<div>Tĩnh</div>
```

#### CSS

```css
div {
  width: 60px;
  height: 60px;
  background-color: skyblue;
}

.moved {
  transform: perspective(500px) translate3d(10px, 0, 100px);
  background-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample("Combining_z-axis_and_x-axis_translation", 250, 250)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("transform")}}
- {{cssxref("&lt;transform-function&gt;")}}
- {{cssxref("translate")}}
