---
title: minmax()
slug: Web/CSS/Reference/Values/minmax
page-type: css-function
browser-compat: css.properties.grid-template-columns.minmax
sidebar: cssref
---

Hàm **`minmax()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) xác định một phạm vi kích thước lớn hơn hoặc bằng _min_ và nhỏ hơn hoặc bằng _max_. Hàm này được dùng với [CSS grids](/vi/docs/Web/CSS/Guides/Grid_layout).

{{InteractiveExample("CSS Demo: minmax()")}}

```css interactive-example-choice
grid-template-columns: minmax(20px, auto) 1fr 1fr;
```

```css interactive-example-choice
grid-template-columns: minmax(0, 1fr) minmax(0, 1fr) minmax(0, 1fr);
```

```css interactive-example-choice
grid-template-columns: minmax(2ch, 10ch) 1fr 1fr;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">
      <div>One. This column has more text in it.</div>
      <div>Two</div>
      <div>Three</div>
      <div>Four</div>
      <div>Five</div>
    </div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  display: grid;
  grid-gap: 10px;
  width: 250px;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
  text-align: left;
}
```

## Cú pháp

```css
/* Các giá trị <inflexible-breadth>, <track-breadth> */
minmax(200px, 1fr)
minmax(400px, 50%)
minmax(30%, 300px)
minmax(100px, max-content)
minmax(min-content, 400px)
minmax(max-content, auto)
minmax(auto, 300px)
minmax(min-content, auto)

/* Các giá trị <fixed-breadth>, <track-breadth> */
minmax(200px, 1fr)
minmax(30%, 300px)
minmax(400px, 50%)
minmax(50%, min-content)
minmax(300px, max-content)
minmax(200px, auto)

/* Các giá trị <inflexible-breadth>, <fixed-breadth> */
minmax(400px, 50%)
minmax(30%, 300px)
minmax(min-content, 200px)
minmax(max-content, 200px)
minmax(auto, 300px)
```

Hàm nhận hai tham số là _min_ và _max_.

Mỗi tham số có thể là `<length>`, `<percentage>` hoặc một trong các từ khóa `max-content`, `min-content`, hoặc `auto`.

Tham số thứ hai _max_ cũng chấp nhận các giá trị {{cssxref("flex_value","&lt;flex&gt;")}}. (Đơn vị `fr` chỉ có thể dùng cho _max_, không hợp lệ với _min_.)

Nếu _max_ < _min_, thì _max_ bị bỏ qua và `minmax(min,max)` được xử lý như là _min_.

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Một độ dài không âm.
- {{cssxref("&lt;percentage&gt;")}}
  - : Một phần trăm không âm so với kích thước inline của container lưới trong các track cột, và kích thước block của container lưới trong các track hàng. Nếu kích thước của container lưới phụ thuộc vào kích thước của các track, thì `<percentage>` phải được xử lý như `auto`. {{glossary("user agent")}} có thể điều chỉnh đóng góp kích thước nội tại của track vào kích thước container lưới và tăng kích thước cuối của track thêm lượng tối thiểu sẽ đáp ứng phần trăm.
- {{cssxref("&lt;flex&gt;")}}
  - : Một chiều không âm với đơn vị `fr` xác định hệ số linh hoạt của track. Mỗi track có kích thước `<flex>` chiếm một phần không gian còn lại tương ứng với hệ số linh hoạt của nó.
- {{cssxref("max-content")}}
  - : Biểu thị đóng góp max-content lớn nhất của các mục lưới chiếm track lưới.
- {{cssxref("min-content")}}
  - : Biểu thị đóng góp min-content lớn nhất của các mục lưới chiếm track lưới.
- `auto`
  - : Khi dùng làm _min_, biểu thị kích thước tối thiểu lớn nhất (được chỉ định bởi {{cssxref("min-width")}}/{{cssxref("min-height")}}) của các mục lưới chiếm track lưới.
    Khi dùng làm _max_, nó giống với `max-content`. Tuy nhiên, khác với `max-content`, nó cho phép mở rộng track bởi các giá trị thuộc tính {{cssxref("align-content")}} và {{cssxref("justify-content")}} như `normal` và `stretch`.

## Cú pháp chính thức

{{CSSSyntax}}

### Thuộc tính CSS

Hàm `minmax()` có thể được dùng trong:

- {{CSSxRef("grid-template-columns")}}
- {{CSSxRef("grid-template-rows")}}
- {{CSSxRef("grid-auto-columns")}}
- {{CSSxRef("grid-auto-rows")}}

## Ví dụ

### CSS

```css
#container {
  display: grid;
  grid-template-columns: minmax(min-content, 300px) minmax(200px, 1fr) 150px;
  grid-gap: 5px;
  box-sizing: border-box;
  height: 200px;
  width: 100%;
  background-color: #8cffa0;
  padding: 10px;
}

#container > div {
  background-color: #8ca0ff;
  padding: 5px;
}
```

### HTML

```html
<div id="container">
  <div>Item as wide as the content, but at most 300 pixels.</div>
  <div>Item with flexible width but a minimum of 200 pixels.</div>
  <div>Inflexible item of 150 pixels width.</div>
</div>
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Các khái niệm cơ bản về bố cục lưới: định kích thước track với minmax()](/vi/docs/Web/CSS/Guides/Grid_layout/Basic_concepts#track_sizing_and_minmax)
- [CSS grids, giá trị logic và chế độ viết](/vi/docs/Web/CSS/Guides/Grid_layout/Logical_values_and_writing_modes)
- Video: [Giới thiệu minmax()](https://gridbyexample.com/video/series-minmax/)
