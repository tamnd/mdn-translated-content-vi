---
title: Basic concepts of grid layout
short-title: Basic concepts
slug: Web/CSS/Guides/Grid_layout/Basic_concepts
page-type: guide
sidebar: cssref
---

[CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) giới thiệu hệ thống grid hai chiều cho CSS. Grid có thể được sử dụng để bố trí các vùng trang chính hoặc các phần tử giao diện người dùng nhỏ. Hướng dẫn này giới thiệu CSS grid layout và thuật ngữ là một phần của đặc tả CSS grid layout. Các tính năng được hiển thị trong tổng quan này sẽ được giải thích chi tiết hơn trong các hướng dẫn khác trong chuỗi này.

## Grid là gì?

Một grid là một tập hợp các đường ngang và dọc giao nhau xác định các hàng và cột. Các phần tử có thể được đặt lên grid trong các đường cột và hàng này. CSS grid layout có các tính năng sau:

### Kích thước track cố định và linh hoạt

Bạn có thể tạo một grid với kích thước track cố định – sử dụng pixel chẳng hạn. Điều này đặt grid theo pixel được chỉ định phù hợp với layout bạn mong muốn. Bạn cũng có thể tạo một grid sử dụng kích thước linh hoạt với phần trăm hoặc với đơn vị [`fr`](#the_fr_unit) được thiết kế cho mục đích này.

### Đặt vị trí mục

Bạn có thể đặt các mục vào một vị trí chính xác trên grid bằng cách sử dụng số dòng, tên hoặc bằng cách nhắm mục tiêu một vùng của grid. Grid cũng chứa một thuật toán để kiểm soát việc đặt các mục không được gán vị trí rõ ràng trên grid.

### Tạo thêm track để giữ nội dung

Bạn có thể xác định một explicit grid với grid layout. Các tính năng được định nghĩa bởi module grid layout cung cấp tính linh hoạt để thêm các hàng và cột bổ sung khi cần thiết. Các tính năng như thêm "số cột tùy ý vừa vào container" được bao gồm.

### Kiểm soát alignment

CSS grid layout và các tính năng [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment) cho phép chúng ta kiểm soát cách các mục căn chỉnh sau khi được đặt vào grid area, và cách toàn bộ grid được căn chỉnh.

### Kiểm soát nội dung chồng lên nhau

Có thể đặt nhiều hơn một mục vào một ô hoặc vùng grid và chúng có thể chồng lên nhau một phần. Việc phân lớp này sau đó có thể được kiểm soát bằng thuộc tính {{cssxref("z-index")}}.

Grid là một phương pháp layout mạnh mẽ mà, khi kết hợp với các phần khác của CSS như [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout), có thể giúp bạn tạo các layout responsive, linh hoạt và dễ tiếp cận. Tất cả bắt đầu bằng việc tạo một grid trong **{{glossary("grid container")}}** của bạn.

## Grid container

Chúng ta tạo một _grid container_ bằng cách khai báo `display: grid` hoặc `display: inline-grid` trên một phần tử. Ngay khi chúng ta làm điều này, tất cả _con trực tiếp_ của phần tử đó trở thành _grid item_.

Trong ví dụ này, chúng ta có một div chứa với class là `wrapper`. Bên trong có năm phần tử con.

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
</div>
```

Chúng ta biến `.wrapper` thành grid container bằng cách sử dụng `display: grid;`.

```css
.wrapper {
  display: grid;
}
```

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

{{ EmbedLiveSample('The_Grid_container', '200', '330') }}

Tất cả các con trực tiếp bây giờ là grid item. Trong trình duyệt web, bạn sẽ không thấy bất kỳ sự khác biệt nào về cách hiển thị các mục này trước khi biến chúng thành grid, vì grid đã tạo một grid một cột cho các mục. Nếu bạn kiểm tra grid trong công cụ phát triển của trình duyệt, bạn có thể thấy một biểu tượng nhỏ bên cạnh giá trị `grid`. Nhấp vào biểu tượng này và, trong hầu hết các trình duyệt, grid trên phần tử này sẽ được hiển thị chồng lên trong cửa sổ trình duyệt.

![Sử dụng grid highlighter trong Firefox DevTools để xem một grid](1-grid-inspector.png)

Khi bạn học và làm việc với CSS grid layout, công cụ trình duyệt của bạn sẽ cung cấp cho bạn ý tưởng tốt hơn về những gì đang xảy ra với grid của bạn một cách trực quan.

Nếu chúng ta muốn bắt đầu làm cho điều này trông giống grid hơn, chúng ta cần thêm column track.

## Grid track

Chúng ta xác định các hàng và cột trên grid với các thuộc tính {{cssxref("grid-template-rows")}} và {{cssxref("grid-template-columns")}}. Những thuộc tính này xác định {{glossary("grid tracks")}}. Một _grid track_ là khoảng cách giữa hai đường kề nhau trên grid. Hình ảnh dưới đây hiển thị một track được tô sáng – đây là track hàng đầu tiên trong grid của chúng ta.

![Một hộp với 3 grid item. Phía trên ba mục là một vùng xanh lá cây nhạt hình chữ nhật là track.](1_grid_track.png)

Grid track được định nghĩa trong [explicit grid](#implicit_and_explicit_grids) bằng cách sử dụng các thuộc tính `grid-template-columns` và `grid-template-rows` hoặc shorthand `grid` hoặc `grid-template`. Track cũng được tạo trong implicit grid bằng cách định vị một grid item bên ngoài các track được tạo trong explicit grid.

### Ví dụ cơ bản

Chúng ta có thể thêm column track vào ví dụ trước bằng cách thêm thuộc tính `grid-template-columns`, rồi xác định kích thước của column track.

Chúng ta đã tạo một grid với ba column track rộng 200 pixel. Các mục con sẽ được bố trí trên grid này, một mục trong mỗi ô grid.

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: 200px 200px 200px;
}
```

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

{{ EmbedLiveSample('Basic_example', '610', '140') }}

### Đơn vị fr

Track có thể được định nghĩa bằng bất kỳ đơn vị độ dài nào. Grid cũng giới thiệu một đơn vị độ dài bổ sung để giúp chúng ta tạo các grid track linh hoạt. Đơn vị [`fr`](/en-US/docs/Web/CSS/Reference/Values/flex_value) đại diện cho một phần của không gian khả dụng trong grid container. Định nghĩa grid tiếp theo sẽ tạo ba track có chiều rộng bằng nhau, lớn dần và thu lại theo không gian khả dụng.

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
}
```

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

{{ EmbedLiveSample('The_fr_unit', '220', '140') }}

### Kích thước không đồng đều

Trong ví dụ này, chúng ta tạo một định nghĩa với một track `2fr` rồi hai track `1fr`. Không gian khả dụng được chia thành bốn phần. Hai phần được giao cho track đầu tiên và mỗi phần cho hai track tiếp theo.

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: 2fr 1fr 1fr;
}
```

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

