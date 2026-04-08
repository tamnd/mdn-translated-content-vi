---
title: transform-origin
slug: Web/CSS/Reference/Properties/transform-origin
page-type: css-property
browser-compat: css.properties.transform-origin
sidebar: cssref
---

Thuộc tính **`transform-origin`** của [CSS](/vi/docs/Web/CSS) đặt điểm gốc cho các biến đổi của một phần tử.

{{InteractiveExample("CSS Demo: transform-origin")}}

```css interactive-example-choice
transform-origin: center;
```

```css interactive-example-choice
transform-origin: top left;
```

```css interactive-example-choice
transform-origin: 50px 50px;
```

```css interactive-example-choice
/* 3D rotation with z-axis origin */
transform-origin: bottom right 60px;
```

```html interactive-example
<section id="default-example">
  <div id="example-container">
    <div id="example-element">Rotate me!</div>
    <img
      alt=""
      id="crosshair"
      src="/shared-assets/images/examples/crosshair.svg"
      width="24px" />
    <div id="static-element"></div>
  </div>
</section>
```

```css interactive-example
@keyframes rotate {
  from {
    transform: rotate(0);
  }

  to {
    transform: rotate(30deg);
  }
}

@keyframes rotate3d {
  from {
    transform: rotate3d(0, 0, 0, 0);
  }

  to {
    transform: rotate3d(1, 2, 0, 60deg);
  }
}

#example-container {
  width: 160px;
  height: 160px;
  position: relative;
}

#example-element {
  width: 100%;
  height: 100%;
  display: flex;
  position: absolute;
  align-items: center;
  justify-content: center;
  background: #f7ebee;
  color: black;
  font-size: 1.2rem;
  text-transform: uppercase;
}

#example-element.rotate {
  animation: rotate 1s forwards;
}

#example-element.rotate3d {
  animation: rotate3d 1s forwards;
}

#crosshair {
  width: 24px;
  height: 24px;
  opacity: 0;
  position: absolute;
}

#static-element {
  width: 100%;
  height: 100%;
  position: absolute;
  border: dotted 3px #ff1100;
}
```

```js interactive-example
const crosshair = document.getElementById("crosshair");
const el = document.getElementById("example-element");

function update() {
  const selected = document.querySelector(".selected");

  /* Restart the animation
           https://developer.mozilla.org/en-US/docs/Web/API/Web_Animations_API/Tips */
  el.className = "";
  window.requestAnimationFrame(() => {
    window.requestAnimationFrame(() => {
      el.className =
        el.style.transformOrigin.split(" ")[2] === "60px"
          ? "rotate3d"
          : "rotate";
    });
  });

  const transformOrigin = getComputedStyle(el).transformOrigin;
  const pos = transformOrigin.split(/\s+/);
  crosshair.style.left = `calc(${pos[0]} - 12px)`;
  crosshair.style.top = `calc(${pos[1]} - 12px)`;
}

const observer = new MutationObserver(() => {
  update();
});

observer.observe(el, {
  attributes: true,
  attributeFilter: ["style"],
});

update();
crosshair.style.opacity = "1";
```

Điểm gốc transform là điểm xung quanh đó một biến đổi được áp dụng. Ví dụ, điểm gốc transform của hàm [`rotate()`](/en-US/docs/Web/CSS/Reference/Values/transform-function/rotate) là tâm xoay.

Về thực chất, thuộc tính này bọc một cặp dịch chuyển xung quanh các biến đổi khác của phần tử. Dịch chuyển đầu tiên di chuyển điểm gốc transform đến gốc thực tại <math><mrow><mo stretchy="false">(</mo><mn>0</mn><mo>,</mo><mn>0</mn><mo stretchy="false">)</mo></mrow></math>. Sau đó các biến đổi khác được áp dụng, và vì điểm gốc transform đang ở <math><mrow><mo stretchy="false">(</mo><mn>0</mn><mo>,</mo><mn>0</mn><mo stretchy="false">)</mo></mrow></math>, các biến đổi đó hoạt động quanh điểm gốc transform. Cuối cùng, dịch chuyển ngược được áp dụng, di chuyển điểm gốc transform trở lại vị trí ban đầu của nó. Do đó, định nghĩa này

```css
transform-origin: -100% 50%;
transform: rotate(45deg);
```

cho kết quả cùng biến đổi như

```css
transform-origin: 0 0;
transform: translate(-100%, 50%) rotate(45deg) translate(100%, -50%);
```

