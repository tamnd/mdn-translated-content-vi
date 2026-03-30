---
title: Grid Cell
slug: Glossary/Grid_Cell
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout), **ô grid** là đơn vị nhỏ nhất bạn có thể có trên CSS grid của mình. Đây là không gian giữa bốn {{glossary("grid lines")}} giao nhau và về mặt khái niệm rất giống với một ô trong bảng.

![Sơ đồ hiển thị một ô riêng lẻ trên grid.](1_grid_cell.png)

Nếu bạn không đặt các phần tử bằng một trong các phương pháp đặt grid, các phần tử con trực tiếp của grid container sẽ được đặt mỗi phần tử vào từng ô grid riêng lẻ bởi thuật toán tự động đặt. Các {{glossary("grid tracks", "track")}} hàng hoặc cột bổ sung sẽ được tạo ra để có đủ ô chứa tất cả các phần tử.

## Ví dụ

Trong ví dụ chúng ta đã tạo một grid có track ba cột. Năm phần tử được đặt vào các ô grid dọc theo một hàng ban đầu gồm ba ô grid, sau đó tạo một hàng mới cho hai phần tử còn lại.

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
  grid-auto-rows: 100px;
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

{{ EmbedLiveSample('Ví dụ', '300', '280') }}

## Xem thêm

### Tham khảo thuộc tính

- {{cssxref("grid-template-columns")}}
- {{cssxref("grid-template-rows")}}
- {{cssxref("grid-auto-rows")}}
- {{cssxref("grid-auto-columns")}}

### Đọc thêm

- [Khái niệm cơ bản về bố cục grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts)
- [Định nghĩa về ô grid trong đặc tả bố cục CSS grid](https://drafts.csswg.org/css-grid/#grid-track-concept)
