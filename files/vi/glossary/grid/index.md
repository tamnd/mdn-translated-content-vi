---
title: Grid
slug: Glossary/Grid
page-type: glossary-definition
sidebar: glossarysidebar
---

_CSS grid_ được định nghĩa bằng cách sử dụng giá trị `grid` của thuộc tính {{cssxref("display")}}; bạn có thể định nghĩa các cột và hàng trên grid của bạn bằng cách sử dụng các thuộc tính {{cssxref("grid-template-rows")}} và {{cssxref("grid-template-columns")}}.

Grid mà bạn định nghĩa bằng các thuộc tính này được mô tả là _grid tường minh_ (explicit grid).

Nếu bạn đặt nội dung ngoài grid tường minh này, hoặc nếu bạn đang dựa vào tính năng tự động đặt (auto-placement) và thuật toán grid cần tạo thêm các {{glossary("grid tracks", "track")}} hàng hoặc cột để chứa {{glossary("grid cell", "ô grid")}}, thì các track bổ sung sẽ được tạo trong grid ngầm. _Grid ngầm_ (implicit grid) là grid được tạo tự động do nội dung được thêm vào bên ngoài các track đã định nghĩa.

Trong ví dụ bên dưới, tôi đã tạo một _grid tường minh_ gồm ba cột và hai hàng. Hàng _thứ ba_ trên grid là _track hàng grid ngầm_, được hình thành do có nhiều hơn sáu phần tử lấp đầy các track tường minh.

## Ví dụ

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
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: 100px 100px;
}
```

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
</div>
```

{{ EmbedLiveSample('Ví dụ', '500', '330') }}

## Xem thêm

- [Khái niệm cơ bản về bố cục grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts)
- Tham khảo thuộc tính:
  - {{cssxref("grid-template-columns")}}
  - {{cssxref("grid-template-rows")}}
  - {{cssxref("grid")}}
  - {{cssxref("grid-template")}}
