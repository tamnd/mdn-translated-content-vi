---
title: Layout using named grid lines
short-title: Using named grid lines
slug: Web/CSS/Guides/Grid_layout/Named_grid_lines
page-type: guide
sidebar: cssref
---

Trong các hướng dẫn trước, chúng ta đã xem xét cách đặt các phần tử trên các đường kẻ được tạo bởi [việc định nghĩa grid track](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement) và cách đặt các phần tử [bằng cách sử dụng các named template area](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas). Trong hướng dẫn này, chúng ta xem xét cách hai điều này kết hợp với nhau khi chúng ta sử dụng các đường kẻ có tên.

Việc đặt tên đường kẻ vô cùng hữu ích, nhưng một số cú pháp grid khó hiểu nhất xuất phát từ sự kết hợp giữa tên và kích thước track. Khi bạn đã làm qua một số ví dụ, mọi thứ sẽ trở nên rõ ràng và dễ làm việc hơn.

## Đặt tên đường kẻ khi định nghĩa grid

Bạn có thể gán một số hoặc tất cả các đường kẻ trong grid của bạn một tên khi bạn định nghĩa grid với các thuộc tính {{cssxref("grid-template-rows")}} và {{cssxref("grid-template-columns")}}. Để minh họa, chúng ta sẽ sử dụng bố cục cơ bản được tạo trong hướng dẫn về [line-based placement](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement). Lần này, chúng ta sẽ tạo grid bằng cách sử dụng các đường kẻ có tên.

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

Khi định nghĩa grid, chúng ta đặt tên cho các đường kẻ bên trong dấu ngoặc vuông (`[]`). Những tên đó có thể là bất cứ điều gì bạn muốn. Chúng ta định nghĩa tên cho điểm bắt đầu và kết thúc của container, cả cho hàng và cột. Trong trường hợp này, cả hàng và cột bắt đầu của khối trung tâm grid đều được đặt tên `content-start`, và cả hàng và cột kết thúc đều được đặt tên `content-end`.

```css
.wrapper {
  display: grid;
  grid-template-columns: [main-start] 1fr [content-start] 1fr [content-end] 1fr [main-end];
  grid-template-rows: [main-start] 100px [content-start] 100px [content-end] 100px [main-end];
}
```

Chúng ta không cần phải đặt tên tất cả các đường kẻ trong grid; bạn có thể chọn chỉ đặt tên cho các đường kẻ quan trọng của bố cục.

Khi các đường kẻ đã có tên, chúng ta có thể sử dụng tên đã định nghĩa thay vì số đường kẻ để đặt các grid item.

```css
.box1 {
  grid-column-start: main-start;
  grid-row-start: main-start;
  grid-row-end: main-end;
}

.box2 {
  grid-column-start: content-end;
  grid-row-start: main-start;
  grid-row-end: content-end;
}

.box3 {
  grid-column-start: content-start;
  grid-row-start: main-start;
}

.box4 {
  grid-column-start: content-start;
  grid-column-end: main-end;
  grid-row-start: content-end;
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

{{ EmbedLiveSample('Naming_lines_when_defining_a_grid', '500', '330') }}

Mọi thứ khác về line-based placement vẫn hoạt động theo cùng cách. Trong grid layout của chúng ta, chúng ta cung cấp cho mỗi đường kẻ số thứ tự một tên bí danh. Trong các grid item, chúng ta tham chiếu một tên thay vì một số. Việc đặt tên đường kẻ theo cách này rất hữu ích — khi tạo responsive design, chúng ta có thể cập nhật các thuộc tính grid của container thay vì cập nhật các grid item trong mỗi [media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using).

### Đặt nhiều tên cho một đường kẻ

Bạn có thể muốn đặt cho một đường kẻ nhiều hơn một tên, có thể nó biểu thị cả sidebar-end và main-start chẳng hạn. Để làm điều này, hãy thêm các tên bên trong dấu ngoặc vuông với khoảng trắng giữa chúng `[sidebar-end main-start]`. Sau đó bạn có thể tham chiếu đường kẻ đó bằng bất kỳ tên nào trong số đó.

## Grid area ngầm từ các đường kẻ có tên

Khi đặt tên cho các đường kẻ, chúng ta đã đề cập rằng bạn có thể đặt tên chúng bất cứ điều gì bạn muốn. Tên đó là một {{cssxref("custom-ident")}}, một tên do tác giả định nghĩa. Khi chọn tên, bạn cần tránh các từ có thể xuất hiện trong đặc tả và gây nhầm lẫn - chẳng hạn như `span`. Các ident không được trích dẫn.

Mặc dù bạn có thể chọn bất kỳ tên nào, nếu bạn thêm `-start` và `-end` vào các đường kẻ xung quanh một vùng, như trong ví dụ trên, grid sẽ tạo ra một named area với tên chính được sử dụng. Lấy ví dụ trên, chúng ta có `content-start` và `content-end` cho cả hàng và cột. Điều này có nghĩa là chúng ta có một grid area được đặt tên `content`, và chúng ta có thể đặt thứ gì đó vào vùng đó nếu muốn.

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

Chúng ta sử dụng cùng định nghĩa grid như trên, đặt một phần tử duy nhất vào named area `content`.

```css
.wrapper {
  display: grid;
  grid-template-columns: [main-start] 1fr [content-start] 1fr [content-end] 1fr [main-end];
  grid-template-rows: [main-start] 100px [content-start] 100px [content-end] 100px [main-end];
}
.thing {
  grid-area: content;
}
```

```html
<div class="wrapper">
  <div class="thing">I am placed in an area named content.</div>