{{ EmbedLiveSample('Unequal_sizes', '220', '140') }}

### Kết hợp kích thước linh hoạt và tuyệt đối

Trong ví dụ cuối này, chúng ta kết hợp track có kích thước tuyệt đối với đơn vị `fr`. Track đầu tiên là `500px`, vì vậy chiều rộng cố định được lấy ra khỏi không gian khả dụng. Không gian còn lại được chia thành ba và giao theo tỷ lệ cho hai track linh hoạt.

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: 500px 1fr 2fr;
}
```

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

{{ EmbedLiveSample('Mixing_flexible_and_absolute_sizes', '220', '140') }}

### Danh sách track với ký hiệu repeat()

Các grid lớn với nhiều track có thể sử dụng ký hiệu [`repeat()`](/en-US/docs/Web/CSS/Reference/Values/repeat), để lặp lại tất cả hoặc một phần danh sách grid track. Ví dụ, định nghĩa grid:

```css
.wrapper {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
}
```

Cũng có thể được viết là:

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
}
```

Ký hiệu repeat có thể được sử dụng cho một phần của danh sách track. Trong ví dụ này, chúng ta tạo một grid 8 cột; track đầu tiên là `20px`, sau đó là một phần lặp lại gồm 6 track `1fr`, và cuối cùng là một track `20px`.

```css
.wrapper {
  display: grid;
  grid-template-columns: 20px repeat(6, 1fr) 20px;
}
```

