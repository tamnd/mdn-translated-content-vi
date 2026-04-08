---
title: grid-auto-flow
slug: Web/CSS/Reference/Properties/grid-auto-flow
page-type: css-property
browser-compat: css.properties.grid-auto-flow
sidebar: cssref
---

Thuộc tính **`grid-auto-flow`** [CSS](/en-US/docs/Web/CSS) kiểm soát cách thuật toán tự động đặt vị trí hoạt động, chỉ định chính xác cách các phần tử được đặt tự động chảy vào lưới.

{{InteractiveExample("CSS Demo: grid-auto-flow")}}

```css interactive-example-choice
grid-auto-flow: row;
```

```css interactive-example-choice
grid-auto-flow: column;
```

```css interactive-example-choice
grid-auto-flow: row dense;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">
      <div>One</div>
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
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: repeat(3, minmax(40px, auto));
  grid-gap: 10px;
  width: 220px;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}

#example-element > div:nth-child(1) {
  grid-column: auto / span 2;
}

#example-element > div:nth-child(2) {
  grid-column: auto / span 2;
}
```

> [!NOTE]
> Thuộc tính `masonry-auto-flow` đã bị loại bỏ khỏi [bố cục Masonry](/en-US/docs/Web/CSS/Guides/Grid_layout/Masonry_layout) trong CSS để ủng hộ `grid-auto-flow`.
> Xem [csswg-drafts #10231](https://github.com/w3c/csswg-drafts/issues/10231) để biết chi tiết.

## Cú pháp

```css
/* Giá trị từ khóa */
grid-auto-flow: row;
grid-auto-flow: column;
grid-auto-flow: dense;
grid-auto-flow: row dense;
grid-auto-flow: column dense;

/* Giá trị toàn cục */
grid-auto-flow: inherit;
grid-auto-flow: initial;
grid-auto-flow: revert;
grid-auto-flow: revert-layer;
grid-auto-flow: unset;
```

Thuộc tính này có thể có một trong hai dạng:

- một từ khóa đơn: một trong `row`, `column`, hoặc `dense`.
- hai từ khóa: `row dense` hoặc `column dense`.

### Giá trị

- `row`
  - : Các phần tử được đặt bằng cách lấp đầy từng hàng lần lượt, thêm hàng mới khi cần. Nếu không có `row` hay `column` nào được cung cấp, `row` được giả định.
- `column`
  - : Các phần tử được đặt bằng cách lấp đầy từng cột lần lượt, thêm cột mới khi cần.
- `dense`
  - : Thuật toán đóng gói "dày đặc" cố gắng lấp đầy các khoảng trống trước đó trong lưới, nếu các phần tử nhỏ hơn xuất hiện sau. Điều này có thể khiến các phần tử xuất hiện không theo thứ tự, khi làm như vậy sẽ lấp đầy các khoảng trống do các phần tử lớn hơn để lại.

    Nếu nó bị bỏ qua, thuật toán "thưa thớt" được sử dụng, nơi thuật toán đặt vị trí chỉ di chuyển "tiến" trong lưới khi đặt các phần tử, không bao giờ quay ngược lại để lấp đầy khoảng trống. Điều này đảm bảo rằng tất cả các phần tử được đặt tự động xuất hiện "theo thứ tự", ngay cả khi điều này để lại khoảng trống có thể đã được lấp đầy bởi các phần tử sau.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt tự động đặt vị trí lưới

#### HTML

```html
<div id="grid">
  <div id="item1"></div>
  <div id="item2"></div>
  <div id="item3"></div>
  <div id="item4"></div>
  <div id="item5"></div>
</div>
<select id="direction">
  <option value="column">column</option>
  <option value="row">row</option>
</select>
<input id="dense" type="checkbox" />
<label for="dense">dense</label>
```

#### CSS

```css
#grid {
  height: 200px;
  width: 200px;
  display: grid;
  gap: 10px;
  grid-template: repeat(4, 1fr) / repeat(2, 1fr);
  grid-auto-flow: column; /* hoặc 'row', 'row dense', 'column dense' */
}

#item1 {
  background-color: lime;
  grid-row-start: 3;
}

#item2 {
  background-color: yellow;
}

#item3 {
  background-color: blue;
}

#item4 {
  grid-column-start: 2;
  background-color: red;
}

#item5 {
  background-color: aqua;
}
```

```js hidden
function changeGridAutoFlow() {
  const grid = document.getElementById("grid");
  const direction = document.getElementById("direction");
  const dense = document.getElementById("dense");
  let gridAutoFlow = direction.value === "row" ? "row" : "column";

  if (dense.checked) {
    gridAutoFlow += " dense";
  }

  grid.style.gridAutoFlow = gridAutoFlow;
}

const selectElem = document.querySelector("select");
const inputElem = document.querySelector("input");
selectElem.addEventListener("change", changeGridAutoFlow);
inputElem.addEventListener("change", changeGridAutoFlow);
```

#### Kết quả

{{EmbedLiveSample("Setting_grid_auto-placement", "200px", "260px")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("grid-auto-rows")}}
- {{cssxref("grid-auto-columns")}}
- {{cssxref("grid")}}
- [Tự động đặt vị trí trong bố cục lưới](/en-US/docs/Web/CSS/Guides/Grid_layout/Auto-placement)
- Video: [Introducing grid auto-placement and order](https://gridbyexample.com/video/series-auto-placement-order/)
