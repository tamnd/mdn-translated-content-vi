---
title: Basic shapes with shape-outside
short-title: Using shape-outside
slug: Web/CSS/Guides/Shapes/Using_shape-outside
page-type: guide
sidebar: cssref
---

CSS shape có thể được xác định bằng kiểu {{cssxref("basic-shape")}}. Trong hướng dẫn này, chúng ta thảo luận về việc tạo hình chữ nhật, hình tròn, hình ellipse và polygon với thuộc tính {{cssxref("shape-outside")}}. Đây là các tính năng được định nghĩa trong [module CSS shapes](/en-US/docs/Web/CSS/Guides/Shapes).

Trước khi tìm hiểu về shape, cần nắm hai mảnh thông tin đi cùng nhau để tạo nên các shape này:

- Kiểu `<basic-shape>`
- Reference box

## Kiểu \<basic-shape>

Kiểu {{cssxref("basic-shape")}} được dùng làm giá trị cho tất cả các basic shape. Kiểu này là ký hiệu hàm: các dấu ngoặc đơn của hàm chứa các đối số dùng để mô tả shape.

Các đối số được chấp nhận khác nhau tùy thuộc vào shape bạn đang tạo. Chúng ta sẽ đề cập đến các ví dụ dưới đây.

## Reference box

Hiểu reference box được CSS shapes sử dụng là rất quan trọng khi dùng basic shape, vì nó xác định hệ tọa độ của mỗi shape. Bạn đã gặp reference box trong [hướng dẫn về tạo shape từ giá trị box](/en-US/docs/Web/CSS/Guides/Shapes/From_box_values), nơi trực tiếp sử dụng reference box để tạo shape.

Ảnh chụp màn hình dưới đây hiển thị Firefox Shapes Inspector đang hiển thị reference box của một hình tròn được tạo bằng `shape-outside: circle(50%)`. Phần tử có 20 pixel padding, border và margin được áp dụng. Shapes Inspector làm nổi bật các reference box này.

![Text wrapping around a circle floated left. The left edge of the text is circular abutting the clipped shape on the outside of the margin with the margin following the shape clipping.](shapes-reference-box.png)

Reference box mặc định cho một basic shape là `margin-box`. Bạn có thể thấy trong ảnh chụp màn hình rằng shape được xác định tương đối so với phần đó của Box Model.

Mặc dù reference box mặc định là `margin-box`, nhưng có thể thay đổi. Để đặt một box khác làm reference box, hãy thêm giá trị box mong muốn sau định nghĩa basic shape.

Hai khai báo này tương đương nhau:

```css
shape-outside: circle(50%);
shape-outside: circle(50%) margin-box;
```

Để shape sử dụng reference box khác, hãy thêm giá trị {{cssxref("box-edge")}} khác. Ví dụ, để dùng border làm reference box cho hình tròn, hãy đặt:

```css
.shape {
  shape-outside: circle(50%) border-box;
}
```

Các shape được tạo ra vượt qua margin box sẽ bị cắt theo margin box. Các basic shape dưới đây minh họa điều này.

## inset()

Hàm [`inset()`](/en-US/docs/Web/CSS/Reference/Values/basic-shape/inset) xác định một hình chữ nhật. Điều này có vẻ không hữu ích lắm vì float một phần tử, không có shape, đã tạo ra một shape hình chữ nhật xung quanh nó. Tuy nhiên, kiểu `inset()` cho phép xác định offset, qua đó kéo văn bản bọc xung quanh hình chữ nhật có kích thước nhỏ hơn, phủ lên các phần của phần tử được float.

Hàm `inset()` nhận tối đa bốn giá trị offset cho các cạnh, cộng với một từ khóa `round` tùy chọn, theo sau là giá trị {{cssxref("border-radius")}}. CSS dưới đây tạo một shape hình chữ nhật được thụt vào từ reference box của phần tử được float 20 pixel từ trên và dưới, 10 pixel từ trái và phải, với giá trị `border-radius` là 10 pixel.

```css
.shape {
  float: left;
  shape-outside: inset(20px 10px 20px 10px round 10px);
}
```

Các giá trị offset sử dụng quy tắc tương tự như shorthand {{cssxref("margin")}}. Bốn giá trị cách nhau bởi dấu cách xác định offset trên, phải, dưới và trái — theo thứ tự đó. Bạn cũng có thể đặt nhiều hơn một offset cùng lúc:

- Nếu chỉ có một giá trị, nó áp dụng cho tất cả các cạnh.
- Nếu có hai giá trị, offset trên và dưới được đặt thành giá trị đầu tiên, offset phải và trái được đặt thành giá trị thứ hai.
- Nếu có ba giá trị, trên được đặt thành giá trị đầu tiên, trái và phải được đặt thành giá trị thứ hai, và dưới được đặt thành giá trị thứ ba.

Do đó, các quy tắc trên cũng có thể được viết là:

```css
.shape {
  float: left;
  shape-outside: inset(20px 10px round 10px);
}
```