Ký hiệu repeat (`repeat()`) sử dụng danh sách track để tạo ra một mẫu lặp lại của các track. Trong ví dụ này, grid sẽ có 10 track; một track `1fr` được theo sau bởi một track `2fr`, với mẫu này được lặp lại năm lần.

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(5, 1fr 2fr);
}
```

### Implicit và explicit grid

Khi tạo grid ví dụ của chúng ta, chúng ta đã xác định cụ thể các column track bằng thuộc tính {{cssxref("grid-template-columns")}}, với grid tạo các hàng khi cần thiết để chứa nội dung. Các cột xác định explicit grid trong khi các hàng là một phần của implicit grid.

_Explicit grid_ bao gồm các hàng và cột được định nghĩa bằng {{cssxref("grid-template-columns")}} hoặc {{cssxref("grid-template-rows")}}. _Implicit grid_ mở rộng explicit grid được định nghĩa khi nội dung được đặt bên ngoài grid đó, chẳng hạn như vào các hàng bằng cách vẽ thêm các grid line.

Nếu bạn đặt thứ gì đó bên ngoài grid được định nghĩa hoặc, do lượng nội dung, cần nhiều grid track hơn, thì grid sẽ tạo các hàng và cột trong _implicit grid_. Các implicit track này được tự động kích thước theo mặc định, có nghĩa là kích thước của các hàng hoặc cột được tạo bị ảnh hưởng bởi cả nội dung của chúng và bởi không gian trống khả dụng trong grid container. Từ khóa `auto` cho phép các track được tạo chứa nội dung trong khi chia sẻ bất kỳ không gian còn lại nào.

Bạn cũng có thể xác định kích thước đặt cho các track được tạo trong implicit grid bằng các thuộc tính {{cssxref("grid-auto-rows")}} và {{cssxref("grid-auto-columns")}}.

Trong ví dụ này, chúng ta đặt `grid-auto-rows: 200px`, đảm bảo các track được tạo trong implicit grid này cao `200px`.

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: 200px;
}
```

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

{{ EmbedLiveSample('The_implicit_and_explicit_grid', '230', '450') }}

### Kích thước track và minmax

Khi thiết lập một explicit grid hoặc xác định kích thước cho các hàng hoặc cột được tạo tự động, chúng ta có thể muốn cho track một kích thước tối thiểu nhưng cũng đảm bảo chúng mở rộng để vừa với nội dung được thêm vào. Ví dụ, chúng ta có thể muốn các hàng không bao giờ nhỏ hơn 100 pixel, nhưng nếu nội dung kéo dài đến 300 pixel chiều cao, thì chúng ta muốn hàng kéo dài đến chiều cao đó. Điều này được giải quyết bởi hàm {{cssxref("minmax()")}}.

Trong ví dụ này, chúng ta sử dụng `minmax()` trong giá trị thuộc tính `grid-auto-rows`. Bằng cách đặt `grid-auto-rows: minmax(100px, auto);`, các hàng được tạo tự động sẽ có chiều cao tối thiểu là `100px` và tối đa là `auto`. Đặt `auto` là giá trị tối đa cho phép track lớn lên để chứa nội dung của nó (lên đến kích thước `max-content` của nó) trong khi cũng chia sẻ bất kỳ không gian trống khả dụng nào trong grid container.

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: minmax(100px, auto);
}
```

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

```html hidden
<div class="wrapper">
  <div>One</div>
  <div>
    Two
    <p>We have some more content.</p>
    <p>This makes me taller than 100 pixels.</p>
  </div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
</div>
```

{{ EmbedLiveSample('Track_sizing_and_minmax', '240', '270') }}

## Grid line

Cần lưu ý rằng khi chúng ta định nghĩa một grid, chúng ta định nghĩa các grid track, không phải các đường. Grid sau đó cung cấp cho chúng ta các đường được đánh số để sử dụng khi định vị các mục. Trong grid ba cột, hai hàng của chúng ta có bốn column line.

![Sơ đồ hiển thị các grid line được đánh số.](1_diagram_numbered_grid_lines.png)

Các đường được đánh số theo writing mode của tài liệu. Trong ngôn ngữ trái sang phải, đường 1 ở phía bên trái của grid. Trong ngôn ngữ phải sang trái, nó ở phía bên phải của grid. Các đường cũng có thể được đặt tên, điều này được thảo luận trong hướng dẫn [grid layout using named grid lines](/en-US/docs/Web/CSS/Guides/Grid_layout/Named_grid_lines).

### Định vị các mục theo các đường

Ví dụ sau minh họa line-based placement cơ bản; khi đặt một mục, chúng ta nhắm mục tiêu vào đường chứ không phải track. Chúng ta khám phá điều này chi tiết hơn trong hướng dẫn [grid layout using line-based placement](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement).

Trong ví dụ này, hai mục đầu tiên trên grid ba column track của chúng ta được đặt bằng các thuộc tính {{cssxref("grid-column-start")}}, {{cssxref("grid-column-end")}}, {{cssxref("grid-row-start")}} và {{cssxref("grid-row-end")}}. Làm việc từ trái sang phải, mục đầu tiên được đặt chống lại column line 1, và trải dài đến column line 4, đây là đường ở ngoài cùng bên phải của grid trong trường hợp này. Nó bắt đầu ở row line 1 và kết thúc ở row line 3, do đó trải qua hai row track.

Mục thứ hai bắt đầu ở grid column line 1 và trải qua một track. Đây là mặc định, vì vậy chúng ta không cần chỉ định đường kết thúc. Nó cũng trải qua hai row track từ row line 3 đến row line 5. Các mục khác sẽ tự đặt vào các khoảng trống trên grid.

```html
<div class="wrapper">
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
  <div class="box4">Four</div>
  <div class="box5">Five</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: 100px;
}

