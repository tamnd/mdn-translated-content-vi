---
title: Bố cục lưới CSS
slug: Learn_web_development/Core/CSS_layout/Grids
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Test_your_skills/Flexbox", "Learn_web_development/Core/CSS_layout/Test_your_skills/Grid", "Learn_web_development/Core/CSS_layout")}}

Bố cục lưới CSS là hệ thống bố cục hai chiều cho web. Nó cho phép bạn tổ chức nội dung thành các hàng và cột và cung cấp nhiều tính năng để đơn giản hóa việc tạo các bố cục phức tạp. Bài viết này sẽ giải thích tất cả những gì bạn cần biết để bắt đầu với bố cục lưới.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Cấu trúc nội dung với HTML</a
        >,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals">Tạo kiểu văn bản và phông chữ cơ bản</a>,
        quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/CSS_layout/Introduction">các khái niệm cơ bản về bố cục CSS</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Hiểu mục đích của CSS Grid — sắp xếp linh hoạt một tập hợp các phần tử khối hoặc nội tuyến trong hai chiều.</li>
          <li>Hiểu thuật ngữ lưới — hàng, cột, khoảng cách và rãnh.</li>
          <li>Hiểu những gì <code>display: grid</code> cung cấp theo mặc định.</li>
          <li>Xác định hàng, cột và khoảng cách lưới.</li>
          <li>Định vị các phần tử trên lưới.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Bố cục lưới là gì?

Lưới là tập hợp các đường ngang và dọc tạo ra một mẫu để chúng ta có thể căn chỉnh các phần tử thiết kế của mình. Chúng giúp chúng ta tạo các bố cục trong đó các phần tử của chúng ta sẽ không nhảy xung quanh hoặc thay đổi chiều rộng khi chúng ta di chuyển từ trang này sang trang khác, cung cấp sự nhất quán hơn cho các trang web của chúng ta.

Một lưới thường sẽ có **cột**, **hàng** và sau đó là khoảng cách giữa mỗi hàng và cột. Các khoảng cách thường được gọi là **rãnh**.

![Lưới CSS với các phần được gắn nhãn là hàng, cột và rãnh. Hàng là các phân đoạn ngang của lưới và Cột là các phân đoạn dọc của lưới. Khoảng cách giữa hai hàng được gọi là 'rãnh hàng' và khoảng cách giữa 2 cột được gọi là 'rãnh cột'.](grid.png)

## Tạo lưới của bạn trong CSS

Sau khi quyết định lưới mà thiết kế của bạn cần, bạn có thể sử dụng bố cục lưới CSS để tạo nó. Chúng ta sẽ kiểm tra các tính năng cơ bản của bố cục lưới trước tiên, sau đó khám phá cách tạo một hệ thống lưới đơn giản cho dự án của bạn.
Video sau đây cung cấp giải thích trực quan hay về việc sử dụng CSS grid:

{{EmbedYouTube("KOvGeFUHAC0")}}

### Xác định một lưới

Hãy thử các bố cục lưới. Đây là một ví dụ với một vùng chứa, có một số phần tử con. Theo mặc định, các mục này được hiển thị trong luồng thông thường, khiến chúng xuất hiện lần lượt bên dưới nhau.

```html live-sample___simple-grid_0
<div class="container">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
</div>
```

```css live-sample___simple-grid_0
body {
  font-family: sans-serif;
}
.container > div {
  border-radius: 5px;
  padding: 10px;
  background-color: rgb(207 232 220);
  border: 2px solid rgb(79 185 227);
}
```

{{EmbedLiveSample('simple-grid_0', '100%', "310") }}

Tương tự như cách bạn xác định flexbox, bạn xác định bố cục lưới bằng cách đặt giá trị của thuộc tính {{cssxref("display")}} thành `grid`. Như trong trường hợp flexbox, thuộc tính `display: grid` chuyển đổi tất cả các con trực tiếp của vùng chứa thành mục lưới. Chúng ta đã thêm CSS sau vào tệp:

