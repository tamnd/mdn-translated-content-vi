---
title: <transform-function>
slug: Web/CSS/Reference/Values/transform-function
page-type: css-type
browser-compat: css.types.transform-function
sidebar: cssref
---

Kiểu dữ liệu **`<transform-function>`** [CSS](/vi/docs/Web/CSS) [data type](/vi/docs/Web/CSS/Reference/Values/Data_types) biểu diễn một phép biến đổi ảnh hưởng đến giao diện của một phần tử. Các [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) biến đổi có thể xoay, thay đổi kích thước, bóp méo hoặc di chuyển một phần tử trong không gian 2D hoặc 3D. Nó được dùng trong thuộc tính {{cssxref("transform")}}.

## Cú pháp

Kiểu dữ liệu `<transform-function>` được chỉ định bằng một trong các hàm biến đổi liệt kê bên dưới. Mỗi hàm áp dụng một phép tính hình học trong không gian 2D hoặc 3D.

### Biến đổi ma trận

- [`matrix()`](/vi/docs/Web/CSS/Reference/Values/transform-function/matrix)
  - : Mô tả ma trận biến đổi 2D thuần nhất.
- [`matrix3d()`](/vi/docs/Web/CSS/Reference/Values/transform-function/matrix3d)
  - : Mô tả biến đổi 3D dưới dạng ma trận thuần nhất 4×4.

### Phối cảnh

- [`perspective()`](/vi/docs/Web/CSS/Reference/Values/transform-function/perspective)
  - : Đặt khoảng cách giữa người dùng và mặt phẳng z=0.

### Phép quay

- [`rotate()`](/vi/docs/Web/CSS/Reference/Values/transform-function/rotate)
  - : Quay một phần tử quanh một điểm cố định trên mặt phẳng 2D.
- [`rotate3d()`](/vi/docs/Web/CSS/Reference/Values/transform-function/rotate3d)
  - : Quay một phần tử quanh một trục cố định trong không gian 3D.
- [`rotateX()`](/vi/docs/Web/CSS/Reference/Values/transform-function/rotateX)
  - : Quay một phần tử quanh trục ngang.
- [`rotateY()`](/vi/docs/Web/CSS/Reference/Values/transform-function/rotateY)
  - : Quay một phần tử quanh trục dọc.
- [`rotateZ()`](/vi/docs/Web/CSS/Reference/Values/transform-function/rotateZ)
  - : Quay một phần tử quanh trục z.

### Tỷ lệ (thay đổi kích thước)

- [`scale()`](/vi/docs/Web/CSS/Reference/Values/transform-function/scale)
  - : Phóng to hoặc thu nhỏ một phần tử trên mặt phẳng 2D.
- [`scale3d()`](/vi/docs/Web/CSS/Reference/Values/transform-function/scale3d)
  - : Phóng to hoặc thu nhỏ một phần tử trong không gian 3D.
- [`scaleX()`](/vi/docs/Web/CSS/Reference/Values/transform-function/scaleX)
  - : Phóng to hoặc thu nhỏ một phần tử theo chiều ngang.
- [`scaleY()`](/vi/docs/Web/CSS/Reference/Values/transform-function/scaleY)
  - : Phóng to hoặc thu nhỏ một phần tử theo chiều dọc.
- [`scaleZ()`](/vi/docs/Web/CSS/Reference/Values/transform-function/scaleZ)
  - : Phóng to hoặc thu nhỏ một phần tử dọc theo trục z.

### Nghiêng (bóp méo)

- [`skew()`](/vi/docs/Web/CSS/Reference/Values/transform-function/skew)
  - : Làm nghiêng một phần tử trên mặt phẳng 2D.
- [`skewX()`](/vi/docs/Web/CSS/Reference/Values/transform-function/skewX)
  - : Làm nghiêng một phần tử theo chiều ngang.
- [`skewY()`](/vi/docs/Web/CSS/Reference/Values/transform-function/skewY)
  - : Làm nghiêng một phần tử theo chiều dọc.

### Dịch chuyển (di chuyển)

