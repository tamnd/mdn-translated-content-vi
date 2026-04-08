---
title: scale3d()
slug: Web/CSS/Reference/Values/transform-function/scale3d
page-type: css-function
browser-compat: css.types.transform-function.scale3d
sidebar: cssref
---

Hàm **`scale3d()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) định nghĩa một phép biến đổi thay đổi kích thước phần tử trong không gian 3D. Vì lượng tỉ lệ được xác định bởi vectơ [sx, sy, sz], nó có thể thay đổi kích thước theo các chiều khác nhau với các tỉ lệ khác nhau. Kết quả của hàm là kiểu dữ liệu {{cssxref("&lt;transform-function&gt;")}}.

{{InteractiveExample("CSS Demo: scale3d()")}}

```css interactive-example-choice
transform: scale3d(1, 1, 1);
```

```css interactive-example-choice
transform: scale3d(1.3, 1.3, 1.3);
```

```css interactive-example-choice
transform: scale3d(0.5, 1, 1.7);
```

```css interactive-example-choice
transform: scale3d(-1.4, 0.4, 0.7);
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

Phép biến đổi tỉ lệ này được đặc trưng bởi một vectơ ba chiều. Tọa độ của nó xác định lượng tỉ lệ thực hiện theo mỗi chiều. Nếu cả ba tọa độ bằng nhau, tỉ lệ là đồng đều (_đẳng hướng_) và {{glossary("aspect ratio")}} của phần tử được giữ nguyên (đây là [phép biến đổi đồng dạng](https://en.wikipedia.org/wiki/Homothetic_transformation)).

Khi giá trị tọa độ nằm ngoài phạm vi \[-1, 1], phần tử lớn ra theo chiều đó; khi nằm bên trong, nó thu nhỏ lại. Nếu giá trị âm, kết quả là [phép đối xứng qua điểm](https://en.wikipedia.org/wiki/Point_reflection) theo chiều đó. Giá trị 1 không có tác dụng.

## Cú pháp

```css
scale3d(sx, sy, sz)
```

### Giá trị

- `sx`
  - : Là {{cssxref("&lt;number&gt;")}} biểu thị hoành độ (nằm ngang, thành phần x) của vectơ tỉ lệ.
- `sy`
  - : Là {{cssxref("&lt;number&gt;")}} biểu thị tung độ (thẳng đứng, thành phần y) của vectơ tỉ lệ.
- `sz`
  - : Là {{cssxref("&lt;number&gt;")}} biểu thị thành phần z của vectơ tỉ lệ.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col"><a href="/vi/docs/Web/CSS/Reference/Values/transform-function#cartesian_coordinates">Tọa độ Descartes</a> trên <a href="https://en.wikipedia.org/wiki/Real_coordinate_space">ℝ^2</a></th>
      <th scope="col"><a href="https://en.wikipedia.org/wiki/Homogeneous_coordinates">Tọa độ đồng nhất</a> trên <a href="https://en.wikipedia.org/wiki/Real_projective_plane">ℝℙ^2</a></th>
      <th scope="col">Tọa độ Descartes trên <a href="https://en.wikipedia.org/wiki/Real_coordinate_space">ℝ^3</a></th>
      <th scope="col">Tọa độ đồng nhất trên <a href="https://en.wikipedia.org/wiki/Real_projective_space">ℝℙ^3</a></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        Phép biến đổi này áp dụng cho không gian 3D và không thể biểu diễn trên mặt phẳng.
      </td>
      <td>
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mi>sx</mi></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mi>sy</mi></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mi>sz</mi></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{ccc} sx & 0 & 0 \\ 0 & sy & 0 \\ 0 & 0 & sz \end{array} \right)</annotation></semantics>
        </math>
      </td>
      <td>
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mi>sx</mi></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mi>sy</mi></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mi>sz</mi></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{cccc} sx & 0 & 0 & 0 \\ 0 & sy & 0 & 0 \\ 0 & 0 & sz & 0 \\ 0 & 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Không thay đổi gốc tọa độ

#### HTML

```html
<div>Normal</div>
<div class="scaled">Scaled</div>
```

#### CSS

```css
div {
  width: 80px;
  height: 80px;
  background-color: skyblue;
}

.scaled {
  transform: perspective(500px) scale3d(2, 0.7, 0.2) translateZ(100px);
  background-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample("Without_changing_the_origin","200","200")}}

### Dịch chuyển gốc của phép biến đổi

#### HTML

```html
<div>Normal</div>
<div class="scaled">Scaled</div>
```

#### CSS

```css
div {
  width: 80px;
  height: 80px;
  background-color: skyblue;
}

.scaled {
  transform: perspective(500px) scale3d(2, 0.7, 0.2) translateZ(100px);
  transform-origin: left;
  background-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample("Translating_the_origin_of_the_transformation","200","200")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("transform")}}
- {{cssxref("&lt;transform-function&gt;")}}
- [`scaleZ()`](/vi/docs/Web/CSS/Reference/Values/transform-function/scaleZ)
- [`translate3d()`](/vi/docs/Web/CSS/Reference/Values/transform-function/translate3d)
- [`rotate3d()`](/vi/docs/Web/CSS/Reference/Values/transform-function/rotate3d)
- Các thuộc tính biến đổi riêng lẻ:
  - {{cssxref("translate")}}
  - {{cssxref("scale")}}
  - {{cssxref("rotate")}}
