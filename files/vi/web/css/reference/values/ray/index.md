---
title: ray()
slug: Web/CSS/Reference/Values/ray
page-type: css-function
browser-compat: css.types.ray
sidebar: cssref
---

Hàm **`ray()`** trong [CSS](/vi/docs/Web/CSS) xác định đoạn thẳng {{cssxref("offset-path")}} mà một phần tử được hoạt ảnh có thể đi theo. Đoạn thẳng này được gọi là "tia". Tia bắt đầu từ một {{cssxref("offset-position")}} và kéo dài theo hướng của góc được chỉ định. Độ dài của tia có thể bị giới hạn bằng cách chỉ định kích thước và dùng từ khóa `contain`.

## Cú pháp

```css
/* Tất cả tham số được chỉ định */
offset-path: ray(50deg closest-corner contain at 100px 20px);

/* Hai tham số được chỉ định, thứ tự không quan trọng */
offset-path: ray(contain 200deg);

/* Chỉ một tham số được chỉ định */
offset-path: ray(45deg);
```

### Tham số

Các tham số có thể được chỉ định theo bất kỳ thứ tự nào.

- {{cssxref("angle")}}
  - : Xác định hướng mà đoạn thẳng kéo dài từ vị trí bắt đầu offset. Góc `0deg` nằm trên trục y hướng lên, và các góc dương tăng theo chiều kim đồng hồ.

- `<size>`
  - : Xác định độ dài của đoạn thẳng, tức là khoảng cách giữa `offset-distance` `0%` và `100%`, so với hộp chứa. Đây là tham số tùy chọn (`closest-side` được dùng nếu không chỉ định `<size>`). Nó chấp nhận một trong các giá trị từ khóa sau:

    `closest-side`: Khoảng cách giữa điểm bắt đầu của tia và cạnh gần nhất của [khối chứa](/vi/docs/Web/CSS/Guides/Display/Containing_block) của phần tử. Nếu điểm bắt đầu của tia nằm trên cạnh của khối chứa, độ dài của đoạn thẳng là không. Nếu điểm bắt đầu của tia nằm ngoài khối chứa, cạnh của khối chứa được coi là kéo dài đến vô cực. Đây là giá trị mặc định.

    `closest-corner`: Khoảng cách giữa điểm bắt đầu của tia và góc gần nhất trong khối chứa của phần tử. Nếu điểm bắt đầu của tia nằm tại góc của khối chứa, độ dài của đoạn thẳng là không.

    `farthest-side`: Khoảng cách giữa điểm bắt đầu của tia và cạnh xa nhất của khối chứa của phần tử. Nếu điểm bắt đầu của tia nằm ngoài khối chứa, cạnh của khối chứa được coi là kéo dài đến vô cực.

    `farthest-corner`: Khoảng cách giữa điểm bắt đầu của tia và góc xa nhất trong khối chứa của phần tử.

    `sides`: Khoảng cách giữa điểm bắt đầu của tia và điểm mà đoạn thẳng giao với biên của khối chứa. Nếu điểm bắt đầu nằm trên hoặc ngoài biên của khối chứa, độ dài của đoạn thẳng là không.

- `contain`
  - : Giảm độ dài của đoạn thẳng để phần tử nằm trong khối chứa ngay cả khi `offset-distance: 100%`. Cụ thể, độ dài của đoạn được giảm bằng một nửa chiều rộng hoặc một nửa chiều cao của hộp viền của phần tử, tùy cái nào lớn hơn, và không bao giờ nhỏ hơn không. Đây là tham số tùy chọn.

- `at <position>`
  - : Xác định điểm mà tia bắt đầu và nơi phần tử được đặt trong khối chứa của nó. Đây là tham số tùy chọn. Nếu được đưa vào, giá trị `<position>` phải đứng trước từ khóa `at`. Nếu bị bỏ qua, giá trị `offset-position` của phần tử sẽ được dùng. Nếu bị bỏ qua và phần tử không có giá trị `offset-position`, giá trị dùng cho vị trí bắt đầu của tia là `offset-position: normal`, đặt phần tử ở trung tâm (hay `50% 50%`) của khối chứa.

