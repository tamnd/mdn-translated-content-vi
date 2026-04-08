---
title: clip-path
slug: Web/CSS/Reference/Properties/clip-path
page-type: css-property
browser-compat: css.properties.clip-path
sidebar: cssref
---

Thuộc tính **`clip-path`** [CSS](/en-US/docs/Web/CSS) tạo vùng cắt xác định phần nào của phần tử sẽ được hiển thị. Các phần nằm trong vùng sẽ được hiển thị, còn các phần nằm ngoài sẽ bị ẩn.

{{InteractiveExample("CSS Demo: clip-path")}}

```css interactive-example-choice
clip-path: circle(40%);
```

```css interactive-example-choice
clip-path: ellipse(130px 140px at 10% 20%);
```

```css interactive-example-choice
clip-path: polygon(50% 0, 100% 50%, 50% 100%, 0 50%);
```

```css interactive-example-choice
clip-path: path("M 0 200 L 0,75 A 5,5 0,0,1 150,75 L 200 200 z");
```

```css interactive-example-choice
clip-path: rect(5px 145px 160px 5px round 20%);
```

```css interactive-example-choice
clip-path: xywh(0 5px 100% 75% round 15% 0);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <img
      class="transition-all"
      id="example-element"
      src="/shared-assets/images/examples/balloon-small.jpg"
      width="150" />
    We had agreed, my companion and I, that I should call for him at his house,
    after dinner, not later than eleven o'clock. This athletic young Frenchman
    belongs to a small set of Parisian sportsmen, who have taken up "ballooning"
    as a pastime. After having exhausted all the sensations that are to be found
    in ordinary sports, even those of "automobiling" at a breakneck speed, the
    members of the "Aéro Club" now seek in the air, where they indulge in all
    kinds of daring feats, the nerve-racking excitement that they have ceased to
    find on earth.
  </div>
</section>
```

```css interactive-example
section {
  align-items: flex-start;
}

.example-container {
  text-align: left;
  padding: 20px;
}

#example-element {
  float: left;
  width: 150px;
  margin: 20px;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
clip-path: none;

/* Giá trị <clip-source> */
clip-path: url("resources.svg#c1");

/* Giá trị <geometry-box> */
clip-path: margin-box;
clip-path: border-box;
clip-path: padding-box;
clip-path: content-box;
clip-path: fill-box;
clip-path: stroke-box;
clip-path: view-box;

/* Giá trị <basic-shape> */
clip-path: inset(100px 50px);
clip-path: circle(50px at 0 100px);
clip-path: ellipse(50px 60px at 10% 20%);
clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%);
clip-path: path(
  "M0.5,1 C0.5,1,0,0.7,0,0.3 A0.25,0.25,1,1,1,0.5,0.3 A0.25,0.25,1,1,1,1,0.3 C1,0.7,0.5,1,0.5,1 Z"
);
clip-path: rect(5px 5px 160px 145px round 20%);
clip-path: shape(from 0% 0%, line to 100% 0%, line to 50% 100%, close);
clip-path: xywh(0 5px 100% 75% round 15% 0);

/* Kết hợp hộp và hình dạng */
clip-path: padding-box circle(50px at 0 100px);

/* Giá trị toàn cục */
clip-path: inherit;
clip-path: initial;
clip-path: revert;
clip-path: revert-layer;
clip-path: unset;
```

Thuộc tính `clip-path` được xác định bằng một hoặc kết hợp các giá trị liệt kê bên dưới.

### Giá trị

- `<clip-source>`
  - : Một {{cssxref("url_value", "&lt;url&gt;")}} tham chiếu đến phần tử SVG {{SVGElement("clipPath")}}.
