---
title: Grid areas
slug: Glossary/Grid_Areas
page-type: glossary-definition
sidebar: glossarysidebar
---

**Vùng grid** là một hoặc nhiều {{glossary("grid cell", "ô grid")}} tạo thành một vùng hình chữ nhật trên grid. Các vùng grid được tạo ra khi bạn đặt một phần tử bằng cách [đặt theo đường line](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement) hoặc khi định nghĩa các vùng bằng cách sử dụng [named grid areas](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas).

![Hình ảnh hiển thị một vùng grid được tô sáng](1_grid_area.png)

Các vùng grid _phải_ có hình chữ nhật; không thể tạo, ví dụ, vùng grid hình chữ T hoặc hình chữ L.

## Ví dụ

Trong ví dụ bên dưới, tôi có một grid container với hai grid item. Tôi đã đặt tên cho chúng bằng thuộc tính {{cssxref("grid-area")}} và sau đó bố trí chúng trên grid bằng cách sử dụng {{cssxref("grid-template-areas")}}. Điều này tạo ra hai vùng grid, một vùng bao gồm bốn ô grid, vùng còn lại hai ô.

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: 100px 100px;
  grid-template-areas:
    "a a b"
    "a a b";
}
.item1 {
  grid-area: a;
}
.item2 {
  grid-area: b;
}
```

```html
<div class="wrapper">
  <div class="item1">Item</div>
  <div class="item2">Item</div>
</div>
```

{{ EmbedLiveSample('Ví dụ', '300', '280') }}

## Xem thêm

### Tham khảo thuộc tính

- {{cssxref("grid-template-columns")}}
- {{cssxref("grid-template-rows")}}
- {{cssxref("grid-auto-rows")}}
- {{cssxref("grid-auto-columns")}}
- {{cssxref("grid-template-areas")}}
- {{cssxref("grid-area")}}

### Đọc thêm

- Hướng dẫn bố cục CSS grid:
  - [Khái niệm cơ bản về bố cục grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts)
  - [Grid template areas](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas)
- [Định nghĩa về grid areas trong đặc tả bố cục CSS grid](https://drafts.csswg.org/css-grid/#grid-area-concept)
