---
title: How to fade a button on hover
short-title: Fade a button on hover
slug: Learn_web_development/Howto/Solve_CSS_problems/Transition_button
page-type: learn-faq
sidebar: learn-how-to
---

Trong hướng dẫn này, bạn có thể tìm hiểu cách thực hiện chuyển đổi mờ dần nhẹ nhàng giữa hai màu khi di chuột qua một nút.

Trong ví dụ về nút của chúng ta, chúng ta có thể thay đổi background của nút bằng cách định nghĩa màu nền khác cho pseudo-class động `:hover`. Tuy nhiên, di chuột qua nút sẽ làm cho background-color bật ngay sang màu mới. Để tạo ra sự chuyển đổi nhẹ nhàng hơn giữa hai màu, chúng ta có thể sử dụng CSS Transitions.

## Sử dụng transitions

Sau khi thêm màu mong muốn cho trạng thái hover, hãy thêm thuộc tính {{cssxref("transition")}} vào các quy tắc cho nút. Đối với một transition đơn giản, giá trị của `transition` là tên của thuộc tính hoặc các thuộc tính mà bạn muốn transition này áp dụng, và thời gian mà transition sẽ kéo dài.

Đối với các pseudo-class `:active` và `:focus`, thuộc tính {{cssxref("transition")}} được đặt thành none, để nút bật ngay sang trạng thái active khi được nhấp.

Trong ví dụ, transition kéo dài 1 giây, bạn có thể thử thay đổi giá trị này để xem sự khác biệt khi thay đổi tốc độ.

```html live-sample___transition-button
<div class="wrapper">
  <button class="fade">Hover over me</button>
</div>
```

```css hidden live-sample___transition-button
.wrapper {
  height: 150px;
  display: flex;
  align-items: center;
  justify-content: center;
}

button {
  padding: 5px 10px;
  border: 0;
  border-radius: 5px;
  font-weight: bold;
  font-size: 140%;
  cursor: pointer;
}

.fade:focus,
.fade:active {
  background-color: black;
}
```

```css live-sample___transition-button
.fade {
  background-color: #db1f48;
  color: white;
  transition: background-color 1s;
}

.fade:hover {
  background-color: #004369;
}

.fade:focus,
.fade:active {
  background-color: black;
  transition: none;
}
```

{{EmbedLiveSample("transition-button")}}

> [!NOTE]
> Thuộc tính {{cssxref("transition")}} là viết tắt của {{cssxref("transition-delay")}}, {{cssxref("transition-duration")}}, {{cssxref("transition-property")}}, và {{cssxref("transition-timing-function")}}. Xem các trang cho các thuộc tính này trên MDN để tìm cách tinh chỉnh các transition của bạn.

## Xem thêm

- [Using CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions/Using)