```html hidden live-sample___simple-grid_1
<div class="container">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
</div>
```

```css hidden live-sample___simple-grid_1
body {
  font-family: sans-serif;
}
.container > div {
  border-radius: 5px;
  padding: 10px;
  background-color: rgb(207 232 220);
  border: 2px solid rgb(79 185 227);
}
```

```css live-sample___simple-grid_1
.container {
  display: grid;
}
```

{{EmbedLiveSample('simple-grid_1', '100%', "310") }}

Không giống flexbox, các mục sẽ không ngay lập tức trông khác đi. Khai báo `display: grid` cho bạn một lưới một cột, vì vậy các mục của bạn sẽ tiếp tục hiển thị lần lượt bên dưới nhau như trong luồng thông thường.

Để xem thứ gì đó trông giống lưới hơn, chúng ta sẽ cần thêm một số cột vào lưới. Hãy thêm ba cột 200 pixel. Bạn có thể sử dụng bất kỳ đơn vị độ dài hoặc phần trăm nào để tạo các track cột này.

```html hidden live-sample___simple-grid_2
<div class="container">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
</div>
```

```css hidden live-sample___simple-grid_2
body {
  font-family: sans-serif;
}
.container > div {
  border-radius: 5px;
  padding: 10px;
  background-color: rgb(207 232 220);
  border: 2px solid rgb(79 185 227);
}
```

```css live-sample___simple-grid_2
.container {
  display: grid;
  grid-template-columns: 200px 200px 200px;
}
```

Bạn sẽ thấy rằng các mục đã tự sắp xếp lại sao cho có một mục trong mỗi ô của lưới.

{{EmbedLiveSample('simple-grid_2', '100%', "130") }}

## Tóm tắt tương tác về các khái niệm lưới

Nội dung nhúng sau đây từ Scrimba<sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp bài học tương tác về những kiến thức cơ bản của CSS grid. Nó cũng bao gồm một ví dụ lưới trực tiếp mà bạn có thể thử nghiệm để xem mã hoạt động như thế nào.

<mdn-scrim-inline url="https://scrimba.com/learn-css-grid-c02k/~01" scrimtitle="Your first grid"></scrim-inline>

### Lưới linh hoạt với đơn vị fr

Ngoài việc tạo lưới bằng độ dài và phần trăm, chúng ta có thể sử dụng [`fr`](/en-US/docs/Web/CSS/Reference/Values/flex_value). Đơn vị `fr` đại diện cho một phần của không gian có sẵn trong vùng chứa lưới để định kích thước linh hoạt cho các hàng và cột lưới.

```html hidden live-sample___grid-fr-unit_0
<div class="container">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
</div>
```

```css hidden live-sample___grid-fr-unit_0
body {
  font-family: sans-serif;
}
.container > div {
  border-radius: 5px;
  padding: 10px;
  background-color: rgb(207 232 220);
  border: 2px solid rgb(79 185 227);
}
```

Ở đây chúng ta thay đổi danh sách track thành định nghĩa sau, tạo ba track `1fr`:

```css live-sample___grid-fr-unit_0
.container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
}
```

{{EmbedLiveSample('grid-fr-unit_0', '100%', "130") }}

Bây giờ bạn có các track linh hoạt.
Đơn vị `fr` phân phối không gian theo tỷ lệ, vì vậy bạn có thể chỉ định các giá trị dương khác nhau cho các track của mình.
Thay đổi danh sách track của bạn thành định nghĩa sau, tạo một track `2fr` và hai track `1fr`:

```html hidden live-sample___grid-fr-unit_1
<div class="container">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
</div>
```

```css hidden live-sample___grid-fr-unit_1
body {
  font-family: sans-serif;
}
.container > div {
  border-radius: 5px;
  padding: 10px;
  background-color: rgb(207 232 220);
  border: 2px solid rgb(79 185 227);
}
```

