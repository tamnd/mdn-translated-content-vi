---
title: scaleY()
slug: Web/CSS/Reference/Values/transform-function/scaleY
page-type: css-function
browser-compat: css.types.transform-function.scaleY
sidebar: cssref
---

Hàm **`scaleY()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) định nghĩa một phép biến đổi thay đổi kích thước phần tử dọc theo trục y (thẳng đứng). Kết quả của hàm là kiểu dữ liệu {{cssxref("&lt;transform-function&gt;")}}.

{{InteractiveExample("CSS Demo: scaleY()")}}

```css interactive-example-choice
transform: scaleY(1);
```

```css interactive-example-choice
transform: scaleY(0.7);
```

```css interactive-example-choice
transform: scaleY(1.3);
```

```css interactive-example-choice
transform: scaleY(-0.5);
```

```html interactive-example
<section id="default-example">
  <img
    class="transition-all"
    id="example-element"
    src="/shared-assets/images/examples/firefox-logo.svg"
    width="200" />
</section>
```

Hàm sửa đổi tung độ (thẳng đứng, tọa độ y) của mỗi điểm phần tử theo một hệ số không đổi, ngoại trừ khi hệ số tỉ lệ là 1, trong trường hợp đó hàm là phép biến đổi đồng nhất. Tỉ lệ không đẳng hướng, và các góc của phần tử không được bảo toàn.
`scaleY(-1)` định nghĩa [đối xứng trục](https://en.wikipedia.org/wiki/Axial_symmetry), với trục nằm ngang đi qua gốc tọa độ (như được chỉ định bởi thuộc tính {{cssxref("transform-origin")}}).

> [!NOTE]
> `scaleY(sy)` tương đương với
> `scale(1, sy)` hoặc
> `scale3d(1, sy, 1)`.
>
> `transform: rotateX(180deg);` === `transform: scaleY(-1);`

## Cú pháp

```css
scaleY(s)
```

### Giá trị

- `s`
  - : Là {{cssxref("&lt;number&gt;")}} biểu thị hệ số tỉ lệ áp dụng lên tung độ (thẳng đứng, tọa độ y) của mỗi điểm của phần tử.

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
      <td rowspan="2">
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mi>s</mi></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{cc} 1 & 0 \\ 0 & s \end{array} \right)</annotation></semantics>
        </math>
      </td>
      <td>
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mi>s</mi></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{ccc} 1 & 0 & 0 \\ 0 & s & 0 \\ 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
      <td rowspan="2">
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mi>s</mi></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{ccc} 1 & 0 & 0 \\ 0 & s & 0 \\ 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
      <td rowspan="2">
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mi>s</mi></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{cccc} 1 & 0 & 0 & 0 \\ 0 & s & 0 & 0 \\ 0 & 0 & 1 & 0 \\ 0 & 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
    </tr>
    <tr>
      <td><code>[1 0 0 s 0 0]</code></td>
    </tr>
  </tbody>
</table>

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### HTML

```html
<div>Normal</div>
<div class="scaled">Scaled</div>
```

### CSS

```css
div {
  width: 80px;
  height: 80px;
  background-color: skyblue;
}

.scaled {
  transform: scaleY(0.6);
  background-color: pink;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 200, 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`scaleX()`](/vi/docs/Web/CSS/Reference/Values/transform-function/scaleX)
- [`scaleZ()`](/vi/docs/Web/CSS/Reference/Values/transform-function/scaleZ)
- {{cssxref("transform")}}
- {{cssxref("&lt;transform-function&gt;")}}
- {{cssxref("transform-origin")}}
- Các thuộc tính biến đổi riêng lẻ:
  - {{cssxref("translate")}}
  - {{cssxref("scale")}}
  - {{cssxref("rotate")}}
  - Lưu ý: không có thuộc tính `skew`
