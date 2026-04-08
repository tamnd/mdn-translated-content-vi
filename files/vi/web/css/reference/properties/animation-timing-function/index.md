---
title: animation-timing-function
slug: Web/CSS/Reference/Properties/animation-timing-function
page-type: css-property
browser-compat: css.properties.animation-timing-function
sidebar: cssref
---

Thuộc tính **`animation-timing-function`** [CSS](/en-US/docs/Web/CSS) xác định cách hoạt hình tiến triển trong suốt thời gian của mỗi chu kỳ.

Thường thuận tiện khi sử dụng thuộc tính viết tắt {{cssxref("animation")}} để thiết lập tất cả các thuộc tính hoạt hình cùng một lúc.

{{InteractiveExample("CSS Demo: animation-timing-function")}}

```css interactive-example-choice
animation-timing-function: linear;
```

```css interactive-example-choice
animation-timing-function: ease-in-out;
```

```css interactive-example-choice
animation-timing-function: steps(5, end);
```

```css interactive-example-choice
animation-timing-function: cubic-bezier(0.1, -0.6, 0.2, 0);
```

```html interactive-example
<section class="flex-column" id="default-example">
  <div class="animating" id="example-element"></div>
  <button id="play-pause">Play</button>
</section>
```

```css interactive-example
#example-element {
  animation-duration: 3s;
  animation-iteration-count: infinite;
  animation-name: slide;
  animation-play-state: paused;
  background-color: #1766aa;
  border-radius: 50%;
  border: 5px solid #333333;
  color: white;
  height: 150px;
  margin: auto;
  margin-left: 0;
  width: 150px;
}

#example-element.running {
  animation-play-state: running;
}

#play-pause {
  font-size: 2rem;
}

@keyframes slide {
  from {
    background-color: orange;
    color: black;
    margin-left: 0;
  }
  to {
    background-color: orange;
    color: black;
    margin-left: 80%;
  }
}
```

```js interactive-example
const el = document.getElementById("example-element");
const button = document.getElementById("play-pause");

button.addEventListener("click", () => {
  if (el.classList.contains("running")) {
    el.classList.remove("running");
    button.textContent = "Play";
  } else {
    el.classList.add("running");
    button.textContent = "Pause";
  }
});
```

## Cú pháp

```css
/* Giá trị từ khóa */
animation-timing-function: ease;
animation-timing-function: ease-in;
animation-timing-function: ease-out;
animation-timing-function: ease-in-out;
animation-timing-function: linear;
animation-timing-function: step-start;
animation-timing-function: step-end;

/* Giá trị hàm cubic-bezier() */
animation-timing-function: cubic-bezier(0.42, 0, 1, 1); /* ease-in */
animation-timing-function: cubic-bezier(0, 0, 0.58, 1); /* ease-out */
animation-timing-function: cubic-bezier(0.42, 0, 0.58, 1); /* ease-in-out */

/* Giá trị hàm linear() */
animation-timing-function: linear(0, 0.25, 1);
animation-timing-function: linear(0 0%, 0.25 50%, 1 100%);
animation-timing-function: linear(0, 0.25 50% 75%, 1);
animation-timing-function: linear(0, 0.25 50%, 0.25 75%, 1);

/* Giá trị hàm steps() */
animation-timing-function: steps(4, jump-start);
animation-timing-function: steps(10, jump-end);
animation-timing-function: steps(20, jump-none);
animation-timing-function: steps(5, jump-both);
animation-timing-function: steps(6, start);
animation-timing-function: steps(8, end);

/* Nhiều hoạt hình */
animation-timing-function: ease, step-start, cubic-bezier(0.1, 0.7, 1, 0.1);

/* Giá trị toàn cục */
animation-timing-function: inherit;
animation-timing-function: initial;
animation-timing-function: revert;
animation-timing-function: revert-layer;
animation-timing-function: unset;
```

### Giá trị

