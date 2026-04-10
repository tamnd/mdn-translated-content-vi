---
title: "Element: phương thức animate()"
short-title: animate()
slug: Web/API/Element/animate
page-type: web-api-instance-method
browser-compat: api.Element.animate
---

{{APIRef("Web Animations")}}

Phương thức **`animate()`** của giao diện {{domxref("Element")}} là phương thức tắt giúp tạo một {{domxref("Animation")}} mới, áp dụng nó cho phần tử, sau đó phát hoạt ảnh. Phương thức trả về đối tượng {{domxref("Animation")}} đã tạo.

> [!NOTE]
> Các phần tử có thể có nhiều hoạt ảnh được áp dụng. Bạn có thể lấy danh sách các hoạt ảnh ảnh hưởng đến một phần tử bằng cách gọi {{domxref("Element.getAnimations()")}}.

## Cú pháp

```js-nolint
animate(keyframes, options)
```

### Tham số

- `keyframes`
  - : Là một mảng các đối tượng keyframe, **hoặc** một đối tượng keyframe có các thuộc tính là mảng các giá trị cần lặp qua. Xem thêm [Định dạng Keyframe](/en-US/docs/Web/API/Web_Animations_API/Keyframe_Formats) để biết thêm chi tiết.
- `options`
  - : Là một **số nguyên đại diện cho thời lượng hoạt ảnh** (tính bằng mili giây), **hoặc** một Đối tượng chứa một hoặc nhiều thuộc tính thời gian được mô tả trong [tham số options của `KeyframeEffect()`](/en-US/docs/Web/API/KeyframeEffect/KeyframeEffect#parameters) và/hoặc các tùy chọn sau:
    - `id` {{optional_inline}}
      - : Một thuộc tính chỉ có trong `animate()`: Một chuỗi dùng để tham chiếu đến hoạt ảnh.
    - `rangeEnd` {{optional_inline}}
      - : Chỉ định điểm kết thúc của phạm vi đính kèm hoạt ảnh dọc theo dòng thời gian của nó, tức là nơi hoạt ảnh sẽ kết thúc trên dòng thời gian. Tương đương JavaScript của thuộc tính CSS {{cssxref("animation-range-end")}}. `rangeEnd` có thể nhận nhiều kiểu giá trị khác nhau như sau:
        - Một chuỗi có thể là `normal` (có nghĩa là không thay đổi phạm vi đính kèm của hoạt ảnh), một {{cssxref("length-percentage")}} CSS đại diện cho độ lệch, một `<timeline-range-name>`, hoặc một `<timeline-range-name>` theo sau là `<length-percentage>`. Ví dụ: `"normal"`, `"entry"`, hoặc `"cover 100%"`.

          Xem {{cssxref("animation-range")}} để biết mô tả chi tiết về các giá trị có sẵn. Cũng có thể tham khảo [View Timeline Ranges Visualizer](https://scroll-driven-animations.style/tools/view-timeline/ranges/), hiển thị chính xác ý nghĩa của các giá trị khác nhau theo định dạng trực quan dễ hiểu.

        - Một đối tượng chứa các thuộc tính `rangeName` (một chuỗi) và `offset` (một {{domxref("CSSNumericValue")}}) đại diện cho `<timeline-range-name>` và `<length-percentage>`, như mô tả ở trên. Ví dụ: `{ rangeName: "entry", offset: CSS.percent("100") }`.
        - Một {{domxref("CSSNumericValue")}} đại diện cho độ lệch, ví dụ: `CSS.percent("100")`.

    - `rangeStart` {{optional_inline}}
      - : Chỉ định điểm bắt đầu của phạm vi đính kèm hoạt ảnh dọc theo dòng thời gian của nó, tức là nơi hoạt ảnh sẽ bắt đầu trên dòng thời gian. Tương đương JavaScript của thuộc tính CSS {{cssxref("animation-range-start")}}. `rangeStart` có thể nhận cùng các kiểu giá trị như `rangeEnd`.
    - `timeline` {{optional_inline}}
      - : Một thuộc tính chỉ có trong `animate()`: {{domxref("AnimationTimeline")}} để liên kết với hoạt ảnh. Mặc định là {{domxref("Document.timeline")}}. Tương đương JavaScript của thuộc tính CSS {{cssxref("animation-timeline")}}.

### Giá trị trả về

Trả về một {{domxref("Animation")}}.

## Ví dụ

### Xoay và thu phóng

Trong ví dụ này, chúng ta sử dụng phương thức `animate()` để xoay và thu phóng một phần tử.

#### HTML

```html
<div class="newspaper">Spinning newspaper<br />causes dizziness</div>
```

#### CSS

```css
html,
body {
  height: 100%;
}

body {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: black;
}

.newspaper {
  padding: 0.5rem;
  text-transform: uppercase;
  text-align: center;
  background-color: white;
  cursor: pointer;
}
```

#### JavaScript

```js
const newspaperSpinning = [
  { transform: "rotate(0) scale(1)" },
  { transform: "rotate(360deg) scale(0)" },
];

const newspaperTiming = {
  duration: 2000,
  iterations: 1,
};

const newspaper = document.querySelector(".newspaper");

newspaper.addEventListener("click", () => {
  newspaper.animate(newspaperSpinning, newspaperTiming);
});
```

#### Kết quả

{{EmbedLiveSample("Rotating and scaling")}}

### Demo Down the Rabbit Hole

Trong demo [Down the Rabbit Hole (với Web Animation API)](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API#moving_it_to_javascript), chúng ta sử dụng phương thức `animate()` thuận tiện để ngay lập tức tạo và phát một hoạt ảnh trên phần tử `#tunnel` để làm nó di chuyển lên trên, vô hạn. Lưu ý mảng các đối tượng được truyền dưới dạng keyframe và khối tùy chọn thời gian.

```js
document.getElementById("tunnel").animate(
  [
    // keyframes
    { transform: "translateY(0px)" },
    { transform: "translateY(-300px)" },
  ],
  {
    // timing options
    duration: 1000,
    iterations: Infinity,
  },
);
```

### Keyframes to/from ngầm định

Trình duyệt có thể suy ra trạng thái bắt đầu hoặc kết thúc của hoạt ảnh bằng cách sử dụng trạng thái hiện tại. Theo mặc định, nếu chỉ cung cấp một keyframe, nó sẽ được coi là trạng thái kết thúc và trạng thái bắt đầu được suy ra từ kiểu tính toán hiện tại của phần tử. Tuy nhiên, bạn có thể chỉ định `offset` để cho biết vị trí của keyframe được cung cấp trên dòng thời gian hoạt ảnh.

```html hidden
<div>
  <img
    id="logo"
    src="/shared-assets/images/examples/firefox-logo.svg"
    alt="Firefox logo" />
</div>
<button id="run">Animate - use current as start</button>
<button id="run2">Animate - use current as end</button>
<button id="run3">Animate - use current as both ends</button>
```

```css hidden
div {
  width: 100%;
}

#logo {
  width: 200px;
  height: 200px;
}
```

```js
const logo = document.getElementById("logo");
document.getElementById("run").addEventListener("click", () => {
  logo.animate({ transform: "translateX(300px)" }, 1000);
});
document.getElementById("run2").addEventListener("click", () => {
  logo.animate({ transform: "translateX(300px)", offset: 0 }, 1000);
});
document.getElementById("run3").addEventListener("click", () => {
  logo.animate({ transform: "translateX(300px)", offset: 0.5 }, 1000);
});
```

Chúng ta đã chỉ định một khung duy nhất trong dòng thời gian, và trạng thái bắt đầu và/hoặc kết thúc có thể được điền vào để tạo một hoạt ảnh hoàn chỉnh.

{{EmbedLiveSample("Implicit to/from keyframes", "", 300)}}

### timeline, rangeStart, và rangeEnd

Cách sử dụng điển hình của các thuộc tính `timeline`, `rangeStart`, và `rangeEnd` có thể trông như thế này:

```js
const img = document.querySelector("img");

const timeline = new ViewTimeline({
  subject: img,
  axis: "block",
});

img.animate(
  {
    opacity: [0, 1],
    transform: ["scaleX(0)", "scaleX(1)"],
  },
  {
    fill: "both",
    duration: 1,
    timeline,
    rangeStart: "cover 0%",
    rangeEnd: "cover 100%",
  },
);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Animation")}}
- {{domxref("Element.getAnimations()")}}
- {{cssxref("animation-range-end")}}, {{cssxref("animation-range-start")}}, {{cssxref("animation-timeline")}}
- [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
