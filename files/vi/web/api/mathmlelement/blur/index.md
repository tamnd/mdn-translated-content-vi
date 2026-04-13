---
title: "MathMLElement: phương thức blur()"
short-title: blur()
slug: Web/API/MathMLElement/blur
page-type: web-api-instance-method
browser-compat: api.MathMLElement.blur
---

{{APIRef("MathML")}}

Phương thức **`blur()`** của giao diện {{domxref("MathMLElement")}} xóa tiêu điểm bàn phím khỏi phần tử MathML hiện tại.

## Cú pháp

```js-nolint
blur()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa tiêu điểm khỏi phần tử MathML

#### HTML

```html
<div>
  <math>
    <msup id="myMath" tabindex="0">
      <mi>x</mi>
      <mn>2</mn>
    </msup>
  </math>
  <button id="focusButton">Focus the Math</button>
  <button id="blurButton">Blur the Math</button>
</div>
```

#### JavaScript

```js
const mathElement = document.getElementById("myMath");
const focusButton = document.getElementById("focusButton");
const blurButton = document.getElementById("blurButton");

// Focus the MathMLElement when the "Focus" button is clicked
focusButton.addEventListener("click", () => {
  mathElement.focus();
});

// Blur the MathMLElement when the "Blur" button is clicked
blurButton.addEventListener("click", () => {
  mathElement.blur();
});
```

### Kết quả

{{EmbedLiveSample("blur",100,100)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MathMLElement.focus()")}}
- {{domxref("HTMLElement.blur()")}}