</div>
```

{{ EmbedLiveSample('Implicit_grid_areas_from_named_lines', '500', '330') }}

Chúng ta không cần định nghĩa vị trí của các vùng với {{cssxref("grid-template-areas")}} vì các đường kẻ có tên của chúng ta đã tạo ra một vùng cho chúng ta.

## Đường kẻ grid ngầm từ các named area

Chúng ta đã thấy cách các đường kẻ có tên tạo ra một named area, và điều này cũng hoạt động theo chiều ngược lại. Các named template area tạo ra các đường kẻ có tên mà bạn có thể sử dụng để đặt các phần tử. Nếu chúng ta lấy bố cục được tạo trong hướng dẫn về [grid template areas](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas), chúng ta có thể sử dụng các đường kẻ được tạo bởi các vùng của chúng ta để xem cách điều này hoạt động.

Trong ví dụ này, chúng ta đã thêm một `<div>` bổ sung với class là `overlay`. Chúng ta có các named area được tạo bằng thuộc tính {{cssxref("grid-area")}}, sau đó là bố cục được tạo trong `grid-template-areas`. Các tên vùng là:

- `hd`
- `ft`
- `main`
- `sd`

Điều này cho chúng ta các đường kẻ cột và hàng:

- `hd-start`
- `hd-end`
- `sd-start`
- `sd-end`
- `main-start`
- `main-end`
- `ft-start`
- `ft-end`

Bạn có thể thấy các đường kẻ có tên trong hình ảnh. Lưu ý rằng một số đường kẻ có hai tên - ví dụ `sd-end` và `main-start` đề cập đến cùng một đường kẻ cột.

![Hình ảnh hiển thị các tên đường kẻ ngầm được tạo bởi các grid area.](5_multiple_lines_from_areas.png)

Định vị `overlay` bằng các đường kẻ có tên ngầm này giống như định vị một phần tử bằng các đường kẻ có tên.

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
  grid-template-columns: repeat(9, 1fr);
  grid-auto-rows: minmax(100px, auto);
  grid-template-areas:
    "hd hd hd hd   hd   hd   hd   hd   hd"
    "sd sd sd main main main main main main"
    "ft ft ft ft   ft   ft   ft   ft   ft";
}

.header {
  grid-area: hd;
}

.footer {
  grid-area: ft;
}

.content {
  grid-area: main;
}

.sidebar {
  grid-area: sd;
}

.wrapper > div.overlay {
  z-index: 10;
  grid-column: main-start / main-end;
  grid-row: hd-start / ft-end;
  border: 4px solid rgb(92 148 13);
  background-color: rgb(92 148 13 / 40%);
  color: rgb(92 148 13);
  font-size: 150%;
}
```

```html
<div class="wrapper">
  <div class="header">Header</div>
  <div class="sidebar">Sidebar</div>
  <div class="content">Content</div>
  <div class="footer">Footer</div>
  <div class="overlay">Overlay</div>
</div>
```

