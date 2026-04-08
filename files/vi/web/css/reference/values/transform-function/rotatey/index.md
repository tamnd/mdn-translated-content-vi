---
title: rotateY()
slug: Web/CSS/Reference/Values/transform-function/rotateY
page-type: css-function
browser-compat: css.types.transform-function.rotateY
sidebar: cssref
---

Hàm **`rotateY()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) định nghĩa một phép biến đổi xoay một phần tử quanh
trục y (dọc) mà không làm biến dạng nó. Kết quả của nó là kiểu dữ liệu {{cssxref("&lt;transform-function&gt;")}}.

{{InteractiveExample("CSS Demo: rotateY()")}}

```css interactive-example-choice
transform: rotateY(0);
```

```css interactive-example-choice
transform: rotateY(45deg);
```

```css interactive-example-choice
transform: rotateY(-0.2turn);
```

```css interactive-example-choice
transform: rotateY(3.142rad);
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

Trục quay đi qua một gốc tọa độ, được xác định bởi thuộc tính CSS {{ cssxref("transform-origin") }}.

> [!NOTE]
> `rotateY(a)` tương đương với
> `rotate3d(0, 1, 0, a)`.

> [!NOTE]
> Không giống như phép quay trên mặt phẳng 2D, phép hợp thành của các phép quay 3D thường
> không có tính giao hoán. Nói cách khác, thứ tự áp dụng các phép quay ảnh hưởng đến kết quả.

## Cú pháp

```css
rotateY(a)
```

### Giá trị

- `a`
  - : Là một {{ cssxref("&lt;angle&gt;") }} biểu thị góc quay. Góc dương biểu thị xoay theo chiều kim đồng hồ, góc âm biểu thị xoay ngược chiều kim đồng hồ.

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
        Phép biến đổi này áp dụng cho không gian 3D và không thể biểu diễn trên mặt phẳng.
      </td>
      <td>
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mo>cos</mo><mo>(</mo><mi>a</mi><mo>)</mo></mtd><mtd><mn>0</mn></mtd><mtd><mo>sin</mo><mo>(</mo><mi>a</mi><mo>)</mo></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mo>-</mo><mo>sin</mo><mo>(</mo><mi>a</mi><mo>)</mo></mtd><mtd><mn>0</mn></mtd><mtd><mo>cos</mo><mo>(</mo><mi>a</mi><mo>)</mo></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{ccc} \cos(a) & 0 & \sin(a) \\ 0 & 1 & 0 \\ -\sin(a) & 0 & \cos(a) \end{array} \right)</annotation></semantics>
        </math>
      </td>
      <td>
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mo>cos</mo><mo>(</mo><mi>a</mi><mo>)</mo></mtd><mtd><mn>0</mn></mtd><mtd><mo>sin</mo><mo>(</mo><mi>a</mi><mo>)</mo></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mo>-</mo><mo>sin</mo><mo>(</mo><mi>a</mi><mo>)</mo></mtd><mtd><mn>0</mn></mtd><mtd><mo>cos</mo><mo>(</mo><mi>a</mi><mo>)</mo></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{cccc} \cos(a) & 0 & \sin(a) & 0 \\ 0 & 1 & 0 & 0 \\ -\sin(a) & 0 & \cos(a) & 0 \\ 0 & 0 & 0 & 1 \end{array} \right)</annotation></semantics>
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
<div>Bình thường</div>
<div class="rotated">Đã xoay</div>
```

### CSS

```css
div {
  width: 80px;
  height: 80px;
  background-color: skyblue;
}

.rotated {
  transform: rotateY(60deg);
  background-color: pink;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "auto", 180)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{cssxref("transform")}}
- Thuộc tính {{cssxref("rotate")}}
- {{cssxref("&lt;transform-function&gt;")}}