## Mô tả

Hàm `ray()` định vị một phần tử dọc theo một đường dẫn bằng cách xác định vị trí của nó trong không gian hai chiều thông qua góc và khoảng cách từ điểm tham chiếu (tọa độ cực). Tính năng này làm cho hàm `ray()` hữu ích để tạo các chuyển đổi không gian 2D. Để so sánh, cách tiếp cận này khác với phương pháp xác định điểm bằng khoảng cách ngang và dọc từ gốc tọa độ cố định (tọa độ Cartesian), được dùng bởi hàm {{cssxref("translate","translate()")}}, và khác với việc di chuyển phần tử dọc theo đường dẫn đã xác định thông qua hoạt ảnh.

Vì `ray()` hoạt động trong không gian 2D, điều quan trọng là cần xem xét cả vị trí ban đầu và hướng của phần tử. Khi hàm `ray()` được áp dụng làm giá trị `offset-path` trên một phần tử, đây là cách bạn có thể kiểm soát các khía cạnh này:

- Phần tử ban đầu được định vị bằng cách di chuyển điểm {{cssxref("offset-anchor")}} của phần tử đến vị trí bắt đầu offset của phần tử. Theo mặc định, vị trí bắt đầu của tia được xác định bởi giá trị {{cssxref("offset-position")}}. Nếu `offset-position` được chỉ định tường minh là `normal` (hoặc bị bỏ qua và mặc định thành `normal`), phần tử được đặt ở `center` (hay `50% 50%`) của khối chứa. Chỉ định `offset-position: auto` đặt vị trí bắt đầu tại góc `top left` (hay `0 0`) của vị trí phần tử.
- Phần tử ban đầu được xoay sao cho [trục inline](/vi/docs/Web/CSS/Guides/Grid_layout/Box_alignment#the_two_axes_of_a_grid_layout) của nó — hướng văn bản chạy — căn chỉnh với góc được chỉ định bởi `ray()`. Ví dụ, với góc `ray()` là `0deg`, nằm trên trục y hướng lên, trục inline của phần tử được xoay để thẳng đứng khớp với góc của tia. Phần tử duy trì vòng quay này xuyên suốt đường dẫn. Để tùy chỉnh hành vi này, hãy dùng thuộc tính {{cssxref("offset-rotate")}}, cho phép bạn chỉ định góc xoay hoặc hướng khác cho phần tử, cho phép kiểm soát chính xác hơn hình thức của nó khi đi theo đường dẫn. Ví dụ, đặt `offset-rotate: 0deg` sẽ loại bỏ bất kỳ vòng quay nào được áp dụng bởi `ray()`, căn chỉnh lại trục inline của phần tử với hướng văn bản chạy.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Xác định góc và vị trí bắt đầu cho tia

Ví dụ này cho thấy cách làm việc với vị trí bắt đầu của phần tử và cách hướng của phần tử bị ảnh hưởng bởi góc tia được chỉ định.

#### CSS

```css hidden
body {
  width: fit-content;
  height: fit-content;
}

.container {
  width: 80vw;
  height: 100px;
  border: 1px dashed black;
  margin: 0 0.5em 2em 2em;
  text-align: center;
}

pre {
  font-size: 1em;
  text-align: right;
  padding-right: 10px;
  line-height: 1em;
}

.box {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 50px;
  height: 50px;
}

.box + .box {
  opacity: 1;
}
```

```css
.box {
  background-color: palegreen;
  border-top: 4px solid black;
  opacity: 20%;
}

.box:first-of-type {
  position: absolute;
}

.box1 {
  offset-path: ray(0deg);
}

.box2 {
  offset-path: ray(150deg);
}

.box3 {
  offset-rotate: 0deg;
  offset-position: 20% 40%;
  offset-path: ray(150deg);
}

.box4 {
  offset-position: 0 0;
  offset-path: ray(0deg);
}

.box5 {
  offset-path: ray(60deg closest-side at bottom right);
}
```

```html hidden
<pre>/* original */</pre>
<div class="container">
  <div class="box">0</div>
  <div class="box box0">0</div>
</div>

<pre>
  offset-path: ray(0deg);
  /* Default offset starting position is 50% 50% */
</pre>
<div class="container">
  <div class="box">0</div>
  <div class="box box1">1</div>
</div>

<pre>
  offset-path: ray(150deg);
</pre>
<div class="container">
  <div class="box">0</div>
  <div class="box box2">2</div>
</div>

<pre>
  offset-rotate: 0deg;
  offset-position: 20% 40%;
  offset-path: ray(150deg);
</pre>
<div class="container">
  <div class="box">0</div>
  <div class="box box3">3</div>
</div>

<pre>
  offset-position: 0 0;
  offset-path: ray(0deg);
</pre>
<div class="container">
  <div class="box">0</div>
  <div class="box box4">4</div>
</div>

<pre>
  offset-path: ray(60deg closest-side at bottom right);
</pre>
<div class="container">
  <div class="box">0</div>
  <div class="box box5">5</div>
</div>
```

Tương tự với {{cssxref("transform-origin")}}, điểm neo mặc định là ở trung tâm của phần tử. Điểm neo này có thể được thay đổi bằng thuộc tính {{cssxref("offset-anchor")}}.

Trong ví dụ này, các giá trị `offset-path: ray()` khác nhau được áp dụng cho các hộp được đánh số từ `1` đến `5`. "Khối chứa" của mỗi hộp được hiển thị với viền nét đứt. Một hộp mờ ở góc trên bên trái hiển thị vị trí mặc định của mỗi hộp mà không có `offset-position` hay `offset-path` nào được áp dụng, cho phép so sánh cạnh nhau. Đỉnh của mỗi hộp được đánh dấu với viền `solid` để minh họa các biến thể trong điểm bắt đầu và hướng của tia. Sau khi định vị tại điểm bắt đầu của tia, hộp căn chỉnh theo hướng của góc tia được chỉ định. Nếu {{cssxref("offset-position")}} không được chỉ định, vị trí bắt đầu offset mặc định của tia là tâm (hay `50% 50%`) của khối chứa của hộp.

#### Kết quả

{{EmbedLiveSample('Giving an angle to the ray', '100%', 1100)}}

- `box1` ban đầu được định vị sao cho điểm neo của nó (tâm) nằm ở vị trí bắt đầu offset mặc định (`50% 50%` của khối chứa). `box1` cũng được xoay để hướng về góc `0deg` của tia. Đây sẽ là điểm bắt đầu của đường dẫn. Bạn có thể quan sát thay đổi vị trí và vòng quay của hộp bằng cách so sánh nó với `box0` mờ ở bên trái. Hộp được xoay để khớp với góc `0deg` dọc theo trục y, hướng lên. Vòng quay của hộp được thể hiện qua hướng của số bên trong hộp.

- Trong `box2`, góc dương lớn hơn là `150deg` được áp dụng cho tia để thể hiện cách góc tia hoạt động. Từ góc trên bên trái, hộp được xoay theo chiều kim đồng hồ để đạt góc được chỉ định là `150deg`.

- `box2` và `box3` có cùng giá trị `offset-path`. Trong `box3`, {{cssxref("offset-rotate")}} `0deg` cũng được áp dụng cho phần tử. Kết quả là phần tử sẽ vẫn được xoay ở góc cụ thể này xuyên suốt đường dẫn của tia, và phần tử sẽ không xoay theo hướng của đường dẫn. Lưu ý trong `box3` rằng đường dẫn tia ở góc `150deg`, nhưng hướng hộp sẽ không thay đổi dọc theo đường dẫn vì `offset-rotate`. Cũng lưu ý rằng thuộc tính `offset-path` của `box3` không chỉ định `<position>` bắt đầu, nên vị trí bắt đầu của tia được lấy từ `offset-position` của phần tử, trong trường hợp này là `top 20% left 40%`.

- `offset-position` của `box4` được đặt ở góc trên bên trái (`0 0`) của khối chứa, và do đó, điểm neo và vị trí bắt đầu offset của phần tử trùng nhau. Góc tia `0deg` được áp dụng cho phần tử tại điểm bắt đầu này.

- Trong `box5`, thuộc tính `offset-path` chỉ định giá trị `at <position>`, đặt hộp tại cạnh `bottom` và `right` của khối chứa của phần tử và `60deg` được áp dụng cho góc tia.

### Hoạt ảnh phần tử dọc theo tia

Trong ví dụ này, hình đầu tiên được hiển thị làm tham chiếu cho vị trí và hướng của nó. Đường dẫn chuyển động tia được áp dụng cho các hình còn lại.

#### CSS

```css
body {
  display: grid;
  grid-template-columns: 200px 100px;
  gap: 40px;
  margin-left: 40px;
}

.container {
  transform-style: preserve-3d;
  width: 150px;
  height: 100px;
  border: 2px dotted green;
}

.shape {
  width: 40px;
  height: 40px;
  background: #2bc4a2;
  margin: 5px;
  text-align: center;
  line-height: 40px;
  clip-path: polygon(0% 0%, 70% 0%, 100% 50%, 70% 100%, 0% 100%, 30% 50%);
  animation: move 5000ms infinite alternate ease-in-out;
}

.shape2 {
  offset-path: ray(120deg sides contain);
}

.shape3 {
  offset-rotate: 0deg;
  offset-path: ray(120deg sides contain);
}

.shape4 {
  offset-position: auto;
  offset-path: ray(120deg closest-corner);
}

.shape5 {
  offset-position: auto;
  offset-path: ray(120deg farthest-corner);
}

@keyframes move {
  0%,
  20% {
    offset-distance: 0%;
  }
  80%,
  100% {
    offset-distance: 100%;
  }
}
```

```html hidden
<div>
  <div class="container">
    <div class="shape shape1">&mdash;</div>
  </div>
</div>

<pre>/* no offset-path applied */</pre>

<div>
  <div class="container">
    <div class="shape shape2">&mdash;</div>
  </div>
</div>

<pre>offset-path: ray(120deg sides contain);</pre>

<div>
  <div class="container">
    <div class="shape shape3">&mdash;</div>
  </div>
</div>

<pre>
offset-path: ray(120deg sides contain);
offset-rotate: 0deg;
</pre>

<div>
  <div class="container">
    <div class="shape shape4">&mdash;</div>
  </div>
</div>

<pre>
  offset-position: auto;
  offset-path: ray(120deg closest-corner);
</pre>

<div>
  <div class="container">
    <div class="shape shape5">&mdash;</div>
  </div>
</div>

<pre>
  offset-position: auto;
  offset-path: ray(120deg farthest-corner);
</pre>
```

#### Kết quả

{{EmbedLiveSample('Animating an element along the ray', '100%', 750)}}

Trong hai mẫu đầu tiên có áp dụng `offset-path`, hãy chú ý hướng của hình không có {{cssxref("offset-rotate")}} và có `offset-rotate`. Cả hai mẫu này đều dùng giá trị {{cssxref("offset-position")}} mặc định `normal`, và do đó chuyển động đường dẫn bắt đầu từ `50% 50%`. Hai mẫu `offset-path` cuối cùng cho thấy tác động của các giá trị `<size>` góc: `closest-corner` và `farthest-corner`. Giá trị `closest-corner` tạo ra offset-path rất ngắn vì hình đã ở góc (`offset-position: auto`). Giá trị `farthest-corner` tạo ra offset-path dài nhất, đi từ góc trên bên trái của khối chứa đến góc dưới bên phải.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("offset-distance")}}
- {{cssxref("offset-path")}}
- {{cssxref("offset-rotate")}}
