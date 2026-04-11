---
title: "SVGElement: phương thức blur()"
short-title: blur()
slug: Web/API/SVGElement/blur
page-type: web-api-instance-method
browser-compat: api.SVGElement.blur
---

{{APIRef("SVG")}}

Phương thức **`SVGElement.blur()`** xóa tiêu điểm bàn phím khỏi phần tử SVG hiện tại.

## Cú pháp

```js-nolint
blur()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa tiêu điểm khỏi phần tử hình tròn SVG

#### HTML

```html
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200">
  <circle id="myCircle" cx="100" cy="100" r="50" tabindex="0" fill="blue" />
  <button id="focusButton">Focus the circle</button>
  <button id="blurButton">Blur the circle</button>
</svg>
```

#### JavaScript

```js
const circle = document.getElementById("myCircle");
const focusButton = document.getElementById("focusButton");
const blurButton = document.getElementById("blurButton");

// Focus the circle when the "Focus" button is clicked
focusButton.addEventListener("click", () => {
  circle.focus();
});

// Blur the circle when the "Blur" button is clicked
blurButton.addEventListener("click", () => {
  circle.blur();
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGElement.focus")}} đặt phần tử làm tiêu điểm bàn phím hiện tại.
- {{domxref("HTMLElement.blur")}} phương thức tương tự cho các phần tử HTML.
