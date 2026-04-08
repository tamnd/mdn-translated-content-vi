---
title: grid
slug: Web/CSS/Reference/Properties/grid
page-type: css-shorthand-property
browser-compat: css.properties.grid
sidebar: cssref
---

Thuộc tính **`grid`** [CSS](/en-US/docs/Web/CSS) là [thuộc tính rút gọn](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) đặt tất cả các thuộc tính lưới rõ ràng và ngầm định trong một khai báo duy nhất.

Sử dụng `grid`, bạn chỉ định một trục bằng cách sử dụng {{cssxref("grid-template-rows")}} hoặc {{cssxref("grid-template-columns")}}, sau đó chỉ định cách nội dung nên tự động lặp lại trên trục kia bằng các thuộc tính lưới ngầm định: {{cssxref("grid-auto-rows")}}, {{cssxref("grid-auto-columns")}} và {{cssxref("grid-auto-flow")}}.

{{InteractiveExample("CSS Demo: grid")}}

```css interactive-example-choice
grid: auto-flow / 1fr 1fr 1fr;
```

```css interactive-example-choice
grid: auto-flow dense / 40px 40px 1fr;
```

```css interactive-example-choice
grid: repeat(3, 80px) / auto-flow;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">
      <div>One</div>
      <div>Two</div>
      <div>Three</div>
    </div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  display: grid;
  grid-gap: 10px;
  width: 200px;
}

#example-element :nth-child(1) {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}

#example-element :nth-child(2) {
  background-color: rgb(255 0 200 / 0.2);
  border: 3px solid rebeccapurple;
  grid-column: auto / span 3;
  grid-row: auto / span 2;
}

#example-element :nth-child(3) {
  background-color: rgb(94 255 0 / 0.2);
  border: 3px solid green;
  grid-column: auto / span 2;
}
```

> [!NOTE]
> Các thuộc tính con mà bạn không chỉ định sẽ được đặt về giá trị ban đầu, như thông thường với các thuộc tính rút gọn. Ngoài ra, các thuộc tính rãnh KHÔNG được đặt lại bởi thuộc tính rút gọn này.

## Thuộc tính cấu thành

Thuộc tính này là dạng rút gọn của các thuộc tính CSS sau:

- {{cssxref("grid-auto-columns")}}
- {{cssxref("grid-auto-flow")}}
- {{cssxref("grid-auto-rows")}}
- {{cssxref("grid-template-areas")}}
- {{cssxref("grid-template-columns")}}
- {{cssxref("grid-template-rows")}}

## Cú pháp

```css
/* Giá trị <'grid-template'> */
grid: none;
grid: "a" 100px "b" 1fr;
grid: [line-name1] "a" 100px [line-name2];
grid: "a" 200px "b" min-content;
grid: "a" minmax(100px, max-content) "b" 20%;
grid: 100px / 200px;
grid: minmax(400px, min-content) / repeat(auto-fill, 50px);

/* Giá trị <'grid-template-rows'> /
   [ auto-flow && dense? ] <'grid-auto-columns'>? */
grid: 200px / auto-flow;
grid: 30% / auto-flow dense;
grid: repeat(3, [line1 line2 line3] 200px) / auto-flow 300px;
grid: [line1] minmax(20em, max-content) / auto-flow dense 40%;

/* Giá trị [ auto-flow && dense? ] <'grid-auto-rows'>? /
   <'grid-template-columns'> */
grid: auto-flow / 200px;
grid: auto-flow dense / 30%;
grid: auto-flow 300px / repeat(3, [line1 line2 line3] 200px);
grid: auto-flow dense 40% / [line1] minmax(20em, max-content);

/* Giá trị toàn cục */
grid: inherit;
grid: initial;
grid: revert;
grid: revert-layer;
grid: unset;
```

### Giá trị

- `<'grid-template'>`
  - : Xác định {{cssxref("grid-template")}} bao gồm {{cssxref("grid-template-columns")}}, {{cssxref("grid-template-rows")}} và {{cssxref("grid-template-areas")}}.
- `<'grid-template-rows'> / [ auto-flow && dense? ] <'grid-auto-columns'>?`
  - : Thiết lập luồng tự động bằng cách đặt các track hàng rõ ràng thông qua thuộc tính {{cssxref("grid-template-rows")}} (và đặt thuộc tính {{cssxref("grid-template-columns")}} thành `none`) và chỉ định cách tự động lặp lại các track cột thông qua {{cssxref("grid-auto-columns")}} (và đặt {{cssxref("grid-auto-rows")}} thành `auto`). {{cssxref("grid-auto-flow")}} cũng được đặt thành `column` tương ứng, với `dense` nếu nó được chỉ định.

    Tất cả các thuộc tính con `grid` khác được đặt lại về giá trị ban đầu.

- `[ auto-flow && dense? ] <'grid-auto-rows'>? / <'grid-template-columns'>`
  - : Thiết lập luồng tự động bằng cách đặt các track cột rõ ràng thông qua thuộc tính {{cssxref("grid-template-columns")}} (và đặt thuộc tính {{cssxref("grid-template-rows")}} thành `none`) và chỉ định cách tự động lặp lại các track hàng thông qua {{cssxref("grid-auto-rows")}} (và đặt {{cssxref("grid-auto-columns")}} thành `auto`). {{cssxref("grid-auto-flow")}} cũng được đặt thành `row` tương ứng, với `dense` nếu nó được chỉ định.

    Tất cả các thuộc tính con `grid` khác được đặt lại về giá trị ban đầu.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Tạo bố cục lưới

#### HTML

```html
<div id="container">
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
</div>
```

#### CSS

```css
#container {
  display: grid;
  grid: repeat(2, 60px) / auto-flow 80px;
}

#container > div {
  background-color: #8ca0ff;
  width: 50px;
  height: 50px;
}
```

#### Kết quả

{{EmbedLiveSample("Creating_a_grid_layout", "100%", 150)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("grid-template")}}
- {{cssxref("grid-template-rows")}}
- {{cssxref("grid-template-columns")}}
- {{cssxref("grid-template-areas")}}
- {{cssxref("grid-auto-columns")}}
- {{cssxref("grid-auto-rows")}}
- {{cssxref("grid-auto-flow")}}
- [Line-based placement with CSS grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement)
- [Grid template areas: grid definition shorthands](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas#grid_definition_shorthands)
