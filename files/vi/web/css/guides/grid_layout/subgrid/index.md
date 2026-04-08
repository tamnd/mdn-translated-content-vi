---
title: Subgrid
slug: Web/CSS/Guides/Grid_layout/Subgrid
page-type: guide
browser-compat: css.properties.grid-template-columns.subgrid
sidebar: cssref
---

Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) bao gồm giá trị `subgrid` cho {{cssxref("grid-template-columns")}} và {{cssxref("grid-template-rows")}}. Hướng dẫn này mô tả subgrid làm gì và đưa ra một số trường hợp sử dụng và design pattern mà tính năng này giải quyết.

## Giới thiệu về subgrid

Khi bạn thêm [`display: grid`](/en-US/docs/Web/CSS/Reference/Properties/display) vào một grid container, chỉ các phần tử con trực tiếp mới trở thành grid item, có thể được đặt trên grid bạn đã tạo. Các phần tử con của những item này hiển thị theo normal flow.

Bạn có thể "lồng" các grid bằng cách làm cho một grid item trở thành grid container. Tuy nhiên, các grid này độc lập với grid cha và với nhau, có nghĩa là chúng không lấy kích thước track từ grid cha. Điều này làm cho việc căn chỉnh các nested grid item với main grid trở nên khó khăn.

Nếu bạn đặt giá trị `subgrid` cho `grid-template-columns`, `grid-template-rows` hoặc cả hai, thay vì tạo một track listing mới, nested grid sẽ sử dụng các track được định nghĩa trên grid cha.

