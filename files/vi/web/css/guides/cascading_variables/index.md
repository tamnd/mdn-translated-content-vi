---
title: CSS custom properties for cascading variables
short-title: Custom properties for cascading variables
slug: Web/CSS/Guides/Cascading_variables
page-type: css-module
spec-urls: https://drafts.csswg.org/css-variables/
sidebar: cssref
---

Mô-đun **CSS custom properties for cascading variables** bổ sung hỗ trợ cho các biến cascading trong thuộc tính CSS, đồng thời cho phép bạn tạo custom properties để định nghĩa các biến này cùng với cơ chế sử dụng chúng làm giá trị cho các thuộc tính CSS khác.

Khi làm việc với CSS, bạn thường xuyên phải dùng lại các giá trị phổ biến trong dự án như chiều rộng phù hợp với bố cục, hay một bộ màu sắc cho sơ đồ màu của mình.
Một cách để quản lý sự lặp lại trong stylesheet là định nghĩa giá trị một lần rồi sử dụng ở nhiều nơi khác.
Custom properties cho phép bạn tạo và định nghĩa các biến tùy chỉnh có thể tái sử dụng, giúp đơn giản hóa các quy tắc phức tạp hoặc lặp đi lặp lại, đồng thời làm cho chúng dễ đọc và dễ bảo trì hơn.
Ví dụ, `--dark-grey-text` và `--dark-background` dễ hiểu hơn các mã màu hex như `#323831`, và ngữ cảnh sử dụng chúng cũng rõ ràng hơn.

## Custom properties trong thực tế

Để xem cách custom properties có thể được sử dụng, hãy di chuyển thanh trượt từ trái sang phải.

```html hidden
<div class="container">
  <div id="color-1">--hue</div>
  <div id="color-2">--hue + 10</div>
  <div id="color-3">--hue + 20</div>
  <div id="color-4">--hue + 30</div>
  <div id="color-5">--hue + 40</div>
  <div id="color-6">--hue + 50</div>
  <div id="color-7">--hue + 60</div>
  <div id="color-8">--hue + 70</div>
</div>
<input type="range" min="0" max="360" value="0" step="0.1" id="hue" />
```

```js hidden
const hue = document.querySelector("#hue");

const updateHue = () => {
  document.documentElement.style.setProperty("--hue", hue.value);
};

hue.addEventListener("input", updateHue);
```

```css hidden
.container {
  display: grid;
  font-family: sans-serif;
  color: white;
  gap: 0.5rem;
  grid-template-columns: repeat(4, 1fr);
  margin-bottom: 1rem;
}
.container div {
  border-radius: 0.5rem;
  padding: 1rem;
}

input {
  width: 100%;
  margin: 0;
}

:root {
  --hue: 0;
}

#color-1 {
  background-color: hsl(var(--hue) 50% 50%);
}
#color-2 {
  background-color: hsl(calc(var(--hue) + 10) 50% 50%);
}
#color-3 {
  background-color: hsl(calc(var(--hue) + 20) 50% 50%);
}
#color-4 {
  background-color: hsl(calc(var(--hue) + 30) 50% 50%);
}
#color-5 {
  background-color: hsl(calc(var(--hue) + 40) 50% 50%);
}
#color-6 {
  background-color: hsl(calc(var(--hue) + 50) 50% 50%);
}
#color-7 {
  background-color: hsl(calc(var(--hue) + 60) 50% 50%);
}
#color-8 {
  background-color: hsl(calc(var(--hue) + 70) 50% 50%);
}
```

{{EmbedLiveSample("Custom properties in action",600,160)}}

Trong các ô màu này, {{cssxref("background-color")}} được đặt bằng hàm {{cssxref("color_value/hsl", "hsl()")}} {{cssxref("&lt;color&gt;")}} dưới dạng `hsl(var(--hue) 50% 50%)`.
Mỗi ô màu tăng giá trị {{cssxref("hue")}} lên 10 độ như `calc(var(--hue) + 10)`, `calc(var(--hue) + 20)`, v.v.
Khi giá trị thanh trượt thay đổi từ 0 đến 360, giá trị của [custom property](/en-US/docs/Web/CSS/Reference/Properties/--*) `--hue` được cập nhật bằng {{cssxref("calc")}}, và màu nền của mỗi ô trong lưới cũng được cập nhật theo.

## Tham chiếu

### Thuộc tính

- {{cssxref("--*")}}

### Hàm

- {{cssxref("var")}}

## Hướng dẫn

- [Sử dụng CSS custom properties (biến)](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties)
  - : Giải thích cách sử dụng custom properties trong CSS và JavaScript, kèm theo gợi ý về xử lý các giá trị undefined và không hợp lệ, fallback và kế thừa.

- [Invalid custom properties](/en-US/docs/Web/CSS/Guides/Syntax/Error_handling#invalid_custom_properties)
  - : Giải thích cách trình duyệt xử lý các giá trị thuộc tính khi giá trị của custom property là kiểu dữ liệu không hợp lệ cho thuộc tính đó.

## Khái niệm liên quan

- Mô-đun [CSS Properties and Values API](/en-US/docs/Web/CSS/Guides/Properties_and_values_API)
  - At-rule {{cssxref("@property")}}
  - Phương thức [`CSS.registerProperty()`](/en-US/docs/Web/API/CSS/registerProperty_static)

## Đặc tả

{{Specifications}}

## Xem thêm

- Mô-đun [CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)
- Hàm [CSS `env()`](/en-US/docs/Web/CSS/Reference/Values/env)
- Hàm [CSS `calc()`](/en-US/docs/Web/CSS/Reference/Values/calc)
- Phương thức [`getPropertyValue()`](/en-US/docs/Web/API/CSSStyleDeclaration/getPropertyValue)
