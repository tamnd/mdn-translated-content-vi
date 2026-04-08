---
title: CSS grid layout
short-title: Grid layout
slug: Web/CSS/Guides/Grid_layout
page-type: css-module
spec-urls: https://drafts.csswg.org/css-grid/
sidebar: cssref
---

Module **CSS grid layout** xuất sắc trong việc chia trang thành các vùng chính hoặc xác định mối quan hệ về kích thước, vị trí và lớp chồng giữa các phần của một giao diện được xây dựng từ các phần tử HTML cơ bản.

Giống như bảng, grid layout cho phép tác giả căn chỉnh các phần tử thành cột và hàng. Tuy nhiên, nhiều bố cục hơn có thể thực hiện được hoặc dễ dàng hơn với CSS grid so với bảng. Ví dụ, các phần tử con của một grid container có thể tự định vị để chúng thực sự chồng lên nhau và tạo lớp, tương tự như các phần tử được định vị bằng CSS.

## Grid layout trong thực tế

Ví dụ dưới đây hiển thị một grid ba cột với các hàng mới được tạo ở kích thước tối thiểu 100 pixel và tối đa auto. Các mục được đặt lên grid bằng cách sử dụng line-based placement.

```html hidden
<div class="wrapper">
  <div class="one">One</div>
  <div class="two">Two</div>
  <div class="three">Three</div>
  <div class="four">Four</div>
  <div class="five">Five</div>
  <div class="six">Six</div>
</div>
```

```css hidden
* {
  box-sizing: border-box;
}
.wrapper {
  max-width: 940px;
  margin: 0 auto;
}
.wrapper > div {
  border: 2px solid rgb(233 171 88);
  border-radius: 5px;
  background-color: rgb(233 171 88 / 50%);
  padding: 1em;
  color: #d9480f;
}
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
  grid-auto-rows: minmax(100px, auto);
}
.one {
  grid-column: 1 / 3;
  grid-row: 1;
}
.two {
  grid-column: 2 / 4;
  grid-row: 1 / 3;
}
.three {
  grid-column: 1;
  grid-row: 2 / 5;
}
.four {
  grid-column: 3;
  grid-row: 3;
}
.five {
  grid-column: 2;
  grid-row: 4;
}
.six {
  grid-column: 3;
  grid-row: 4;
}
```

{{EmbedLiveSample("Grid_layout_in_action", "100%", "460")}}

Ví dụ này sử dụng {{cssxref("display")}}, {{cssxref("grid-template-columns")}}, {{cssxref("grid-template-rows")}}, và {{cssxref("gap")}} để tạo grid, và {{cssxref("grid-column")}} cùng {{cssxref("grid-row")}} để định vị các mục trong grid. Để xem và chỉnh sửa HTML và CSS, nhấp vào 'Play' ở góc trên bên phải của ví dụ.

## Tham chiếu

### Thuộc tính

- {{CSSxRef("grid-auto-columns")}}
- {{CSSxRef("grid-auto-flow")}}
- {{CSSxRef("grid-auto-rows")}}
- {{CSSxRef("grid-template-columns")}}
- {{CSSxRef("grid-template-rows")}}
- {{CSSxRef("grid-template-areas")}}
- Shorthand {{CSSxRef("grid-template")}}
- Shorthand {{CSSxRef("grid")}}
- {{CSSxRef("grid-column-start")}}
- {{CSSxRef("grid-column-end")}}
- Shorthand {{CSSxRef("grid-column")}}
- {{CSSxRef("grid-row-start")}}
- {{CSSxRef("grid-row-end")}}
- Shorthand {{CSSxRef("grid-row")}}
- Shorthand {{CSSxRef("grid-area")}}

### Hàm

- {{cssxref("repeat()")}}
- {{cssxref("minmax()")}}
- {{cssxref("fit-content()")}}

### Kiểu dữ liệu và giá trị

- {{CSSxRef("&lt;flex&gt;")}} (đơn vị `fr`)

### Thuật ngữ và định nghĩa từ điển

- {{glossary("Grid")}}
- {{glossary("Grid areas")}}
- {{glossary("Grid axis")}}
- {{glossary("Grid cell")}}
- {{glossary("Grid column")}}
- {{glossary("Grid container")}}
- {{glossary("Grid lines")}}
- {{glossary("Grid row")}}
- {{glossary("Grid tracks")}}
- {{glossary("Gutters")}}

## Hướng dẫn

- [Khái niệm cơ bản về grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts)
  - : Tổng quan về các tính năng khác nhau được cung cấp trong module CSS grid layout.