Trong ví dụ dưới đây, chúng ta có shape `inset()` được dùng để kéo nội dung phủ lên phần tử được float. Thay đổi các giá trị offset để xem shape thay đổi như thế nào.

```html live-sample___inset
<div class="box">
  <div class="shape"></div>
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___inset
body {
  font: 1.2em sans-serif;
}

.shape {
  float: left;
  width: 150px;
  height: 100px;
  shape-outside: inset(20px 50px 10px 0 round 50px);
  background-color: rebeccapurple;
  border: 2px solid black;
  border-radius: 10px;
  margin: 20px;
  padding: 20px;
}
```

{{EmbedLiveSample("inset", "", "250px")}}

Bạn cũng có thể thêm giá trị box làm reference box thay thế. Trong ví dụ dưới đây, hãy thử thay đổi reference box từ `margin-box` thành `border-box`, `padding-box` hoặc `content-box` để xem reference box được dùng làm điểm khởi đầu thay đổi như thế nào trước khi tính toán offset.

```html hidden live-sample___inset-box
<div class="box">
  <div class="shape"></div>
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___inset-box
body {
  font: 1.2em sans-serif;
}

.shape {
  float: left;
  width: 150px;
  height: 100px;
  shape-outside: inset(20px 50px 10px 0 round 50px) margin-box;
  background-color: rebeccapurple;
  border: 2px solid black;
  border-radius: 10px;
  margin: 20px;
  padding: 20px;
}
```

{{EmbedLiveSample("inset-box", "", "250px")}}

Bạn cũng có thể tạo hình chữ nhật dựa trên khoảng cách từ cạnh trên và cạnh trái của reference box với hàm [`rect()`](/en-US/docs/Web/CSS/Reference/Values/basic-shape/rect), hoặc theo chiều rộng và chiều cao với hàm [`xywh()`](/en-US/docs/Web/CSS/Reference/Values/basic-shape/xywh); cả hai cũng hỗ trợ các góc bo tròn tùy chọn.

## circle()

Giá trị [`circle()`](/en-US/docs/Web/CSS/Reference/Values/basic-shape/circle) cho `shape-outside` có thể nhận hai đối số có thể: `<shape-radius>` xác định kích thước và `<position>` xác định vị trí của nó.