- {{cssxref("basic-shape")}}
  - : Một hình dạng có kích thước và vị trí được xác định bởi giá trị `<geometry-box>`. Nếu không có hộp hình học nào được chỉ định, `border-box` sẽ được dùng làm hộp tham chiếu. Các giá trị có thể là:
    - {{cssxref("basic-shape/inset","inset()")}}
      - : Xác định một hình chữ nhật thụt vào.
    - {{cssxref("basic-shape/circle","circle()")}}
      - : Xác định một hình tròn bằng bán kính và vị trí.
    - {{cssxref("basic-shape/ellipse","ellipse()")}}
      - : Xác định một hình elip bằng hai bán kính và vị trí.
    - {{cssxref("basic-shape/polygon","polygon()")}}
      - : Xác định một đa giác bằng quy tắc tô màu SVG và tập hợp các đỉnh.
    - {{cssxref("basic-shape/path","path()")}}
      - : Xác định một hình dạng bằng quy tắc tô màu SVG tùy chọn và định nghĩa đường dẫn SVG.
    - {{cssxref("basic-shape/rect","rect()")}}
      - : Xác định một hình chữ nhật bằng khoảng cách từ các cạnh của hộp tham chiếu.
    - {{cssxref("basic-shape/shape","shape()")}}
      - : Xác định hình dạng bằng quy tắc tô màu SVG tùy chọn và các lệnh hình dạng cho đường thẳng, đường cong và cung tròn.
    - {{cssxref("basic-shape/xywh","xywh()")}}
      - : Xác định một hình chữ nhật bằng khoảng cách từ cạnh trên và cạnh trái của hộp tham chiếu cùng chiều rộng và chiều cao của hình chữ nhật.

