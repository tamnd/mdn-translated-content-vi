---
title: offset-path
slug: Web/CSS/Reference/Properties/offset-path
page-type: css-property
browser-compat: css.properties.offset-path
sidebar: cssref
---

Thuộc tính **`offset-path`** [CSS](/en-US/docs/Web/CSS) chỉ định đường dẫn để phần tử theo và xác định vị trí của phần tử trong khung chứa cha hoặc hệ tọa độ SVG. Đường dẫn là một đường thẳng, đường cong, hoặc hình dạng hình học mà phần tử được đặt hoặc di chuyển theo.

Thuộc tính `offset-path` được sử dụng kết hợp với các thuộc tính {{cssxref("offset-distance")}}, {{cssxref("offset-rotate")}}, và {{cssxref("offset-anchor")}} để kiểm soát vị trí và hướng của phần tử dọc theo đường dẫn.

{{InteractiveExample("CSS Demo: offset-path")}}

```css interactive-example-choice
offset-path: path("M-70,-40 C-70,70 70,70 70,-40");
```

```css interactive-example-choice
offset-path: path("M0,0 L60,70 L-60,30z");
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element"></div>
  <button id="playback" type="button">Play</button>
</section>
```

```css interactive-example
#example-element {
  width: 24px;
  height: 24px;
  background: #2bc4a2;
  animation: distance 8000ms infinite linear;
  animation-play-state: paused;
  clip-path: polygon(0% 0%, 70% 0%, 100% 50%, 70% 100%, 0% 100%, 30% 50%);
}

#example-element.running {
  animation-play-state: running;
}

#playback {
  position: absolute;
  top: 0;
  left: 0;
  font-size: 1em;
}

@keyframes distance {
  0% {
    offset-distance: 0%;
  }
  100% {
    offset-distance: 100%;
  }
}

#default-example {
  position: relative;
}
```

```js interactive-example
const example = document.getElementById("example-element");
const button = document.getElementById("playback");

button.addEventListener("click", () => {
  if (example.classList.contains("running")) {
    example.classList.remove("running");
    button.textContent = "Play";
  } else {
    example.classList.add("running");
    button.textContent = "Pause";
  }
});
```

## Cú pháp

```css
/* Mặc định */
offset-path: none;

/* Đoạn thẳng */
offset-path: ray(45deg closest-side contain);
offset-path: ray(contain 150deg at center center);
offset-path: ray(45deg);

/* URL */
offset-path: url("#my-circle");

/* Basic shape */
offset-path: circle(50% at 25% 25%);
offset-path: ellipse(50% 50% at 25% 25%);
offset-path: inset(50% 50% 50% 50%);
offset-path: polygon(30% 0%, 70% 0%, 100% 50%, 30% 100%, 0% 70%, 0% 30%);
offset-path: path("M 0,200 Q 200,200 260,80 Q 290,20 400,0 Q 300,100 400,200");
offset-path: rect(5px 5px 160px 145px round 20%);
offset-path: xywh(0 5px 100% 75% round 15% 0);

/* Hộp tọa độ */
offset-path: content-box;
offset-path: padding-box;
offset-path: border-box;
offset-path: fill-box;
offset-path: stroke-box;
offset-path: view-box;

/* Giá trị toàn cục */
offset-path: inherit;
offset-path: initial;
offset-path: revert;
offset-path: revert-layer;
offset-path: unset;
```

### Giá trị

