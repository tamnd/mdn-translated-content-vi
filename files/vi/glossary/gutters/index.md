---
title: Gutters
slug: Glossary/Gutters
page-type: glossary-definition
sidebar: glossarysidebar
---

**Gutters** hay _alleys_ (khoảng cách giữa các cột/hàng) là khoảng cách giữa các {{glossary("grid_tracks", "track")}} nội dung. Chúng có thể được tạo trong [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout), [flex layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) và [multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout) bằng cách sử dụng các thuộc tính {{cssxref("column-gap")}}, {{cssxref("row-gap")}} hoặc {{cssxref("gap")}}.

## Ví dụ

Trong ví dụ bên dưới, chúng ta có một grid ba cột và hai track hàng, với khoảng cách `20px` giữa cả track cột và track hàng.

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
  background-color: #fff8f8;
  padding: 1em;
  color: #d9480f;
}
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1.2fr);
  grid-auto-rows: 45%;
  column-gap: 20px;
  row-gap: 20px;
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

{{EmbedLiveSample('Ví dụ', '300', '280')}}

Về kích thước grid, các khoảng cách hoạt động như thể chúng là một track grid thông thường, tuy nhiên không thể đặt bất cứ thứ gì vào khoảng cách. Khoảng cách hoạt động như thể đường grid tại vị trí đó đã được mở rộng thêm, vì vậy bất kỳ grid item nào được đặt sau đường đó bắt đầu từ cuối khoảng cách.

Các thuộc tính `row-gap` và `column-gap` không phải là điều duy nhất có thể khiến các track cách xa nhau. Margins, padding hoặc việc sử dụng các thuộc tính phân phối không gian trong [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment) đều có thể góp phần vào khoảng cách hiển thị — do đó các thuộc tính `row-gap` và `column-gap` không nên được coi là bằng với "kích thước gutter" trừ khi bạn biết rằng thiết kế của bạn không đưa ra thêm không gian nào bằng một trong các phương pháp này.

## Xem thêm

- [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts)
- Tham khảo thuộc tính
  - {{cssxref("column-gap")}}
  - {{cssxref("row-gap")}}
  - {{cssxref("gap")}}

- [Định nghĩa về gutters](https://drafts.csswg.org/css-grid/#gutters) trong đặc tả bố cục CSS grid