Cả hai giá trị `circle()` và `ellipse()` của `shape-outside` đều nhận [`<shape-radius>`](/en-US/docs/Web/CSS/Reference/Values/basic-shape#shape-radius) làm đối số. Đây có thể là {{cssxref("length")}}, {{cssxref("percentage")}}, hoặc một trong các từ khóa `closest-side` hoặc `farthest-side`.

Giá trị từ khóa `closest-side` sử dụng khoảng cách từ tâm của shape đến cạnh gần nhất của reference box để tạo độ dài bán kính. Giá trị từ khóa `farthest-side` sử dụng khoảng cách từ tâm của shape đến cạnh xa nhất của reference box.

Đối số thứ hai là `position`, nhận giá trị {{cssxref("&lt;position&gt;")}} một hoặc hai từ khóa, để chỉ ra vị trí tâm của hình tròn. Cách chỉ định giống như {{cssxref("background-position")}}; nếu một hoặc cả hai giá trị bị bỏ qua, các giá trị mặc định là `center`.

Để tạo hình tròn, chúng ta thêm một giá trị bán kính duy nhất, tùy chọn theo sau là từ khóa **at** và một giá trị vị trí. Ví dụ này có hình tròn được áp dụng cho một {{htmlelement("img")}} với `width` và `height` là `210px` và `margin` là `20px`. Điều này cho tổng chiều rộng của reference box là `250px`. Giá trị `50%` cho `<shape-radius>` có nghĩa là bán kính là `125px`. Giá trị vị trí được đặt thành `30%`, tức là `30%` từ trái và ở vị trí dọc mặc định là `center`.

```html live-sample___circle
<div class="box">
  <img
    alt="An orange hot air balloon as seen from below"
    src="https://mdn.github.io/shared-assets/images/examples/round-balloon.png" />
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___circle
body {
  font: 1.2em sans-serif;
}

img {
  float: left;
  shape-outside: circle(50% at 30%);
  margin: 20px;
}
```

{{EmbedLiveSample("circle", "", "250px")}}

Hãy thử tăng hoặc giảm kích thước hình tròn bằng cách thay đổi kích thước bán kính, di chuyển hình tròn xung quanh bằng giá trị vị trí, hoặc đặt reference box như chúng ta đã làm với `inset()`.

Ví dụ dưới đây kết hợp generated content với hàm `circle()` sử dụng từ khóa `top left` cho vị trí. Điều này tạo ra shape góc phần tư hình tròn ở góc trên bên trái của trang để văn bản chảy xung quanh.

```html live-sample___circle-generated
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___circle-generated
body {
  font: 1.2em sans-serif;
}

.box::before {
  content: "";
  float: left;
  width: 250px;
  height: 250px;
  shape-outside: circle(50% at top left);
}
```

{{EmbedLiveSample("circle-generated", "", "300px")}}

### Shape sẽ bị cắt bởi margin box

Như đã lưu ý trong phần [reference box](#the_reference_box) ở trên, `margin-box` sẽ cắt shape. Bạn có thể thấy điều này bằng cách di chuyển tâm của hình tròn về phía nội dung bằng cách đặt vị trí thành `60%`. Tâm của hình tròn sẽ gần nội dung hơn và hình tròn sẽ vượt ra ngoài margin-box. Điều này có nghĩa là phần mở rộng bị cắt và trở nên vuông góc.

```css
img {
  float: left;
  shape-outside: circle(50% at 60%);
}
```

![The circle shape is clipped by the margin box](shapes-circle-clipped.png)

## ellipse()

Ellipse là hình tròn bị dẹt. Do đó, hàm [`ellipse()`](/en-US/docs/Web/CSS/Reference/Values/basic-shape/ellipse) hoạt động rất giống với `circle()` ngoại trừ việc chúng ta phải chỉ định hai bán kính, `x` và `y`, theo thứ tự đó.

Chúng có thể được theo sau bởi một hoặc hai giá trị `<position>`, như với `circle()`, để xác định vị trí tâm của ellipse. Trong ví dụ dưới đây, chúng ta có ellipse với bán kính `x` là `40%`, bán kính `y` là `50%` và `<position>` được đặt thành `left`. Điều này có nghĩa là tâm của ellipse ở giữa cạnh trái của reference box. Điều này tạo ra shape nửa ellipse để văn bản bọc xung quanh. Bạn có thể thay đổi các giá trị này để xem ellipse thay đổi như thế nào.

```html live-sample___ellipse
<div class="box">
  <div class="shape"></div>
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___ellipse
body {
  font: 1.2em sans-serif;
}
.shape {
  float: left;
  shape-outside: ellipse(40% 50% at left);
  margin: 20px;
  width: 100px;
  height: 200px;
}
```

{{EmbedLiveSample("ellipse", "", "300px")}}

Các giá trị từ khóa `closest-side` và `farthest-side` hữu ích để tạo nhanh ellipse dựa trên kích thước reference box của phần tử được float.

```html hidden live-sample___ellipse-keywords
<div class="box">
  <div class="shape"></div>
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___ellipse-keywords
body {
  font: 1.2em sans-serif;
}

.shape {
  float: left;
  shape-outside: ellipse(closest-side farthest-side at 30%);
  margin: 20px;
  width: 100px;
  height: 140px;
}
```

{{EmbedLiveSample("ellipse-keywords", "", "250px")}}

## polygon()

Hàm [`polygon()`](/en-US/docs/Web/CSS/Reference/Values/basic-shape/polygon) phức tạp hơn, cho phép tạo các shape đa giác nhiều cạnh. Shape này nhận ba hoặc nhiều cặp giá trị trở lên (một polygon phải vẽ ít nhất một hình tam giác). Mỗi cặp giá trị cách nhau bởi dấu cách được phân cách bởi dấu phẩy và đại diện cho tọa độ của một đỉnh duy nhất được vẽ tương đối so với reference box. Mỗi cặp tọa độ xác định một cạnh của polygon, với cạnh cuối cùng được xác định bởi bộ tọa độ đầu tiên và cuối cùng.

Ví dụ dưới đây tạo shape để văn bản theo bằng hàm `polygon()`. Hãy thử thay đổi các giá trị tọa độ để xem shape thay đổi như thế nào.

```html hidden live-sample___polygon
<div class="box">
  <div class="shape"></div>
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___polygon
body {
  font: 1.2em sans-serif;
}

.shape {
  float: left;
  shape-outside: polygon(
    0px 0px,
    0px 189px,
    100.48% 94.71%,
    200px 120px,
    80.67% 37.17%
  );
  width: 200px;
  height: 200px;
}
```

{{EmbedLiveSample("polygon", "", "250px")}}

Để tạo các shape phức tạp hơn, bạn có thể xác định đường viền của bất kỳ shape nào bằng hàm [`path()`](/en-US/docs/Web/CSS/Reference/Values/basic-shape/path) hoặc [`shape()`](/en-US/docs/Web/CSS/Reference/Values/basic-shape/shape).

Các hàm `inset()`, `circle()`, `ellipse()` và `polygon()` có thể được kiểm tra và chỉnh sửa bằng Shape Inspector trong Firefox Developer Tools. Ảnh chụp màn hình dưới đây hiển thị shape được làm nổi bật trong công cụ.

![The polygon basic shape, highlighted with the Shapes Inspector.](shapes-polygon.png)

Một tài nguyên khác là [Clippy](https://bennettfeely.com/clippy/), một công cụ tạo shape với các ví dụ sử dụng thuộc tính CSS {{cssxref("clip-path")}}, sử dụng các hàm và giá trị basic shape tương tự như thuộc tính `shape-outside`.
