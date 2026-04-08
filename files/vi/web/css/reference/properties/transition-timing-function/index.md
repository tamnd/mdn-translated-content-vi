---
title: transition-timing-function
slug: Web/CSS/Reference/Properties/transition-timing-function
page-type: css-property
browser-compat: css.properties.transition-timing-function
sidebar: cssref
---

Thuộc tính **`transition-timing-function`** của [CSS](/vi/docs/Web/CSS) đặt cách tính các giá trị trung gian cho các thuộc tính CSS bị ảnh hưởng bởi [hiệu ứng chuyển đổi](/vi/docs/Web/CSS/Guides/Transitions/Using).

{{InteractiveExample("CSS Demo: transition-timing-function")}}

```css interactive-example-choice
transition-timing-function: linear;
```

```css interactive-example-choice
transition-timing-function: ease-in;
```

```css interactive-example-choice
transition-timing-function: steps(6, end);
```

```css interactive-example-choice
transition-timing-function: cubic-bezier(0.29, 1.01, 1, -0.68);
```

```html interactive-example
<section id="default-example">
  <div id="example-element">Hover to see<br />the transition.</div>
</section>
```

```css interactive-example
#example-element {
  background-color: #e4f0f5;
  color: black;
  padding: 1rem;
  border-radius: 0.5rem;
  font: 1em monospace;
  width: 100%;
  transition: margin-right 2s;
}

#default-example:hover > #example-element {
  background-color: #990099;
  color: white;
  margin-right: 40%;
}
```

Về cơ bản, điều này cho phép bạn thiết lập đường cong gia tốc để tốc độ chuyển đổi có thể thay đổi trong suốt thời lượng của nó.

Đường cong gia tốc này được xác định bằng cách sử dụng một {{cssxref("easing-function")}} cho mỗi thuộc tính cần chuyển đổi.

Bạn có thể chỉ định nhiều hàm nới dần; mỗi hàm sẽ được áp dụng cho thuộc tính tương ứng được chỉ định bởi thuộc tính {{ cssxref("transition-property") }}, đóng vai trò là danh sách `transition-property`. Nếu có ít hàm nới dần được chỉ định hơn trong danh sách `transition-property`, tác nhân người dùng phải tính toán giá trị nào được sử dụng bằng cách lặp lại danh sách giá trị cho đến khi có một giá trị cho mỗi thuộc tính chuyển đổi. Nếu có nhiều hàm nới dần hơn, danh sách bị cắt bớt về kích thước phù hợp. Trong cả hai trường hợp, khai báo CSS vẫn hợp lệ.

## Cú pháp

```css
/* Giá trị từ khóa */
transition-timing-function: ease;
transition-timing-function: ease-in;
transition-timing-function: ease-out;
transition-timing-function: ease-in-out;
transition-timing-function: linear;
transition-timing-function: step-start;
transition-timing-function: step-end;

/* Giá trị hàm */
transition-timing-function: steps(4, jump-end);
transition-timing-function: cubic-bezier(0.1, 0.7, 1, 0.1);

/* Từ khóa hàm bước */
transition-timing-function: steps(4, jump-start);
transition-timing-function: steps(10, jump-end);
transition-timing-function: steps(20, jump-none);
transition-timing-function: steps(5, jump-both);
transition-timing-function: steps(6, start);
transition-timing-function: steps(8, end);

/* Nhiều hàm nới dần */
transition-timing-function: ease, step-start, cubic-bezier(0.1, 0.7, 1, 0.1);

/* Giá trị toàn cục */
transition-timing-function: inherit;
transition-timing-function: initial;
transition-timing-function: revert;
transition-timing-function: revert-layer;
transition-timing-function: unset;
```

### Giá trị