.box1 {
  grid-column-start: 1;
  grid-column-end: 4;
  grid-row-start: 1;
  grid-row-end: 3;
}

.box2 {
  grid-column-start: 1;
  grid-row-start: 3;
  grid-row-end: 5;
}
```

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

{{ EmbedLiveSample('Positioning_items_against_lines', '230', '450') }}

Sử dụng grid inspector trong công cụ phát triển của bạn để xem cách các mục được định vị theo các đường của grid.

### Shorthand định vị theo đường

Các giá trị longhand được sử dụng ở trên có thể được nén thành một dòng cho cột với shorthand {{cssxref("grid-column")}}, và một dòng cho hàng với shorthand {{cssxref("grid-row")}}. Ví dụ sau sẽ cho cùng kết quả định vị như trong code trước, nhưng với ít CSS hơn nhiều. Giá trị trước ký tự gạch chéo (`/`) là đường bắt đầu, giá trị sau là đường kết thúc.

Bạn có thể bỏ qua giá trị kết thúc nếu vùng chỉ trải qua một track.

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: 100px;
}

.box1 {
  grid-column: 1 / 4;
  grid-row: 1 / 3;
}

.box2 {
  grid-column: 1;
  grid-row: 3 / 5;
}
```

## Grid cell

Một _grid cell_ là đơn vị nhỏ nhất trên grid. Về mặt khái niệm, nó giống như một ô bảng. Như chúng ta đã thấy trong các ví dụ trước, một khi grid được định nghĩa là cha, các mục con sẽ tự sắp xếp trong mỗi ô grid đã được định nghĩa. Trong hình ảnh dưới đây, ô đầu tiên của grid được tô sáng.

![Ô đầu tiên của grid được tô sáng](1_grid_cell.png)

## Grid area

Các mục có thể trải qua một hoặc nhiều ô theo hàng hoặc theo cột, và điều này tạo ra một _grid area_. Grid area phải là hình chữ nhật – không thể tạo ra một vùng hình chữ L chẳng hạn. Grid area được tô sáng trải qua hai track hàng và hai track cột.

![Một grid area](1_grid_area.png)

## Gutter

_Gutter_ hoặc _khoảng cách_ giữa các grid cell có thể được tạo bằng các thuộc tính {{cssxref("column-gap")}} và {{cssxref("row-gap")}}, hoặc shorthand {{cssxref("gap")}}. Trong ví dụ dưới đây, chúng ta thêm khoảng cách 10 pixel giữa các cột và khoảng cách `1em` giữa các hàng.

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  column-gap: 10px;
  row-gap: 1em;
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

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  column-gap: 10px;
  row-gap: 1em;
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

{{ EmbedLiveSample('Gutters') }}

Bất kỳ không gian nào được sử dụng bởi gutter sẽ được tính toán trước khi không gian được giao cho các track `fr` linh hoạt, và gutter hoạt động cho mục đích kích thước như một grid track thông thường, tuy nhiên bạn không thể đặt bất cứ thứ gì vào gutter. Về mặt định vị dựa trên đường, gutter hoạt động như một đường dày, trong suốt.

## Lồng grid

Một grid item có thể trở thành một grid container. Trong ví dụ sau, chúng ta mở rộng grid ba cột với hai mục được đặt vị trí đã thấy trước đó, thêm các mục con vào grid item đầu tiên. Vì các mục lồng này không phải là con trực tiếp của grid, chúng không tham gia vào grid layout và vì vậy hiển thị trong luồng tài liệu thông thường.

![Grid lồng trong luồng](1_nested_grids_in_flow.png)

### Lồng không có subgrid

Nếu chúng ta đặt `box1` thành `display: grid`, chúng ta có thể cho nó một định nghĩa track và nó cũng sẽ trở thành một grid. Các mục sau đó sẽ được bố trí trên grid mới này.

