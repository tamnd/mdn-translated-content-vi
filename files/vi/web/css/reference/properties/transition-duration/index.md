---
title: transition-duration
slug: Web/CSS/Reference/Properties/transition-duration
page-type: css-property
browser-compat: css.properties.transition-duration
sidebar: cssref
---

Thuộc tính **`transition-duration`** của [CSS](/vi/docs/Web/CSS) đặt khoảng thời gian mà một hoạt hình chuyển đổi cần để hoàn thành. Mặc định, giá trị là `0s`, nghĩa là không có hoạt hình nào xảy ra.

{{InteractiveExample("CSS Demo: transition-duration")}}

```css interactive-example-choice
transition-duration: 500ms;
transition-property: margin-right;
```

```css interactive-example-choice
transition-duration: 2s;
transition-property: background-color;
```

```css interactive-example-choice
transition-duration: 2s;
transition-property: margin-right, color;
```

```css interactive-example-choice
transition-duration: 3s, 1s;
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

Bạn có thể chỉ định nhiều thời lượng; mỗi thời lượng sẽ được áp dụng cho thuộc tính tương ứng được chỉ định bởi thuộc tính {{ cssxref("transition-property") }}, đóng vai trò là danh sách chính. Nếu số thời lượng được chỉ định ít hơn trong danh sách chính, tác nhân người dùng lặp lại danh sách thời lượng. Nếu số thời lượng được chỉ định nhiều hơn trong danh sách chính, danh sách bị cắt bớt về kích thước phù hợp. Trong cả hai trường hợp, khai báo CSS vẫn hợp lệ.

## Cú pháp

```css
/* Giá trị <time> */
transition-duration: 6s;
transition-duration: 120ms;
transition-duration: 1s, 15s;
transition-duration: 10s, 30s, 230ms;

/* Giá trị toàn cục */
transition-duration: inherit;
transition-duration: initial;
transition-duration: revert;
transition-duration: revert-layer;
transition-duration: unset;
```

### Giá trị

- `<time>`
  - : Là {{cssxref("&lt;time&gt;")}} biểu thị lượng thời gian chuyển đổi từ giá trị cũ sang giá trị mới của thuộc tính. Thời gian `0s` cho biết không có chuyển đổi nào xảy ra, tức là việc chuyển đổi giữa hai trạng thái sẽ diễn ra ngay lập tức. Giá trị âm cho thời gian làm cho khai báo không hợp lệ.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ hiển thị các thời lượng khác nhau

#### HTML

```html
<div class="box duration-1">0.5 giây</div>

<div class="box duration-2">2 giây</div>

<div class="box duration-3">4 giây</div>

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
}

.transformed-state {
  transform: rotate(270deg);
  background-color: blue;
  color: yellow;
  font-size: 12px;
  transition-property: background-color, font-size, transform, color;
  transition-timing-function: ease-in-out;
}

.duration-1 {
  transition-duration: 0.5s;
}

.duration-2 {
  transition-duration: 2s;
}

.duration-3 {
  transition-duration: 4s;
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

{{EmbedLiveSample("Example_showing_different_durations",275,200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS transitions](/vi/docs/Web/CSS/Guides/Transitions/Using)
- {{cssxref('transition')}}
- {{cssxref('transition-property')}}
- {{cssxref('transition-timing-function')}}
- {{cssxref('transition-delay')}}
- {{domxref("TransitionEvent")}}