```css live-sample___grid-fr-unit_1
.container {
  display: grid;
  grid-template-columns: 2fr 1fr 1fr;
}
```

{{EmbedLiveSample('grid-fr-unit_1', '100%', "130") }}

Track đầu tiên nhận `2fr` không gian có sẵn và hai track còn lại nhận `1fr`, làm track đầu tiên lớn hơn. Bạn có thể kết hợp đơn vị `fr` với đơn vị độ dài cố định. Trong trường hợp này, không gian cần thiết cho các track cố định được sử dụng trước khi không gian còn lại được phân phối cho các track khác.

> [!NOTE]
> Đơn vị `fr` phân phối không gian _có sẵn_, không phải _tất cả_ không gian. Do đó, nếu một trong các track của bạn có thứ gì đó lớn bên trong nó, sẽ có ít không gian trống hơn để chia sẻ.

### Khoảng cách giữa các track

Để tạo khoảng cách giữa các track, chúng ta sử dụng các thuộc tính:

- {{cssxref("column-gap")}} cho khoảng cách giữa các cột
- {{cssxref("row-gap")}} cho khoảng cách giữa các hàng
- {{cssxref("gap")}} như viết tắt cho cả hai

```html hidden live-sample___grid-gap
<div class="container">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
</div>
```

```css hidden live-sample___grid-gap
body {
  font-family: sans-serif;
}
.container > div {
  border-radius: 5px;
  padding: 10px;
  background-color: rgb(207 232 220);
  border: 2px solid rgb(79 185 227);
}
```

Ở đây chúng ta thêm thuộc tính `gap` để tạo khoảng cách giữa các track với giá trị `20px`:

```css live-sample___grid-gap
.container {
  display: grid;
  grid-template-columns: 2fr 1fr 1fr;
  gap: 20px;
}
```

{{EmbedLiveSample('grid-gap', '100%', "180") }}

Những khoảng cách này có thể là bất kỳ đơn vị độ dài hoặc phần trăm, nhưng không phải đơn vị `fr`.

### Lặp lại danh sách track

Bạn có thể lặp lại tất cả hoặc chỉ một phần danh sách track của mình bằng cách sử dụng hàm CSS `repeat()`.
Ở đây chúng ta thay đổi danh sách track thành sau:

```html hidden live-sample___grid-repeat
<div class="container">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
</div>
```

```css hidden live-sample___grid-repeat
body {
  font-family: sans-serif;
}
.container > div {
  border-radius: 5px;
  padding: 10px;
  background-color: rgb(207 232 220);
  border: 2px solid rgb(79 185 227);
}
```

```css live-sample___grid-repeat
.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
}
```

{{EmbedLiveSample('grid-repeat', '100%', "180") }}

Bây giờ bạn sẽ nhận được ba track `1fr` như trước. Giá trị đầu tiên được truyền vào hàm `repeat()` xác định số lần bạn muốn lặp lại danh sách, trong khi giá trị thứ hai là danh sách track, có thể là một hoặc nhiều track mà bạn muốn lặp lại.

### Lưới ngầm định và lưới tường minh

Cho đến thời điểm này, chúng ta chỉ xác định các track cột, nhưng các hàng được tự động tạo để chứa nội dung. Khái niệm này làm nổi bật sự khác biệt giữa lưới tường minh và lưới ngầm định.
Đây là một chút thêm về sự khác biệt giữa hai loại lưới:

- **Lưới tường minh** được tạo bằng `grid-template-columns` hoặc `grid-template-rows`.
- **Lưới ngầm định** mở rộng lưới tường minh đã xác định khi nội dung được đặt bên ngoài lưới đó, chẳng hạn như vào các hàng bằng cách vẽ thêm các đường lưới.

