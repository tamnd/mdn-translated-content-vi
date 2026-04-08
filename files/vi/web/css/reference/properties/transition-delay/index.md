---
title: transition-delay
slug: Web/CSS/Reference/Properties/transition-delay
page-type: css-property
browser-compat: css.properties.transition-delay
sidebar: cssref
---

Thuộc tính **`transition-delay`** của [CSS](/vi/docs/Web/CSS) chỉ định thời gian chờ trước khi bắt đầu [hiệu ứng chuyển đổi](/vi/docs/Web/CSS/Guides/Transitions/Using) của một thuộc tính khi giá trị của nó thay đổi.

{{InteractiveExample("CSS Demo: transition-delay")}}

```css interactive-example-choice
transition-delay: 250ms;
transition-property: margin-right;
```

```css interactive-example-choice
transition-delay: 1s;
transition-property: background-color;
```

```css interactive-example-choice
transition-delay: 1s;
transition-property: margin-right, color;
```

```css interactive-example-choice
transition-delay: 1s, 250ms;
transition-property: margin-right, color;
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

Độ trễ có thể bằng không, dương hoặc âm:

- Giá trị `0s` (hoặc `0ms`) sẽ bắt đầu hiệu ứng chuyển đổi ngay lập tức.
- Giá trị dương sẽ trì hoãn việc bắt đầu hiệu ứng chuyển đổi trong khoảng thời gian đã cho.
- Giá trị âm sẽ bắt đầu hiệu ứng chuyển đổi ngay lập tức nhưng ở giữa chừng của hiệu ứng. Nói cách khác, hiệu ứng sẽ được hoạt hình như thể nó đã chạy được khoảng thời gian đã cho.

Bạn có thể chỉ định nhiều độ trễ, điều này hữu ích khi chuyển đổi nhiều thuộc tính. Mỗi độ trễ sẽ được áp dụng cho thuộc tính tương ứng được chỉ định bởi thuộc tính {{cssxref("transition-property")}}, đóng vai trò là danh sách chính. Nếu có ít độ trễ được chỉ định hơn so với danh sách chính, danh sách giá trị độ trễ sẽ được lặp lại cho đến khi có đủ. Nếu có nhiều độ trễ hơn, danh sách giá trị độ trễ sẽ bị cắt bớt để khớp với số lượng thuộc tính. Trong cả hai trường hợp, khai báo CSS vẫn hợp lệ.

## Cú pháp

```css
/* Giá trị <time> */
transition-delay: 3s;
transition-delay: 2s, 4ms;

/* Giá trị toàn cục */
transition-delay: inherit;
transition-delay: initial;
transition-delay: revert;
transition-delay: revert-layer;
transition-delay: unset;
```

### Giá trị

- {{cssxref("&lt;time&gt;")}}
  - : Biểu thị lượng thời gian chờ giữa khi giá trị thuộc tính thay đổi và khi bắt đầu hiệu ứng chuyển đổi.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ hiển thị các độ trễ khác nhau

#### HTML

```html
<div class="box delay-1">0.5 giây</div>

<div class="box delay-2">2 giây</div>

<div class="box delay-3">4 giây</div>

<button id="change">Thay đổi</button>
```

#### CSS

```css
.box {
  margin: 20px;
  padding: 10px;
  display: inline-block;
  width: 100px;
  height: 100px;
  background-color: red;
  font-size: 18px;
  transition-property: background-color, font-size, transform, color;
  transition-timing-function: ease-in-out;
  transition-duration: 3s;
}

.transformed-state {
  transform: rotate(270deg);
  background-color: blue;
  color: yellow;
  font-size: 12px;
  transition-property: background-color, font-size, transform, color;
  transition-timing-function: ease-in-out;
  transition-duration: 3s;
}

.delay-1 {
  transition-delay: 0.5s;
}

.delay-2 {
  transition-delay: 2s;
}

.delay-3 {
  transition-delay: 4s;
}
```

#### JavaScript

```js
function change() {
  const elements = document.querySelectorAll("div.box");
  for (const element of elements) {
    element.classList.toggle("transformed-state");
  }
}

const changeButton = document.querySelector("#change");
changeButton.addEventListener("click", change);
```

#### Kết quả

{{EmbedLiveSample("Example_showing_different_delays",275,200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS transitions](/vi/docs/Web/CSS/Guides/Transitions/Using)
- API {{domxref("TransitionEvent")}}