Ví dụ, nếu bạn sử dụng `grid-template-columns: subgrid` và nested grid trải dài qua ba column track của cha, nested grid sẽ có ba column track cùng kích thước với grid cha. Trong khi [gap](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts#gutters) được kế thừa, chúng có thể bị ghi đè bằng giá trị {{cssxref("gap")}} khác. [Tên đường kẻ](/en-US/docs/Web/CSS/Guides/Grid_layout/Named_grid_lines) có thể được truyền từ cha vào subgrid, và subgrid cũng có thể khai báo các tên đường kẻ của riêng nó.

## Subgrid cho cột

Trong ví dụ dưới đây, grid layout có chín `1fr` column track và bốn hàng có chiều cao tối thiểu `100px`.

`.item` được đặt giữa đường kẻ cột 2 đến 7 và hàng 2 đến 4. Grid item này được chỉ định là một grid bằng `display: grid` và sau đó được định nghĩa là subgrid bằng cách đặt column track là subgrid (`grid-template-columns: subgrid`) và các hàng được định nghĩa bình thường. Subgrid có năm column track vì nó trải dài qua năm column track.

Vì `.item` là một subgrid, mặc dù `.subitem` không phải là phần tử con trực tiếp của `.grid` bên ngoài, nó vẫn có thể được đặt trên grid bên ngoài đó, với các cột được căn chỉnh theo cột của grid bên ngoài. Các hàng không phải là subgrid, vì vậy chúng hoạt động như một nested grid thông thường. Grid area trên cha sẽ mở rộng đủ lớn cho nested grid này.

```html live-sample___columns
<div class="grid">
  <div class="item">
    <div class="subitem"></div>
  </div>
</div>
```

```css hidden live-sample___columns
* {
  box-sizing: border-box;
}

.grid {
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

.subitem {
  background-color: rgb(40 240 83);
}
```

```css live-sample___columns
.grid {
  display: grid;
  grid-template-columns: repeat(9, 1fr);
  grid-template-rows: repeat(4, minmax(100px, auto));
}

.item {
  display: grid;
  grid-column: 2 / 7;
  grid-row: 2 / 4;
  grid-template-columns: subgrid;
  grid-template-rows: repeat(3, 80px);
}

.subitem {
  grid-column: 3 / 6;
  grid-row: 1 / 3;
}
```

Lưu ý rằng việc đánh số đường kẻ bắt đầu lại bên trong subgrid — đường kẻ cột 1, khi ở trong subgrid, là đường kẻ đầu tiên của subgrid. Phần tử subgridded không kế thừa số đường kẻ của grid cha. Điều này có nghĩa là bạn có thể đặt một component một cách an toàn có thể được đặt ở các vị trí khác nhau trên main grid, biết rằng số đường kẻ trên component sẽ luôn giống nhau.

{{EmbedLiveSample("columns", "", "450px")}}

## Subgrid cho hàng

Ví dụ này sử dụng cùng HTML như trên, nhưng ở đây `subgrid` được áp dụng làm giá trị của `grid-template-rows` thay thế, với các column track được định nghĩa rõ ràng. Trong trường hợp này, các column track hoạt động như một nested grid thông thường, nhưng các hàng được gắn với hai track mà `.item` trải dài.

```html live-sample___rows hidden
<div class="grid">
  <div class="item">
    <div class="subitem"></div>
  </div>
</div>
```

```css hidden live-sample___rows
* {
  box-sizing: border-box;
}

.grid {
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

.subitem {
  background-color: rgb(40 240 83);
}
```

```css live-sample___rows
.grid {
  display: grid;
  grid-template-columns: repeat(9, 1fr);
  grid-template-rows: repeat(4, minmax(100px, auto));
}

.item {
  display: grid;
  grid-column: 2 / 7;
  grid-row: 2 / 4;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: subgrid;
}

.subitem {
  grid-column: 2 / 4;
  grid-row: 1 / 3;
}
```

{{EmbedLiveSample("rows", "", "450px")}}

## Subgrid theo cả hai chiều

Trong ví dụ này, cả hàng và cột đều được định nghĩa là subgrid, gắn subgrid với các track của grid cha theo cả hai chiều.

```html live-sample___both hidden
<div class="grid">
  <div class="item">
    <div class="subitem"></div>
  </div>
</div>
```

```css hidden live-sample___both
* {
  box-sizing: border-box;
}

.grid {
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

.subitem {
  background-color: rgb(40 240 83);
}
```

```css live-sample___both
.grid {
  display: grid;
  grid-template-columns: repeat(9, 1fr);
  grid-template-rows: repeat(4, minmax(100px, auto));
}

.item {
  display: grid;
  grid-column: 2 / 7;
  grid-row: 2 / 4;
  grid-template-columns: subgrid;
  grid-template-rows: subgrid;
}

.subitem {
  grid-column: 3 / 6;
  grid-row: 1 / 3;
}
```

{{EmbedLiveSample("both", "", "450px")}}

### Không có implicit grid trong chiều subgridded

Nếu bạn cần tự động đặt các phần tử và không biết bạn sẽ có bao nhiêu phần tử, hãy cẩn thận khi tạo subgrid, vì nó sẽ ngăn việc tạo thêm hàng để chứa những phần tử đó.

Hãy xem ví dụ tiếp theo — nó sử dụng cùng grid cha và con như trong ví dụ trên. Có mười hai phần tử bên trong subgrid đang cố gắng tự đặt vào mười ô grid. Vì subgrid theo cả hai chiều, không có chỗ nào cho hai phần tử thêm, vì vậy chúng đi vào track cuối cùng của grid. Đây là hành vi được định nghĩa trong đặc tả.

```html live-sample___no-implicit
<div class="grid">
  <div class="item">
    <div class="subitem">1</div>
    <div class="subitem">2</div>
    <div class="subitem">3</div>
    <div class="subitem">4</div>
    <div class="subitem">5</div>
    <div class="subitem">6</div>
    <div class="subitem">7</div>
    <div class="subitem">8</div>
    <div class="subitem">9</div>
    <div class="subitem">10</div>
    <div class="subitem">11</div>
    <div class="subitem">12</div>
  </div>
</div>
```

```css hidden live-sample___no-implicit
* {
  box-sizing: border-box;
}
body {
  font: 1.2em sans-serif;
}

.grid {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.item {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  color: #d9480f;
}

.subitem {
  background-color: #d9480f;
  color: white;
  border-radius: 5px;
}
```

```css live-sample___no-implicit
.grid {
  display: grid;
  grid-template-columns: repeat(9, 1fr);
  grid-template-rows: repeat(4, minmax(100px, auto));
}

.item {
  display: grid;
  grid-column: 2 / 7;
  grid-row: 2 / 4;
  grid-template-columns: subgrid;
  grid-template-rows: subgrid;
}
```

{{EmbedLiveSample("no-implicit", "", "440px")}}

Bằng cách xóa giá trị `grid-template-rows`, việc tạo implicit track thông thường được kích hoạt, tạo ra nhiều hàng theo yêu cầu. Những hàng này sẽ không thẳng hàng với các track của cha.

```html live-sample___implicit
<div class="grid">
  <div class="item">
    <div class="subitem">1</div>
    <div class="subitem">2</div>
    <div class="subitem">3</div>
    <div class="subitem">4</div>
    <div class="subitem">5</div>
    <div class="subitem">6</div>
    <div class="subitem">7</div>
    <div class="subitem">8</div>
    <div class="subitem">9</div>
    <div class="subitem">10</div>
    <div class="subitem">11</div>
    <div class="subitem">12</div>
  </div>
</div>
```

```css hidden live-sample___implicit
* {
  box-sizing: border-box;
}
body {
  font: 1.2em sans-serif;
}

.grid {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.item {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  color: #d9480f;
}

.subitem {
  background-color: #d9480f;
  color: white;
  border-radius: 5px;
}
```

```css live-sample___implicit
.grid {
  display: grid;
  grid-template-columns: repeat(9, 1fr);
  grid-template-rows: repeat(4, minmax(100px, auto));
}

.item {
  display: grid;
  grid-column: 2 / 7;
  grid-row: 2 / 4;
  grid-template-columns: subgrid;
  grid-auto-rows: minmax(100px, auto);
}
```

{{EmbedLiveSample("implicit", "", "520px")}}

## Thuộc tính gap và subgrid

Bất kỳ giá trị {{cssxref("gap")}}, {{cssxref("column-gap")}}, hoặc {{cssxref("row-gap")}} nào được chỉ định trên cha đều được truyền vào subgrid, tạo ra khoảng cách tương tự giữa các track như cha. Hành vi mặc định này có thể bị ghi đè bằng cách áp dụng các thuộc tính `gap-*` trên subgrid container.

Trong ví dụ này, grid cha có gap `20px` cho hàng và cột và subgrid có `row-gap` được đặt thành `0`.

```html live-sample___gap
<div class="grid">
  <div class="item">
    <div class="subitem"></div>
    <div class="subitem2"></div>
  </div>
</div>
```

```css hidden live-sample___gap
* {
  box-sizing: border-box;
}

.grid {
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

.subitem {
  background-color: rgb(40 240 83);
}
```

```css live-sample___gap
.grid {
  display: grid;
  grid-template-columns: repeat(9, 1fr);
  grid-template-rows: repeat(4, minmax(100px, auto));
  gap: 20px;
}

.item {
  display: grid;
  grid-column: 2 / 7;
  grid-row: 2 / 4;
  grid-template-columns: subgrid;
  grid-template-rows: subgrid;
  row-gap: 0;
}

.subitem {
  grid-column: 3 / 6;
  grid-row: 1 / 3;
}

.subitem2 {
  background-color: rgb(0 0 0 / 0.5);
  grid-column: 2;
  grid-row: 1;
}
```

{{EmbedLiveSample("gap", "", "500px")}}

Nếu bạn kiểm tra điều này trong grid inspector của developer tools, bạn sẽ thấy đường kẻ subgrid ở giữa gap. Việc đặt gap thành `0` hoạt động tương tự như áp dụng margin âm cho một phần tử, trả lại khoảng trống từ gap cho phần tử.

![Phần tử nhỏ hơn hiển thị trong gap vì row-gap được đặt thành 0 trên subgrid, như được thấy trong firefox developer tools grid inspector.](gap.png)

## Named grid lines

Khi sử dụng CSS grid, bạn có thể [đặt tên cho các đường kẻ trên grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Named_grid_lines) và sau đó định vị các phần tử dựa trên những tên đó thay vì số đường kẻ. Các tên đường kẻ trên grid cha được truyền vào subgrid, và bạn có thể đặt các phần tử bằng cách sử dụng chúng. Trong ví dụ dưới đây, các đường kẻ có tên của cha `col-start` và `col-end` được sử dụng để đặt subitem.

```html live-sample___line-names
<div class="grid">
  <div class="item">
    <div class="subitem"></div>
  </div>
</div>
```

```css hidden live-sample___line-names
* {
  box-sizing: border-box;
}

.grid {
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

.subitem {
  background-color: rgb(40 240 83);
}
```

```css live-sample___line-names
.grid {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr [col-start] 1fr 1fr 1fr [col-end] 1fr 1fr 1fr;
  grid-template-rows: repeat(4, minmax(100px, auto));
  gap: 20px;
}

.item {
  display: grid;
  grid-column: 2 / 7;
  grid-row: 2 / 4;
  grid-template-columns: subgrid;
  grid-template-rows: subgrid;
}

.subitem {
  grid-column: col-start / col-end;
  grid-row: 1 / 3;
}
```

{{EmbedLiveSample("line-names", "", "500px")}}

Bạn cũng có thể chỉ định tên đường kẻ trên subgrid. Điều này được thực hiện bằng cách thêm danh sách tên đường kẻ được đặt trong dấu ngoặc vuông sau từ khóa `subgrid`. Ví dụ, nếu bạn có bốn đường kẻ trong subgrid, để đặt tên cho tất cả, bạn có thể sử dụng cú pháp `grid-template-columns: subgrid [line1] [line2] [line3] [line4]`

Các đường kẻ được chỉ định trên subgrid được thêm vào bất kỳ đường kẻ nào được chỉ định trên cha, vì vậy bạn có thể sử dụng một trong hai hoặc cả hai. Trong ví dụ này, một phần tử được đặt bên dưới bằng cách sử dụng các đường kẻ của cha và một phần tử khác bằng cách sử dụng các đường kẻ subgrid.

```html live-sample___adding-line-names
<div class="grid">
  <div class="item">
    <div class="subitem"></div>
    <div class="subitem2"></div>
  </div>
</div>
```

```css hidden live-sample___adding-line-names
* {
  box-sizing: border-box;
}

.grid {
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

.subitem {
  background-color: rgb(40 240 83);
}
```

```css live-sample___adding-line-names
.grid {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr [col-start] 1fr 1fr 1fr [col-end] 1fr 1fr 1fr;
  grid-template-rows: repeat(4, minmax(100px, auto));
  gap: 20px;
}

.item {
  display: grid;
  grid-column: 2 / 7;
  grid-row: 2 / 4;
  grid-template-columns: subgrid [sub-a] [sub-b] [sub-c] [sub-d] [sub-e] [sub-f];
  grid-template-rows: subgrid;
}

.subitem {
  grid-column: col-start / col-end;
  grid-row: 1 / 3;
}

.subitem2 {
  background-color: rgb(0 0 0 / 0.5);
  grid-column: sub-b / sub-d;
  grid-row: 1;
}
```

{{EmbedLiveSample("adding-line-names", "", "500px")}}

## Sử dụng subgrids

Một subgrid hoạt động rất giống với bất kỳ nested grid nào; sự khác biệt duy nhất là kích thước track của subgrid được đặt trên grid cha. Tuy nhiên, như với bất kỳ nested grid nào, kích thước của nội dung trong subgrid có thể thay đổi kích thước track, giả sử một phương pháp định kích thước track được sử dụng cho phép nội dung ảnh hưởng đến kích thước. Trong trường hợp như vậy, các auto-sized row track sẽ phát triển để phù hợp với nội dung trong main grid và nội dung trong subgrid.

Vì giá trị subgrid hoạt động gần giống như một nested grid thông thường, nên dễ dàng chuyển đổi giữa hai. Ví dụ, nếu bạn nhận ra rằng bạn cần implicit grid cho hàng, bạn cần xóa giá trị `subgrid` của `grid-template-rows` và có thể đặt giá trị cho `grid-auto-rows` để kiểm soát kích thước implicit track.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Video: Laying out forms using subgrid](https://www.youtube.com/watch?v=gmQlK3kRft4) (2019)
- [Video: Don't wait to use subgrid for better card layouts](https://www.youtube.com/watch?v=lLnFtK1LNu4) (2019)
- [Video: Hello subgrid!](https://www.youtube.com/watch?v=vxOj7CaWiPU) từ CSSConf.eu (2019)