{{ EmbedLiveSample('Implicit_Grid_lines_from_named_areas', '500', '330') }}

Vì chúng ta có khả năng định vị các đường kẻ được tạo từ named area và các vùng từ các đường kẻ có tên, nên đáng để dành một chút thời gian lên kế hoạch chiến lược đặt tên khi bắt đầu tạo grid layout. Chọn các tên có ý nghĩa với bạn và nhóm của bạn sẽ làm cho bố cục trở nên trực quan hơn.

## Nhiều đường kẻ có cùng tên với repeat()

Nếu bạn muốn đặt cho tất cả các đường kẻ grid của mình một tên duy nhất, bạn cần định nghĩa track bằng các thuộc tính longhand thay vì sử dụng cú pháp repeat, vì các tên cần được thêm vào trong dấu ngoặc vuông khi định nghĩa track. Nếu bạn sử dụng cú pháp repeat, bạn sẽ có nhiều đường kẻ có cùng tên, điều này có thể hữu ích hoặc gây nhầm lẫn, tùy thuộc vào yêu cầu bố cục của bạn.

### Grid 12 cột sử dụng repeat()

Trong ví dụ này, chúng ta tạo một grid với 12 cột có chiều rộng bằng nhau. Trước khi định nghĩa kích thước `1fr` của column track, chúng ta định nghĩa một đường kẻ có tên `[col-start]`. Điều này có nghĩa là chúng ta sẽ có một grid với 12 đường kẻ cột đều có tên `col-start` trước một cột có chiều rộng `1fr`.

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
  grid-template-columns: repeat(12, [col-start] 1fr);
}
```

Sau khi bạn đã tạo grid, bạn có thể đặt các phần tử lên đó. Vì chúng ta có nhiều đường kẻ có tên `col-start`, nếu bạn đặt một phần tử bắt đầu sau đường kẻ `col-start`, đường kẻ đầu tiên có tên `col-start` sẽ được sử dụng. Trong trường hợp của chúng ta, đây là đường kẻ ngoài cùng bên trái. Để chỉ định một đường kẻ khác, hãy sử dụng tên kèm theo số của đường kẻ đó.

Để đặt một phần tử trải dài từ đường kẻ đầu tiên có tên `col-start` đến đường kẻ thứ 5 có tên đó, chúng ta có thể sử dụng:

```css
.item1to5 {
  grid-column: col-start / col-start 5;
}
```

Bạn cũng có thể sử dụng từ khóa `span`. Phần tử này sẽ trải dài 3 đường kẻ bắt đầu từ đường kẻ thứ 7 có tên `col-start`:

```css
.item7to9 {
  grid-column: col-start 7 / span 3;
}
```

```html
<div class="wrapper">
  <div class="item1to5">I am placed from col-start line 1 to col-start 5</div>
  <div class="item7to9">I am placed from col-start line 7 spanning 3 lines</div>
</div>
```

{{ EmbedLiveSample('Twelve-column_grid_using_repeat', '500', '120') }}

Nếu bạn xem bố cục này trong developer tools của trình duyệt, bạn sẽ thấy cách hiển thị các đường kẻ cột và cách các phần tử được đặt theo các đường kẻ này.

![Grid 12 cột với các phần tử được đặt. Firefox grid highlighter hiển thị vị trí các đường kẻ.](5_named_lines1.png)

### Định nghĩa các đường kẻ có tên với track list

Cú pháp `repeat()` cũng có thể nhận một track list; không chỉ là các kích thước track đơn lẻ có thể được lặp lại.

CSS này tạo một grid 8 track, với một cột `1fr` hẹp hơn có tên `col1-start` theo sau là một cột `3fr` rộng hơn có tên `col2-start`.

```css
.wrapper {
  grid-template-columns: repeat(4, [col1-start] 1fr [col2-start] 3fr);
}
```

Nếu cú pháp lặp của bạn đặt hai đường kẻ cạnh nhau, chúng sẽ được hợp nhất và tạo ra kết quả tương tự như khi đặt nhiều tên cho một đường kẻ trong định nghĩa track không lặp lại. Định nghĩa sau đây tạo ra bốn track `1fr`, mỗi track có một đường kẻ bắt đầu và kết thúc.

```css
.wrapper {
  grid-template-columns: repeat(4, [col-start] 1fr [col-end]);
}
```

Nếu chúng ta viết khai báo này mà không sử dụng ký hiệu repeat, nó trông như thế này:

```css
.wrapper {
  grid-template-columns: [col-start] 1fr [col-end col-start] 1fr [col-end col-start] 1fr [col-end col-start] 1fr [col-end];
}
```

Sử dụng track list, chúng ta có thể sử dụng từ khóa `span` để trải dài một số đường kẻ, bao gồm các đường kẻ có tên nhất định:

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
  grid-template-columns: repeat(6, [col1-start] 1fr [col2-start] 3fr);
}

.item1 {
  grid-column: col1-start / col2-start 2;
}

.item2 {
  grid-row: 2;
  grid-column: col1-start 2 / span 2 col1-start;
}
```