Đọc từ phải sang trái, `translate(100%, -50%)` là dịch chuyển đưa điểm gốc transform về gốc thực, `rotate(45deg)` là biến đổi gốc và `translate(-100%, 50%)` là dịch chuyển khôi phục điểm gốc transform về vị trí ban đầu.

Theo mặc định, điểm gốc của một biến đổi là `center`.

## Cú pháp

```css
/* Cú pháp một giá trị */
transform-origin: 2px;
transform-origin: bottom;

/* x-offset | y-offset */
transform-origin: 3cm 2px;

/* x-offset-keyword | y-offset */
transform-origin: left 2px;

/* x-offset-keyword | y-offset-keyword */
transform-origin: right top;

/* y-offset-keyword | x-offset-keyword */
transform-origin: top right;

/* x-offset | y-offset | z-offset */
transform-origin: 2px 30% 10px;

/* x-offset-keyword | y-offset | z-offset */
transform-origin: left 5px -3px;

/* x-offset-keyword | y-offset-keyword | z-offset */
transform-origin: right bottom 2cm;

/* y-offset-keyword | x-offset-keyword | z-offset */
transform-origin: bottom right 2cm;

/* Giá trị toàn cục */
transform-origin: inherit;
transform-origin: initial;
transform-origin: revert;
transform-origin: revert-layer;
transform-origin: unset;
```

Thuộc tính `transform-origin` có thể được chỉ định bằng một, hai hoặc ba giá trị, mỗi giá trị đại diện cho một độ lệch. Các độ lệch không được định nghĩa rõ ràng sẽ được đặt lại về [giá trị khởi tạo](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value) tương ứng.

Nếu một giá trị {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} duy nhất được định nghĩa, nó đại diện cho độ lệch ngang.

Nếu hai hoặc nhiều giá trị được định nghĩa và không có giá trị nào là từ khóa, hoặc từ khóa duy nhất được sử dụng là `center`, thì giá trị đầu tiên đại diện cho độ lệch ngang và giá trị thứ hai đại diện cho độ lệch dọc.

- Cú pháp một giá trị:
  - Giá trị phải là {{cssxref("&lt;length&gt;")}}, một {{cssxref("&lt;percentage&gt;")}}, hoặc một trong các từ khóa `left`, `center`, `right`, `top` và `bottom`.

- Cú pháp hai giá trị:
  - Một giá trị phải là {{cssxref("&lt;length&gt;")}}, một {{cssxref("&lt;percentage&gt;")}}, hoặc một trong các từ khóa `left`, `center` và `right`.
  - Giá trị còn lại phải là {{cssxref("&lt;length&gt;")}}, một {{cssxref("&lt;percentage&gt;")}}, hoặc một trong các từ khóa `top`, `center` và `bottom`.

- Cú pháp ba giá trị:
  - Hai giá trị đầu giống như trong cú pháp hai giá trị.
  - Giá trị thứ ba phải là {{cssxref("&lt;length&gt;")}}. Nó luôn đại diện cho độ lệch theo trục Z.

### Giá trị

- _x-offset_
  - : Là {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} mô tả khoảng cách từ cạnh trái của hộp đến điểm gốc của biến đổi.
- _offset-keyword_
  - : Là một trong các từ khóa `left`, `right`, `top`, `bottom` hoặc `center` mô tả độ lệch tương ứng.
- _y-offset_
  - : Là {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} mô tả khoảng cách từ cạnh trên của hộp đến điểm gốc của biến đổi.
- _x-offset-keyword_
  - : Là một trong các từ khóa `left`, `right` hoặc `center` mô tả khoảng cách từ cạnh trái của hộp đến điểm gốc của biến đổi.
- _y-offset-keyword_
  - : Là một trong các từ khóa `top`, `bottom` hoặc `center` mô tả khoảng cách từ cạnh trên của hộp đến điểm gốc của biến đổi.
- _z-offset_
  - : Là {{cssxref("&lt;length&gt;")}} (và không bao giờ là {{cssxref("&lt;percentage&gt;")}} vì điều đó sẽ làm cho câu lệnh không hợp lệ) mô tả khoảng cách từ mắt người dùng đến gốc z=0.

Các từ khóa là viết tắt tiện lợi và tương ứng với các giá trị {{cssxref("&lt;percentage&gt;")}} sau:

| Từ khóa  | Giá trị |
| -------- | ------- |
| `left`   | `0%`    |
| `center` | `50%`   |
| `right`  | `100%`  |
| `top`    | `0%`    |
| `bottom` | `100%`  |

