---
title: translateZ()
slug: Web/CSS/Reference/Values/transform-function/translateZ
page-type: css-function
browser-compat: css.types.transform-function.translateZ
sidebar: cssref
---

Hàm **`translateZ()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) định vị lại một phần tử dọc theo trục z trong không gian 3D, tức là
gần hơn hoặc xa hơn người xem. Kết quả của nó là kiểu dữ liệu {{cssxref("&lt;transform-function&gt;")}}.

{{InteractiveExample("CSS Demo: translateZ()")}}

```css interactive-example-choice
transform: translateZ(0);
```

```css interactive-example-choice
transform: translateZ(42px);
```

```css interactive-example-choice
transform: translateZ(-9.7rem);
```

```css interactive-example-choice
transform: translateZ(-3ch);
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

Phép biến đổi này được xác định bởi một {{cssxref("&lt;length&gt;")}} chỉ định phần tử hoặc các phần tử di chuyển bao nhiêu vào trong hay ra ngoài.

Trong các ví dụ tương tác trên, [`perspective: 550px;`](/vi/docs/Web/CSS/Reference/Properties/perspective) (để
tạo không gian 3D) và [`transform-style: preserve-3d;`](/vi/docs/Web/CSS/Reference/Properties/transform-style)
(để các phần tử con, 6 mặt của khối lập phương, cũng được định vị trong không gian 3D), đã được thiết lập trên khối lập phương.

> [!NOTE]
> `translateZ(tz)` tương đương với
> `translate3d(0, 0, tz)`.

## Cú pháp

```css
translateZ(tz)
```

### Giá trị

- `tz`
  - : Một {{cssxref("&lt;length&gt;")}} biểu thị thành phần z của vector dịch chuyển [0, 0, tz]. Trong [hệ tọa độ Descartes](/vi/docs/Web/CSS/Reference/Values/transform-function#cartesian_coordinates), nó biểu thị độ dịch chuyển dọc theo trục z. Giá trị dương di chuyển
    phần tử về phía người xem, còn giá trị âm di chuyển ra xa hơn.

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
        Phép dịch chuyển không phải là phép biến đổi tuyến tính trong ℝ^3 và không thể biểu diễn bằng ma trận tọa độ Descartes.
      </td>
      <td>
        <math display="block">
          <semantics><mrow><mo>(</mo><mtable><mtr><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mi>t</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\left( \begin{array}{cccc} 1 & 0 & 0 & 0 \\ 0 & 1 & 0 & 0 \\ 0 & 0 & 1 & t \\ 0 & 0 & 0 & 1 \end{array} \right)</annotation></semantics>
        </math>
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

Trong ví dụ này, hai hộp được tạo ra. Một hộp được định vị bình thường trên trang, không có bất kỳ phép dịch chuyển nào. Hộp
thứ hai được thay đổi bằng cách áp dụng perspective để tạo không gian 3D, sau đó di chuyển về phía người dùng.

### HTML

```html
<div>Tĩnh</div>
<div class="moved">Đã di chuyển</div>
```

### CSS

```css
div {
  position: relative;
  width: 60px;
  height: 60px;
  left: 100px;
  background-color: skyblue;
}

.moved {
  transform: perspective(500px) translateZ(200px);
  background-color: pink;
}
```

Điều quan trọng ở đây là lớp "moved"; hãy xem nó làm gì. Đầu tiên, hàm
[`perspective()`](/vi/docs/Web/CSS/Reference/Values/transform-function/perspective) định vị
người xem tương đối với mặt phẳng nằm ở z=0 (về cơ bản, bề mặt của màn hình). Giá trị
`500px` có nghĩa là người dùng ở cách "500 pixel" phía trước hình ảnh ở z=0.

Sau đó, hàm `translateZ()` di chuyển phần tử 200 pixel "ra ngoài" màn hình, về phía người dùng.
Điều này tạo ra hiệu ứng khiến phần tử xuất hiện lớn hơn khi xem trên màn hình 2D, hoặc gần hơn khi xem qua kính thực tế ảo
hay thiết bị hiển thị 3D khác.

Lưu ý rằng nếu giá trị `perspective()` nhỏ hơn giá trị `translateZ()`, chẳng hạn
`transform: perspective(200px) translateZ(300px);` thì phần tử được biến đổi sẽ không hiển thị vì nó
ở xa hơn viewport của người dùng. Chênh lệch càng nhỏ giữa giá trị perspective và translateZ, người dùng càng gần phần tử và phần tử được dịch chuyển càng có vẻ lớn hơn.

> [!NOTE]
> Vì phép hợp thành các biến đổi không có tính giao hoán, thứ tự bạn viết các hàm khác nhau là quan trọng. Nói chung, bạn muốn đặt `perspective()` trước `translateZ()`.

### Kết quả

{{EmbedLiveSample("Examples", 250, 250)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("transform")}}
- {{cssxref("&lt;transform-function&gt;")}}
- {{cssxref("translate")}}