```html
<div class="wrapper">
  <div class="item1">
    I am placed from col1-start line 1 to col2-start line 2
  </div>
  <div class="item2">
    I am placed from col1-start line 2 spanning 2 lines named col1-start
  </div>
</div>
```

{{ EmbedLiveSample('Defining_named_lines_with_a_track_list', '500', '230') }}

### Framework grid 12 cột

Sau khi học về numeric và named line-based placement và [grid template areas](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas), chúng ta biết có một số cách để đặt các phần tử bằng CSS grid layout. Điều này có vẻ quá phức tạp, nhưng bạn không cần phải sử dụng tất cả chúng. Trong thực tế, việc sử dụng các named template area hoạt động tốt cho các bố cục đơn giản vì phương pháp này cho thấy biểu diễn trực quan tốt về bố cục của bạn trông như thế nào, và làm cho việc di chuyển mọi thứ xung quanh trên grid trở nên trực quan hơn. Ví dụ, khi làm việc với bố cục nhiều cột nghiêm ngặt, demo các đường kẻ có tên trong phần cuối của hướng dẫn này hoạt động tốt.

Các hệ thống grid cũ như Foundation hay Bootstrap dựa trên grid 12 cột. Các framework này import code để thực hiện tính toán đảm bảo các cột cộng lại thành 100%. Framework không cần thiết! CSS duy nhất chúng ta cần cho "framework" grid 12 cột là:

```css
.wrapper {
  display: grid;
  gap: 10px;
  grid-template-columns: repeat(12, [col-start] 1fr);
}
```

Sau đó chúng ta có thể sử dụng "framework" này để bố trí trang.

Ví dụ, để tạo bố cục ba cột với header và footer, chúng ta có thể sử dụng markup sau.

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.wrapper > * {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```html
<div class="wrapper">
  <header class="main-header">I am the header</header>
  <aside class="side1">I am sidebar 1</aside>
  <article class="content">I am the main article</article>
  <aside class="side2">I am sidebar 2</aside>
  <footer class="main-footer">I am the footer</footer>
</div>
```

Chúng ta có thể đặt điều này trên framework grid layout:

```css
.main-header,
.main-footer {
  grid-column: col-start / span 12;
}

.side1 {
  grid-column: col-start / span 3;
  grid-row: 2;
}

.content {
  grid-column: col-start 4 / span 6;
  grid-row: 2;
}

.side2 {
  grid-column: col-start 10 / span 3;
  grid-row: 2;
}
```

{{ EmbedLiveSample('Twelve-column_grid_framework', '500', '220') }}

Một lần nữa, grid highlighter của developer tools rất hữu ích để hiển thị cho chúng ta cách grid mà chúng ta đã đặt các phần tử hoạt động.

![Bố cục với grid được highlight.](5_named_lines2.png)

Đó là tất cả những gì chúng ta cần. Chúng ta không cần phải thực hiện bất kỳ tính toán nào! CSS grid layout tự động loại bỏ track gutter 10-pixel trước khi phân bổ không gian cho các `1fr` column track.

Tiếp theo, chúng ta sẽ xem xét cách CSS grid layout có thể định vị các phần tử cho chúng ta mà không cần yêu cầu bất kỳ thuộc tính placement nào, trong hướng dẫn [auto-placement in grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Auto-placement).