- {{cssxref("easing-function")}}
  - : Hàm easing tương ứng với một hoạt hình cụ thể, được xác định bởi {{cssxref("animation-name")}}.

    Các giá trị từ khóa không phải step (`ease`, `linear`, `ease-in-out`, v.v.) đều đại diện cho các đường cong Bézier bậc ba với bốn điểm cố định, trong khi giá trị hàm `cubic-bezier()` cho phép chỉ định các giá trị không được định sẵn. Hàm easing `steps()` chia thời gian đầu vào thành một số khoảng thời gian bằng nhau. Tham số bao gồm số bước và vị trí bước.
    - `linear`
      - : Tương đương với `cubic-bezier(0.0, 0.0, 1.0, 1.0)`, hoạt hình với tốc độ đều đặn.
    - `ease`
      - : Tương đương với `cubic-bezier(0.25, 0.1, 0.25, 1.0)`, giá trị mặc định, tăng tốc về giữa hoạt hình, rồi chậm lại ở cuối.
    - `ease-in`
      - : Tương đương với `cubic-bezier(0.42, 0, 1.0, 1.0)`, bắt đầu chậm, tốc độ chuyển đổi tăng dần cho đến khi hoàn thành.
    - `ease-out`
      - : Tương đương với `cubic-bezier(0, 0, 0.58, 1.0)`, bắt đầu nhanh, hoạt hình chậm dần khi tiếp tục.
    - `ease-in-out`
      - : Tương đương với `cubic-bezier(0.42, 0, 0.58, 1.0)`, thuộc tính hoạt hình chuyển đổi chậm, tăng tốc, rồi chậm lại.

    - `cubic-bezier(<number [0,1]> , <number> , <number [0,1]> , <number>)`
      - : Đường cong cubic-bezier do tác giả xác định, trong đó giá trị thứ nhất và thứ ba phải nằm trong khoảng từ 0 đến 1.

    - `linear(<number> <percentage>{1,2}, …)`
      - : Hàm nội suy tuyến tính giữa các điểm dừng easing được cung cấp. Điểm dừng là cặp gồm tiến trình đầu ra và phần trăm đầu vào. Phần trăm đầu vào là tùy chọn và được suy luận nếu không được chỉ định. Nếu không có phần trăm đầu vào, điểm dừng đầu và cuối được đặt thành `0%` và `100%`, và các điểm dừng ở giữa nhận giá trị phần trăm bằng cách nội suy tuyến tính giữa các điểm gần nhất có giá trị phần trăm.

    - `steps(<integer>, <step-position>)`
      - : Hiển thị lần lặp hoạt hình dọc theo _n_ điểm dừng trong chuyển đổi, hiển thị mỗi điểm dừng trong khoảng thời gian bằng nhau. Ví dụ, nếu _n_ là 5, có 5 bước. Hoạt hình dừng tạm thời tại 0%, 20%, 40%, 60% và 80%, tại 20%, 40%, 60%, 80% và 100%, hay tạo 5 điểm dừng giữa 0% và 100%, hay tạo 5 điểm dừng bao gồm cả 0% và 100% (tại 0%, 25%, 50%, 75% và 100%) phụ thuộc vào vị trí bước nào được dùng:
        - `jump-start`
          - : Chỉ định hàm liên tục trái, sao cho lần nhảy đầu tiên xảy ra khi hoạt hình bắt đầu.
        - `jump-end`
          - : Chỉ định hàm liên tục phải, sao cho lần nhảy cuối cùng xảy ra khi hoạt hình kết thúc. Đây là giá trị mặc định.
        - `jump-none`
          - : Không có lần nhảy ở cả hai đầu, thực chất loại bỏ một bước trong quá trình nội suy. Thay vào đó, nó giữ ở cả điểm 0% và 100%, mỗi điểm trong 1/n thời gian.
        - `jump-both`
          - : Bao gồm khoảng dừng ở cả điểm 0% và 100%, thực chất thêm một bước trong quá trình lặp hoạt hình.
        - `start`
          - : Giống như `jump-start`.
        - `end`
          - : Giống như `jump-end`.

    - `step-start`
      - : Tương đương với `steps(1, jump-start)`
    - `step-end`
      - : Tương đương với `steps(1, jump-end)`

