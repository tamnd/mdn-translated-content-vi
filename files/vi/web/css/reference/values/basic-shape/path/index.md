---
title: path()
slug: Web/CSS/Reference/Values/basic-shape/path
page-type: css-function
browser-compat: css.types.basic-shape.path
sidebar: cssref
---

Hàm **`path()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) nhận vào một chuỗi đường dẫn [SVG](/vi/docs/Web/SVG/Reference/Element/path), được dùng trong các module [CSS shapes](/vi/docs/Web/CSS/Guides/Shapes) và [CSS motion path](/vi/docs/Web/CSS/Guides/Motion_path) để vẽ một hình dạng. Hàm `path()` là giá trị kiểu dữ liệu {{cssxref("basic-shape")}}. Nó có thể được dùng trong thuộc tính CSS {{cssxref("offset-path")}} và {{cssxref("clip-path")}}, cũng như trong thuộc tính SVG [`d`](/vi/docs/Web/SVG/Reference/Attribute/d).

Có một số hạn chế khi dùng hàm `path()`. Đường dẫn phải được định nghĩa dưới dạng một chuỗi duy nhất, vì vậy không thể tạo đường dẫn tùy chỉnh bằng biến (hàm [`var()`](/vi/docs/Web/CSS/Reference/Values/var)). Ngoài ra, tất cả độ dài trong đường dẫn đều được định nghĩa ngầm định theo đơn vị [pixel](/vi/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#absolute_length_units) (`px`); không thể dùng các đơn vị khác. Hàm [`shape()`](/vi/docs/Web/CSS/Reference/Values/basic-shape/shape) cung cấp nhiều tính linh hoạt hơn so với hàm `path()`.

{{InteractiveExample("CSS Demo: path()")}}

```css interactive-example-choice
clip-path: path(
  "M  20  240 \
 L  20  80 L 160  80 \
 L 160  20 L 280 100 \
 L 160 180 L 160 120 \
 L  60 120 L  60 240 Z"
);
```

```css interactive-example-choice
clip-path: path(
  "M 20 240 \
 C 20 0 300 0 300 240 Z"
);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element"></div>
</section>
```

```css interactive-example
#default-example {
  background: #ffee99;
}

#example-element {
  background: linear-gradient(to bottom right, #ff5522, #0055ff);
  width: 100%;
  height: 100%;
}
```

## Cú pháp

```css
path("M 10 80 C 40 10, 65 10, 95 80 S 150 150, 180 80")

/* Chỉ khi dùng trong clip-path */
path(evenodd,"M 10 80 C 40 10, 65 10, 95 80 S 150 150, 180 80")
```

### Tham số

- [`<fill-rule>`](/vi/docs/Web/SVG/Reference/Attribute/fill-rule) {{optional_inline}}
  - : Xác định phần nào của đường dẫn nằm bên trong hình dạng. Các giá trị có thể bao gồm:
    - `nonzero`: Một điểm được coi là nằm bên trong hình dạng nếu tia vẽ từ điểm đó đi qua nhiều đoạn đường từ trái sang phải hơn là từ phải sang trái, tạo ra kết quả khác không. Đây là giá trị mặc định khi `<fill-rule>` bị bỏ qua.

    - `evenodd`: Một điểm được coi là nằm bên trong hình dạng nếu tia vẽ từ điểm đó đi qua một số lẻ đoạn đường. Điều này có nghĩa là mỗi lần tia đi vào hình dạng, nó chưa thoát ra một số lần bằng nhau, cho thấy số lần vào lẻ mà không có lối ra tương ứng.

    > [!WARNING]
    > `<fill-rule>` không được hỗ trợ trong {{cssxref("offset-path")}} và việc sử dụng nó sẽ làm thuộc tính không hợp lệ.

- {{cssxref("string")}}
  - : Một [chuỗi dữ liệu](/vi/docs/Web/SVG/Reference/Attribute/d), đặt trong dấu ngoặc kép, định nghĩa một [đường dẫn SVG](/vi/docs/Web/SVG/Reference/Element/path). Chuỗi dữ liệu đường dẫn SVG chứa các [lệnh đường dẫn](/vi/docs/Web/SVG/Reference/Attribute/d#path_commands) ngầm định sử dụng đơn vị pixel. Đường dẫn rỗng được coi là không hợp lệ.

### Giá trị trả về

Trả về một giá trị {{cssxref("basic-shape")}}.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng hàm `path()` làm giá trị `offset-path`

Hàm `path()` được dùng làm giá trị {{cssxref("offset-path")}} trong ví dụ sau để tạo đường dẫn hình elip cho một quả bóng di chuyển theo.

```html
<div id="path">
  <div id="ball"></div>
</div>
<button>animate</button>
```

```css
#path {
  margin: 40px;
  width: 400px;
  height: 200px;

  /* vẽ đường dốc màu xám */
  background: radial-gradient(at 50% 0%, transparent 70%, grey 70%, grey 100%);
}

#ball {
  width: 30px;
  height: 30px;
  background-color: red;
  border-radius: 50%;

  /* đánh dấu đường dẫn hình elip */
  offset-path: path("M 15 15 A 6 5.5 10 0 0 385 15");
}
```

```js
const btn = document.querySelector("button");
const ball = document.getElementById("ball");

btn.addEventListener("click", () => {
  btn.setAttribute("disabled", true);
  setTimeout(() => btn.removeAttribute("disabled"), 6000);

  ball.animate(
    // hoạt hình offset path
    { offsetDistance: [0, "100%"] },
    {
      duration: 1500,
      iterations: 4,
      easing: "cubic-bezier(.667,0.01,.333,.99)",
      direction: "alternate",
    },
  );
});
```

{{EmbedLiveSample("Use as the value of offset-path", "100%", 350)}}

### Thay đổi giá trị thuộc tính d của đường dẫn SVG

Hàm `path()` có thể dùng để thay đổi giá trị của [thuộc tính `d`](/vi/docs/Web/SVG/Reference/Attribute/d) trong SVG, thuộc tính này cũng có thể được đặt thành `none` trong CSS.

Ký hiệu "V" sẽ lật theo chiều dọc khi bạn di chuột qua nó, nếu `d` được hỗ trợ dưới dạng thuộc tính CSS.

#### CSS

```css
html,
body,
svg {
  height: 100%;
}

/* Đường dẫn này được hiển thị khi hover */
#svg_css_ex1:hover path {
  d: path("M20,80 L50,20 L80,80");
}
```

#### HTML

```html
<svg id="svg_css_ex1" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <path fill="none" stroke="red" d="M20,20 L50,80 L80,20" />
</svg>
```

#### Kết quả

{{EmbedLiveSample('Modify the value of the SVG path d attribute', '100%', 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("&lt;shape-outside&gt;")}}
- Module [CSS shapes](/vi/docs/Web/CSS/Guides/Shapes)
- [Tổng quan về CSS shapes](/vi/docs/Web/CSS/Guides/Shapes/Overview)
- [Cú pháp đường dẫn SVG `path`: hướng dẫn minh họa](https://css-tricks.com/svg-path-syntax-illustrated-guide/) trên CSS-tricks (2021)
