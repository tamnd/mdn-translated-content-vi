---
title: contrast-color()
slug: Web/CSS/Reference/Values/color_value/contrast-color
page-type: css-function
browser-compat: css.types.color.contrast-color
sidebar: cssref
---

Hàm **`contrast-color()`** của [CSS](/vi/docs/Web/CSS) nhận một giá trị {{cssxref("color_value","color")}} và trả về một màu có độ tương phản cao. Hàm thường đảm bảo [độ tương phản tối thiểu WCAG AA](https://w3c.github.io/wcag/guidelines/22/#contrast-minimum). Trình duyệt có thể sử dụng các thuật toán khác nhau và tốt hơn.

Hàm `contrast-color()` cho phép chỉ định màu chữ và tự động tạo màu nền có độ tương phản cao, hoặc ngược lại. Nó tránh việc phải duy trì các cặp màu nền-chữ.

## Cú pháp

```css
contrast-color(red)
contrast-color(var(--backgroundColor))
```

### Tham số

- `color`
  - : Bất kỳ giá trị {{cssxref("&lt;color&gt;")}} hợp lệ nào.

### Giá trị trả về

Một {{cssxref("named-color")}} là `white` hoặc `black`.

## Mô tả

Hàm `contrast-color()` trả về giá trị `white` hoặc `black`, tùy thuộc vào giá trị nào có độ tương phản lớn nhất với màu đầu vào. Nếu cả `white` và `black` có cùng độ tương phản với màu đầu vào, `white` được trả về.

> [!WARNING]
> Độ tương phản WCAG AA (4.5:1) không thể tạo ra chữ dễ đọc trong mọi trường hợp. Màu nền trung tính thường không cung cấp đủ độ tương phản với chữ đen hoặc trắng. Ví dụ, `contrast-color()` trên nền xanh hoàng gia (`#2277d3`) tạo ra chữ đen, không dễ đọc cho chữ nhỏ. Do đó, khuyến nghị sử dụng màu sáng hoặc tối với hàm `contrast-color()`.

## Ví dụ

### Chữ tương phản cho nút bấm

Trong ví dụ sau, trình duyệt tự động áp dụng màu được chọn cho nền của {{htmlelement("button")}} "Button", và màu tương phản (đen hoặc trắng) cho chữ của nó.

```html hidden
<label>
  Select background color of the button:
  <input type="color" id="colorPicker" value="#660066" />
</label>
<br />
<button>Button</button>
```

```css
:root {
  --button-color: lightblue;
}

button {
  background-color: var(--button-color);

  /* Đặt màu chữ tương phản tự động */
  color: contrast-color(var(--button-color));
}
```

```css hidden
body {
  padding: 1rem;
}

button {
  margin: 3rem;
  padding: 1rem;
  width: 150px;
  font-size: 2rem;
  border-radius: 1rem;
}

@supports not (color: contrast-color(red)) {
  body::before {
    content: "Your browser doesn't support the contrast-color() function.";
    background-color: wheat;
    display: block;
    width: 100%;
    text-align: center;
  }

  body > * {
    display: none;
  }
}
```

```js hidden
const colorPicker = document.getElementById("colorPicker");
const root = document.documentElement;

function updateColor(color) {
  root.style.setProperty("--button-color", colorPicker.value);
}

colorPicker.addEventListener("input", updateColor);
updateColor();
```

{{EmbedLiveSample("Contrasting text for a button", "", 250)}}

### Sử dụng chế độ sáng và tối

Trong ví dụ sau, media query [`prefers-color-scheme`](/vi/docs/Web/CSS/Reference/At-rules/@media/prefers-color-scheme) được sử dụng để đặt màu nền dựa trên cài đặt giao diện màu của hệ điều hành hoặc trình duyệt. Hàm `contrast-color()` được sử dụng để đặt màu chữ tự động.

Thử thay đổi cài đặt chế độ tối của trình duyệt hoặc hệ điều hành để xem hiệu ứng.

```html hidden
<pre>
    Q: How does CSS transform light into energy?
  Ans: Using <a href="/vi/docs/Web/CSS/Reference/Properties/font-synthesis">font-synthesis</a>.
</pre>
```

```css
:root {
  --background-color: navy;
}

@media (prefers-color-scheme: light) {
  :root {
    --background-color: wheat;
  }
}

body,
a {
  background-color: var(--background-color);
  color: contrast-color(var(--background-color));
}
```

```css hidden
body {
  padding: 2rem;
  font-size: 1.2rem;
}

pre {
  margin-top: 3rem;
}

@supports not (color: contrast-color(red)) {
  body::before {
    content: "Your browser doesn't support the contrast-color() function.";
    background-color: wheat;
    display: block;
    width: 100%;
    text-align: center;
  }

  body {
    background-color: white;
  }

  body > * {
    display: none;
  }
}
```

{{EmbedLiveSample("Light and dark mode usage", "", 250)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`contrast()`](/vi/docs/Web/CSS/Reference/Values/filter-function/contrast)
- Mô-đun [CSS colors](/vi/docs/Web/CSS/Guides/Colors)
- [Thuộc tính tùy chỉnh CSS](/vi/docs/Web/CSS/Reference/Properties/--*) và {{cssxref("var")}}
- [`prefers-contrast`](/vi/docs/Web/CSS/Reference/At-rules/@media/prefers-contrast) và [`prefers-color-scheme`](/vi/docs/Web/CSS/Reference/At-rules/@media/prefers-color-scheme) tính năng {{cssxref("@media")}}
- [WCAG: color contrast](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast)
- [How to have the browser pick a contrasting color in CSS](https://webkit.org/blog/16929/contrast-color/) trên webkit.org (2025)
- [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/) trên webaim.org (2025)