- `<easing-function>`
  - : Mỗi {{cssxref("easing-function")}} đại diện cho hàm nới dần được liên kết với thuộc tính tương ứng cần chuyển đổi, như được xác định trong {{ cssxref("transition-property") }}.

    Các giá trị từ khóa không phải bước (ease, linear, ease-in-out, v.v.) mỗi cái đại diện cho một đường cong Bézier bậc ba với bốn giá trị điểm cố định, với giá trị hàm cubic-bezier() cho phép một giá trị không được xác định trước. Các hàm nới dần bước chia thời gian đầu vào thành một số khoảng được chỉ định có độ dài bằng nhau. Nó được xác định bởi số bước và vị trí bước.
    - `ease`
      - : Bằng `cubic-bezier(0.25, 0.1, 0.25, 1.0)`, giá trị mặc định, tăng tốc về phía giữa chuyển đổi, sau đó chậm lại ở cuối.
    - `linear`
      - : Bằng `cubic-bezier(0.0, 0.0, 1.0, 1.0)`, chuyển đổi với tốc độ đều.
    - `ease-in`
      - : Bằng `cubic-bezier(0.42, 0, 1.0, 1.0)`, bắt đầu chậm, tốc độ chuyển đổi tăng dần cho đến khi hoàn thành.
    - `ease-out`
      - : Bằng `cubic-bezier(0, 0, 0.58, 1.0)`, bắt đầu chuyển đổi nhanh, chậm dần khi chuyển đổi tiếp tục.
    - `ease-in-out`
      - : Bằng `cubic-bezier(0.42, 0, 0.58, 1.0)`, bắt đầu chuyển đổi chậm, tăng tốc, rồi chậm lại.
    - `cubic-bezier(p1, p2, p3, p4)`
      - : Đường cong Bézier bậc ba do tác giả xác định, trong đó các giá trị p1 và p3 phải nằm trong khoảng từ 0 đến 1.
    - `steps(n, <jump-term>)`
      - : Hiển thị chuyển đổi qua _n điểm dừng dọc theo chuyển đổi, hiển thị mỗi điểm dừng trong_ khoảng thời gian bằng nhau. Ví dụ: nếu _n_ là 5, có 5 bước. Việc chuyển đổi có giữ tạm thời ở 0%, 20%, 40%, 60% và 80%, ở 20%, 40%, 60%, 80% và 100%, hay thực hiện 5 điểm dừng giữa 0% và 100%, hay thực hiện 5 điểm dừng bao gồm các điểm 0% và 100% (ở 0%, 25%, 50%, 75% và 100%) phụ thuộc vào thuật ngữ nhảy nào sau đây được sử dụng:
        - `jump-start`
          - : Biểu thị một hàm liên tục trái, do đó lần nhảy đầu tiên xảy ra khi chuyển đổi bắt đầu;
        - `jump-end`
          - : Biểu thị một hàm liên tục phải, do đó lần nhảy cuối cùng xảy ra khi hoạt hình kết thúc;
        - `jump-none`
          - : Không có lần nhảy nào ở cả hai đầu. Thay vào đó, giữ nguyên tại cả điểm 0% và điểm 100%, mỗi điểm trong 1/n thời lượng
        - `jump-both`
          - : Bao gồm các khoảng dừng ở cả điểm 0% và 100%, thực sự thêm một bước trong thời gian chuyển đổi.
        - `start`
          - : Giống như `jump-start`.
        - `end`
          - : Giống như `jump-end`.

    - `step-start`
      - : Bằng `steps(1, jump-start)`
    - `step-end`
      - : Bằng `steps(1, jump-end)`

## Khả năng truy cập

Một số hoạt hình có thể hữu ích như hướng dẫn người dùng hiểu những hành động nào được mong đợi, hiển thị mối quan hệ trong giao diện người dùng và thông báo cho người dùng về những hành động đã xảy ra. Hoạt hình có thể giúp giảm tải nhận thức, ngăn ngừa mù thay đổi và thiết lập khả năng nhớ tốt hơn về các mối quan hệ không gian. Tuy nhiên, một số hoạt hình có thể gây ra vấn đề cho những người có lo ngại về nhận thức như Rối loạn Tăng động Giảm chú ý (ADHD) và một số loại chuyển động có thể kích hoạt rối loạn Tiền đình, động kinh, và chứng đau nửa đầu cùng nhạy cảm ánh sáng.

