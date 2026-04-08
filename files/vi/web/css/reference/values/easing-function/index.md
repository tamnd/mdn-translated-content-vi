---
title: <easing-function>
slug: Web/CSS/Reference/Values/easing-function
page-type: css-type
browser-compat: css.types.easing-function
sidebar: cssref
---

Kiểu dữ liệu [CSS](/vi/docs/Web/CSS) **`<easing-function>`** biểu diễn một hàm toán học mô tả tốc độ thay đổi của một giá trị.

Quá trình chuyển đổi giữa hai giá trị này có thể được áp dụng trong các tình huống khác nhau. Nó có thể được dùng để mô tả tốc độ thay đổi giá trị trong các hoạt ảnh. Điều này cho phép bạn thay đổi tốc độ hoạt ảnh trong suốt thời lượng của nó. Bạn có thể chỉ định một hàm làm mượt cho các thuộc tính CSS [transition](/vi/docs/Web/CSS/Reference/Properties/transition-timing-function) và [animation](/vi/docs/Web/CSS/Reference/Properties/animation-timing-function).

## Cú pháp

```css
/* Hàm làm mượt tuyến tính dạng từ khóa */
linear                /* linear(0, 1) */

/* Hàm làm mượt tuyến tính tùy chỉnh */
linear(0, 0.25, 1)
linear(0, 0.25 75%, 1)

/* Hàm làm mượt cubic Bézier dạng từ khóa */
ease                  /* cubic-bezier(0.25, 0.1, 0.25, 1) */
ease-in               /* cubic-bezier(0.42, 0, 1, 1) */
ease-out              /* cubic-bezier(0, 0, 0.58, 1) */
ease-in-out           /* cubic-bezier(0.42, 0, 0.58, 1) */

/* Hàm làm mượt cubic Bézier tùy chỉnh */
cubic-bezier(0.25, 0.1, 0.25, 1)

/* Hàm làm mượt bước dạng từ khóa */
step-start            /* steps(1, jump-start) */
step-end              /* steps(1, jump-end) */

/* Hàm làm mượt bước tùy chỉnh */
steps(4, end)
steps(10, jump-both)
```

### Giá trị

Một `<easing-function>` có thể là một trong các kiểu sau:

- `<linear-easing-function>`
  - : Tạo ra các chuyển đổi tiến triển với tốc độ không đổi. Hàm này có thể được chỉ định bằng một trong các cách sau:
    - `linear`
      - : Xác định tốc độ nội suy không đổi, không thay đổi tốc độ trong suốt thời lượng (tức là không có gia tốc hay giảm tốc).
        Giá trị từ khóa này tương đương với `linear(0, 1)`.
        Nó cũng có thể được biểu diễn là `cubic-bezier(0, 0, 1, 1)`.

        ![Đồ thị tiến trình đầu vào sang tiến trình đầu ra hiển thị một đường thẳng kéo dài từ gốc tọa độ đến (1, 1).](linear.svg)

        > [!NOTE]
        > Từ khóa `linear` luôn được hiểu là `linear(0, 1)`, trong khi hàm `linear(0, 1)` được hiểu là `linear(0 0%, 1 100%)`.

    - {{cssxref("easing-function/linear", "linear()")}}
      - : Xác định nhiều điểm tiến trình bằng các giá trị {{cssxref("&lt;number&gt;")}}, với các giá trị {{cssxref("&lt;percentage&gt;")}} tùy chọn để kiểm soát thời điểm của chúng.

- `<cubic-bezier-easing-function>`
  - : Tạo ra các chuyển đổi mượt mà với tốc độ thay đổi biến thiên. Hàm này có thể được chỉ định bằng một trong các cách sau:
    - `ease`
      - : Biểu diễn hàm làm mượt `cubic-bezier(0.25, 0.1, 0.25, 1)`.
        Nó chỉ ra rằng quá trình nội suy bắt đầu chậm, tăng tốc đột ngột, sau đó dần chậm lại về phía cuối.
        Nó tương tự từ khóa `ease-in-out`, mặc dù nó tăng tốc mạnh hơn ở đầu.

    - `ease-in`
      - : Biểu diễn hàm làm mượt `cubic-bezier(0.42, 0, 1, 1)`.
        Nó chỉ ra rằng quá trình nội suy bắt đầu chậm, sau đó dần tăng tốc đến cuối, tại đó nó dừng đột ngột.

    - `ease-out`
      - : Biểu diễn hàm làm mượt `cubic-bezier(0, 0, 0.58, 1)`.
        Nó chỉ ra rằng quá trình nội suy bắt đầu đột ngột và sau đó dần chậm lại về phía cuối.

    - `ease-in-out`
      - : Biểu diễn hàm làm mượt `cubic-bezier(0.42, 0, 0.58, 1)`.
        Nó chỉ ra rằng quá trình nội suy bắt đầu chậm, tăng tốc, sau đó chậm lại về phía cuối.
        Ở đầu, nó hoạt động như từ khóa `ease-in`; ở cuối, nó giống từ khóa `ease-out`.

        ![Đồ thị tiến trình đầu vào sang tiến trình đầu ra, trong đó ease hiển thị đường cong tăng nhanh từ gốc tọa độ đến (1, 1); ease-in hiển thị đường cong nông từ gốc tọa độ thẳng dần khi tiếp cận (1, 1); ease-out hiển thị đường chéo thẳng cong nhẹ khi gần đến (1, 1); và ease-in-out hiển thị đường cong S đối xứng từ gốc tọa độ đến (1, 1).](ease.svg)

    - {{cssxref("easing-function/cubic-bezier", "cubic-bezier()")}}
      - : Định nghĩa một đường cong tùy chỉnh bằng bốn giá trị {{cssxref("&lt;number&gt;")}} xác định tọa độ của hai điểm kiểm soát.
        Tọa độ x phải nằm trong khoảng `[0, 1]`.

