---
title: Grid layout using line-based placement
short-title: Using line-based placement
slug: Web/CSS/Guides/Grid_layout/Line-based_placement
page-type: guide
sidebar: cssref
---

Trong hướng dẫn [các khái niệm cơ bản về grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts), chúng ta đã sơ lược tìm hiểu cách định vị các phần tử trên grid bằng số thứ tự đường kẻ. Trong hướng dẫn này, chúng ta sẽ khám phá đầy đủ cách tính năng cơ bản này của đặc tả hoạt động.

Bắt đầu khám phá grid với các đường kẻ được đánh số là điểm khởi đầu hợp lý nhất, bởi khi sử dụng grid layout, bạn luôn có các đường kẻ được đánh số. Các đường kẻ được đánh số cho cả cột và hàng, và được lập chỉ mục từ `1`. Lưu ý rằng grid được đánh chỉ mục theo writing mode của tài liệu. Trong ngôn ngữ viết từ trái sang phải như tiếng Anh, đường kẻ số 1 nằm ở phía bên trái của grid. Nếu bạn đang làm việc với ngôn ngữ viết từ phải sang trái như tiếng Ả Rập, đường kẻ số 1 sẽ nằm ở phía bên phải của grid. Chúng ta sẽ tìm hiểu thêm về sự tương tác giữa writing modes và grids trong hướng dẫn [grids, logical values, và writing modes](/en-US/docs/Web/CSS/Guides/Grid_layout/Logical_values_and_writing_modes).

## Ví dụ cơ bản

Trong ví dụ cơ bản, chúng ta tạo một grid với 3 column track và 3 row track. Điều này cho chúng ta 4 đường kẻ ở mỗi chiều.

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
  grid-template-rows: repeat(3, 100px);
}
```

Bên trong grid container, chúng ta bao gồm bốn phần tử con.

```html
<div class="wrapper">
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
  <div class="box4">Four</div>
</div>
```

{{ EmbedLiveSample('A_basic_example', '300', '330') }}

Nếu chúng ta không đặt các phần tử này vào grid theo bất kỳ cách nào, chúng sẽ được bố trí theo quy tắc auto-placement, mỗi phần tử vào một trong bốn ô đầu tiên. Bạn có thể kiểm tra grid bằng developer tools của trình duyệt để xem grid định nghĩa các cột và hàng như thế nào.

![Ví dụ grid được highlight trong DevTools](highlighted_grid.png)

## Định vị phần tử theo số đường kẻ

Chúng ta có thể sử dụng line-based placement để kiểm soát vị trí các phần tử trên grid. Có thể dùng các thuộc tính {{cssxref("grid-column-start")}} và {{cssxref("grid-column-end")}} để làm cho phần tử đầu tiên bắt đầu từ phía trái ngoài cùng của grid và trải dài qua một column track. Với {{cssxref("grid-row-start")}} và {{cssxref("grid-row-end")}}, chúng ta làm cho phần tử bắt đầu từ đường kẻ hàng đầu tiên ở trên cùng của grid và trải dài đến đường kẻ hàng thứ tư.

```css
.box1 {
  grid-column-start: 1;
  grid-column-end: 2;
  grid-row-start: 1;
  grid-row-end: 4;
}
```

Khi bạn định vị một số phần tử, các phần tử khác trên grid sẽ tiếp tục được bố trí theo quy tắc auto-placement. Hành vi này được giải thích trong hướng dẫn [Auto-placement in grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Auto-placement). Hiện tại, hãy quan sát cách grid bố trí các phần tử chưa được đặt vị trí vào các ô trống.

Chỉ định từng phần tử riêng lẻ bằng cùng các thuộc tính nhưng với các giá trị khác nhau, chúng ta đặt tất cả bốn phần tử, trải dài qua các row và column track.

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
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
  <div class="box4">Four</div>
</div>
```

```css
.box1 {
  grid-column-start: 1;
  grid-column-end: 2;
  grid-row-start: 1;
  grid-row-end: 4;
}
.box2 {
  grid-column-start: 3;
  grid-column-end: 4;
  grid-row-start: 1;
  grid-row-end: 3;
}
.box3 {
  grid-column-start: 2;
  grid-column-end: 3;
  grid-row-start: 1;
  grid-row-end: 2;
}
.box4 {
  grid-column-start: 2;
  grid-column-end: 4;
  grid-row-start: 3;
  grid-row-end: 4;
}
```

