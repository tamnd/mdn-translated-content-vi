---
title: <angle>
slug: Web/CSS/Reference/Values/angle
page-type: css-type
browser-compat: css.types.angle
sidebar: cssref
---

Kiểu dữ liệu **`<angle>`** [CSS](/vi/docs/Web/CSS) [kiểu dữ liệu](/vi/docs/Web/CSS/Reference/Values/Data_types) biểu diễn một giá trị góc được biểu thị bằng độ, gradian, radian, hoặc vòng. Nó được dùng, ví dụ, trong {{cssxref("gradient")}} và trong một số hàm {{cssxref("transform")}}.

{{InteractiveExample("CSS Demo: &lt;angle&gt;")}}

```css interactive-example-choice
transform: rotate(45deg);
```

```css interactive-example-choice
transform: rotate(3.1416rad);
```

```css interactive-example-choice
transform: rotate(-50grad);
```

```css interactive-example-choice
transform: rotate(1.75turn);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This box can rotate to different angles.
  </div>
</section>
```

```css interactive-example
#example-element {
  background-color: #0118f3;
  padding: 0.75em;
  width: 180px;
  height: 120px;
  color: white;
}
```

## Cú pháp

Kiểu dữ liệu `<angle>` bao gồm một {{cssxref("&lt;number&gt;")}} theo sau là một trong các đơn vị được liệt kê bên dưới. Như với mọi kích thước, không có khoảng cách giữa đơn vị và số. Đơn vị góc là tùy chọn sau số `0`.

Tùy chọn, giá trị có thể được đứng trước bởi một dấu `+` hoặc `-`. Các số dương biểu diễn góc theo chiều kim đồng hồ, trong khi các số âm biểu diễn góc ngược chiều kim đồng hồ. Đối với các thuộc tính tĩnh của một đơn vị nhất định, bất kỳ góc nào cũng có thể được biểu diễn bằng các giá trị tương đương khác nhau. Ví dụ, `90deg` bằng `-270deg`, và `1turn` bằng `4turn`. Đối với các thuộc tính động, như khi áp dụng {{cssxref("animation")}} hoặc {{cssxref("transition")}}, hiệu ứng vẫn sẽ khác nhau.

### Đơn vị

- `deg`
  - : Biểu diễn góc theo [độ](https://en.wikipedia.org/wiki/Degree_%28angle%29). Một vòng tròn đầy đủ là `360deg`. Ví dụ: `0deg`, `90deg`, `14.23deg`.
- `grad`
  - : Biểu diễn góc theo [gradian](https://en.wikipedia.org/wiki/Gradian). Một vòng tròn đầy đủ là `400grad`. Ví dụ: `0grad`, `100grad`, `38.8grad`.
- `rad`
  - : Biểu diễn góc theo [radian](https://en.wikipedia.org/wiki/Radian). Một vòng tròn đầy đủ là 2π radian xấp xỉ `6.2832rad`. `1rad` là 180/π độ. Ví dụ: `0rad`, `1.0708rad`, `6.2832rad`.
- `turn`
  - : Biểu diễn góc theo số vòng. Một vòng tròn đầy đủ là `1turn`. Ví dụ: `0turn`, `0.25turn`, `1.2turn`.

## Ví dụ

### Đặt góc vuông theo chiều kim đồng hồ

<table class="standard-table">
  <tbody>
    <tr>
      <td><img class="default internal" src="angle90.png" alt="A diagram showing a clockwise 90-degree rotation along a circle by moving from the topmost point to the rightmost point." /></td>
      <td><code>90deg = 100grad = 0.25turn ≈ 1.5708rad</code></td>
    </tr>
  </tbody>
</table>

### Đặt góc phẳng

<table class="standard-table">
  <tbody>
    <tr>
      <td><img class="default internal" src="angle180.png" alt="A diagram showing a clockwise 180-degree rotation along a circle by moving from the topmost point to the bottommost point." /></td>
      <td><code>180deg = 200grad = 0.5turn ≈ 3.1416rad</code></td>
    </tr>
  </tbody>
</table>

### Đặt góc vuông ngược chiều kim đồng hồ

<table class="standard-table">
  <tbody>
    <tr>
      <td><img class="default internal" src="angleminus90.png" alt="A diagram showing a counterclockwise 90-degree rotation along a circle by moving from the topmost point to the leftmost point." /></td>
      <td><code>-90deg = -100grad = -0.25turn ≈ -1.5708rad</code></td>
    </tr>
  </tbody>
</table>

### Đặt góc bằng không

<table class="standard-table">
  <tbody>
    <tr>
      <td><img class="default internal" src="angle0.png" alt="A diagram showing a 0-degree rotation. There is no movement." /></td>
      <td><code>0 = 0deg = 0grad = 0turn = 0rad</code></td>
    </tr>
  </tbody>
</table>

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Kiểu dữ liệu CSS](/vi/docs/Web/CSS/Reference/Values/Data_types)
- Kiểu {{cssxref("gradient")}}
- Phép biến đổi xoay CSS: [`rotate()`](/vi/docs/Web/CSS/Reference/Values/transform-function/rotate), [`rotate3d()`](/vi/docs/Web/CSS/Reference/Values/transform-function/rotate3d), [`rotateX()`](/vi/docs/Web/CSS/Reference/Values/transform-function/rotateX), [`rotateY()`](/vi/docs/Web/CSS/Reference/Values/transform-function/rotateY), và [`rotateZ()`](/vi/docs/Web/CSS/Reference/Values/transform-function/rotateZ)
- [Biến đổi CSS](/vi/docs/Web/CSS/Guides/Transforms)
- [Sử dụng biến đổi CSS](/vi/docs/Web/CSS/Guides/Transforms/Using)
- [Sử dụng CSS gradients](/vi/docs/Web/CSS/Guides/Images/Using_gradients)
