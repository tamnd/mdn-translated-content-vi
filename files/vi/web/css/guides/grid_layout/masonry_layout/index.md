---
title: Masonry layout
slug: Web/CSS/Guides/Grid_layout/Masonry_layout
page-type: guide
status:
  - experimental
browser-compat:
  - css.properties.grid-template-columns.masonry
  - css.properties.grid-template-rows.masonry
sidebar: cssref
---

{{SeeCompatTable}}

Cấp độ 3 của đặc tả [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) định nghĩa **masonry layout** (còn được gọi là **grid-lanes** layout), được truy cập thông qua các giá trị `grid-lanes` và `inline-grid-lanes` của {{cssxref("display")}}. Hướng dẫn này giải thích masonry layout là gì và cách sử dụng nó.

Masonry layout là một phương pháp layout trong đó một trục sử dụng layout grid nghiêm ngặt thông thường, thường là các cột, và trục kia sử dụng layout **xếp chồng** (masonry). Trên trục xếp chồng, thay vì bám vào một grid nghiêm ngặt với các khoảng trống để lại sau các phần tử ngắn hơn, các phần tử trong hàng tiếp theo sẽ dâng lên để lấp đầy các khoảng trống.

## Tạo masonry layout

Để tạo masonry layout phổ biến nhất trong đó các cột được bố trí theo grid và các hàng xếp chồng như masonry, hãy sử dụng **`display: grid-lanes`** cùng với {{cssxref("grid-template-columns")}}.

Các phần tử con của container này sẽ bố trí từng phần tử một dọc theo trục xếp chồng theo thuật toán masonry: mỗi hàng phần tử tải vào cột có nhiều không gian nhất, tạo ra bố cục được đóng gói chặt chẽ mà không có các row track nghiêm ngặt.

```css hidden live-sample___block-axis live-sample___inline-axis live-sample___spanners live-sample___positioned
* {
  box-sizing: border-box;
}

body {
  font: 1.2em sans-serif;
}

.grid {
  padding: 10px;
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.item {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  color: #d9480f;
}
```

```css live-sample___block-axis
.grid {
  display: grid-lanes;
  gap: 10px;
  grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
}
```

```html live-sample___block-axis live-sample___inline-axis
<div class="grid">
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
</div>
```

```js live-sample___block-axis live-sample___spanners live-sample___positioned
// prettier-ignore
const itemSizes = [
  "2em", "3em", "1.6em", "4em", "3.2em",
  "3em", "4.5em", "1em", "3.5em", "2.8em",
];
const items = document.querySelectorAll(".item");
for (let i = 0; i < items.length; i++) {
  items[i].style.blockSize = itemSizes[i];
}
```

{{EmbedLiveSample("block-axis", "", "250px")}}

Cũng có thể tạo masonry layout với các phần tử tải vào các hàng.

```js live-sample___inline-axis
// prettier-ignore
const itemSizes = [
  "2em", "3em", "1.6em", "4em", "2.2em",
  "3em", "4.5em", "1em", "3.5em", "2.8em",
];
const items = document.querySelectorAll(".item");
for (let i = 0; i < items.length; i++) {
  items[i].style.inlineSize = itemSizes[i];
}
```

```css live-sample___inline-axis
.grid {
  display: grid-lanes;
  gap: 10px;
  grid-template-rows: repeat(3, 100px);
}
```

{{EmbedLiveSample("inline-axis", "", "450px")}}

## Kiểm soát trục grid

Trên trục grid, mọi thứ sẽ hoạt động như bạn mong đợi trong grid layout. Bạn có thể làm cho các phần tử trải dài qua nhiều track trong khi vẫn ở chế độ auto-placement, bằng cách sử dụng từ khóa `span`. Các phần tử cũng có thể được định vị bằng line-based positioning.

### Masonry layout với các phần tử spanning

Trong ví dụ này, hai trong số các phần tử trải dài qua hai track, và các phần tử masonry hoạt động xung quanh chúng.

```html live-sample___spanners
<div class="grid">
  <div class="item"></div>
  <div class="item span-2"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item span-2"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
</div>
```

```css live-sample___spanners
.grid {
  display: grid-lanes;
  gap: 10px;
  grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
}

.span-2 {
  grid-column-end: span 2;
}
```

{{EmbedLiveSample("spanners", "", "270px")}}

Ví dụ này bao gồm một phần tử có định vị cho các cột. Các phần tử có definite placement được đặt trước khi masonry layout xảy ra.

```html live-sample___positioned
<div class="grid">
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item positioned">positioned.</div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
</div>
```

```css live-sample___positioned
.grid {
  display: grid-lanes;
  gap: 10px;
  grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
}

.positioned {
  padding: 1em;
  grid-column: 2 / 4;
}
```

{{EmbedLiveSample("positioned", "", "290px")}}

## Fallback cho masonry layout

Trong các trình duyệt [không hỗ trợ masonry](#browser_compatibility), thay vào đó sẽ sử dụng grid auto-placement thông thường.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("grid-auto-flow")}} để kiểm soát grid auto-placement
- [Native CSS masonry layout in CSS grid](https://www.smashingmagazine.com/native-css-masonry-layout-css-grid/) qua Smashing Magazine (2020)