> [!NOTE]
> Khi bạn chỉ định nhiều giá trị phân tách bằng dấu phẩy trên thuộc tính `animation-*`, chúng được áp dụng cho các hoạt hình theo thứ tự mà {{cssxref("animation-name")}} xuất hiện. Xem [Setting multiple animation property values](/en-US/docs/Web/CSS/Guides/Animations/Using#setting_multiple_animation_property_values) để biết tình huống số lượng hoạt hình và giá trị thuộc tính `animation-*` không khớp nhau.

> [!NOTE]
> `animation-timing-function` có hiệu ứng tương tự khi tạo [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) như đối với các hoạt hình dựa trên thời gian thông thường.

## Mô tả

Các hàm easing có thể được chỉ định trên từng keyframe riêng lẻ trong quy tắc {{cssxref("@keyframes")}}. Nếu không có **`animation-timing-function`** được chỉ định trên một keyframe, giá trị tương ứng của **`animation-timing-function`** từ phần tử được áp dụng hoạt hình sẽ được sử dụng cho keyframe đó.

Trong một keyframe, `animation-timing-function` là một descriptor dành riêng cho at-rule, không phải thuộc tính có cùng tên. Thời gian không được hoạt hình. Thay vào đó, hàm easing của keyframe được áp dụng theo từng thuộc tính, từ keyframe nơi nó được chỉ định cho đến keyframe tiếp theo chỉ định thuộc tính đó, hoặc đến cuối hoạt hình nếu không có keyframe tiếp theo. Do đó, **`animation-timing-function`** được chỉ định trên keyframe **`100%`** hoặc **`to`** sẽ không bao giờ được sử dụng.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

Tất cả các ví dụ trong phần này hoạt hình thuộc tính `width` và `background-color` của một số phần tử `<div>` với các giá trị `animation-timing-function` khác nhau. Chiều rộng được hoạt hình từ `0` đến `100%`, và màu nền được hoạt hình từ lime sang magenta.

### Ví dụ hàm linear

Ví dụ này minh họa hiệu ứng của các giá trị hàm easing `linear()` khác nhau.

```html hidden
<div class="parent">
  <div class="linear">'linear' value</div>
  <div class="linear-fn1">linear(0, 0.5 50%, 1)</div>
  <div class="linear-fn2">linear(0, 0.25 75%, 1)</div>
  <div class="linear-fn3">linear(0, 0.75 25%, 1)</div>
  <div class="linear-fn4">linear(0, 0.5 25% 75%, 1)</div>
  <div class="linear-fn5">linear(0, 0.25 45%, 0.75 55%, 0.5 70%, 1)</div>
  <div class="linear-fn6">linear(0, 1.2 50%, 0.75 80%, 1)</div>
  <div class="linear-fn7">linear(0, 0.5 75%, 1 120%)</div>
</div>
<div class="x-axis"><span>25%</span><span>50%</span><span>75%</span></div>
<button>Play animation</button>
```

```js hidden
const btn = document.querySelector("button");
const divs = document.querySelectorAll(".parent > div[class]");

btn.addEventListener("click", () => {
  btn.setAttribute("disabled", "true");
  for (const div of divs) {
    div.classList.remove("animate");
    void div.offsetWidth;
    div.classList.add("animate");
  }
  setTimeout(() => {
    btn.removeAttribute("disabled");
  }, 11000);
});
```

```css hidden
.x-axis {
  display: flex;
  justify-content: space-evenly;
  width: 80vw;
  margin-left: 4px;
}

.parent {
  background: linear-gradient(
    to right,
    white 24.8%,
    grey 24.8%,
    grey 25.2%,
    white 25.2%,
    white 49.8%,
    grey 49.8%,
    grey 50.2%,
    white 50.2%,
    white 74.8%,
    grey 74.8%,
    grey 75.2%,
    white 75.2%
  );
  width: 80vw;
  font-family: monospace;
  font-weight: bold;
  border: 2px solid grey;
}

.animate {
  animation-name: changeme;
}

.parent > div[class] {
  animation-fill-mode: forwards;
  animation-duration: 10s;

  width: 0;
  margin-bottom: 4px;
  padding: 5px 0;
  box-sizing: border-box;
  text-wrap: nowrap;
  background-color: lime;
}

@keyframes changeme {
  0% {
    width: 0em;
  }
  100% {
    width: 100%;
    background-color: orange;
  }
}

.linear {
  animation-timing-function: linear;
}
.linear-fn1 {
  animation-timing-function: linear(0, 0.5 50%, 1);
}
.linear-fn2 {
  animation-timing-function: linear(0, 0.25 75%, 1);
}
.linear-fn3 {
  animation-timing-function: linear(0, 0.75 25%, 1);
}
.linear-fn4 {
  animation-timing-function: linear(0, 0.5 25% 75%, 1);
}
.linear-fn5 {
  animation-timing-function: linear(0, 0.25 45%, 0.75 55%, 0.5 70%, 1);
}
.linear-fn6 {
  animation-timing-function: linear(0, 1.2 50%, 0.75 80%, 1);
}
.linear-fn7 {
  animation-timing-function: linear(0, 0.5 75%, 1 120%);
}
```

{{EmbedLiveSample("Linear function examples", 600, 300)}}

Hình ảnh sau hiển thị đồ thị của tất cả các giá trị hàm `linear()` được sử dụng trong ví dụ này. Tiến trình đầu vào (thời gian) được vẽ trên trục x và tiến trình đầu ra trên trục y. Theo cú pháp, tiến trình đầu vào từ 0 đến 100%, và đầu ra từ 0 đến 1.

![An image showing 'linear' function graphs](https://mdn.github.io/shared-assets/images/diagrams/css/animation-easing/linear-function-graphs.png)

Lưu ý rằng đầu ra có thể đi tiến hoặc lùi.

### Ví dụ Cubic-Bézier

Ví dụ này minh họa hiệu ứng của các hàm easing đường cong bézier khác nhau.

```html hidden
<div class="parent">
  <div class="linear">linear</div>
  <div class="ease">ease</div>
  <div class="ease-in">ease-in</div>
  <div class="ease-out">ease-out</div>
  <div class="ease-in-out">ease-in-out</div>
  <div class="cb">cubic-bezier(.5, -0.5, 1, 1.5)</div>
</div>
<div class="x-axis"><span>50%</span></div>
<button>Play animation</button>
```

```js hidden
const btn = document.querySelector("button");
const divs = document.querySelectorAll(".parent > div[class]");

btn.addEventListener("click", () => {
  btn.setAttribute("disabled", "true");
  for (const div of divs) {
    div.classList.remove("animate");
    void div.offsetWidth;
    div.classList.add("animate");
  }
  setTimeout(() => {
    btn.removeAttribute("disabled");
  }, 11000);
});
```

```css hidden
.x-axis {
  display: flex;
  justify-content: space-evenly;
  width: 80vw;
  margin-left: 4px;
}

.parent {
  background: linear-gradient(
    to right,
    white 49.8%,
    grey 49.8%,
    grey 50.2%,
    white 50.2%
  );
  width: 80vw;
  font-family: monospace;
  font-weight: bold;
  border: 2px solid grey;
}

.animate {
  animation-name: changeme;
}

.parent > div[class] {
  animation-fill-mode: forwards;
  animation-duration: 10s;

  width: 0;
  margin-bottom: 4px;
  padding: 5px 0;
  box-sizing: border-box;
  text-wrap: nowrap;
  background-color: lime;
}

@keyframes changeme {
  0% {
    width: 0em;
  }
  100% {
    width: 100%;
    background-color: orange;
  }
}

.linear {
  animation-timing-function: linear;
}
.ease {
  animation-timing-function: ease;
}
.ease-in {
  animation-timing-function: ease-in;
}
.ease-out {
  animation-timing-function: ease-out;
}
.ease-in-out {
  animation-timing-function: ease-in-out;
}
.cb {
  animation-timing-function: cubic-bezier(0.5, -0.5, 1, 1.5);
}
```

{{EmbedLiveSample("Cubic-Bezier_examples", 600, 250)}}

Hình ảnh sau hiển thị đồ thị của tất cả các giá trị hàm cubic bézier được sử dụng trong ví dụ này. Tiến trình đầu vào (thời gian) từ 0 đến 1 và tiến trình đầu ra từ 0 đến 1.

![An image showing 'cubic-bezier' function graphs](https://mdn.github.io/shared-assets/images/diagrams/css/animation-easing/cubic-bezier-function-graphs.png)

### Ví dụ Step

Ví dụ này minh họa hiệu ứng của một số giá trị hàm easing step.

```html hidden
<div class="parent">
  <div class="linear">linear</div>
  <div class="start">steps(4, start)</div>
  <div class="jump-start">steps(4, jump-start)</div>
  <div class="end">steps(4, end)</div>
  <div class="jump-end">steps(4, jump-end)</div>
  <div class="jump-both">steps(4, jump-both)</div>
  <div class="jump-none">steps(4, jump-none)</div>
  <div class="step-start">step-start</div>
  <div class="step-end">step-end</div>
</div>
<div class="x-axis"><span>25%</span><span>50%</span><span>75%</span></div>
<button>Play animation</button>
```

```js hidden
const btn = document.querySelector("button");
const divs = document.querySelectorAll(".parent > div[class]");

btn.addEventListener("click", () => {
  btn.setAttribute("disabled", "true");
  for (const div of divs) {
    div.classList.remove("animate");
    void div.offsetWidth;
    div.classList.add("animate");
  }
  setTimeout(() => {
    btn.removeAttribute("disabled");
  }, 11000);
});
```

```css hidden
.x-axis {
  display: flex;
  justify-content: space-evenly;
  width: 80vw;
  margin-left: 4px;
}

.parent {
  background: linear-gradient(
    to right,
    white 24.8%,
    grey 24.8%,
    grey 25.2%,
    white 25.2%,
    white 49.8%,
    grey 49.8%,
    grey 50.2%,
    white 50.2%,
    white 74.8%,
    grey 74.8%,
    grey 75.2%,
    white 75.2%
  );
  width: 80vw;
  font-family: monospace;
  font-weight: bold;
  border: 2px solid grey;
}

.animate {
  animation-name: changeme;
}

.parent > div[class] {
  animation-fill-mode: forwards;
  animation-duration: 10s;

  width: 0;
  margin-bottom: 4px;
  padding: 5px 0;
  box-sizing: border-box;
  text-wrap: nowrap;
  background-color: lime;
}

@keyframes changeme {
  0% {
    width: 0em;
  }
  100% {
    width: 100%;
    background-color: orange;
  }
}
```

```css hidden
.linear {
  animation-timing-function: linear;
}

.start {
  animation-timing-function: steps(4, start);
}
.jump-start {
  animation-timing-function: steps(4, jump-start);
}
.end {
  animation-timing-function: steps(4, end);
}
.jump-end {
  animation-timing-function: steps(4, jump-end);
}
.jump-both {
  animation-timing-function: steps(4, jump-both);
}
.jump-none {
  animation-timing-function: steps(4, jump-none);
}
.step-start {
  animation-timing-function: step-start;
}
.step-end {
  animation-timing-function: step-end;
}
```

{{EmbedLiveSample("Step_examples", 600, 350)}}

Hình ảnh sau hiển thị đồ thị của tất cả các giá trị hàm `step()` được sử dụng trong ví dụ này. Tiến trình đầu vào (thời gian) và tiến trình đầu ra từ 0 đến 1.

![image showing 'steps' function graphs](https://mdn.github.io/shared-assets/images/diagrams/css/animation-easing/step-function-graphs.png)

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- {{cssxref('easing-function')}}
- [CSS easing functions](/en-US/docs/Web/CSS/Guides/Easing_functions) module
- JavaScript {{domxref("AnimationEvent")}} API
- [Cubic bézier generation tool](https://cubic-bezier.com/)
- Các thuộc tính hoạt hình liên quan khác: {{cssxref("animation")}}, {{cssxref("animation-composition")}}, {{cssxref("animation-delay")}}, {{cssxref("animation-direction")}}, {{cssxref("animation-duration")}}, {{cssxref("animation-fill-mode")}}, {{cssxref("animation-iteration-count")}}, {{cssxref("animation-name")}}, {{cssxref("animation-play-state")}}, {{cssxref("animation-timeline")}}