- `<geometry-box>`
  - : Nếu được chỉ định kết hợp với `<basic-shape>`, giá trị này xác định hộp tham chiếu cho hình dạng cơ bản. Nếu được chỉ định đơn lẻ, nó khiến các cạnh của hộp được chỉ định, bao gồm cả tạo hình góc (chẳng hạn như {{cssxref("border-radius")}}), trở thành đường cắt. Hộp hình học có thể là một trong các giá trị sau:
    - `margin-box`
      - : Sử dụng [hộp lề](/en-US/docs/Web/CSS/Guides/Shapes/From_box_values#margin-box) làm hộp tham chiếu.
    - `border-box`
      - : Sử dụng [hộp viền](/en-US/docs/Web/CSS/Guides/Shapes/From_box_values#border-box) làm hộp tham chiếu.
    - `padding-box`
      - : Sử dụng [hộp padding](/en-US/docs/Web/CSS/Guides/Shapes/From_box_values#padding-box) làm hộp tham chiếu.
    - `content-box`
      - : Sử dụng [hộp nội dung](/en-US/docs/Web/CSS/Guides/Shapes/From_box_values#content-box) làm hộp tham chiếu.
    - `fill-box`
      - : Sử dụng hộp bao đối tượng làm hộp tham chiếu.
    - `stroke-box`
      - : Sử dụng hộp bao nét vẽ làm hộp tham chiếu.
    - `view-box`
      - : Sử dụng viewport SVG gần nhất làm hộp tham chiếu. Nếu có thuộc tính {{SVGAttr("viewBox")}} trên phần tử tạo viewport SVG, hộp tham chiếu được đặt tại gốc của hệ tọa độ được xác lập bởi thuộc tính `viewBox` và kích thước của hộp tham chiếu được đặt theo giá trị chiều rộng và chiều cao của thuộc tính `viewBox`.

- `none`
  - : Không tạo đường cắt.

> [!NOTE]
> Giá trị được tính toán khác **`none`** dẫn đến việc tạo ra một [ngữ cảnh xếp chồng](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) mới, tương tự như {{cssxref("opacity")}} với giá trị khác `1`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Hình dạng và hộp hình học

Trong ví dụ này, hai hình tam giác được tạo bằng cách định nghĩa `polygon()` làm đường cắt trên các phần tử {{htmlelement("div")}}. Mỗi phần tử có nền màu đặc và viền dày. Phần tử `<div>` thứ hai có hộp tham chiếu được đặt thành `content-box`:

#### HTML

```html live-sample___shapes1 live-sample___shapes2 live-sample___shapes3
<div></div>
<div></div>
```

#### CSS

```css hidden live-sample___shapes1 live-sample___shapes2 live-sample___shapes3
body {
  display: flex;
  gap: 20px;
  flex-flow: row wrap;
}
```

```css live-sample___shapes1 live-sample___shapes2 live-sample___shapes3
div {
  height: 200px;
  width: 200px;
  box-sizing: border-box;
  background-color: rebeccapurple;
  border: 20px solid magenta;

  clip-path: polygon(50% 0, 100% 100%, 0 100%);
}

div:last-of-type {
  clip-path: content-box polygon(50% 0, 100% 100%, 0 100%);
}
```

#### Kết quả

{{EmbedLiveSample("shapes1", "", "230")}}

Đối với tam giác đầu tiên, chúng ta không chỉ định hộp tham chiếu; do đó mặc định là `border-box`, với vị trí 0% và 100% nằm ở cạnh ngoài của viền. Trong ví dụ thứ hai, chúng ta đặt `<geometry-box>` thành `content-box`, nghĩa là hộp tham chiếu cho hình dạng cơ bản là cạnh ngoài của vùng nội dung, nằm bên trong hộp padding. Vì ví dụ của chúng ta không có `padding`, đây là cạnh trong của viền.

### Hàm `shape()` so với `path()`

Mở rộng ví dụ trước, chúng ta tạo cùng một hình tam giác với các giá trị `<basic-shape>` khác nhau, minh họa cách hàm {{cssxref("basic-shape/shape", "shape()")}} và {{cssxref("basic-shape/path", "path()")}} cũng có thể được dùng để tạo đường cắt, trong đó `shape()` là giải pháp linh hoạt hơn.

Chúng ta dùng `path()` để định nghĩa đường cắt cho phần tử đầu tiên và `shape()` cho phần tử thứ hai, cả hai đều sử dụng `border-box` mặc định làm hộp tham chiếu:

```css live-sample___shapes2 live-sample___shapes3
div {
  clip-path: path("M100 0 L200 200 L0 200 Z");
}

div:last-of-type {
  clip-path: shape(from 50% 0, line to 100% 100%, line to 0 100%, close);
}
```

Kết quả là, đường dẫn được định nghĩa bằng hàm shape() sẽ co giãn theo phần tử, còn phiên bản path() thì không:

{{EmbedLiveSample("shapes2", "", "230")}}

Vì hàm `shape()` cho phép sử dụng giá trị {{cssxref("percentage")}} (và cả [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Reference/Properties/--*)), nó mạnh mẽ hơn.

Chúng ta sẽ minh họa bằng cách tăng kích thước phần tử nền:

```css live-sample___shapes3
div {
  width: 250px;
  height: 250px;
}
```

{{EmbedLiveSample("shapes3", "", "280")}}

Khả năng hiển thị, hay ít nhất là hiển thị một phần, của bốn cạnh viền trong ví dụ đường cắt được định nghĩa bằng hàm `shape()` là do các giá trị phần trăm cho phép đường dẫn co giãn theo phần tử. Trong phiên bản `path()`, phần tử lớn hơn nhưng hình dạng thì không. Kết quả là các viền trên và trái hiển thị một phần trong khi viền phải và dưới bị cắt.

### SVG làm nguồn cắt

Trong ví dụ này, chúng ta định nghĩa các phần tử SVG {{svgElement("clipPath")}} để dùng làm nguồn `clip-path`.

#### HTML

Chúng ta gồm hai phần tử {{htmlElement("div")}} và một phần tử `<svg>` chứa hai phần tử `<clipPath>`. Một `<clipPath>` chứa bốn phần tử {{svgElement("rect")}} cùng nhau định nghĩa ô cửa sổ, tạo ra khoảng trống hình chữ thập ở giữa, và phần tử còn lại chứa hai phần tử `<rect>` giao nhau.

```html
<svg height="0" width="0">
  <defs>
    <clipPath id="window">
      <rect y="0" x="0" width="80" height="80" />
      <rect y="0" x="120" width="80" height="80" />
      <rect y="120" x="0" width="80" height="80" />
      <rect y="120" x="120" width="80" height="80" />
    </clipPath>
    <clipPath id="cross">
      <rect y="0" x="80" width="40" height="200" />
      <rect y="80" x="0" width="200" height="40" />
    </clipPath>
  </defs>
</svg>

<div class="window">Window</div>
<div class="cross">Cross</div>
```

#### CSS

Chúng ta dùng [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) để các phần tử nằm cạnh nhau với khoảng cách, nếu có không gian. Chúng ta định nghĩa nền {{cssxref("gradient/conic-gradient", "conic-gradient()")}} trên cả hai phần tử `<div>`, tạo nền thú vị để cắt, cùng với {{cssxref("border")}}.

```css
body {
  display: flex;
  gap: 20px;
  flex-flow: row wrap;
  font: 2em sans-serif;
}

div {
  width: 200px;
  height: 200px;
  background-image: conic-gradient(
    at center,
    rebeccapurple,
    green,
    lightblue,
    rebeccapurple
  );

  border: 5px solid;
  box-sizing: border-box;
}
```

Sau đó chúng ta đặt `id` của `<clipPath>` làm `<clip-source>`. Chúng ta căn giữa văn bản theo chiều dọc trong ví dụ `cross` bằng {{cssxref("align-content")}}, nếu không văn bản sẽ bị cắt như đang xảy ra trong ví dụ `window`.

```css
.window {
  clip-path: url("#window");
}

.cross {
  clip-path: url("#cross");
  align-content: center;
}
```

#### Kết quả

{{EmbedLiveSample("SVG as clip source", "", "230")}}

Các phần tử, bao gồm viền và văn bản, bị cắt, chỉ những phần chồng lên các phần tử `<clipPath>` mới được vẽ trên trang.

### Các kiểu giá trị khác nhau

Ví dụ này minh họa các giá trị khác nhau của thuộc tính `clip-path` cắt một phần tử HTML {{htmlelement("img")}}.

#### HTML

HTML gồm một `<img>` sẽ bị cắt, một `<clipPath>` hình ngôi sao, và một phần tử {{htmlelement("select")}} để chọn giá trị thuộc tính `clip-path`.

```html
<img
  id="clipped"
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<svg height="0" width="0">
  <defs>
    <clipPath id="star">
      <path d="M100,0 42,180 196,70 4,70 158,180z" />
    </clipPath>
  </defs>
</svg>

<select id="clipPath">
  <option value="none">none</option>
  <option value="circle(100px at 110px 100px)">circle</option>
  <option value="url(#star)" selected>star</option>
  <option value="inset(20px round 20px)">inset</option>
  <option value="rect(20px 150px 200px 20px round 10%)">rect</option>
  <option value="xywh(0 20% 90% 67% round 0 0 5% 5px)">xywh</option>
  <option value="path('M 0 200 L 0,110 A 110,90 0,0,1 240,100 L 200 340 z')">
    path
  </option>
</select>
```

```html hidden
<pre id="log"></pre>
```

#### CSS

Hiển thị ban đầu gồm ngôi sao làm nguồn `clip-path`.

```css
#clipped {
  margin-bottom: 20px;
  clip-path: url("#star");
}
```

#### JavaScript

Khi bạn chọn một tùy chọn mới từ menu `<select>`, trình xử lý sự kiện cập nhật giá trị `clip-path` được đặt trên `<img>`.

```js
const clipPathSelect = document.getElementById("clipPath");
clipPathSelect.addEventListener("change", (evt) => {
  const path = evt.target.value;
  document.getElementById("clipped").style.clipPath = path;
  log(`clip-path: ${path};`);
});
```

```js hidden
function log(text) {
  const logElement = document.querySelector("#log");
  logElement.innerText = `${text}`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

#### Kết quả

{{EmbedLiveSample("Complete_example", 230, 300)}}

Chọn các tùy chọn khác nhau để thay đổi giá trị `clip-path`.

> [!NOTE]
> Mặc dù có thể định nghĩa đường dẫn bằng văn bản, nếu bạn muốn cắt hình nền theo văn bản thay vì hình dạng, hãy xem thuộc tính {{cssxref("background-clip")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("clip-rule")}}
- {{CSSxRef("mask")}}
- {{CSSxRef("filter")}}
- {{cssxref("background-clip")}}
- [Giới thiệu về cắt CSS](/en-US/docs/Web/CSS/Guides/Masking/Clipping)
- Module [CSS masking](/en-US/docs/Web/CSS/Guides/Masking)
- Thuộc tính SVG {{SVGAttr("clip-path")}}
- [Áp dụng hiệu ứng SVG cho nội dung HTML](/en-US/docs/Web/SVG/Guides/Applying_SVG_effects_to_HTML_content)