Thuộc tính `offset-path` nhận giá trị `<offset-path>`, giá trị [`<coord-box>`](/en-US/docs/Web/CSS/Reference/Values/box-edge#values), hoặc cả hai, hoặc từ khóa `none`. Giá trị `<offset-path>` là hàm {{cssxref("ray","ray()")}}, giá trị {{cssxref("url_value", "&lt;url&gt;")}}, hoặc giá trị {{cssxref("basic-shape")}}.

- `none`
  - : Chỉ định rằng phần tử không theo bất kỳ đường dẫn offset nào. Giá trị `none` tương đương với việc phần tử không có bất kỳ [biến đổi offset](/en-US/docs/Web/CSS/Reference/Properties/offset) nào. Chuyển động của phần tử trong trường hợp này được xác định bởi các thuộc tính vị trí mặc định của nó, chẳng hạn như {{cssxref("top")}} và {{cssxref("left")}}, thay vì một đường dẫn offset. Đây là giá trị mặc định.

- `<offset-path>`
  - : Hàm `ray()`, giá trị `<url>`, hoặc giá trị `<basic-shape>` chỉ định đường dẫn offset hình học. Nếu bỏ qua, hình dạng đường dẫn cho giá trị `<coord-box>` là `inset(0 round X)`, trong đó `X` là giá trị của {{cssxref("border-radius")}} của phần tử thiết lập [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block).
    - {{cssxref("ray","ray()")}}
      - : Xác định một đường thẳng bắt đầu tại một vị trí được đặt, có độ dài nhất định và kéo dài theo góc được chỉ định. Hàm `ray()` chấp nhận tối đa bốn tham số — một {{CSSxRef("angle")}}, một giá trị kích thước tùy chọn, từ khóa tùy chọn `contain`, và tùy chọn `at <position>`.

    - {{cssxref("url_value", "&lt;url&gt;")}}
      - : Chỉ định ID của một [phần tử hình dạng SVG](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes). Đường dẫn là hình dạng của phần tử SVG {{SVGElement("circle")}}, {{SVGElement("ellipse")}}, {{SVGElement("line")}}, {{SVGElement("path")}}, {{SVGElement("polygon")}}, {{SVGElement("polyline")}}, hoặc {{SVGElement("rect")}} được tham chiếu bởi `id` của nó trong hàm `url()`. Nếu URL không tham chiếu đến phần tử hình dạng hoặc không hợp lệ, giá trị đã giải quyết cho đường dẫn offset là `path("M0,0")` (là một giá trị `<basic-shape>` hợp lệ).

    - {{cssxref("basic-shape")}}
      - : Chỉ định đường dẫn offset là đường dẫn tương đương của một [hàm CSS basic shape](/en-US/docs/Web/CSS/Reference/Values/basic-shape), chẳng hạn như {{cssxref("basic-shape/circle","circle()")}}, {{cssxref("basic-shape/ellipse","ellipse()")}}, {{cssxref("basic-shape/inset","inset()")}}, {{cssxref("basic-shape/path","path()")}}, {{cssxref("basic-shape/polygon","polygon()")}}, {{cssxref("basic-shape/rect","rect()")}}, hoặc {{cssxref("basic-shape/xywh","xywh()")}}. Ví dụ, nếu `<basic_shape>` là hàm `ellipse()`, thì đường dẫn là đường viền của hình ellipse, bắt đầu từ điểm ngoài cùng bên phải của hình ellipse, tiến theo chiều kim đồng hồ qua một vòng tròn đầy đủ. Đối với `ellipse()` và `circle()`, chấp nhận tham số `at <position>`, nếu `<position>` bị bỏ qua, vị trí mặc định là `center` trừ khi phần tử có {{cssxref("offset-position")}} được chỉ định. Trong trường hợp đó, giá trị `offset-position` được sử dụng cho tham số `at <position>`. Các hình dạng phức tạp hơn có thể được xác định bằng hàm {{cssxref("basic-shape/shape","shape()")}}.

- [`<coord-box>`](/en-US/docs/Web/CSS/Reference/Values/box-edge#values)
  - : Chỉ định thông tin kích thước của [hộp tham chiếu](/en-US/docs/Web/CSS/Guides/Shapes/Using_shape-outside#the_reference_box) chứa đường dẫn. Hộp tham chiếu được lấy từ phần tử thiết lập khối chứa cho phần tử này. Tham số này là tùy chọn. Nếu không được chỉ định, giá trị mặc định là `border-box` trong ngữ cảnh CSS. Trong ngữ cảnh SVG, giá trị được coi là `view-box`. Nếu `ray()` hoặc `<basic-shape>` được sử dụng để xác định đường dẫn offset, giá trị `<coord-box>` cung cấp hộp tham chiếu cho ray hoặc `<basic-shape>`, tương ứng. Nếu `<url>` được sử dụng để xác định đường dẫn offset, giá trị `<coord-box>` cung cấp viewport và hệ tọa độ người dùng cho phần tử hình dạng, với gốc tọa độ (`0 0`) ở góc trên bên trái và kích thước là `1px`.

## Mô tả

Thuộc tính `offset-path` xác định một đường dẫn mà một phần tử được tạo hoạt ảnh có thể theo. Một đường dẫn offset là một đường dẫn được chỉ định với một hoặc nhiều đường dẫn phụ hoặc hình học của một basic shape không được tạo kiểu. Vị trí chính xác của phần tử trên đường dẫn offset được xác định bởi thuộc tính {{cssxref("offset-distance")}}. Mỗi hình dạng hoặc đường dẫn phải xác định vị trí ban đầu cho giá trị tính toán là `0` của {{cssxref("offset-distance")}} và một hướng ban đầu chỉ định góc xoay của đối tượng đến vị trí ban đầu.

Các phiên bản đầu của đặc tả gọi thuộc tính này là `motion-path`. Nó đã được đổi thành `offset-path` vì thuộc tính mô tả các vị trí tĩnh, không phải chuyển động.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tạo offset-path bằng cách định vị theo hộp cạnh

Ví dụ này minh họa việc sử dụng các giá trị `<coord-box>` khác nhau trong thuộc tính `offset-path`.

```html hidden
<div class="box blueBox"></div>
<div class="box redBox"></div>
<div class="box greenBox"></div>
```

```css hidden
body {
  width: 300px;
  height: 200px;
  border-radius: 50px;
  border: dashed aqua;
  border-width: 25px;
  padding: 25px;
  margin: 50px;
}
```

```css
.box {
  width: 40px;
  height: 20px;
  animation: move 8000ms infinite ease-in-out;
}

.blueBox {
  background-color: blue;
  offset-path: border-box;
  offset-distance: 5%;
}

.greenBox {
  background-color: green;
  offset-path: padding-box;
  offset-distance: 8%;
}

.redBox {
  background-color: red;
  offset-path: content-box;
  offset-distance: 12%;
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

Trong ví dụ này, margin, border và padding đã được cố tình cấp các giá trị lớn để minh họa việc đặt các hình chữ nhật màu xanh dương, xanh lá cây và đỏ trên các cạnh `<coord-box>` tương ứng: border-box, padding-box và content-box.

![Hình chữ nhật màu xanh dương nằm trên cạnh ngoài của border box, hình chữ nhật màu xanh lá cây nằm trên cạnh trong của border, là cạnh ngoài của padding box, và hình chữ nhật đỏ nằm trên cạnh ngoài của content box.](offset-path-coord-box.png)

#### Kết quả

{{EmbedLiveSample('Creating an offset-path using box-edge positioning', '100%', 400)}}

### Tạo offset-path bằng path()

Trong ví dụ này, phần tử {{svgelement("svg")}} tạo một ngôi nhà với ống khói và cũng xác định hai nửa của một cái kéo. Ngôi nhà và ống khói được tạo thành từ các hình chữ nhật và đa giác, và các nửa kéo được đại diện bởi hai phần tử đường dẫn riêng biệt. Trong mã CSS, thuộc tính `offset-path` được sử dụng để chỉ định một đường dẫn để theo cho hai nửa kéo. Đường dẫn được xác định bởi CSS này giống hệt với đường dẫn được biểu diễn bởi phần tử `<path>` trong SVG, là đường viền của ngôi nhà bao gồm ống khói.

```html live-sample___offset_path_path
<svg
  xmlns="http://www.w3.org/2000/svg"
  width="700"
  height="450"
  viewBox="350 0 1400 900">
  <title>House and Scissors</title>
  <rect x="595" y="423" width="610" height="377" fill="blue" />
  <polygon points="506,423 900,190 1294,423" fill="yellow" />
  <polygon points="993,245 993,190 1086,190 1086,300" fill="red" />
  <path
    id="house"
    d="M900,190 L993,245 V201 A11,11 0 0,1 1004,190 H1075 A11,11 0 0,1 1086,201 V300 L1294,423 H1216 A11,11 0 0,0 1205,434 V789 A11,11 0 0,1 1194,800 H606 A11,11 0 0,1 595,789 V434 A11,11 0 0,0 584,423 H506 L900,190"
    fill="none"
    stroke="black"
    stroke-width="13"
    stroke-linejoin="round"
    stroke-linecap="round" />
  <path
    id="first-scissor-half"
    class="scissor-half"
    d="M30,0 H-10 A10,10 0 0,0 -20,10 A20,20 0 1,1 -40,-10 H20 A10,10 0 0,1 30,0 M-40,20 A10,10 1 0,0 -40,0 A10,10 1 0,0 -40,20 M0,0" />
  <path
    id="second-scissor-half"
    class="scissor-half"
    d="M30,0 H-10 A10,10 0 0,1 -20,-10 A20,20 0 1,0 -40,10 H20 A10,10 0 0,0 30,0 M-40,-20 A10,10 1 0,0 -40,0 A10,10 1 0,0 -40,-20 M0,0" />
</svg>
```

```css live-sample___offset_path_path
.scissor-half {
  offset-path: path(
    "M900,190 L993,245 V201 A11,11 0 0,1 1004,190 H1075 A11,11 0 0,1 1086,201 V300 L1294,423 H1216 A11,11 0 0,0 1205,434 V789 A11,11 0 0,1 1194,800 H606 A11,11 0 0,1 595,789 V434 A11,11 0 0,0 584,423 H506 L900,190"
  );
  transform: translate(0px, 0px);
  fill: green;
  stroke: black;
  stroke-width: 5px;
  stroke-linejoin: round;
  stroke-linecap: round;
  fill-rule: evenodd;
  offset-anchor: 0 0;
}

#first-scissor-half {
  animation:
    move 12s linear infinite,
    rotate-left 1s infinite;
}
#second-scissor-half {
  animation:
    move 12s linear infinite,
    rotate-right 1s infinite;
}

@keyframes move {
  from {
    offset-distance: 0%;
  }
  to {
    offset-distance: 100%;
  }
}

@keyframes rotate-left {
  0% {
    offset-rotate: auto 0deg;
  }
  50% {
    offset-rotate: auto -45deg;
  }
  100% {
    offset-rotate: auto 0deg;
  }
}

@keyframes rotate-right {
  0% {
    offset-rotate: auto 0deg;
  }
  50% {
    offset-rotate: auto 45deg;
  }
  100% {
    offset-rotate: auto 0deg;
  }
}
```

#### Kết quả

Nếu không có thuộc tính `offset-path`, hai nửa kéo sẽ mặc định đến góc trên bên trái của canvas. Tuy nhiên, bằng cách sử dụng `offset-path`, hai nửa kéo được căn chỉnh với điểm bắt đầu của đường dẫn SVG, cho phép chúng di chuyển dọc theo nó.

{{EmbedLiveSample('offset_path_path', '100%', '450')}}

### Tạo offset-path bằng url()

Ví dụ này minh họa cách tham chiếu đến một hình dạng SVG để xác định hình dạng của đường dẫn mà phần tử có thể theo. Vòng tròn màu xanh lá (được xác định bởi `.target`) theo đường dẫn của một hình chữ nhật, được xác định bằng cách truyền ID của hình dạng SVG (`svgRect`) cho thuộc tính `offset-path` bằng cách sử dụng `url()`.

Hình chữ nhật SVG xác định hình dạng đường dẫn được hiển thị ở đây chỉ để minh họa trực quan rằng vòng tròn màu xanh lá thực sự đang theo đường dẫn được xác định bởi hình chữ nhật này.

```html live-sample___offset_path_url
<div class="outer">
  <div class="target"></div>
</div>
<svg width="400" height="200" xmlns="http://www.w3.org/2000/svg">
  <rect id="svgRect" x="50" y="50" width="200" height="100" />
</svg>
```

```css hidden live-sample___offset_path_url
.outer {
  position: absolute;
}
```

```css live-sample___offset_path_url
.target {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background-color: green;
  offset-path: url("#svgRect");
  offset-anchor: auto;
  animation: move 5s linear infinite;
}

#svgRect {
  fill: antiquewhite;
  stroke: black;
  stroke-width: 2;
}

