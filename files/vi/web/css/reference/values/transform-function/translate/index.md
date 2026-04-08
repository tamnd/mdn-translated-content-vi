---
title: translate()
slug: Web/CSS/Reference/Values/transform-function/translate
page-type: css-function
browser-compat: css.types.transform-function.translate
sidebar: cssref
---

Hàm **`translate()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) định vị lại một phần tử theo hướng ngang và/hoặc
dọc. Kết quả của nó là kiểu dữ liệu {{cssxref("&lt;transform-function&gt;")}}.

{{InteractiveExample("CSS Demo: translate()")}}

```css interactive-example-choice
transform: translate(0);
```

```css interactive-example-choice
transform: translate(42px, 18px);
```

```css interactive-example-choice
transform: translate(-2.1rem, -2ex);
```

```css interactive-example-choice
transform: translate(3ch, 3mm);
```

```html interactive-example
<section id="default-example">
  <img
    class="transition-all"
    id="static-element"
    src="/shared-assets/images/examples/firefox-logo.svg"
    width="200" />
  <img
    class="transition-all"
    id="example-element"
    src="/shared-assets/images/examples/firefox-logo.svg"
    width="200" />
</section>
```

```css interactive-example
#static-element {
  opacity: 0.4;
  position: absolute;
}

#example-element {
  position: absolute;
}
```

Phép biến đổi này được đặc trưng bởi một vector hai chiều [tx, ty]. Các tọa độ của nó xác định phần tử di chuyển bao nhiêu
theo mỗi hướng.

## Cú pháp

```css
/* Single <length-percentage> values */
transform: translate(200px);
transform: translate(50%);

/* Double <length-percentage> values */
transform: translate(100px, 200px);
transform: translate(100px, 50%);
transform: translate(30%, 200px);
transform: translate(30%, 50%);
```

### Giá trị

- Giá trị `<length-percentage>` đơn
  - : Giá trị này là một {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} biểu thị hoành độ
    (ngang, thành phần x) của vector dịch chuyển [tx, 0]. Tung độ (dọc, thành phần y) của vector dịch chuyển
    sẽ được đặt thành `0`. Ví dụ, `translate(2px)` tương đương với
    `translate(2px, 0)`. Giá trị phần trăm tham chiếu đến chiều rộng của hộp tham chiếu được xác định bởi
    thuộc tính {{cssxref("transform-box")}}.
- Giá trị `<length-percentage>` kép
  - : Giá trị này mô tả hai giá trị {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} biểu thị
    cả hoành độ (ngang, thành phần x) và tung độ (dọc, thành phần y) của vector dịch chuyển [tx, ty]. Giá trị phần trăm thứ nhất
    tham chiếu đến chiều rộng, giá trị thứ hai tham chiếu đến chiều cao của hộp tham chiếu được xác định bởi
    thuộc tính {{cssxref("transform-box")}}.

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
      <td rowspan="2">
        <p>
          Phép dịch chuyển không phải là phép biến đổi tuyến tính trong ℝ^2 và không thể biểu diễn bằng ma trận tọa độ Descartes.
        </p>
      </td>
      <td>
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mi>tx</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mi>ty</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{ccc} 1 & 0 & tx \\ 0 & 1 & ty \\ 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
      <td rowspan="2">
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mi>tx</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mi>ty</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{ccc} 1 & 0 & tx \\ 0 & 1 & ty \\ 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
      <td rowspan="2">
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mi>tx</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mi>ty</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{cccc} 1 & 0 & 0 & tx \\ 0 & 1 & 0 & ty \\ 0 & 0 & 1 & 0 \\ 0 & 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
    </tr>
    <tr>
      <td><code>[1 0 0 1 tx ty]</code></td>
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
  /* Equal to: translateX(10px) or translate(10px, 0) */
  transform: translate(10px);
  background-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample("Using_a_single-axis_translation", 250, 250)}}

### Kết hợp dịch chuyển trục y và trục x

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
  transform: translate(10px, 10px);
  background-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample("Combining_y-axis_and_x-axis_translation", 250, 250)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("transform")}}
- {{cssxref("&lt;transform-function&gt;")}}
- {{cssxref("translate")}}