- [`translate()`](/vi/docs/Web/CSS/Reference/Values/transform-function/translate)
  - : Dịch chuyển một phần tử trên mặt phẳng 2D.
- [`translate3d()`](/vi/docs/Web/CSS/Reference/Values/transform-function/translate3d)
  - : Dịch chuyển một phần tử trong không gian 3D.
- [`translateX()`](/vi/docs/Web/CSS/Reference/Values/transform-function/translateX)
  - : Dịch chuyển một phần tử theo chiều ngang.
- [`translateY()`](/vi/docs/Web/CSS/Reference/Values/transform-function/translateY)
  - : Dịch chuyển một phần tử theo chiều dọc.
- [`translateZ()`](/vi/docs/Web/CSS/Reference/Values/transform-function/translateZ)
  - : Dịch chuyển một phần tử dọc theo trục z.

## Mô tả

Nhiều mô hình tọa độ có thể được dùng để mô tả kích thước và hình dạng của một phần tử HTML, cũng như các phép biến đổi được áp dụng lên nó. Phổ biến nhất là [hệ tọa độ Descartes](https://en.wikipedia.org/wiki/Cartesian_coordinate_system), mặc dù [tọa độ thuần nhất](https://en.wikipedia.org/wiki/Homogeneous_coordinates) cũng đôi khi được dùng.

### Tọa độ Descartes

Trong hệ tọa độ Descartes, một điểm hai chiều được mô tả bằng hai giá trị: tọa độ x (hoành độ) và tọa độ y (tung độ). Điều này được biểu diễn bằng ký hiệu vector `(x, y)`.

![Mặt phẳng Descartes với trục Y âm và trục X dương bắt đầu từ gốc tọa độ với ba điểm P1, P2 và P3 cùng các giá trị X và Y tương ứng](coord_in_r2.png)

Trong CSS (và hầu hết các đồ họa máy tính), gốc tọa độ `(0, 0)` biểu diễn góc _trên-trái_ của bất kỳ phần tử nào. Các tọa độ dương hướng xuống và sang phải từ gốc tọa độ, còn các tọa độ âm hướng lên và sang trái. Do đó, điểm 2 đơn vị sang phải và 5 đơn vị xuống là `(2, 5)`, còn điểm 3 đơn vị sang trái và 12 đơn vị lên là `(-3, -12)`.

### Hàm biến đổi

Các hàm biến đổi thay đổi giao diện của một phần tử bằng cách thao tác các giá trị tọa độ của nó. Một hàm biến đổi tuyến tính được mô tả bằng ma trận 2×2, như sau:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mi>a</mi></mtd><mtd><mi>c</mi></mtd></mtr><mtr><mtd><mi>b</mi></mtd><mtd><mi>d</mi></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\begin{pmatrix} a & c \\ b & d \end{pmatrix}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Hàm được áp dụng lên một phần tử bằng phép nhân ma trận. Do đó, mỗi tọa độ thay đổi dựa trên các giá trị trong ma trận:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mrow><mo>(</mo><mtable><mtr><mtd><mi>a</mi></mtd><mtd><mi>c</mi></mtd></mtr><mtr><mtd><mi>b</mi></mtd><mtd><mi>d</mi></mtd></mtr></mtable><mo>)</mo></mrow><mrow><mo>(</mo><mtable><mtr><mtd><mi>x</mi></mtd></mtr><mtr><mtd><mi>y</mi></mtd></mtr></mtable><mo>)</mo></mrow><mo>=</mo><mrow><mo>(</mo><mtable><mtr><mtd><mi>a</mi><mi>x</mi><mo>+</mo><mi>c</mi><mi>y</mi></mtd></mtr><mtr><mtd><mi>b</mi><mi>x</mi><mo>+</mo><mi>d</mi><mi>y</mi></mtd></mtr></mtable><mo>)</mo></mrow></mrow><annotation encoding="TeX">\left( \begin{array}{cc} a & c \\ b & d \end{array} \right) \left( \begin{array}{c} x \\ y \end{array} \right) = \left( \begin{array}{c} ax + cy \\ bx + dy \end{array} \right)</annotation>
</semantics>
</math>
<!-- prettier-ignore-end -->

Thậm chí có thể áp dụng nhiều phép biến đổi liên tiếp:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mrow><mo>(</mo><mtable><mtr><mtd><msub><mi>a</mi><mn>1</mn></msub></mtd><mtd><msub><mi>c</mi><mn>1</mn></msub></mtd></mtr><mtr><mtd><msub><mi>b</mi><mn>1</mn></msub></mtd><mtd><msub><mi>d</mi><mn>1</mn></msub></mtd></mtr></mtable><mo>)</mo></mrow><mrow><mo>(</mo><mtable><mtr><mtd><msub><mi>a</mi><mn>2</mn></msub></mtd><mtd><msub><mi>c</mi><mn>2</mn></msub></mtd></mtr><mtr><mtd><msub><mi>b</mi><mn>2</mn></msub></mtd><mtd><msub><mi>d</mi><mn>2</mn></msub></mtd></mtr></mtable><mo>)</mo></mrow><mo>=</mo><mrow><mo>(</mo><mtable><mtr><mtd><msub><mi>a</mi><mn>1</mn></msub><msub><mi>a</mi><mn>2</mn></msub><mo>+</mo><msub><mi>c</mi><mn>1</mn></msub><msub><mi>b</mi><mn>2</mn></msub></mtd><mtd><msub><mi>a</mi><mn>1</mn></msub><msub><mi>c</mi><mn>2</mn></msub><mo>+</mo><msub><mi>c</mi><mn>1</mn></msub><msub><mi>d</mi><mn>2</mn></msub></mtd></mtr><mtr><mtd><msub><mi>b</mi><mn>1</mn></msub><msub><mi>a</mi><mn>2</mn></msub><mo>+</mo><msub><mi>d</mi><mn>1</mn></msub><msub><mi>b</mi><mn>2</mn></msub></mtd><mtd><msub><mi>b</mi><mn>1</mn></msub><msub><mi>c</mi><mn>2</mn></msub><mo>+</mo><msub><mi>d</mi><mn>1</mn></msub><msub><mi>d</mi><mn>2</mn></msub></mtd></mtr></mtable><mo>)</mo></mrow></mrow><annotation encoding="TeX">\left( \begin{array}{cc} a_1 & c_1 \\ b_1 & d_1 \end{array} \right) \left( \begin{array}{cc} a_2 & c_2 \\ b_2 & d_2 \end{array} \right) = \left( \begin{array}{cc} a_1a_2 + c_1b_2 & a_1c_2 + c_1d_2 \\ b_1a_2 + d_1b_2 & b_1c_2 + d_1d_2 \end{array} \right)</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Với ký hiệu này, có thể mô tả và kết hợp hầu hết các phép biến đổi thông thường: phép quay, tỷ lệ hay nghiêng. (Thực ra, tất cả các phép biến đổi là hàm tuyến tính đều có thể mô tả được.) Các phép biến đổi kết hợp thực tế được áp dụng theo thứ tự từ phải sang trái.

Tuy nhiên, một phép biến đổi quan trọng không phải là tuyến tính và do đó cần được xử lý đặc biệt khi dùng ký hiệu này: phép tịnh tiến. Vector tịnh tiến `(tx, ty)` phải được biểu diễn riêng, dưới dạng hai tham số bổ sung.

> [!NOTE]
> Mặc dù phức tạp hơn tọa độ Descartes, [tọa độ thuần nhất](https://en.wikipedia.org/wiki/Homogeneous_coordinates) trong [hình chiếu xạ ảnh](https://en.wikipedia.org/wiki/Projective_geometry) dẫn đến ma trận biến đổi 3×3 và có thể biểu diễn phép tịnh tiến dưới dạng hàm tuyến tính.

> [!NOTE]
> Các hàm biến đổi được dùng với thuộc tính `transform` nhưng không dùng với các thuộc tính biến đổi riêng lẻ — {{cssxref("translate")}}, {{cssxref("scale")}} và {{cssxref("rotate")}}.

## Ví dụ

### So sánh hàm biến đổi

Ví dụ sau cung cấp một khối 3D được tạo từ các phần tử DOM và các phép biến đổi, cùng một menu chọn để chọn các hàm biến đổi khác nhau áp dụng lên khối, giúp bạn so sánh hiệu ứng của các loại khác nhau.

Chọn một hàm, phép biến đổi sẽ được áp dụng lên khối; sau 2 giây, khối quay về trạng thái ban đầu. Trạng thái ban đầu của khối được xoay nhẹ bằng `transform3d()`, để bạn thấy được hiệu ứng của tất cả các phép biến đổi.

#### HTML

```html
<main>
  <section id="example-element">
    <div class="face front">1</div>
    <div class="face back">2</div>
    <div class="face right">3</div>
    <div class="face left">4</div>
    <div class="face top">5</div>
    <div class="face bottom">6</div>
  </section>

  <div class="select-form">
    <label for="transfunction">Select a transform function</label>
    <select id="transfunction">
      <option selected>Choose a function</option>
      <option>rotate(360deg)</option>
      <option>rotateX(360deg)</option>
      <option>rotateY(360deg)</option>
      <option>rotateZ(360deg)</option>
      <option>rotate3d(1, 1, 1, 90deg)</option>
      <option>scale(1.5)</option>
      <option>scaleX(1.5)</option>
      <option>scaleY(1.5)</option>
      <option>scaleZ(1.5)</option>
      <option>scale3d(1, 1.5, 1.5)</option>
      <option>skew(17deg, 13deg)</option>
      <option>skewX(17deg)</option>
      <option>skewY(17deg)</option>
      <option>translate(100px, 100px)</option>
      <option>translateX(100px)</option>
      <option>translateY(100px)</option>
      <option>translateZ(100px)</option>
      <option>translate3d(50px, 50px, 50px)</option>
      <option>perspective(200px)</option>
      <option>matrix(1, 2, -1, 1, 80, 80)</option>
      <option>matrix3d(1,0,0,0,0,1,3,0,0,0,1,0,50,100,0,1.1)</option>
    </select>
  </div>
</main>
```

#### CSS

```css
main {
  width: 400px;
  height: 200px;
  padding: 50px;
  background-image: linear-gradient(135deg, white, cyan, white);
}

#example-element {
  width: 100px;
  height: 100px;
  transform-style: preserve-3d;
  transition: transform 1.5s;
  transform: rotate3d(1, 1, 1, 30deg);
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
  background: rgb(90 90 90 / 70%);
  transform: translateZ(50px);
}

.back {
  background: rgb(0 210 0 / 70%);
  transform: rotateY(180deg) translateZ(50px);
}

.right {
  background: rgb(210 0 0 / 70%);
  transform: rotateY(90deg) translateZ(50px);
}

.left {
  background: rgb(0 0 210 / 70%);
  transform: rotateY(-90deg) translateZ(50px);
}

.top {
  background: rgb(210 210 0 / 70%);
  transform: rotateX(90deg) translateZ(50px);
}

.bottom {
  background: rgb(210 0 210 / 70%);
  transform: rotateX(-90deg) translateZ(50px);
}

.select-form {
  margin-top: 50px;
}
```

#### JavaScript

```js
const selectElem = document.querySelector("select");
const example = document.querySelector("#example-element");

selectElem.addEventListener("change", () => {
  if (selectElem.value === "Choose a function") {
    return;
  }
  example.style.transform = `rotate3d(1, 1, 1, 30deg) ${selectElem.value}`;
  setTimeout(() => {
    example.style.transform = "rotate3d(1, 1, 1, 30deg)";
  }, 2000);
});
```

#### Kết quả

{{EmbedLiveSample('Transform_function_comparison', '100%', 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("transform")}}
- Các thuộc tính biến đổi riêng lẻ:
  - {{cssxref("translate")}}
  - {{cssxref("scale")}}
  - {{cssxref("rotate")}}