```css
.box1 {
  grid-column-start: 1;
  grid-column-end: 4;
  grid-row-start: 1;
  grid-row-end: 3;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
}
```

```html
<div class="wrapper">
  <div class="box box1">
    <div class="nested">a</div>
    <div class="nested">b</div>
    <div class="nested">c</div>
  </div>
  <div class="box box2">Two</div>
  <div class="box box3">Three</div>
  <div class="box box4">Four</div>
  <div class="box box5">Five</div>
</div>
```

```css
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  gap: 3px;
  background-color: #fff4e6;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
}

.box {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}

.box1 {
  grid-column: 1 / 4;
}

.nested {
  border: 2px solid #ffec99;
  border-radius: 5px;
  background-color: #fff9db;
  padding: 1em;
}
```

{{ EmbedLiveSample('Nesting_without_subgrid', '600', '250') }}

Trong trường hợp này, grid lồng không có mối quan hệ với cha. Như bạn có thể thấy trong ví dụ, nó không kế thừa {{cssxref("gap")}} của cha và các đường trong grid lồng không căn chỉnh với các đường trong grid cha.

### Subgrid

Ngoài các grid thông thường, chúng ta có thể tạo _subgrid_. Giá trị `subgrid` cho phép chúng ta tạo các grid lồng sử dụng định nghĩa track của grid cha.

Để sử dụng chúng, chúng ta chỉnh sửa ví dụ grid lồng ở trên để thay đổi định nghĩa track của `grid-template-columns: repeat(3, 1fr)`, thành `grid-template-columns: subgrid`. Grid lồng sau đó sử dụng các track của grid cha để bố trí các mục.

```css
.box1 {
  grid-column-start: 1;
  grid-column-end: 4;
  grid-row-start: 1;
  grid-row-end: 3;
  display: grid;
  grid-template-columns: subgrid;
}
```

## Xếp lớp các mục với z-index

Các grid item có thể chiếm cùng một ô, và trong trường hợp này, chúng ta có thể sử dụng thuộc tính {{cssxref("z-index")}} để kiểm soát thứ tự xếp chồng các mục chồng lên nhau.

### Chồng lên nhau mà không có z-index

Nếu chúng ta quay lại ví dụ có các mục được định vị theo số đường, chúng ta có thể thay đổi điều này để làm cho hai mục chồng lên nhau.

```html
<div class="wrapper">
  <div class="box box1">One</div>
  <div class="box box2">Two</div>
  <div class="box box3">Three</div>
  <div class="box box4">Four</div>
  <div class="box box5">Five</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: 100px;
}

.box1 {
  grid-column-start: 1;
  grid-column-end: 4;
  grid-row-start: 1;
  grid-row-end: 3;
}

.box2 {
  grid-column-start: 1;
  grid-row-start: 2;
  grid-row-end: 4;
}
```

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.box {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

{{ EmbedLiveSample('Overlapping_without_z-index', '230', '460') }}

Mục `box2` hiện đang chồng lên `box1`, nó hiển thị ở trên vì nó xuất hiện sau trong thứ tự nguồn.

### Kiểm soát thứ tự

Chúng ta có thể kiểm soát thứ tự xếp chồng các mục bằng cách sử dụng thuộc tính `z-index` – giống như các mục được định vị. Nếu chúng ta cho `box2` một `z-index` thấp hơn `box1`, nó sẽ hiển thị bên dưới `box1` trong stack.

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: 100px;
}

.box1 {
  grid-column-start: 1;
  grid-column-end: 4;
  grid-row-start: 1;
  grid-row-end: 3;
  z-index: 2;
}

.box2 {
  grid-column-start: 1;
  grid-row-start: 2;
  grid-row-end: 4;
  z-index: 1;
}
```

```html hidden
<div class="wrapper">
  <div class="box box1">One</div>
  <div class="box box2">Two</div>
  <div class="box box3">Three</div>
  <div class="box box4">Four</div>
  <div class="box box5">Five</div>
</div>
```

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.box {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

{{ EmbedLiveSample('Controlling_the_order', '230', '420') }}

## Các bước tiếp theo

Trong tổng quan này, chúng ta đã xem qua sơ lược các khả năng của grid layout. Hãy khám phá và thử nghiệm với các ví dụ code, rồi tiến đến hướng dẫn [mối quan hệ của grid layout với các phương pháp layout khác](/en-US/docs/Web/CSS/Guides/Grid_layout/Relationship_with_other_layout_methods), nơi chúng ta thực sự bắt đầu tìm hiểu sâu vào chi tiết của CSS grid layout.