Theo mặc định, các track được tạo trong lưới ngầm định có kích thước `auto`, nghĩa là chúng nói chung đủ lớn để chứa nội dung của chúng. Nếu bạn muốn đặt kích thước cho các track lưới ngầm định, bạn có thể sử dụng các thuộc tính {{cssxref("grid-auto-rows")}} và {{cssxref("grid-auto-columns")}}. Nếu bạn thêm `grid-auto-rows` với giá trị `100px` vào CSS, bạn sẽ thấy rằng những hàng được tạo đó bây giờ cao 100 pixel.

```html hidden live-sample___grid-auto
<div class="container">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
</div>
```

```css hidden live-sample___grid-auto
body {
  font-family: sans-serif;
}
.container > div {
  border-radius: 5px;
  padding: 10px;
  background-color: rgb(207 232 220);
  border: 2px solid rgb(79 185 227);
}
```

```css live-sample___grid-auto
.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: 100px;
  gap: 20px;
}
```

{{EmbedLiveSample('grid-auto', '100%', "350") }}

### Hàm minmax()

Các track cao 100 pixel của chúng ta sẽ không hữu ích lắm nếu chúng ta thêm nội dung vào các track đó cao hơn 100 pixel, trong trường hợp đó sẽ gây ra tràn nội dung. Sẽ tốt hơn nếu có các track _ít nhất_ cao 100 pixel và vẫn có thể mở rộng nếu nội dung trở nên cao hơn. Một thực tế khá cơ bản về web là bạn không bao giờ thực sự biết thứ gì đó sẽ cao bao nhiêu — nội dung bổ sung hoặc cỡ chữ lớn hơn có thể gây ra vấn đề với các thiết kế cố gắng hoàn hảo theo pixel trong mọi chiều.

Hàm {{cssxref("minmax", "minmax()")}} cho phép chúng ta đặt kích thước tối thiểu và tối đa cho một track, ví dụ: `minmax(100px, auto)`. Kích thước tối thiểu là 100 pixel, nhưng tối đa là `auto`, sẽ mở rộng để chứa thêm nội dung. Ở đây chúng ta thay đổi `grid-auto-rows` để sử dụng giá trị `minmax()`:

```html hidden live-sample___grid-minmax_0
<div class="container">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four<br />More content</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
</div>
```

```css hidden live-sample___grid-minmax_0
body {
  font-family: sans-serif;
}
.container > div {
  border-radius: 5px;
  padding: 10px;
  background-color: rgb(207 232 220);
  border: 2px solid rgb(79 185 227);
}
```

```css live-sample___grid-minmax_0
.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: minmax(50px, auto);
  gap: 20px;
}
```

{{EmbedLiveSample('grid-minmax_0', '100%', "210") }}

Nếu bạn thêm nội dung thêm, bạn sẽ thấy track mở rộng để cho nó vừa. Lưu ý rằng sự mở rộng xảy ra ngay dọc theo hàng.

### Nhiều cột nhất có thể

