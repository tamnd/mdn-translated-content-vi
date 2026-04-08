---
title: fit-content()
slug: Web/CSS/Reference/Values/fit-content_function
page-type: css-function
browser-compat:
  - css.properties.grid-template-columns.fit-content
  - css.properties.width.fit-content_function
sidebar: cssref
---

Hàm **`fit-content()`** [CSS](/vi/docs/Web/CSS) [](/vi/docs/Web/CSS/Reference/Values/Functions) kẹp một kích thước đã cho vào kích thước khả dụng theo công thức `min(kích thước tối đa, max(kích thước tối thiểu, đối số))`.

{{InteractiveExample("CSS Demo: fit-content()")}}

```css interactive-example-choice
grid-template-columns: fit-content(8ch) fit-content(8ch) 1fr;
```

```css interactive-example-choice
grid-template-columns: fit-content(100px) fit-content(100px) 1fr;
```

```css interactive-example-choice
grid-template-columns: fit-content(40%) fit-content(40%) 1fr;
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

Hàm này có thể được dùng làm kích thước track trong các thuộc tính [CSS grid](/vi/docs/Web/CSS/Guides/Grid_layout), trong đó kích thước tối đa được xác định bởi `max-content` và kích thước tối thiểu bởi `auto`, được tính toán tương tự như `auto` (tức là [`minmax(auto, max-content)`](/vi/docs/Web/CSS/Reference/Values/minmax)), ngoại trừ kích thước track bị kẹp tại _đối số_ nếu nó lớn hơn giá trị tối thiểu `auto`.

Xem trang {{cssxref("grid-template-columns")}} để biết thêm thông tin về các từ khóa `max-content` và `auto`.

Hàm `fit-content()` cũng có thể được dùng làm kích thước hộp đã bố cục cho {{cssxref("width")}}, {{cssxref("height")}}, {{cssxref("min-width")}}, {{cssxref("min-height")}}, {{cssxref("max-width")}} và {{cssxref("max-height")}}, trong đó kích thước tối đa và tối thiểu tham chiếu đến kích thước nội dung.

## Cú pháp

```css
/* Giá trị <length> */
fit-content(200px)
fit-content(5cm)
fit-content(30vw)
fit-content(100ch)

/* Giá trị <percentage> */
fit-content(40%)
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Độ dài tuyệt đối.
- {{cssxref("&lt;percentage&gt;")}}
  - : Phần trăm tương đối so với không gian khả dụng trên trục đã cho.

    Trong các thuộc tính grid, nó tương đối so với kích thước inline của grid container trong các track cột và so với kích thước block của grid container cho các track hàng. Nếu không, nó tương đối so với kích thước inline hoặc block khả dụng của hộp đã bố cục tùy thuộc vào chế độ viết.

## Cú pháp chính thức

{{CSSSyntax("fit-content")}}

## Ví dụ

### Đặt kích thước cột grid bằng fit-content

#### HTML

```html
<div id="container">
  <div>Item as wide as the content.</div>
  <div>
    Item with more text in it. Because the contents of it are wider than the
    maximum width, it is clamped at 300 pixels.
  </div>
  <div>Flexible item</div>
</div>
```

#### CSS

```css
#container {
  display: grid;
  grid-template-columns: fit-content(300px) fit-content(300px) 1fr;
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

#### Kết quả

{{EmbedLiveSample("Sizing_grid_columns_with_fit-content", "100%", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Từ khóa {{cssxref("min-content")}}
- Từ khóa {{cssxref("max-content")}}
- Module [CSS box sizing](/vi/docs/Web/CSS/Guides/Box_sizing)
- {{cssxref("grid-template")}}
- {{cssxref("grid-template-rows")}}
- {{cssxref("grid-template-columns")}}
- {{cssxref("grid-template-areas")}}
- {{cssxref("grid-auto-columns")}}
- {{cssxref("grid-auto-rows")}}
- {{cssxref("grid-auto-flow")}}
- [Bố cục dựa trên đường với CSS grid](/vi/docs/Web/CSS/Guides/Grid_layout/Line-based_placement)
- [Grid template areas: grid definition shorthands](/vi/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas#grid_definition_shorthands)