@keyframes move {
  0% {
    offset-distance: 0%;
  }
  100% {
    offset-distance: 100%;
  }
}
```

{{EmbedLiveSample('live-sample___offset_path_url', '100%', '250')}}

### Các hình dạng khác nhau

Ví dụ này liên quan đến các giá trị {{cssxref("basic-shape")}} khác nhau: {{cssxref("basic-shape/circle", "circle()")}}, {{cssxref("basic-shape/ellipse", "ellipse()")}}, {{cssxref("basic-shape/inset", "inset()")}}, {{cssxref("basic-shape/polygon", "polygon()")}}.

```html
<div class="container">
  <div class="mover mover-path">path()</div>
  <div class="mover mover-circle">circle()</div>
  <div class="mover mover-ellipse">ellipse()</div>
  <div class="mover mover-inset">inset()</div>
  <div class="mover mover-polygon">polygon()</div>
</div>
```

```css
.container {
  border: 1px solid black;
  width: 80vw;
  height: 80vh;
  position: relative;
  left: 10vw;
  top: 10vh;
}

.mover {
  width: 100px;
  height: 80px;
  border-radius: 50%;
  line-height: 80px;
  text-indent: 10px;
  background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' id='e644da42-a34e-4ceb-a89a-89a4eb6dcc51' data-name='Layer 1' viewBox='0 0 71.08 54.62'%3E%3Ctitle%3Epointer-hand%3C/title%3E%3Cpath d='M43.56,49.35a5.24,5.24,0,0,0-1.27-3.43,5.26,5.26,0,0,0,1.86-9,5.26,5.26,0,0,0-.5-9.53L66.12,27c2.28-.07,5-1.57,5-4.58a5.06,5.06,0,0,0-4.58-4.83L34.08,17c3.48-2.89,6.26-6.55,6.73-11.08C41.45-.14,36.07-1.15,35,1.09,32,7.11,23,12.75,17.42,15.52,8.64,19.08,0,19.77,0,34.56,0,42.7,2.7,47.94,9.42,51c5.51,2.52,13.71,3.59,25.36,3.59H38.3A5.27,5.27,0,0,0,43.56,49.35Z'/%3E%3C/svg%3E")
    no-repeat;
  background-size: cover;
  color: white;
  animation: move 10s linear infinite;
  font-family: monospace;
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  transform-origin: center center;
}
.mover-path {
  top: 50px;
  motion-path: path(
    "M18.45,58.46s52.87-70.07,101.25-.75,101.75-6.23,101.75-6.23S246.38,5.59,165.33,9.08s-15,71.57-94.51,74.56S18.45,58.46,18.45,58.46Z"
  );
  offset-path: path(
    "M18.45,58.46s52.87-70.07,101.25-.75,101.75-6.23,101.75-6.23S246.38,5.59,165.33,9.08s-15,71.57-94.51,74.56S18.45,58.46,18.45,58.46Z"
  );
}
.mover-circle {
  top: 150px;
  offset-path: circle(100px at 50px 50px);
  motion-path: circle(100px at 50px 50px);
}
.mover-ellipse {
  top: 250px;
  offset-path: ellipse(25% 40% at 50% 50%);
  motion-path: ellipse(25% 40% at 50% 50%);
}
.mover-inset {
  top: 350px;
  offset-path: inset(5% 20% 15% 10%);
  motion-path: inset(5% 20% 15% 10%);
}
.mover-polygon {
  top: 450px;
  offset-path: polygon(
    30% 0%,
    70% 0%,
    100% 30%,
    100% 70%,
    70% 100%,
    30% 100%,
    0% 70%,
    0% 30%
  );
  motion-path: polygon(
    30% 0%,
    70% 0%,
    100% 30%,
    100% 70%,
    70% 100%,
    30% 100%,
    0% 70%,
    0% 30%
  );
}

@keyframes move {
  100% {
    motion-offset: 100%;
    offset-distance: 100%;
  }
}
```

{{EmbedLiveSample("different shapes", "", "500")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("offset")}}
- {{cssxref("offset-distance")}}
- {{cssxref("offset-rotate")}}
- Hướng dẫn SVG [paths](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Paths)
- {{cssxref("basic-shape/path","path()")}}