## Định nghĩa chính thức

{{CSSInfo}}

> [!NOTE]
> Giá trị khởi tạo của `transform-origin` là `0 0` đối với tất cả các phần tử SVG ngoại trừ phần tử gốc `<svg>` và các phần tử `<svg>` là con trực tiếp của [foreignObject](/en-US/docs/Web/SVG/Reference/Element/foreignObject), với `transform-origin` là `50% 50%`, giống như các phần tử CSS khác. Xem thuộc tính [SVG transform-origin](/en-US/docs/Web/SVG/Reference/Attribute/transform-origin) để biết thêm thông tin.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Minh họa các giá trị transform khác nhau

Ví dụ này cho thấy hiệu lực của việc chọn các giá trị `transform-origin` khác nhau cho nhiều hàm biến đổi.

```html hidden
<div class="container">
  <div class="example">
    <div class="box box1">&nbsp;</div>
    <div class="box original">&nbsp;</div>
  </div>

  <pre>
transform: none;
  </pre>

  <div class="example">
    <div class="box box2">&nbsp;</div>
    <div class="box original">&nbsp;</div>
  </div>

  <pre>
transform: rotate(30deg);
  </pre>

  <div class="example">
    <div class="box box3">&nbsp;</div>
    <div class="box original">&nbsp;</div>
  </div>

  <pre>
transform: rotate(30deg);
transform-origin: 0 0;
  </pre>

  <div class="example">
    <div class="box box4">&nbsp;</div>
    <div class="box original">&nbsp;</div>
  </div>

  <pre>
transform: rotate(30deg);
transform-origin: 100% 100%;
  </pre>

  <div class="example">
    <div class="box box5">&nbsp;</div>
    <div class="box original">&nbsp;</div>
  </div>

  <pre>
transform: rotate(30deg);
transform-origin: -1em -3em;
  </pre>

  <div class="example">
    <div class="box box6">&nbsp;</div>
    <div class="box original">&nbsp;</div>
  </div>

  <pre>
transform: scale(1.7);
  </pre>

  <div class="example">
    <div class="box box7">&nbsp;</div>
    <div class="box original">&nbsp;</div>
  </div>

  <pre>
transform: scale(1.7);
transform-origin: 0 0;
  </pre>

  <div class="example">
    <div class="box box8">&nbsp;</div>
    <div class="box original">&nbsp;</div>
  </div>

  <pre>
transform: scale(1.7);
transform-origin: 100% -30%;
  </pre>

  <div class="example">
    <div class="box box9">&nbsp;</div>
    <div class="box original">&nbsp;</div>
  </div>

  <pre>
transform: skewX(50deg);
transform-origin: 100% -30%;
  </pre>

  <div class="example">
    <div class="box box10">&nbsp;</div>
    <div class="box original">&nbsp;</div>
  </div>

  <pre>
transform: skewY(50deg);
transform-origin: 100% -30%;
  </pre>
</div>
```

```css hidden
.container {
  display: grid;
  grid-template-columns: 200px 100px;
  gap: 20px;
}

.example {
  position: relative;
  margin: 0 2em 4em 5em;
}

.box {
  display: inline-block;
  width: 3em;
  height: 3em;
  border: solid 1px;
  background-color: palegreen;
}

.original {
  position: absolute;
  left: 0;
  opacity: 20%;
}

.box1 {
  transform: none;
}

.box2 {
  transform: rotate(30deg);
}

.box3 {
  transform: rotate(30deg);
  transform-origin: 0 0;
}

.box4 {
  transform: rotate(30deg);
  transform-origin: 100% 100%;
}

.box5 {
  transform: rotate(30deg);
  transform-origin: -1em -3em;
}

.box6 {
  transform: scale(1.7);
}

.box7 {
  transform: scale(1.7);
  transform-origin: 0 0;
}

.box8 {
  transform: scale(1.7);
  transform-origin: 100% -30%;
}

.box9 {
  transform: skewX(50deg);
  transform-origin: 100% -30%;
}

.box10 {
  transform: skewY(50deg);
  transform-origin: 100% -30%;
}
```

{{EmbedLiveSample('A_demonstration_of_various_transform_values', '', 1350) }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using)
- Thuộc tính SVG {{SVGAttr("transform-origin")}}
- <https://css-tricks.com/almanac/properties/t/transform-origin/>