{{ EmbedLiveSample('Positioning_items_by_line_number', '300', '330') }}

Lưu ý rằng chúng ta có thể để trống các ô nếu muốn. Một trong những điều tuyệt vời của grid layout là khả năng tạo khoảng trắng trong thiết kế mà không cần bất kỳ thủ thuật nào.

## Các shorthand `grid-column` và `grid-row`

Ví dụ trước có khá nhiều code để định vị từng phần tử. Không có gì ngạc nhiên khi biết rằng có một [shorthand](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties). Các thuộc tính {{cssxref("grid-column-start")}} và {{cssxref("grid-column-end")}} có thể được kết hợp thành {{cssxref("grid-column")}}, {{cssxref("grid-row-start")}} và {{cssxref("grid-row-end")}} thành {{cssxref("grid-row")}}. Trong ví dụ này, chúng ta tái tạo ví dụ trên bằng các thuộc tính shorthand:

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
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
  <div class="box4">Four</div>
</div>
```

```css
.box1 {
  grid-column: 1 / 2;
  grid-row: 1 / 4;
}
.box2 {
  grid-column: 3 / 4;
  grid-row: 1 / 3;
}
.box3 {
  grid-column: 2 / 3;
  grid-row: 1 / 2;
}
.box4 {
  grid-column: 2 / 4;
  grid-row: 3 / 4;
}
```

{{ EmbedLiveSample('The_grid-column_and_grid-row_shorthands', '300', '330') }}

## Span mặc định

Trong các ví dụ trên, chúng ta đã chỉ định mọi đường kẻ cuối cho hàng và cột để minh họa các thuộc tính, nhưng thực tế nếu một phần tử chỉ trải dài qua một track, bạn có thể bỏ qua giá trị `grid-column-end` hoặc `grid-row-end`. Grid mặc định sẽ trải dài qua một track.

### Span mặc định với longhand placement

Điều này có nghĩa là ví dụ longhand ban đầu của chúng ta sẽ trông như sau:

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
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
  <div class="box4">Four</div>
</div>
```

```css
.box1 {
  grid-column-start: 1;
  grid-row-start: 1;
  grid-row-end: 4;
}
.box2 {
  grid-column-start: 3;
  grid-row-start: 1;
  grid-row-end: 3;
}
.box3 {
  grid-column-start: 2;
  grid-row-start: 1;
}
.box4 {
  grid-column-start: 2;
  grid-column-end: 4;
  grid-row-start: 3;
}
```

{{ EmbedLiveSample('Default_spans_with_longhand_placement', '300', '330') }}

### Span mặc định với shorthand placement

Shorthand của chúng ta sẽ trông như đoạn code dưới đây, không có dấu gạch chéo và giá trị thứ hai cho các phần tử chỉ trải dài qua một track.

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
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
  <div class="box4">Four</div>
</div>
```

```css
.box1 {
  grid-column: 1;
  grid-row: 1 / 4;
}
.box2 {
  grid-column: 3;
  grid-row: 1 / 3;
}
.box3 {
  grid-column: 2;
  grid-row: 1;
}
.box4 {
  grid-column: 2 / 4;
  grid-row: 3;
}
```

{{ EmbedLiveSample('Default_spans_with_shorthand_placement', '300', '330') }}

## Thuộc tính `grid-area`

Chúng ta có thể tiến xa hơn một bước và định nghĩa mỗi vùng bằng một thuộc tính duy nhất – {{cssxref("grid-area")}}. Thứ tự các giá trị cho `grid-area` như sau.

– {{cssxref("grid-row-start")}}
– {{cssxref("grid-column-start")}}
– {{cssxref("grid-row-end")}}
– {{cssxref("grid-column-end")}}

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
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
  <div class="box4">Four</div>
</div>
```

```css
.box1 {
  grid-area: 1 / 1 / 4 / 2;
}
.box2 {
  grid-area: 1 / 3 / 3 / 4;
}
.box3 {
  grid-area: 1 / 2 / 2 / 3;
}
.box4 {
  grid-area: 3 / 2 / 4 / 4;
}
```

{{ EmbedLiveSample('The_grid-area_property', '300', '330') }}