Hãy cân nhắc cung cấp cơ chế tạm dừng hoặc vô hiệu hóa hoạt hình, cũng như sử dụng [Truy vấn Media Giảm Chuyển động](/vi/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion) (hoặc {{HTTPHeader("Sec-CH-Prefers-Reduced-Motion")}} tương đương) để tạo trải nghiệm bổ sung cho những người dùng đã bày tỏ sở thích ít hoạt hình hơn.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ Cubic-Bezier

```html hidden
<div class="parent">
  <div class="ease">ease</div>
  <div class="ease-in">ease-in</div>
  <div class="ease-out">ease-out</div>
  <div class="ease-in-out">ease-in-out</div>
  <div class="linear">linear</div>
  <div class="cb">cubic-bezier(0.2,-2,0.8,2)</div>
</div>
```

```css hidden
.parent {
}
.parent > div[class] {
  width: 12em;
  min-width: 12em;
  margin-bottom: 4px;
  background-color: black;
  border: 1px solid red;
  color: white;
  transition-property: all;
  transition-duration: 7s;
}
.parent > div.box1 {
  width: 90vw;
  min-width: 24em;
  background-color: magenta;
  color: yellow;
  border: 1px solid orange;
  transition-property: all;
  transition-duration: 2s;
}
```

```js hidden
function updateTransition() {
  const els = document.querySelectorAll(".parent > div[class]");
  for (const el of els) {
    el.classList.toggle("box1");
  }
}

const intervalID = setInterval(updateTransition, 10000);
```

```css
.ease {
  transition-timing-function: ease;
}
.ease-in {
  transition-timing-function: ease-in;
}
.ease-out {
  transition-timing-function: ease-out;
}
.ease-in-out {
  transition-timing-function: ease-in-out;
}
.linear {
  transition-timing-function: linear;
}
.cb {
  transition-timing-function: cubic-bezier(0.2, -2, 0.8, 2);
}
```

{{EmbedLiveSample("Cubic-Bezier_examples")}}

### Ví dụ bước

```html hidden
<div class="parent">
  <div class="jump-start">jump-start</div>
  <div class="jump-end">jump-end</div>
  <div class="jump-both">jump-both</div>
  <div class="jump-none">jump-none</div>
  <div class="step-start">step-start</div>
  <div class="step-end">step-end</div>
</div>
```

```css hidden
.parent {
}
.parent > div[class] {
  width: 12em;
  min-width: 12em;
  margin-bottom: 4px;
  background-color: black;
  border: 1px solid red;
  color: white;
  transition-property: all;
  transition-duration: 7s;
}
.parent > div.box1 {
  width: 90vw;
  min-width: 24em;
  background-color: magenta;
  color: yellow;
  border: 1px solid orange;
  transition-property: all;
  transition-duration: 2s;
}
```

```js hidden
function updateTransition() {
  const els = document.querySelectorAll(".parent > div[class]");
  for (const el of els) {
    el.classList.toggle("box1");
  }
}

const intervalID = setInterval(updateTransition, 10000);
```

```css
.jump-start {
  transition-timing-function: steps(5, jump-start);
}
.jump-end {
  transition-timing-function: steps(5, jump-end);
}
.jump-none {
  transition-timing-function: steps(5, jump-none);
}
.jump-both {
  transition-timing-function: steps(5, jump-both);
}
.step-start {
  transition-timing-function: step-start;
}
.step-end {
  transition-timing-function: step-end;
}
```

{{EmbedLiveSample("Step_examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS transitions](/vi/docs/Web/CSS/Guides/Transitions/Using)
- {{cssxref("easing-function")}}
- Module [Hàm nới dần CSS](/vi/docs/Web/CSS/Guides/Easing_functions)
- {{cssxref('transition')}}
- {{cssxref('transition-property')}}
- {{cssxref('transition-duration')}}
- {{cssxref('transition-delay')}}
- {{domxref("TransitionEvent")}}
