---
title: Track grid
slug: Glossary/Grid_Tracks
page-type: glossary-definition
sidebar: glossarysidebar
---

**Track grid** là không gian giữa hai {{glossary("grid lines")}} liền kề nhau. Chúng được định nghĩa trong _grid tường minh_ bằng cách sử dụng các thuộc tính {{cssxref("grid-template-columns")}} và {{cssxref("grid-template-rows")}} hoặc các thuộc tính viết tắt {{cssxref("grid")}} hoặc {{cssxref("grid-template")}}. Các track cũng được tạo trong _grid ngầm_ bằng cách định vị một grid item bên ngoài các track được tạo trong grid tường minh.

Hình ảnh bên dưới hiển thị track hàng đầu tiên trên một grid.

![Sơ đồ hiển thị một track grid.](1_grid_track.png)

## Kích thước track trong grid tường minh

Khi định nghĩa các track grid bằng {{cssxref("grid-template-columns")}} và {{cssxref("grid-template-rows")}}, bạn có thể sử dụng bất kỳ đơn vị độ dài nào, và cũng là đơn vị flex `fr` cho biết một phần của không gian có sẵn trong grid container.

## Ví dụ

Ví dụ bên dưới minh họa một grid với ba track cột, một cột 200 pixel, cột thứ hai 1fr, cột thứ ba 3fr. Sau khi trừ đi 200 pixel từ không gian có sẵn trong grid container, không gian còn lại được chia cho 4. Một phần được cấp cho cột 2, 3 phần cho cột 3.

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
  grid-template-columns: 200px 1fr 3fr;
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

{{ EmbedLiveSample('Ví dụ', '500', '230') }}

## Kích thước track trong grid ngầm

Các track được tạo trong grid ngầm được tự động định kích thước theo mặc định, tuy nhiên bạn có thể định nghĩa kích thước cho các track này bằng cách sử dụng các thuộc tính {{cssxref("grid-auto-rows")}} và {{cssxref("grid-auto-columns")}}.

## Xem thêm

- [Khái niệm cơ bản về bố cục grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts)
- [Định nghĩa về track grid trong đặc tả bố cục CSS grid](https://drafts.csswg.org/css-grid/#grid-track-concept)
- Tham khảo thuộc tính
  - {{cssxref("grid-template-columns")}}
  - {{cssxref("grid-template-rows")}}
  - {{cssxref("grid")}}
  - {{cssxref("grid-template")}}