Thứ tự các giá trị cho `grid-area` có vẻ hơi lạ — nó ngược với hướng chúng ta chỉ định margin và padding dưới dạng shorthand, ví dụ. Có thể hữu ích khi nhận ra rằng điều này là do CSS grid layout sử dụng các hướng flow-relative được định nghĩa trong [CSS writing modes](/en-US/docs/Web/CSS/Guides/Writing_modes). Chúng ta sẽ khám phá cách grid hoạt động với writing modes trong [grids, logical values, và writing modes](/en-US/docs/Web/CSS/Guides/Grid_layout/Logical_values_and_writing_modes). Hiện tại, hãy xem xét khái niệm bốn hướng {{glossary("Flow relative values", "flow-relative")}}:

- `block-start`
- `block-end`
- `inline-start`
- `inline-end`

Chúng ta đang làm việc bằng tiếng Anh, một ngôn ngữ viết từ trái sang phải. `block-start` của chúng ta là đường kẻ hàng trên cùng của grid container, `block-end` là đường kẻ hàng cuối cùng của container. `inline-start` của chúng ta là đường kẻ cột bên trái vì `inline-start` luôn là điểm bắt đầu viết văn bản trong writing mode hiện tại, trong khi `inline-end` là đường kẻ cột cuối cùng của grid.

Khi chúng ta chỉ định grid area bằng thuộc tính `grid-area`, trước tiên chúng ta định nghĩa cả hai đường kẻ bắt đầu `block-start` và `inline-start`, sau đó cả hai đường kẻ kết thúc `block-end` và `inline-end`. Điều này có vẻ bất thường lúc đầu vì chúng ta quen với các {{glossary("physical properties")}} là `top`, `right`, `bottom` và `left`, nhưng nó có ý nghĩa hơn nếu bạn bắt đầu nghĩ đến các trang web có nhiều hướng trong các writing mode khác nhau.

## Đếm ngược

Chúng ta cũng có thể đếm ngược từ phần cuối block và inline của grid, với tiếng Anh đó sẽ là đường kẻ cột bên phải và đường kẻ hàng cuối cùng. Đường kẻ cuối cùng của explicit grid có thể được đánh địa chỉ là `-1`, và bạn có thể đếm ngược từ đó – vì vậy đường kẻ thứ hai từ cuối là `-2`.

Lưu ý rằng các giá trị âm chỉ liên quan đến explicit grid. Đường kẻ cuối cùng là đường kẻ cuối cùng của grid được định nghĩa bởi `grid-template-columns` và `grid-template-rows`, và không tính đến bất kỳ hàng hoặc cột nào được thêm vào trong _implicit grid_ ngoài phạm vi đó.

Trong ví dụ tiếp theo, chúng ta đã đảo ngược bố cục đang làm việc bằng cách làm việc từ phía phải và phía dưới của grid khi đặt các phần tử.

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
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
  <div class="box4">Four</div>
</div>
```

```css
.box1 {
  grid-column-start: -1;
  grid-column-end: -2;
  grid-row-start: -1;
  grid-row-end: -4;
}
.box2 {
  grid-column-start: -3;
  grid-column-end: -4;
  grid-row-start: -1;
  grid-row-end: -3;
}
.box3 {
  grid-column-start: -2;
  grid-column-end: -3;
  grid-row-start: -1;
  grid-row-end: -2;
}
.box4 {
  grid-column-start: -2;
  grid-column-end: -4;
  grid-row-start: -3;
  grid-row-end: -4;
}
```

{{ EmbedLiveSample('Counting_backwards', '300', '330') }}

### Kéo dài phần tử qua toàn bộ grid

Khả năng đánh địa chỉ các đường kẻ bắt đầu và kết thúc của grid rất hữu ích vì khi đó bạn có thể kéo dài một phần tử qua toàn bộ grid với:

```css
.item {
  grid-column: 1 / -1;
}
```

## Gutters (khoảng cách giữa track)

CSS grid bao gồm khả năng thêm gutters giữa các column và row track với các thuộc tính {{cssxref("column-gap")}} và {{cssxref("row-gap")}}, hoặc shorthand {{cssxref("gap")}}.

Gutters chỉ xuất hiện giữa các track của grid, chúng không thêm khoảng cách vào trên và dưới, trái hoặc phải của container. Chúng ta có thể thêm gutters vào ví dụ trước bằng cách sử dụng các thuộc tính này trên grid container.

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
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
  <div class="box4">Four</div>
</div>
```

```css
.box1 {
  grid-column: 1;
  grid-row: 1 / 4;
}
.box2 {
  grid-column: 3;
  grid-row: 1 / 3;
}
.box3 {
  grid-column: 2;
  grid-row: 1;
}
.box4 {
  grid-column: 2 / 4;
  grid-row: 3;
}
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(3, 100px);
  column-gap: 20px;
  row-gap: 1em;
}
```