- [Mối quan hệ của grid layout với các phương pháp layout khác](/en-US/docs/Web/CSS/Guides/Grid_layout/Relationship_with_other_layout_methods)
  - : Cách grid layout kết hợp với các tính năng CSS khác bao gồm flexbox, các phần tử được định vị tuyệt đối và `display: contents`.

- [Grid layout sử dụng line-based placement](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement)
  - : Grid lines và cách định vị các mục theo các đường đó, bao gồm các thuộc tính `grid-area`, số dòng âm, trải qua nhiều ô, và tạo grid gutter.

- [Grid template areas](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas)
  - : Đặt các grid item bằng cách sử dụng các vùng template được đặt tên.

- [Grid layout sử dụng named grid lines](/en-US/docs/Web/CSS/Guides/Grid_layout/Named_grid_lines)
  - : Kết hợp tên và kích thước track; đặt các grid item bằng cách xác định các đường grid được đặt tên và các vùng template.

- [Auto-placement trong grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Auto-placement)
  - : Cách grid định vị các mục không có thuộc tính placement nào được khai báo.

- [Căn chỉnh các mục trong CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Box_alignment)
  - : Căn chỉnh, justify, và căn giữa các grid item theo hai trục của grid layout.

- [Grid, logical values, và writing modes](/en-US/docs/Web/CSS/Guides/Grid_layout/Logical_values_and_writing_modes)
  - : Tìm hiểu sự tương tác giữa CSS grid layout, box alignment và writing modes, cùng với các thuộc tính và giá trị logical và physical của CSS.

- [Grid layout và accessibility](/en-US/docs/Web/CSS/Guides/Grid_layout/Accessibility)
  - : Tìm hiểu cách CSS grid layout có thể hỗ trợ hoặc gây hại cho accessibility.

- [Thực hiện các layout phổ biến với grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Common_grid_layouts)
  - : Một số layout khác nhau trình bày các kỹ thuật khác nhau bạn có thể sử dụng khi thiết kế với CSS grid layout, bao gồm sử dụng {{cssxref("grid-template-areas")}}, hệ thống grid 12 cột linh hoạt, và danh sách sản phẩm sử dụng auto-placement.

- [Subgrid](/en-US/docs/Web/CSS/Guides/Grid_layout/Subgrid)
  - : Subgrid làm gì và các trường hợp sử dụng, các mẫu thiết kế mà subgrid giải quyết.

- [Masonry layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Masonry_layout)
  - : Chi tiết về masonry layout và cách sử dụng nó.

- [Box alignment trong CSS grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
  - : Cách box alignment hoạt động trong ngữ cảnh của grid layout.

## Tính năng liên quan

Module [CSS display](/en-US/docs/Web/CSS/Guides/Display)

- {{CSSxRef("display")}}
- {{CSSxRef("order")}}

Module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment)

- {{cssxref("align-content")}}
- {{cssxref("align-items")}}
- {{cssxref("align-self")}}
- {{cssxref("column-gap")}}
- {{cssxref("gap")}}
- {{cssxref("justify-content")}}
- {{cssxref("justify-items")}}
- {{cssxref("justify-self")}}
- {{cssxref("place-content")}}
- {{cssxref("place-items")}}
- {{cssxref("place-self")}}
- {{cssxref("row-gap")}}

Module [CSS box sizing](/en-US/docs/Web/CSS/Guides/Box_sizing)

- {{cssxref("aspect-ratio")}}
- {{cssxref("box-sizing")}}
- {{cssxref("height")}}
- {{cssxref("max-height")}}
- {{cssxref("max-width")}}
- {{cssxref("min-height")}}
- {{cssxref("min-width")}}
- {{cssxref("width")}}
- Kiểu dữ liệu {{cssxref("ratio")}}
- Giá trị {{cssxref("min-content")}}
- Giá trị {{cssxref("max-content")}}
- Giá trị {{cssxref("fit-content")}}
- Hàm {{cssxref("fit-content()")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- Module [CSS display](/en-US/docs/Web/CSS/Guides/Display)
- [Grid by example](https://gridbyexample.com/)
- [CSS grid reference](https://tympanus.net/codrops/css_reference/grid/) via Codrops
- [Firefox DevTools: grid inspector](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/examine_grid_layouts/index.html)
- [CSS grid playground](https://mozilladevelopers.github.io/playground/css-grid/)
- [CSS grid garden](https://cssgridgarden.com/) - Trò chơi học CSS grid
