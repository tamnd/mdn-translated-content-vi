---
title: scaleX()
slug: Web/CSS/Reference/Values/transform-function/scaleX
page-type: css-function
browser-compat: css.types.transform-function.scaleX
sidebar: cssref
---

Hàm **`scaleX()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) định nghĩa một phép biến đổi thay đổi kích thước phần tử dọc theo trục x (nằm ngang). Kết quả của hàm là kiểu dữ liệu {{cssxref("&lt;transform-function&gt;")}}.

{{InteractiveExample("CSS Demo: scaleX()")}}

```css interactive-example-choice
transform: scaleX(1);
```

```css interactive-example-choice
transform: scaleX(0.7);
```

```css interactive-example-choice
transform: scaleX(1.3);
```

```css interactive-example-choice
transform: scaleX(-0.5);
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

Hàm sửa đổi hoành độ (nằm ngang, tọa độ x) của mỗi điểm phần tử theo một hệ số không đổi, ngoại trừ khi hệ số tỉ lệ là 1, trong trường hợp đó hàm là phép biến đổi đồng nhất. Tỉ lệ không đẳng hướng, và các góc của phần tử thường không được bảo toàn, ngoại trừ bội số của 90 độ.
`scaleX(-1)` định nghĩa [đối xứng trục](https://en.wikipedia.org/wiki/Axial_symmetry), với trục thẳng đứng đi qua gốc tọa độ (như được chỉ định bởi thuộc tính {{cssxref("transform-origin")}}).

> [!NOTE]
> `scaleX(sx)` tương đương với
> `scale(sx, 1)` hoặc
> `scale3d(sx, 1, 1)`.

## Cú pháp

```css
scaleX(s)
```

### Giá trị

- `s`
  - : Là {{cssxref("&lt;number&gt;")}} biểu thị hệ số tỉ lệ áp dụng lên hoành độ (nằm ngang, tọa độ x) của mỗi điểm của phần tử.

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
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mi>s</mi></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{cc} s & 0 \\ 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
      <td>
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mi>s</mi></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{ccc} s & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
      <td rowspan="2">
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mi>s</mi></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{ccc} s & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
      <td rowspan="2">
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mi>s</mi></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{cccc} s & 0 & 0 & 0 \\ 0 & 1 & 0 & 0 \\ 0 & 0 & 1 & 0 \\ 0 & 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
    </tr>
    <tr>
      <td><code>[s 0 0 1 0 0]</code></td>
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
  transform: scaleX(0.6);
  background-color: pink;
}
```

### Kết quả

{{EmbedLiveSample("Examples","200","200")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`scaleY()`](/vi/docs/Web/CSS/Reference/Values/transform-function/scaleY)
- [`scaleZ()`](/vi/docs/Web/CSS/Reference/Values/transform-function/scaleZ)
- {{cssxref("transform")}}
- {{cssxref("scale")}}
- {{cssxref("&lt;transform-function&gt;")}}
- {{cssxref("transform-origin")}}
- Các thuộc tính biến đổi riêng lẻ khác:
  - {{cssxref("translate")}}
  - {{cssxref("rotate")}}
  - Lưu ý: không có thuộc tính `skew`