- `<step-easing-function>`
  - : Tạo ra các chuyển đổi theo bước chia hoạt ảnh thành một số khoảng thời gian bằng nhau, khiến hoạt ảnh nhảy từ bước này sang bước tiếp theo thay vì chuyển đổi mượt mà.
    Hàm này có thể được chỉ định bằng một trong các cách sau:
    - `step-start`
      - : Biểu diễn hàm làm mượt `steps(1, jump-start)` hoặc `steps(1, start)`.
        Nó chỉ ra rằng quá trình nội suy nhảy ngay lập tức đến trạng thái cuối và ở lại đó cho đến khi kết thúc.

    - `step-end`
      - : Biểu diễn hàm làm mượt `steps(1, jump-end)` hoặc `steps(1, end)`.
        Nó chỉ ra rằng quá trình nội suy ở trạng thái ban đầu cho đến cuối, tại đó nó nhảy thẳng đến trạng thái cuối.

        ![Hai đồ thị tiến trình đầu vào sang tiến trình đầu ra. Trong đồ thị step-start, một vòng tròn không tô biểu diễn điểm gốc (0, 0), với một đường nằm ngang kéo dài từ (0, 1) đến (1, 1). Trong đồ thị step-end, một đường nằm ngang kéo dài từ gốc tọa độ đến (1, 0), với vòng tròn không tô tại (1,0) và vòng tròn đặc tại (1, 1).](step.svg)

    - {{cssxref("easing-function/steps", "steps()")}}
      - : Tạo ra đường cong hình bậc thang bằng một {{cssxref("&lt;integer&gt;")}} để xác định số khoảng và một từ khóa tùy chọn để kiểm soát thời điểm nhảy.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### So sánh các hàm làm mượt

Ví dụ này cung cấp một sự so sánh giữa các hàm làm mượt khác nhau bằng cách dùng hoạt ảnh. Từ menu thả xuống, bạn có thể chọn một hàm làm mượt — có một số từ khóa và một số tùy chọn `cubic-bezier()` và `steps()`. Sau khi chọn một tùy chọn, bạn có thể bắt đầu và dừng hoạt ảnh bằng nút được cung cấp.

#### HTML

```html
<div>
  <div></div>
</div>
<ul>
  <li>
    <button class="animation-button">Start animation</button>
  </li>
  <li>
    <label for="easing-select">Choose an easing function:</label>
    <select id="easing-select">
      <option selected>linear</option>
      <option>linear(0, 0.5 50%, 1)</option>
      <option>ease</option>
      <option>ease-in</option>
      <option>ease-in-out</option>
      <option>ease-out</option>
      <option>cubic-bezier(0.1, -0.6, 0.2, 0)</option>
      <option>cubic-bezier(0, 1.1, 0.8, 4)</option>
      <option>steps(5, end)</option>
      <option>steps(3, start)</option>
      <option>steps(4)</option>
    </select>
  </li>
</ul>
```

#### CSS

```css
body > div {
  position: relative;
  height: 100px;
}

div > div {
  position: absolute;
  width: 50px;
  height: 50px;
  background-color: blue;
  background-image: radial-gradient(
    circle at 10px 10px,
    rgb(25 255 255 / 80%),
    rgb(25 255 255 / 40%)
  );
  border-radius: 50%;
  top: 25px;
  animation: 1.5s infinite alternate;
}

@keyframes move-right {
  from {
    left: 10%;
  }

  to {
    left: 90%;
  }
}

li {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 20px;
}
```

#### JavaScript

```js
const selectElem = document.querySelector("select");
const startBtn = document.querySelector("button");
const divElem = document.querySelector("div > div");

startBtn.addEventListener("click", () => {
  if (startBtn.textContent === "Start animation") {
    divElem.style.animationName = "move-right";
    startBtn.textContent = "Stop animation";
    divElem.style.animationTimingFunction = selectElem.value;
  } else {
    divElem.style.animationName = "unset";
    startBtn.textContent = "Start animation";
  }
});

selectElem.addEventListener("change", () => {
  divElem.style.animationTimingFunction = selectElem.value;
});
```

#### Kết quả

{{EmbedLiveSample("comparing_the_easing_functions", "100%", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [Hàm làm mượt CSS](/vi/docs/Web/CSS/Guides/Easing_functions)
- Module [Hoạt ảnh CSS](/vi/docs/Web/CSS/Guides/Animations)
- Module [Chuyển đổi CSS](/vi/docs/Web/CSS/Guides/Transitions)
- [`linear()` easing generator](https://linear-easing-generator.netlify.app/) bởi Jake Archibald
- [cubic-bezier.com](https://cubic-bezier.com/) bởi Lea Verou
