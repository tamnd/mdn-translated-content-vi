---
title: Đường grid
slug: Glossary/Grid_Lines
page-type: glossary-definition
sidebar: glossarysidebar
---

**Đường grid** được tạo ra bất cứ khi nào bạn sử dụng [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout).

## Ví dụ

Trong ví dụ sau, có một grid với ba track cột và hai track hàng. Điều này tạo ra 4 đường cột và 3 đường hàng.

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(3, 100px);
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: 100px 100px;
}
```

{{ EmbedLiveSample('Ví dụ', '500', '250') }}

Các đường có thể được địa chỉ hóa bằng số đường của chúng. Trong ngôn ngữ viết từ trái sang phải như tiếng Anh, đường cột 1 sẽ nằm ở bên trái của grid, đường hàng 1 ở trên cùng. Số đường tuân theo [chế độ viết](/en-US/docs/Web/CSS/Guides/Writing_modes) của tài liệu, vì vậy trong ngôn ngữ từ phải sang trái ví dụ, đường cột 1 sẽ nằm ở bên phải của grid. Hình ảnh bên dưới hiển thị số đường của grid, giả sử ngôn ngữ là từ trái sang phải.

![Sơ đồ hiển thị grid với các đường được đánh số.](1_diagram_numbered_grid_lines.png)

Các đường cũng được tạo trong _grid ngầm_ khi các track ngầm được tạo ra để chứa nội dung được đặt bên ngoài _grid tường minh_, tuy nhiên các đường này không thể được địa chỉ hóa bằng số.

## Đặt các phần tử lên grid theo số đường

Sau khi tạo grid, bạn có thể đặt các phần tử lên grid theo số đường. Trong ví dụ sau, phần tử được đặt từ đường cột 1 đến đường cột 3, và từ đường hàng 1 đến đường hàng 3.

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(3, 100px);
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```html
<div class="wrapper">
  <div class="item">Item</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: 100px 100px;
}
.item {
  grid-column-start: 1;
  grid-column-end: 3;
  grid-row-start: 1;
  grid-row-end: 3;
}
```

{{ EmbedLiveSample('Đặt_các_phần_tử_lên_grid_theo_số_đường', '500', '250') }}

## Đặt tên cho các đường

Các đường được tạo trong _grid tường minh_ có thể được đặt tên, bằng cách thêm tên trong dấu ngoặc vuông trước hoặc sau thông tin kích thước track. Khi đặt phần tử, bạn có thể sử dụng tên này thay vì số đường, như được minh họa bên dưới.

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(3, 100px);
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```html
<div class="wrapper">
  <div class="item">Item</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: [col1-start] 1fr [col2-start] 1fr [col3-start] 1fr [cols-end];
  grid-template-rows: [row1-start] 100px [row2-start] 100px [rows-end];
}
.item {
  grid-column-start: col1-start;
  grid-column-end: col3-start;
  grid-row-start: row1-start;
  grid-row-end: rows-end;
}
```

{{ EmbedLiveSample('Đặt_tên_cho_các_đường', '500', '250') }}

## Xem thêm

### Tham khảo thuộc tính

- {{cssxref("grid-template-columns")}}
- {{cssxref("grid-template-rows")}}
- {{cssxref("grid-column-start")}}
- {{cssxref("grid-column-end")}}
- {{cssxref("grid-column")}}
- {{cssxref("grid-row-start")}}
- {{cssxref("grid-row-end")}}
- {{cssxref("grid-row")}}

### Đọc thêm

- Hướng dẫn bố cục CSS grid:
  - [Khái niệm cơ bản về bố cục grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts)
  - [Đặt theo đường với CSS grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement)
  - [Bố cục sử dụng các đường grid có tên](/en-US/docs/Web/CSS/Guides/Grid_layout/Named_grid_lines)
  - [CSS grids, logical values and writing modes](/en-US/docs/Web/CSS/Guides/Grid_layout/Logical_values_and_writing_modes)
- [Định nghĩa về đường grid trong đặc tả bố cục CSS grid](https://drafts.csswg.org/css-grid/#grid-line-concept)