{{ EmbedLiveSample('Gutters_or_Alleys', '300', '350') }}

### Shorthand gap

Hai thuộc tính cũng có thể được biểu diễn dưới dạng shorthand, {{cssxref("gap")}}. Nếu bạn chỉ đưa ra một giá trị cho `gap`, nó sẽ áp dụng cho cả column và row gap. Nếu bạn chỉ định hai giá trị, giá trị đầu tiên được dùng cho `row-gap` và giá trị thứ hai cho `column-gap`.

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(3, 100px);
  gap: 1em 20px;
}
```

Xét về line-based positioning của các phần tử, gap hoạt động như thể đường kẻ đã tăng thêm chiều rộng. Bất cứ thứ gì bắt đầu tại đường kẻ đó bắt đầu sau gap và bạn không thể đánh địa chỉ gap hay đặt bất cứ thứ gì vào trong đó. Nếu bạn muốn gutters hoạt động giống như các track thông thường hơn, bạn có thể định nghĩa một track cho mục đích đó.

## Sử dụng từ khóa `span`

Ngoài việc chỉ định các đường kẻ bắt đầu và kết thúc theo số, bạn có thể chỉ định một đường kẻ bắt đầu và sau đó số track bạn muốn vùng đó trải dài bằng từ khóa `span`.

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
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
  <div class="box4">Four</div>
</div>
```

```css
.box1 {
  grid-column: 1;
  grid-row: 1 / span 3;
}
.box2 {
  grid-column: 3;
  grid-row: 1 / span 2;
}
.box3 {
  grid-column: 2;
  grid-row: 1;
}
.box4 {
  grid-column: 2 / span 2;
  grid-row: 3;
}
```

{{ EmbedLiveSample('Using_the_span_keyword', '300', '330') }}

Bạn cũng có thể sử dụng từ khóa `span` trong giá trị của `grid-row-start`/`grid-row-end` và `grid-column-start/grid-column-end`. Hai ví dụ sau đây sẽ tạo ra cùng một grid area. Trong ví dụ đầu tiên, chúng ta đặt đường kẻ hàng bắt đầu, sau đó đối với đường kẻ kết thúc, chúng ta chỉ định rằng chúng ta muốn vùng đó bao gồm 3 track. Vùng sẽ bắt đầu tại đường kẻ 1 và kết thúc 3 đường kẻ từ đường kẻ 1; nghĩa là vùng sẽ kết thúc tại đường kẻ 4.

```css
.box1 {
  grid-column-start: 1;
  grid-row-start: 1;
  grid-row-end: span 3;
}
```

Trong ví dụ thứ hai, chúng ta chỉ định đường kẻ hàng kết thúc mà chúng ta muốn phần tử kết thúc tại đó, sau đó đặt đường kẻ bắt đầu là `span 3`. Điều này có nghĩa là phần tử sẽ cần trải dài lên từ đường kẻ hàng được chỉ định. Vùng sẽ bắt đầu tại đường kẻ 4 và trải dài 3 đường kẻ đến đường kẻ 1.

```css
.box1 {
  grid-column-start: 1;
  grid-row-start: span 3;
  grid-row-end: 4;
}
```

Để quen với line-based positioning trong grid, hãy thử xây dựng một số bố cục phổ biến bằng cách đặt các phần tử vào grids với số lượng cột khác nhau. Hãy nhớ rằng nếu bạn không đặt tất cả các phần tử, bất kỳ phần tử nào còn lại sẽ được đặt theo quy tắc auto-placement. Điều này có thể mang lại bố cục bạn muốn, nhưng nếu có thứ gì đó xuất hiện ở chỗ không mong đợi, hãy kiểm tra xem bạn đã đặt vị trí cho nó chưa.

Ngoài ra, hãy nhớ rằng các phần tử trên grid có thể chồng lên nhau khi bạn đặt chúng rõ ràng như vậy. Các phần tử chồng lên nhau có thể tạo ra một số hiệu ứng đẹp, tuy nhiên bạn cũng có thể gặp phải sự chồng lấp không chính xác nếu bạn chỉ định sai đường kẻ bắt đầu hoặc kết thúc. Việc kiểm tra grids bằng developer tools của trình duyệt có thể rất hữu ích để xác định các vấn đề như vậy khi bạn học, đặc biệt nếu grid của bạn khá phức tạp.
