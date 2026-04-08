---
title: Introduction to CSS clipping
short-title: Clipping
slug: Web/CSS/Guides/Masking/Clipping
page-type: guide
sidebar: cssref
---

CSS clipping cho phép bạn định nghĩa các phần hiển thị của một phần tử trong khi ẩn các phần khác, thực chất là "cắt" nội dung của nó trong một hình dạng hoặc vùng cụ thể. Với clipping, các phần tử không bị giới hạn ở dạng hình chữ nhật và có thể được thiết kế theo những cách hấp dẫn về mặt thị giác. Hướng dẫn này khám phá thuộc tính {{cssxref("clip-path")}} cùng với một số ví dụ.

## CSS clipping

Clipping là một kỹ thuật CSS được dùng để cắt (ẩn) các phần của một phần tử, chỉ hiển thị vùng của phần tử nằm trong một path do developer xác định. Các vùng clip được tạo bằng vector path; mọi thứ trong path đều hiển thị trong khi các vùng bên ngoài path bị ẩn.

### Thuộc tính `clip-path`

Thuộc tính `clip-path` áp dụng clipping. Giá trị mà nó chấp nhận là một vector path định nghĩa vùng của phần tử cần được giữ hiển thị. Path có thể được định nghĩa bằng box, tham chiếu đến [SVG `<clipPath>`](#svg_as_source) hoặc các [shape và path](#shape_function) CSS. Trong ví dụ sau, chúng ta clip một {{htmlelement("div")}} hình vuông màu xanh, tạo ra hình thoi, bằng cách sử dụng hàm {{cssxref("basic-shape/polygon","polygon()")}} làm clipping path:

```html hidden live-sample__clip-path
<div class="diamond"></div>
```

```css live-sample__clip-path
.diamond {
  height: 200px;
  width: 200px;
  background-color: blue;

  clip-path: polygon(0 50%, 50% 100%, 100% 50%, 50% 0);
}
```

{{ EmbedLiveSample('clip-path', 230, 230) }}

Với thuộc tính `clip-path`, bạn có thể tạo ra các hình dạng phức tạp bằng cách clip một phần tử theo `<basic-shape>` hoặc theo [SVG source](#svg_as_source). Bạn có thể [animate và transition các hình dạng `clip-path`](#animation) nếu các trạng thái được khai báo có cùng số điểm vector.

### Các giá trị của thuộc tính `clip-path`

Để clip trực quan một phần tử, thuộc tính `clip-path` được đặt thành một [`<geometry-box>`](/en-US/docs/Web/CSS/Reference/Properties/clip-path#geometry-box), một {{cssxref("url_value", "url")}} trỏ đến {{svgElement("clipPath")}} clip source, hoặc một {{cssxref("basic-shape")}} được tạo bằng [shape function](/en-US/docs/Web/CSS/Reference/Values/Functions#shape_functions).

### Geometry box

Thuộc tính `clip-path` ẩn mọi thứ bên ngoài vùng được clip. Clipping cơ bản nhất được thực hiện thông qua geometry box. Bạn có thể clip một phần tử dựa trên margin, border, padding hoặc content của nó. Hiệu ứng của các giá trị visual box này có thể đạt được thông qua các thuộc tính CSS khác, chẳng hạn như đặt {{cssxref("border-color")}} thành transparent và {{cssxref("background-origin")}} theo visual box mong muốn. Chúng ta xem xét những giá trị này chủ yếu vì chúng được dùng kết hợp với các shape function, mà chúng ta sẽ xem xét sau, để định nghĩa nguồn gốc của shape clip path.

[Hiểu về reference box](/en-US/docs/Web/CSS/Guides/Shapes/Using_shape-outside#the_reference_box) được sử dụng bởi CSS shapes là điều quan trọng khi dùng `clip-path`, đặc biệt với [basic shapes](#clipping_to_basic_shapes), vì reference box định nghĩa hệ tọa độ của một hình dạng.

#### Các giá trị visual box

Ví dụ trực tiếp này minh họa các giá trị visual box khác nhau của thuộc tính `clip-path` trên một phần tử, trong khi so sánh với thuộc tính CSS `background-origin`. Chúng ta đã áp dụng {{cssxref("border")}}, {{cssxref("background-color")}}, {{cssxref("background-image")}} và {{cssxref("padding")}} cho {{htmlelement("blockquote")}}. Chọn một radio button để cập nhật `--value` thành một giá trị `<geometry-box>` khác nhau, cập nhật các giá trị resolved của {{cssxref("background-origin")}} và {{cssxref("clip-path")}}.

```css hidden
body {
  display: flex;
  flex-flow: row wrap;
  place-content: center;
}
blockquote {
  float: left;
  font-size: 1.2rem;
}
q {
  color: white;
  font-family: sans-serif;
  display: block;
  margin-bottom: 0.5em;
}
p {
  margin: 0;
  line-height: 1.6;
}

body {
  --value: initial;
}
body:has([value="border-box"]:checked) {
  --value: border-box;
}
body:has([value="padding-box"]:checked) {
  --value: padding-box;
}
body:has([value="content-box"]:checked) {
  --value: content-box;
}
body:has([type="checkbox"]:checked) blockquote {
  border-radius: 70px;
}
```

```css
blockquote {
  width: 210px;
  padding: 20px;
  margin: 20px;
  border: 20px dashed #dedede;
  background-color: #ededed;
  background-image: linear-gradient(rebeccapurple, magenta);
  background-repeat: no-repeat;
}

.clippath {
  background-origin: var(--value);
  clip-path: var(--value);
}

.box-model {
  background-origin: var(--value);
}
```

```html hidden
<blockquote class="clippath">
  <q
    >I've learned that people will forget what you said, people will forget what
    you did, but people will never forget how you made them feel.</q
  >
  <cite>&mdash; Maya Angelou</cite>
</blockquote>
<blockquote class="box-model">
  <q
    >I've learned that people will forget what you said, people will forget what
    you did, but people will never forget how you made them feel.</q
  >
  <cite>&mdash; Maya Angelou</cite>
</blockquote>

<fieldset>
  <legend>Select the geometry box value:</legend>
  <p>
    <label
      ><input type="radio" name="gb" value="border-box" /> border-box</label
    >
  </p>
  <p>
    <label
      ><input type="radio" name="gb" value="padding-box" /> padding-box</label
    >
  </p>
  <p>
    <label
      ><input type="radio" name="gb" value="content-box" /> content-box</label
    >
  </p>
  <p>
    <label
      ><input type="radio" name="gb" value="initial" checked /> initial</label
    >
  </p>
</fieldset>
<p>
  <label><input type="checkbox" /> Change the border radius</label>
</p>
```

{{ EmbedLiveSample('visual box values', 230, 430) }}

Khi một `<geometry>` box được chỉ định kết hợp với `<basic-shape>`, giá trị đó định nghĩa reference box cho basic shape. Nếu được chỉ định một mình, nó khiến các cạnh của box được chỉ định, bao gồm bất kỳ hình dạng góc nào (chẳng hạn như `border-radius`), trở thành clipping path.

#### Shape origin

Ví dụ trước có thể khiến bạn nghĩ rằng các giá trị `<geometry-box>` là vô dụng, vì bạn có thể dùng `background-origin` thay thế. Và bạn hoàn toàn có thể. Nhưng khi clip bằng basic shapes, `<geometry-box>`, khi được đưa vào cùng với `<basic-shape>` làm giá trị `clip-path`, sẽ định nghĩa reference box cho, hay nguồn gốc của, hình dạng đó. Chúng ta có thể kết hợp hai ví dụ trước để minh họa điều này.

```html hidden
<blockquote class="clippath">
  <q
    >I've learned that people will forget what you said, people will forget what
    you did, but people will never forget how you made them feel.</q
  >
  <cite>&mdash; Maya Angelou</cite>
</blockquote>
<fieldset>
  <legend>Select the origin of the clip path shape:</legend>
  <p>
    <label
      ><input type="radio" name="gb" value="border-box" checked />
      border-box</label
    >
  </p>
  <p>
    <label
      ><input type="radio" name="gb" value="padding-box" /> padding-box</label
    >
  </p>
  <p>
    <label
      ><input type="radio" name="gb" value="content-box" /> content-box</label
    >
  </p>
</fieldset>
```

```css
blockquote {
  width: 210px;
  padding: 20px;
  margin: 20px;
  border: 20px dashed #dedede;
  background-color: #ededed;
  background-image: linear-gradient(rebeccapurple, magenta);
  background-repeat: no-repeat;
  background-origin: border-box;
  clip-path: var(--value) polygon(0 50%, 50% 100%, 100% 50%, 50% 0);
}
```

```css hidden
blockquote {
  font-size: 1.2rem;
}
q {
  color: white;
  font-family: sans-serif;
  display: block;
  margin-bottom: 0.5em;
}
p {
  margin: 0;
  line-height: 1.6;
}

body {
  --value: "";
}
body:has([value="border-box"]:checked) {
  --value: border-box;
}
body:has([value="padding-box"]:checked) {
  --value: padding-box;
}
body:has([value="content-box"]:checked) {
  --value: content-box;
}
```

{{ EmbedLiveSample('shape origin', 230, 420) }}

Để xem thêm ví dụ, hãy xem [`clip-path` shapes and geometry boxes](/en-US/docs/Web/CSS/Reference/Properties/clip-path#shapes_and_geometry_boxes).

Ngay cả các giá trị như `clip-path: margin-box` cũng có thể hữu ích. Ngoài hiệu ứng thị giác sáng tạo được tạo ra bằng cách đặt cạnh của clip-path tại cạnh margin-box, bất kỳ giá trị computed nào của `clip-path` khác `none` đều dẫn đến việc tạo ra một [stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) mới, tương tự như cách CSS {{cssxref("opacity")}} làm với các giá trị khác `1`.

## Clipping theo basic shapes

Hỗ trợ giá trị {{cssxref("basic-shape")}} của thuộc tính `clip-path` cung cấp một cách mạnh mẽ để tạo hình dạng các phần tử. Các shape function đa dạng cho phép định nghĩa các vùng clip chính xác, thực chất là điêu khắc các phần tử thành những hình dạng độc đáo. Các basic shape function bao gồm:

- {{cssxref("basic-shape/circle","circle()")}}
- {{cssxref("basic-shape/ellipse","ellipse()")}}
- {{cssxref("basic-shape/inset","inset()")}}
- {{cssxref("basic-shape/path","path()")}}
- {{cssxref("basic-shape/polygon","polygon()")}}
- {{cssxref("basic-shape/rect","rect()")}}
- {{cssxref("basic-shape/shape","shape()")}}
- {{cssxref("basic-shape/xywh","xywh()")}}

Kích thước và vị trí của những hình dạng này được định nghĩa bởi giá trị `<geometry-box>`, mặc định là border-box được dùng làm reference box nếu giá trị `clip-path` bao gồm một hình dạng mà không có component value `<geometry-box>`.

Một số hàm này có vẻ chỉ cung cấp các tùy chọn clip cơ bản được xác định trước. Chúng có vẻ sao chép lại hiệu ứng bạn có thể tạo bằng {{cssxref("border-radius")}}, nhưng nếu bạn [toggle thuộc tính `border-radius`](#visual_box_values) trong ví dụ trước, bạn có thể đã nhận ra sức mạnh của CSS clipping. Shape cung cấp nhiều kiểm soát hơn. Ví dụ, `inset()` cho phép clip một hình chữ nhật với margin chính xác. Sức mạnh và kiểm soát thực sự đến từ `path()`, `shape()` và ngay cả `polygon()`, cho phép tạo các hình dạng tùy chỉnh nhiều điểm.

### Tạo polygon

Với `polygon()`, bằng cách định nghĩa các cặp tọa độ, mỗi cặp đại diện cho một đỉnh của hình, bạn có thể tạo ra các hình dạng phức tạp như ngôi sao hoặc các hình trừu tượng. Các tọa độ định nghĩa các điểm vector được nối với nhau bằng các đường thẳng.

Ở đây chúng ta dùng hàm `polygon()` để tạo một ngôi sao:

```html hidden
<div class="star"></div>
```

```css
.star {
  width: 200px;
  height: 200px;
  background: linear-gradient(rebeccapurple, magenta) blue;
  clip-path: polygon(
    50% 0%,
    61% 35%,
    100% 35%,
    68% 57%,
    79% 91%,
    50% 70%,
    21% 91%,
    32% 57%,
    0% 35%,
    39% 35%,
    50% 0%
  );
}
```

{{ EmbedLiveSample('Creating polygons', 230, 230) }}

### Animation

Các hình dạng được clip có thể được animate và transition bằng cách khai báo cùng số điểm vector cho các trạng thái khác nhau.

```html hidden
<div class="star"></div>
```

```css hidden
.star {
  width: 200px;
  height: 200px;
  background: linear-gradient(rebeccapurple, magenta) blue;
  clip-path: polygon(
    50% 0%,
    61% 35%,
    100% 35%,
    68% 57%,
    79% 91%,
    50% 70%,
    21% 91%,
    32% 57%,
    0% 35%,
    39% 35%,
    50% 0%
  );
}
```

```css
@keyframes morphStar {
  from {
    clip-path: polygon(
      50% 0%,
      61% 35%,
      100% 35%,
      68% 57%,
      79% 91%,
      50% 70%,
      21% 91%,
      32% 57%,
      0% 35%,
      39% 35%,
      50% 0%
    );
  }
  to {
    clip-path: polygon(
      50% 10%,
      65% 30%,
      90% 20%,
      75% 60%,
      85% 95%,
      50% 80%,
      15% 95%,
      25% 60%,
      10% 20%,
      35% 30%,
      50% 10%
    );
  }
}

.star {
  animation: morphStar alternate 3s infinite ease-in-out;
}
```

{{ EmbedLiveSample('Animation', 230, 230) }}

### Hàm `path()`

Hàm `path()` cho phép vẽ hình dạng bằng các lệnh SVG. Hàm này nhận tham số tương đương với thuộc tính SVG {{svgattr("d")}}.

Ngôi sao từ ví dụ trước có thể được tạo bằng `path()`:

```html hidden
<div class="star"></div>
```

```css
.star {
  width: 200px;
  height: 200px;
  background: linear-gradient(rebeccapurple, magenta) blue;
  clip-path: path(
    "M100,0 L122,70 L200,70 L136,114 L158,182 L100,140 L42,182 L64,114 L0,70 L78,70 L100,0 Z"
  );
}
```

{{ EmbedLiveSample('The path function', 230, 230) }}

### Đường cong

Với `path()`, chúng ta không bị giới hạn ở các đường thẳng. Trong ví dụ này, chúng ta dùng hàm `path()` để tạo một trái tim:

```html hidden
<div class="heart"></div>
```

```css
.heart {
  width: 200px;
  height: 200px;
  background: linear-gradient(rebeccapurple, magenta) blue;
  clip-path: path(
    "M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
  );
}
```

{{ EmbedLiveSample('Curved lines', 230, 230) }}

### SVG là nguồn gốc

Thay vì truyền chuỗi thuộc tính SVG {{svgattr("d")}} làm tham số cho hàm `path()`, giá trị của thuộc tính `clip-path` có thể tham chiếu trực tiếp đến phần tử SVG {{svgElement("clipPath")}}.

```html
<div class="heart"></div>
<svg height="0" width="0">
  <clipPath id="heart">
    <path
      d="M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z" />
  </clipPath>
</svg>
```

`id` của `<clipPath>` là tham số của hàm {{cssxref("url_function", "url()")}}.

```css
.heart {
  width: 200px;
  height: 200px;
  background: linear-gradient(rebeccapurple, magenta) blue;
  clip-path: url("#heart");
}
```

{{ EmbedLiveSample('svg as source', 230, 230) }}

### Shape function

Cú pháp SVG path không phải là cách trực quan nhất. Vì lý do này, CSS cũng cung cấp hàm `shape()`. Hàm `shape()` cũng nhận các lệnh vẽ path, nhưng với cú pháp dễ đọc hơn cho con người. Chúng ta có thể tái tạo trái tim với CSS mang tính khai báo hơn:

```css
.heart {
  clip-path: shape(
    from 20px 70px,
    arc to 100px 70px of 1% cw,
    arc to 180px 70px of 1% cw,
    curve to 100px 190px with 180px 130px,
    curve to 20px 70px with 20px 130px
  );
}
```

Hàm `shape()` mạnh mẽ hơn ở chỗ nó chấp nhận các giá trị và đơn vị CSS (`path()` bị giới hạn ở tọa độ), bao gồm cả việc dùng các CSS math function như `calc()`. Bằng cách sử dụng biến, chúng ta có thể tạo ra các hình dạng (và box) với nhiều kích thước khác nhau:

```css
:root {
  --m: 10;
}
.heart {
  width: calc(20px * var(--m));
  height: calc(20px * var(--m));
  display: inline-block;
  background: linear-gradient(rebeccapurple, magenta) blue;
  clip-path: border-box
    shape(
      from calc(2px * var(--m)) calc(7px * var(--m)),
      arc to calc(10px * var(--m)) calc(7px * var(--m)) of 1% cw,
      arc to calc(18px * var(--m)) calc(7px * var(--m)) of 1% cw,
      curve to calc(10px * var(--m)) calc(19px * var(--m)) with
        calc(18px * var(--m)) calc(13px * var(--m)),
      curve to calc(2px * var(--m)) calc(7px * var(--m)) with
        calc(2px * var(--m)) calc(13px * var(--m))
    );
}
.small {
  --m: 4;
}

.medium {
  --m: 8;
}

.large {
  --m: 12;
}
```

```html
<div class="heart small"></div>
<div class="heart medium"></div>
<div class="heart large"></div>
```

{{ EmbedLiveSample('shape function', 230, 270) }}

### Bao văn bản quanh các hình dạng đã clip

Các phần tử được clip vẫn là các hộp hình chữ nhật. Clipping có nghĩa là phần tử của bạn trông không giống một hộp; nhưng nó vẫn là một hộp. Để bao nội dung inline xung quanh các hình dạng không phải hình chữ nhật (hoặc hình chữ nhật) mà bạn định nghĩa, hãy dùng thuộc tính {{cssxref("shape-outside")}}. Theo mặc định, nội dung inline bao quanh margin box của nó; `shape-outside` cung cấp cách tùy chỉnh việc bao này, giúp có thể bao văn bản xung quanh các phần tử bạn đã clip, theo đúng clip path bạn đã tạo thay vì hộp hình chữ nhật của phần tử.

Nội dung bao gồm hai phần tử cần được clip và nội dung sẽ được định hình xung quanh chúng.

```html
<div class="leftTriangle"></div>
<div class="rightTriangle"></div>
<blockquote>
  <q>
    I've learned that people will forget what you said, people will forget what
    you did, but people will never forget how you made them feel.</q
  >
  <cite>&mdash; Maya Angelou</cite>
</blockquote>
```

```css hidden
:root {
  --m: 10;
  font-size: calc(3px * var(--m));
}
div {
  width: calc(0.75em * var(--m));
  height: calc(0.75em * var(--m));
  display: inline-block;
  background: linear-gradient(rebeccapurple, magenta) blue;
}
cite {
  display: block;
  text-align: right;
}
```

Ngoài việc áp dụng cùng một hình dạng cho cả thuộc tính `clip-shape` và `shape-outside`, phần tử được clip phải được float để phần tử được clip nằm trên cùng dòng với nội dung.

```css
.leftTriangle {
  clip-path: polygon(0 0, 0 100%, 100% 0);
  shape-outside: polygon(0 0, 0 100%, 100% 0);
  float: left;
}
.rightTriangle {
  clip-path: polygon(100% 0, 100% 100%, 0 100%);
  shape-outside: polygon(100% 0, 100% 100%, 0 100%);
  float: right;
}
```

{{ EmbedLiveSample('Wrapping text around your clipped shapes', 230, 290) }}

## Xem thêm

- {{cssxref("basic-shape")}}
- {{cssxref("shape-image-threshold")}}
- {{cssxref("shape-margin")}}
- [Tổng quan về shapes](/en-US/docs/Web/CSS/Guides/Shapes/Overview)
- [Giới thiệu về CSS masking](/en-US/docs/Web/CSS/Guides/Masking/Introduction)
- [Các thuộc tính CSS `mask`](/en-US/docs/Web/CSS/Guides/Masking/Mask_properties)
- [Khai báo nhiều mask](/en-US/docs/Web/CSS/Guides/Masking/Multiple_masks)
- Module [CSS masking](/en-US/docs/Web/CSS/Guides/Masking)
- Module [CSS shapes](/en-US/docs/Web/CSS/Guides/Shapes)