Chúng ta có thể kết hợp một số bài học chúng ta đã học về danh sách track, ký hiệu repeat và {{cssxref("minmax", "minmax()")}} để tạo một mẫu hữu ích. Đôi khi sẽ hữu ích khi có thể yêu cầu CSS grid tạo nhiều cột nhất có thể vào trong vùng chứa. Chúng ta thực hiện điều này bằng cách đặt giá trị của `grid-template-columns` bằng hàm {{cssxref("repeat", "repeat()")}}, nhưng thay vì truyền vào một số, hãy truyền vào từ khóa [`auto-fit`](/en-US/docs/Web/CSS/Reference/Values/repeat#auto-fit). Đối với tham số thứ hai của hàm, chúng ta sử dụng `minmax()` với giá trị tối thiểu bằng kích thước track tối thiểu mà chúng ta muốn có và tối đa là `1fr`.

```html hidden live-sample___grid-minmax_1
<div class="container">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four<br />More content</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
</div>
```

```css hidden live-sample___grid-minmax_1
body {
  font-family: sans-serif;
}
.container > div {
  border-radius: 5px;
  padding: 10px;
  background-color: rgb(207 232 220);
  border: 2px solid rgb(79 185 227);
}
```

```css live-sample___grid-minmax_1
.container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
  grid-auto-rows: minmax(50px, auto);
  gap: 20px;
}
```

{{EmbedLiveSample('grid-minmax_1', '100%', "210") }}

Điều này hoạt động vì lưới đang tạo nhiều cột 230 pixel nhất có thể vào trong vùng chứa, sau đó chia sẻ bất kỳ không gian còn lại nào giữa tất cả các cột. Tối đa là `1fr`, như chúng ta đã biết, phân phối không gian đều giữa các track.

## Định vị dựa trên đường

Chúng ta bây giờ chuyển từ việc tạo lưới sang đặt các thứ trên lưới. Lưới của chúng ta luôn có các đường — chúng được đánh số bắt đầu từ 1 và liên quan đến [chế độ viết](/en-US/docs/Web/CSS/Guides/Writing_modes) của tài liệu. Ví dụ: đường cột 1 trong tiếng Anh (viết từ trái sang phải) sẽ ở bên trái của lưới và đường hàng 1 ở đỉnh, trong khi trong tiếng Ả Rập (viết từ phải sang trái), đường cột 1 sẽ ở bên phải.

Để định vị các mục dọc theo các đường này, chúng ta có thể xác định các đường bắt đầu và kết thúc của vùng lưới nơi một mục nên được đặt. Có bốn thuộc tính chúng ta có thể sử dụng để làm điều này:

- {{cssxref("grid-column-start")}}
- {{cssxref("grid-column-end")}}
- {{cssxref("grid-row-start")}}
- {{cssxref("grid-row-end")}}

Các thuộc tính này chấp nhận số đường làm giá trị của chúng, vì vậy chúng ta có thể chỉ định rằng một mục nên bắt đầu trên đường 1 và kết thúc trên đường 3, ví dụ.
Ngoài ra, bạn cũng có thể sử dụng các thuộc tính viết tắt cho phép bạn xác định các đường bắt đầu và kết thúc đồng thời, được phân tách bằng dấu gạch chéo `/`:

- {{cssxref("grid-column")}} viết tắt cho `grid-column-start` và `grid-column-end`
- {{cssxref("grid-row")}} viết tắt cho `grid-row-start` và `grid-row-end`

```html live-sample___grid-placement_0
<div class="container">
  <header>Header</header>
  <main>
    <h1>Main</h1>
    <p>Main content…</p>
  </main>
  <aside>
    <h2>Aside</h2>
    <p>Related content</p>
  </aside>
  <footer>footer</footer>
</div>
```

```css live-sample___grid-placement_0
.container {
  font-family: sans-serif;
  display: grid;
  grid-template-columns: 1fr 3fr;
  gap: 20px;
}
header,
footer {
  border-radius: 5px;
  padding: 10px;
  background-color: rebeccapurple;
  color: whitesmoke;
  text-align: center;
}
aside {
  border-right: 1px solid rebeccapurple;
}
```

Nếu không có định vị được xác định, bạn có thể thấy rằng _tự động định vị_ đang đặt mỗi mục vào ô riêng của nó trong lưới. {{htmlelement("header")}} chiếm `1fr` (một phần tư) và {{htmlelement("main")}} chiếm `3fr` (ba phần tư).

{{EmbedLiveSample('grid-placement_0', '100%', "230") }}

Hãy sắp xếp tất cả các phần tử cho trang web của chúng ta bằng cách sử dụng các đường lưới. Thêm các quy tắc sau vào cuối CSS của bạn:

```html hidden live-sample___grid-placement_1
<div class="container">
  <header>Header</header>
  <main>
    <h1>Main</h1>
    <p>Main content…</p>
  </main>
  <aside>
    <h2>Aside</h2>
    <p>Related content</p>
  </aside>
  <footer>footer</footer>
</div>
```

```css hidden live-sample___grid-placement_1
.container {
  font-family: sans-serif;
  display: grid;
  grid-template-columns: 1fr 3fr;
  gap: 20px;
}
header,
footer {
  border-radius: 5px;
  padding: 10px;
  background-color: rebeccapurple;
  color: whitesmoke;
  text-align: center;
}
aside {
  border-right: 1px solid rebeccapurple;
}
```

```css live-sample___grid-placement_1
header {
  grid-column: 1 / 3;
  grid-row: 1;
}
main {
  grid-column: 2;
  grid-row: 2;
}
aside {
  grid-column: 1;
  grid-row: 2;
}
footer {
  grid-column: 1 / 3;
  grid-row: 3;
}
```

Bây giờ {{htmlelement("header")}} và {{htmlelement("footer")}} được đặt thành `1 / 3`, có nghĩa là bắt đầu tại đường `1` và kết thúc tại đường `3`.

{{EmbedLiveSample('grid-placement_1', '100%', "230") }}

> [!NOTE]
> Bạn cũng có thể sử dụng giá trị `-1` để nhắm đến đường cột hoặc hàng cuối, sau đó đếm vào trong từ cuối bằng cách sử dụng các giá trị âm. Cũng lưu ý rằng các đường luôn đếm từ các cạnh của lưới tường minh, không phải [lưới ngầm định](/en-US/docs/Glossary/Grid).

## Định vị với grid-template-areas

Một cách khác để sắp xếp các mục trên lưới của bạn là sử dụng thuộc tính {{cssxref("grid-template-areas")}} và đặt tên cho các phần tử khác nhau trong thiết kế của bạn.

```html hidden live-sample___grid-placement_2
<div class="container">
  <header>Header</header>
  <main>
    <h1>Main</h1>
    <p>Main content…</p>
  </main>
  <aside>
    <h2>Aside</h2>
    <p>Related content</p>
  </aside>
  <footer>footer</footer>
</div>
```

```css hidden live-sample___grid-placement_2
.container {
  font-family: sans-serif;
  display: grid;
  grid-template-columns: 1fr 3fr;
  gap: 20px;
}
header,
footer {
  border-radius: 5px;
  padding: 10px;
  background-color: rebeccapurple;
  color: whitesmoke;
  text-align: center;
}
aside {
  border-right: 1px solid rebeccapurple;
}
```

```css live-sample___grid-placement_2
.container {
  display: grid;
  grid-template-areas:
    "header header"
    "sidebar content"
    "footer footer";
  grid-template-columns: 1fr 3fr;
  gap: 20px;
}
header {
  grid-area: header;
}
main {
  grid-area: content;
}
aside {
  grid-area: sidebar;
}
footer {
  grid-area: footer;
}
```

Ở đây chúng ta sử dụng thuộc tính {{CSSXRef("grid-template-areas")}} để xác định cách 3 hàng được sắp xếp. Hàng đầu tiên có giá trị `header header`, hàng thứ hai `sidebar content` và hàng thứ ba `footer footer`. Sau đó, chúng ta sử dụng thuộc tính {{CSSXRef("grid-area")}} để xác định nơi các phần tử được đặt trong `grid-template-areas`.

{{EmbedLiveSample('grid-placement_2', '100%', "230") }}

Các quy tắc cho `grid-template-areas` như sau:

- Bạn cần phải có mọi ô của lưới được điền.
- Để kéo dài qua hai ô, hãy lặp lại tên.
- Để để trống một ô, hãy sử dụng `.` (dấu chấm).
- Các vùng phải là hình chữ nhật — ví dụ: bạn không thể có vùng hình chữ L.
- Các vùng không thể lặp lại ở các vị trí khác nhau.

Bạn có thể thử nghiệm với bố cục của mình, thay đổi chân trang để chỉ nằm bên dưới bài viết và thanh bên để kéo dài toàn bộ phía xuống. Đây là một cách mô tả bố cục rất đẹp vì chỉ nhìn vào CSS là rõ ràng ngay điều gì đang xảy ra.

## Lưới lồng nhau và lưới con

Có thể lồng lưới trong một lưới khác, tạo ra ["lưới con"](/en-US/docs/Web/CSS/Guides/Grid_layout/Subgrid).
Bạn có thể làm điều này bằng cách đặt thuộc tính `display: grid` trên một mục trong lưới cha.

Hãy mở rộng ví dụ trước bằng cách thêm vùng chứa cho các bài viết và sử dụng lưới lồng nhau để kiểm soát bố cục của nhiều bài viết.
Mặc dù chúng ta chỉ sử dụng một cột trong lưới lồng nhau, chúng ta có thể xác định các hàng được chia theo tỷ lệ 4:3:3 bằng cách sử dụng thuộc tính `grid-template-rows`.
Cách tiếp cận này cho phép chúng ta tạo bố cục trong đó một bài viết ở đầu trang có màn hình lớn, trong khi các bài viết khác có bố cục nhỏ hơn, giống như xem trước.

```html hidden live-sample___nesting-grids
<div class="container">
  <header>Header</header>
  <main>
    <article>
      <h1>Article one</h1>
      <p>Content…</p>
    </article>
    <article>
      <h1>Article two</h1>
      <p>Content…</p>
    </article>
    <article>
      <h1>Article three</h1>
      <p>Content…</p>
    </article>
  </main>
  <aside>
    <h2>Aside</h2>
    <p>Related content</p>
  </aside>
  <footer>footer</footer>
</div>
```

```css hidden live-sample___nesting-grids
.container {
  font-family: sans-serif;
  display: grid;
  grid-template-columns: 1fr 3fr;
  gap: 20px;
}
header,
footer {
  border-radius: 5px;
  padding: 10px;
  background-color: rebeccapurple;
  color: whitesmoke;
  text-align: center;
}
header {
  grid-area: header;
}
aside {
  border-right: 1px solid rebeccapurple;
  grid-area: sidebar;
}
footer {
  grid-area: footer;
}
.container {
  display: grid;
  grid-template-areas:
    "header header"
    "sidebar content"
    "footer footer";
  grid-template-columns: 1fr 3fr;
  gap: 20px;
}
```

```css live-sample___nesting-grids
main {
  grid-area: content;
  display: grid;
  grid-template-rows: 4fr 3fr 3fr;
  gap: inherit;
}
article {
  padding: 10px;
  border: 2px solid rebeccapurple;
  border-radius: 5px;
}
```

{{EmbedLiveSample('nesting-grids', '100%', 560)}}

Để làm cho việc làm việc với các bố cục trong lưới lồng nhau dễ dàng hơn, bạn có thể sử dụng `subgrid` trên các thuộc tính `grid-template-rows` và `grid-template-columns`. Điều này cho phép bạn tận dụng các track được xác định trong lưới cha.

Trong ví dụ sau, chúng ta đang sử dụng [định vị dựa trên đường](#line-based_placement), cho phép lưới lồng nhau trải dài nhiều cột và hàng của lưới cha.
Chúng ta đã thêm `subgrid` để kế thừa các track cột của lưới cha trong khi thêm bố cục khác cho các hàng trong lưới lồng nhau.

```html hidden live-sample___subgrid
<div class="container">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div class="subgrid">
    <div>Five</div>
    <div>Six</div>
    <div>Seven</div>
    <div>Eight</div>
  </div>
  <div>Nine</div>
  <div>Ten</div>
</div>
```

```css hidden live-sample___subgrid
.container {
  font-family: sans-serif;
}
.container div {
  border-radius: 5px;
  padding: 10px;
  background-color: rebeccapurple;
  border: 1px solid white;
  color: white;
}
```

```css live-sample___subgrid
.container {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-template-rows: repeat(1, 1fr);
  gap: 10px;
}
.subgrid {
  grid-column: 1 / 4;
  grid-row: 2 / 4;
  display: grid;
  gap: inherit;
  grid-template-columns: subgrid;
  grid-template-rows: 2fr 1fr;
}
```

{{ EmbedLiveSample('subgrid', '100%', 200) }}

## Khung lưới

Nhiều khung lưới có sẵn — đây là các hệ thống CSS dựng sẵn
cung cấp các tính năng như lưới 12 hoặc 16 cột, lớp tiện ích cho khoảng cách và căn chỉnh, và
thiết kế responsive thông qua các điểm ngắt.

Tin tốt là bạn có thể sẽ không cần bất kỳ giải pháp độc quyền nào để tạo bố cục dựa trên lưới — tất cả các trình duyệt hiện đại đều hỗ trợ tiêu chuẩn CSS grid.

Ví dụ sau đây cho thấy một phiên bản đơn giản hóa của mã như vậy có thể trông như thế nào. Nó có một vùng chứa với lưới 12 cột được xác định, sử dụng `grid-template-columns: repeat(12, 1fr);`, và cùng đánh dấu chúng ta đã sử dụng trong hai ví dụ trước. Bây giờ chúng ta có thể sử dụng định vị dựa trên đường để đặt nội dung của chúng ta trên lưới 12 cột.

```html hidden live-sample___grid-frameworks
<div class="container">
  <header>Header</header>
  <main>
    <h1>Main</h1>
    <p>Main content…</p>
  </main>
  <aside>
    <h2>Aside</h2>
    <p>Related content</p>
  </aside>
  <footer>footer</footer>
</div>
```

```css hidden live-sample___grid-frameworks
.container {
  font-family: sans-serif;
}

header,
footer {
  border-radius: 5px;
  padding: 10px;
  background-color: rebeccapurple;
  color: whitesmoke;
  text-align: center;
}
aside {
  border-right: 1px solid rebeccapurple;
}
```

```css live-sample___grid-frameworks
.container {
  font-family: sans-serif;
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 20px;
}
header {
  grid-column: 1 / 13;
  grid-row: 1;
}
main {
  grid-column: 4 / 13;
  grid-row: 2;
}
aside {
  grid-column: 1 / 4;
  grid-row: 2;
}
footer {
  grid-column: 1 / 13;
  grid-row: 3;
}
```

{{EmbedLiveSample('grid-frameworks', '100%', "230") }}

Nếu bạn sử dụng [Firefox grid inspector](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/examine_grid_layouts/index.html) để phủ lưới trên thiết kế của bạn, bạn có thể thấy cách lưới 12 cột của chúng ta hoạt động.

![Lưới 12 cột phủ lên thiết kế của chúng ta.](learn-grids-inspector.png)

## Tóm tắt

Trong tổng quan này, chúng ta đã tham quan các tính năng chính của bố cục lưới CSS. Bạn nên có thể bắt đầu sử dụng nó trong các thiết kế của mình.

Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra để kiểm tra mức độ hiểu và ghi nhớ tất cả thông tin này của bạn.

## Xem thêm

- [Bố cục lưới CSS](/en-US/docs/Web/CSS/Guides/Grid_layout)
  - : Trang mô-đun bố cục lưới CSS chính, chứa nhiều tài nguyên hơn nữa.
- [Hướng dẫn bố cục lưới CSS](https://css-tricks.com/complete-guide-css-grid-layout/)
  - : Hướng dẫn trực quan trên CSS-Tricks (2021).
- [Grid Garden](https://cssgridgarden.com/)
  - : Trò chơi giáo dục để học và hiểu rõ hơn về những kiến thức cơ bản về lưới trên cssgridgarden.com.

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Test_your_skills/Flexbox", "Learn_web_development/Core/CSS_layout/Test_your_skills/Grid", "Learn_web_development/Core/CSS_layout")}}
