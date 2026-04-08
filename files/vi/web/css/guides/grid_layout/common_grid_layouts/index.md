---
title: Realizing common layouts using grids
short-title: Common grid layouts
slug: Web/CSS/Guides/Grid_layout/Common_grid_layouts
page-type: guide
sidebar: cssref
---

Để kết thúc [bộ hướng dẫn CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout#guides) này, chúng ta sẽ đi qua một vài layout khác nhau, trình bày một số kỹ thuật bạn có thể sử dụng khi thiết kế với grid layout. Chúng ta sẽ xem xét một ví dụ sử dụng {{cssxref("grid-template-areas")}}, một hệ thống grid 12 cột linh hoạt, và cũng là danh sách sản phẩm sử dụng auto-placement. Như bạn có thể thấy từ bộ ví dụ này, thường có nhiều hơn một cách để đạt được kết quả bạn muốn với CSS grid layout. Hãy chọn phương pháp bạn thấy hữu ích nhất cho các vấn đề bạn đang giải quyết và các thiết kế bạn cần triển khai.

## Layout responsive với 1 đến 3 cột linh hoạt sử dụng `grid-template-areas`

Nhiều trang web là biến thể của loại layout này, với nội dung, sidebar, header và footer. Trong thiết kế responsive, bạn có thể muốn hiển thị layout như một cột đơn, thêm sidebar tại một breakpoint nhất định và sau đó đưa vào layout ba cột cho màn hình rộng hơn.

![ba layout khác nhau được tạo bằng cách xác định lại grid tại hai breakpoint.](11-responsive-areas.png)

Chúng ta sẽ tạo layout này bằng cách sử dụng _named template areas_ mà chúng ta đã học trong hướng dẫn [Grid template areas](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas).

Markup là một container với các phần tử bên trong cho header, footer, nội dung chính, điều hướng, sidebar, và một khối để đặt quảng cáo.

```css hidden
* {
  box-sizing: border-box;
}
.wrapper {
  max-width: 1024px;
  margin: 0 auto;
  font:
    1.2em "Helvetica",
    "Arial",
    sans-serif;
}

.wrapper > * {
  border: 2px solid #f08c00;
  background-color: #ffec99;
  border-radius: 5px;
  padding: 10px;
}

nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
```

```html
<div class="wrapper">
  <header class="main-head">The header</header>
  <nav class="main-nav">
    <ul>
      <li><a href="">Nav 1</a></li>
      <li><a href="">Nav 2</a></li>
      <li><a href="">Nav 3</a></li>
    </ul>
  </nav>
  <article class="content">
    <h1>Main article area</h1>
    <p>
      In this layout, we display the areas in source order for any screen less
      that 500 pixels wide. We go to a two column layout, and then to a three
      column layout by redefining the grid, and the placement of items on the
      grid.
    </p>
  </article>
  <aside class="side">Sidebar</aside>
  <div class="ad">Advertising</div>
  <footer class="main-footer">The footer</footer>
</div>
```

Vì chúng ta sử dụng {{cssxref("grid-template-areas")}} để tạo layout, chúng ta cần đặt tên cho các vùng bên ngoài bất kỳ [media query](/en-US/docs/Web/CSS/Guides/Media_queries) nào. Chúng ta đặt tên cho các vùng bằng thuộc tính {{cssxref("grid-area")}}.

```css
.main-head {
  grid-area: header;
}
.content {
  grid-area: content;
}
.main-nav {
  grid-area: nav;
}
.side {
  grid-area: sidebar;
}
.ad {
  grid-area: ad;
}
.main-footer {
  grid-area: footer;
}
```

Điều này không tạo ra layout. Thay vào đó, các mục hiện có tên mà chúng ta có thể sử dụng để làm như vậy. Ở ngoài bất kỳ media query nào, chúng ta sẽ thiết lập layout cho chiều rộng mobile. Ở đây chúng ta giữ mọi thứ theo thứ tự nguồn để tránh bất kỳ sự ngắt kết nối nào giữa nguồn và hiển thị như được mô tả trong hướng dẫn [Grid layout và accessibility](/en-US/docs/Web/CSS/Guides/Grid_layout/Accessibility). Chúng ta không xác định rõ ràng bất kỳ column hay row track nào; layout này chỉ định một cột và tạo các hàng khi cần thiết cho mỗi mục trong implicit grid.

```css
.wrapper {
  display: grid;
  gap: 20px;
  grid-template-areas:
    "header"
    "nav"
    "content"
    "sidebar"
    "ad"
    "footer";
}
```

Với layout mobile tại chỗ, chúng ta có thể tiến hành thêm một {{cssxref("@media")}} query để thích nghi layout này cho màn hình lớn hơn với đủ không gian thực để hiển thị hai cột.

```css
@media (width >= 500px) {
  .wrapper {
    grid-template-columns: 1fr 3fr;
    grid-template-areas:
      "header  header"
      "nav     nav"
      "sidebar content"
      "ad      footer";
  }
  nav ul {
    display: flex;
    justify-content: space-between;
  }
}
```

Bạn có thể thấy layout định hình trong giá trị của {{cssxref("grid-template-areas")}}. `header` trải qua hai column track, cũng như `nav`. Trong row track thứ ba, chúng ta đặt `sidebar` cạnh `content`. Chúng ta đặt nội dung `ad` trong row track thứ tư nên nó xuất hiện dưới sidebar. `footer` ở cạnh nó dưới content. Chúng ta sử dụng [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) cho navigation để phân phối đều các mục navigation trong một hàng.

Bây giờ chúng ta có thể thêm một breakpoint cuối cùng cho màn hình rộng hơn có thể hiển thị layout ba cột.

```css
@media (width >= 700px) {
  .wrapper {
    grid-template-columns: 1fr 4fr 1fr;
    grid-template-areas:
      "header header  header"
      "nav    content sidebar"
      "nav    content ad"
      "footer footer  footer";
  }
  nav ul {
    flex-direction: column;
  }
}
```

Layout ba cột có hai cột phía bên với đơn vị `1fr` và cột giữa có `4fr` là kích thước track. Điều này có nghĩa là không gian khả dụng trong container được chia thành sáu phần và giao theo tỷ lệ cho ba track của chúng ta – một phần cho mỗi cột bên và bốn phần cho cột giữa.

Trong layout này, chúng ta hiển thị `nav` trong cột trái, cạnh `content`. Trong cột phải, chúng ta có `sidebar` và bên dưới nó là các quảng cáo (`ad`). `footer` bây giờ trải qua toàn bộ phần dưới của layout. Một lần nữa, chúng ta sử dụng flexbox để hiển thị navigation, nhưng lần này chúng ta hiển thị nó như một cột thay vì một hàng.

{{ EmbedLiveSample('A_responsive_layout_with_1_to_3_fluid_columns_using_grid-template-areas', '800', '570') }}

Ví dụ cơ bản này minh họa cách sắp xếp lại một grid layout trên các breakpoint khác nhau. Đặc biệt, chúng ta đang thay đổi vị trí của khối `ad` cho phù hợp trong các cài đặt cột khác nhau. Phương pháp named areas này có thể rất hữu ích, đặc biệt ở giai đoạn tạo mẫu thử nghiệm. Bạn có thể thấy dễ dàng hơn khi sử dụng tên thay vì số khi thử nghiệm vị trí của các phần tử trên grid.

## Layout 12 cột linh hoạt

Các framework CSS và hệ thống grid thường sử dụng grid linh hoạt 12 hoặc 16 cột. Chúng ta có thể tạo loại hệ thống này bằng CSS grid layout. Ví dụ, hãy tạo một grid 12 cột linh hoạt với 12 column track `1fr`, mỗi track có đường bắt đầu được đặt tên là `col-start`. Điều này có nghĩa là chúng ta sẽ có mười hai grid line được đặt tên là `col-start`.

```css hidden
.wrapper {
  max-width: 1024px;
  margin: 0 auto;
  font:
    1.2em "Helvetica",
    "Arial",
    sans-serif;
}
.wrapper > * {
  border: 2px solid #f08c00;
  background-color: #ffec99;
  border-radius: 5px;
  padding: 10px;
}
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(12, [col-start] 1fr);
  gap: 20px;
}
```

Để minh họa cách hệ thống grid này hoạt động, chúng ta có bốn phần tử con bên trong một wrapper.

```html
<div class="wrapper">
  <div class="item1">Start column line 1, span 3 column tracks.</div>
  <div class="item2">
    Start column line 6, span 4 column tracks. 2 row tracks.
  </div>
  <div class="item3">Start row 2 column line 2, span 2 column tracks.</div>
  <div class="item4">
    Start at column line 3, span to the end of the grid (-1).
  </div>
</div>
```

Sau đó chúng ta có thể đặt chúng lên grid bằng cách sử dụng các named line, và cũng với từ khóa `span`.

```css
.item1 {
  grid-column: col-start / span 3;
}
.item2 {
  grid-column: col-start 6 / span 4;
  grid-row: 1 / 3;
}
.item3 {
  grid-column: col-start 2 / span 2;
  grid-row: 2;
}
.item4 {
  grid-column: col-start 3 / -1;
  grid-row: 3;
}
```

{{ EmbedLiveSample('A_flexible_12-column_layout', '800', '400') }}

Như được mô tả trong [hướng dẫn sử dụng named grid lines](/en-US/docs/Web/CSS/Guides/Grid_layout/Named_grid_lines), chúng ta đang sử dụng các named line để đặt các mục. Vì chúng ta có 12 đường tất cả có cùng tên, chúng ta sử dụng tên và chỉ số của đường. Nếu bạn muốn, bạn có thể sử dụng chỉ số đường và tránh sử dụng named line.

Thay vì đặt số đường kết thúc, chúng ta xác định số track mà phần tử này nên trải qua bằng từ khóa `span`. Khi làm việc với hệ thống layout nhiều cột, phương pháp này có thể trực quan hơn cho những người nghĩ về các khối theo số lượng track của grid mà chúng trải qua, sau đó điều chỉnh cho các breakpoint khác nhau. Để xem cách các khối căn chỉnh với các track, hãy sử dụng grid inspector trong công cụ phát triển của trình duyệt; nó có thể minh họa rõ ràng cách các mục được đặt.

![Hiển thị các mục được đặt lên grid với grid track được tô sáng trong Firefox developer tools.](11-grid-inspector-12col.png)

Chúng ta không cần thêm bất kỳ markup nào để tạo một hàng. Các hệ thống grid framework CSS thường làm điều này để ngăn các phần tử xuất hiện vào hàng phía trên đối với các trình duyệt không hỗ trợ CSS grid layout. Tuy nhiên, điều này hiện không còn cần thiết nữa – tất cả các trình duyệt hiện đại đã hỗ trợ CSS grid layout trong một thời gian dài. CSS grid cho phép chúng ta đặt các mục vào các hàng mà không có nguy cơ chúng bị đẩy lên hàng trên nếu nó bị để trống. Do việc đặt cột và hàng _nghiêm ngặt_ này, chúng ta cũng có thể dễ dàng để lại khoảng trắng trong layout. Chúng ta cũng không cần các class đặc biệt để thụt lề các mục vào grid. Tất cả những gì chúng ta cần làm là chỉ định đường bắt đầu và kết thúc cho mục.

## Xây dựng layout sử dụng hệ thống 12 cột

Để xem cách phương pháp layout này hoạt động trong thực tế, chúng ta có thể tạo layout tương tự mà chúng ta đã tạo với {{cssxref("grid-template-areas")}}, lần này sử dụng hệ thống grid 12 cột. Hãy bắt đầu với cùng markup như đã sử dụng cho ví dụ grid template areas.

```css hidden
* {
  box-sizing: border-box;
}
.wrapper {
  max-width: 1024px;
  margin: 0 auto;
  font:
    1.2em "Helvetica",
    "Arial",
    sans-serif;
}

.wrapper > * {
  border: 2px solid #f08c00;
  background-color: #ffec99;
  border-radius: 5px;
  padding: 10px;
}

nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
```

```html
<div class="wrapper">
  <header class="main-head">The header</header>
  <nav class="main-nav">
    <ul>
      <li><a href="">Nav 1</a></li>
      <li><a href="">Nav 2</a></li>
      <li><a href="">Nav 3</a></li>
    </ul>
  </nav>
  <article class="content">
    <h1>Main article area</h1>
    <p>
      In this layout, we display the areas in source order for any screen less
      that 500 pixels wide. We go to a two column layout, and then to a three
      column layout by redefining the grid, and the placement of items on the
      grid.
    </p>
  </article>
  <aside class="side">Sidebar</aside>
  <div class="ad">Advertising</div>
  <footer class="main-footer">The footer</footer>
</div>
```

Chúng ta thiết lập grid như chúng ta đã làm cho ví dụ layout 12 cột ở trên.

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(12, [col-start] 1fr);
  gap: 20px;
}
```

Chúng ta sẽ một lần nữa biến layout này thành responsive, lần này sử dụng named line. Mỗi breakpoint sẽ sử dụng grid 12 cột. Tuy nhiên, số track mà các mục trải qua sẽ thay đổi tùy thuộc vào kích thước màn hình.

Chúng ta bắt đầu với {{glossary("mobile first")}}. Đối với màn hình hẹp nhất, chúng ta muốn các mục giữ nguyên thứ tự nguồn và tất cả trải qua toàn bộ grid.

```css
.wrapper > * {
  grid-column: col-start / span 12;
}
```

Tại breakpoint tiếp theo, chúng ta muốn layout hai cột. Header và navigation của chúng ta vẫn trải qua toàn grid, vì vậy chúng ta không cần chỉ định bất kỳ vị trí nào cho chúng. Sidebar bắt đầu trên đường cột đầu tiên tên là `col-start`, trải qua 3 đường. Nó đi sau row line 3, vì header và navigation nằm trong hai row track đầu tiên.

Panel `ad` nằm dưới sidebar, bắt đầu ở grid row line 4. Sau đó chúng ta có content và footer bắt đầu tại col-start 4 và trải qua chín track, đưa cả hai đến cuối grid.

```css
@media (width >= 500px) {
  .side {
    grid-column: col-start / span 3;
    grid-row: 3;
  }
  .ad {
    grid-column: col-start / span 3;
    grid-row: 4;
  }
  .content,
  .main-footer {
    grid-column: col-start 4 / span 9;
  }
  nav ul {
    display: flex;
    justify-content: space-between;
  }
}
```

Cuối cùng, đối với màn hình lớn hơn breakpoint lớn nhất của chúng ta, chúng ta xác định phiên bản ba cột của layout này. Header tiếp tục trải qua toàn grid, nhưng navigation bây giờ di chuyển xuống để trở thành sidebar đầu tiên, với content và sau đó là sidebar bên cạnh nó. Footer bây giờ cũng trải qua toàn layout.

```css
@media (width >= 700px) {
  .main-nav {
    grid-column: col-start / span 2;
    grid-row: 2 / 4;
  }
  .content {
    grid-column: col-start 3 / span 8;
    grid-row: 2 / 4;
  }
  .side {
    grid-column: col-start 11 / span 2;
    grid-row: 2;
  }
  .ad {
    grid-column: col-start 11 / span 2;
    grid-row: 3;
  }
  .main-footer {
    grid-column: col-start / span 12;
  }
  nav ul {
    flex-direction: column;
  }
}
```

{{ EmbedLiveSample('Building_a_layout_using_the_12-column_system', '800', '570') }}

Một lần nữa, hãy kiểm tra grid inspector trong công cụ phát triển của trình duyệt để xem layout đã định hình như thế nào.

![Hiển thị layout với grid track được tô sáng bởi grid inspector.](11-grid-inspector-12col-layout.png)

Một điều đáng chú ý khi chúng ta tạo layout này là chúng ta không cần đặt rõ ràng mọi phần tử trên grid tại mỗi breakpoint. Chúng ta đã kế thừa vị trí được thiết lập cho các breakpoint trước – lợi thế của việc làm việc theo cách "mobile first". Chúng ta cũng tận dụng grid auto-placement. Bằng cách giữ các phần tử theo thứ tự logic, auto-placement thực hiện khá nhiều công việc cho chúng ta trong việc đặt các mục lên grid.

## Danh sách sản phẩm với auto-placement

Trong ví dụ cuối cùng trong hướng dẫn này, chúng ta tạo một layout hoàn toàn dựa vào auto-placement.

Nhiều layout về cơ bản là các tập hợp "thẻ" – danh sách sản phẩm, thư viện hình ảnh, v.v. Một grid cho phép tạo ra các danh sách này theo cách responsive mà không cần thêm [media query](/en-US/docs/Web/CSS/Guides/Media_queries). Trong ví dụ này, chúng ta kết hợp CSS grid và flexbox layout để tạo một layout danh sách sản phẩm cơ bản.

Markup cho danh sách là một danh sách không có thứ tự các mục. Mỗi mục chứa một tiêu đề, một số văn bản có chiều cao khác nhau, và một liên kết kêu gọi hành động.

```html
<ul class="listing">
  <li>
    <h2>Item One</h2>
    <div class="body">
      <p>The content of this listing item goes here.</p>
    </div>
    <div class="cta">
      <a href="">Call to action!</a>
    </div>
  </li>
  <li>
    <h2>Item Two</h2>
    <div class="body">
      <p>The content of this listing item goes here.</p>
    </div>
    <div class="cta">
      <a href="">Call to action!</a>
    </div>
  </li>
  <li class="wide">
    <h2>Item Three</h2>
    <div class="body">
      <p>The content of this listing item goes here.</p>
      <p>This one has more text than the other items.</p>
      <p>Quite a lot more</p>
      <p>Perhaps we could do something different with it?</p>
    </div>
    <div class="cta">
      <a href="">Call to action!</a>
    </div>
  </li>
  <li>
    <h2>Item Four</h2>
    <div class="body">
      <p>The content of this listing item goes here.</p>
    </div>
    <div class="cta">
      <a href="">Call to action!</a>
    </div>
  </li>
  <li>
    <h2>Item Five</h2>
    <div class="body">
      <p>The content of this listing item goes here.</p>
    </div>
    <div class="cta">
      <a href="">Call to action!</a>
    </div>
  </li>
</ul>
```

```css hidden
* {
  box-sizing: border-box;
}
img {
  max-width: 100%;
  display: block;
}
body {
  font:
    1.2em "Helvetica",
    "Arial",
    sans-serif;
}
a:link,
a:visited {
  text-decoration: none;
  color: #f08c00;
}

h2 {
  background-color: #f08c00;
  color: white;
  text-align: center;
  margin: 0;
  padding: 20px;
}
```

Chúng ta tạo một grid với số lượng cột linh hoạt. Chúng ta muốn chúng rộng tối thiểu 200 pixel và chia sẻ đều bất kỳ không gian còn lại – vì vậy chúng ta luôn nhận được các column track có chiều rộng bằng nhau. Chúng ta đạt được điều này với hàm {{cssxref("minmax()")}} trong ký hiệu {{cssxref("repeat")}} của chúng ta để kích thước track.

```css
.listing {
  list-style: none;
  margin: 2em;
  display: grid;
  gap: 20px;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
}
```

Khi chúng ta thêm CSS này, các mục sẽ được bố trí như một grid. Nếu chúng ta thu nhỏ hoặc mở rộng cửa sổ, số column track sẽ thay đổi – mà không cần media query thêm breakpoint và không cần xác định lại grid.

Chúng ta có thể dọn dẹp bên trong các hộp bằng cách sử dụng một chút flexbox. Chúng ta đặt list item thành `display: flex` và {{cssxref("flex-direction")}} thành `column`. Sau đó chúng ta có thể sử dụng auto margin trên `.cta` để đẩy thanh này xuống cuối hộp.

```css
.listing li {
  border: 1px solid #ffe066;
  border-radius: 5px;
  display: flex;
  flex-direction: column;
}
.listing .cta {
  margin-block-start: auto;
  border-block-start: 1px solid #ffe066;
  padding: 10px;
  text-align: center;
}
.listing .body {
  padding: 10px;
}
```

Đây là một trong những lý do chính để sử dụng flexbox thay vì CSS grid layout. Nếu bạn đang căn chỉnh hoặc phân phối nội dung trong một chiều duy nhất, đó là trường hợp sử dụng cho flexbox.

{{ EmbedLiveSample('A_product_listing_with_auto-placement', '800', '900') }}

## Ngăn chặn khoảng trống với từ khóa dense

Tất cả điều này đang trông khá hoàn chỉnh. Tuy nhiên, đôi khi chúng ta có các thẻ chứa nhiều nội dung hơn các thẻ khác. Có thể sẽ tốt nếu những thẻ đó trải qua hai track, thì chúng sẽ không cao đến vậy. Chúng ta thêm class `wide` trên mục lớn hơn, và thêm một quy tắc cho nó với {{cssxref("grid-column-end")}} có giá trị là `span 2`. Khi mục này được gặp, nó sẽ được giao cho hai track. Điều này có nghĩa là, tại một số breakpoint, chúng ta sẽ nhận được một khoảng trống trong grid – nơi không có đủ không gian để bố trí một mục hai track.

![Layout có khoảng trống vì không có chỗ để bố trí một mục hai track.](11-grid-auto-flow-sparse.png)

Chúng ta có thể làm grid lấp đầy các khoảng trống đó bằng cách đặt {{cssxref("grid-auto-flow", "grid-auto-flow: dense")}} trên grid container. Hãy cẩn thận khi làm điều này vì nó có thể khiến các mục bị lấy ra khỏi thứ tự nguồn logic của chúng. Bạn chỉ nên làm điều này nếu các mục của bạn không có thứ tự đặt. Ngoài ra, hãy lưu ý về các [vấn đề accessibility và sắp xếp lại](/en-US/docs/Web/CSS/Guides/Grid_layout/Accessibility#visual_not_logical_re-ordering) kết quả từ thứ tự tab theo nguồn và không phải theo hiển thị được sắp xếp lại của bạn.

```html hidden
<ul class="listing">
  <li>
    <h2>Item One</h2>
    <div class="body"><p>The content of this listing item goes here.</p></div>
    <div class="cta"><a href="">Call to action!</a></div>
  </li>
  <li>
    <h2>Item Two</h2>
    <div class="body"><p>The content of this listing item goes here.</p></div>
    <div class="cta"><a href="">Call to action!</a></div>
  </li>
  <li class="wide">
    <h2>Item Three</h2>
    <div class="body">
      <p>The content of this listing item goes here.</p>
      <p>This one has more text than the other items.</p>
      <p>Quite a lot more</p>
      <p>Perhaps we could do something different with it?</p>
    </div>
    <div class="cta"><a href="">Call to action!</a></div>
  </li>
  <li>
    <h2>Item Four</h2>
    <div class="body"><p>The content of this listing item goes here.</p></div>
    <div class="cta"><a href="">Call to action!</a></div>
  </li>
  <li>
    <h2>Item Five</h2>
    <div class="body"><p>The content of this listing item goes here.</p></div>
    <div class="cta"><a href="">Call to action!</a></div>
  </li>
</ul>
```

```css hidden
* {
  box-sizing: border-box;
}
img {
  max-width: 100%;
  display: block;
}
body {
  font:
    1.2em "Helvetica",
    "Arial",
    sans-serif;
}
a:link,
a:visited {
  text-decoration: none;
  color: #f08c00;
}

h2 {
  background-color: #f08c00;
  color: white;
  text-align: center;
  margin: 0;
  padding: 20px;
}

.listing li {
  border: 1px solid #ffe066;
  border-radius: 5px;
  display: flex;
  flex-direction: column;
}
.listing .cta {
  margin-block-start: auto;
  border-block-start: 1px solid #ffe066;
  padding: 10px;
  text-align: center;
}
.listing .body {
  padding: 10px;
}
```

```css
.listing {
  list-style: none;
  margin: 2em;
  display: grid;
  gap: 20px;
  grid-auto-flow: dense;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
}
.listing .wide {
  grid-column-end: span 2;
}
```

{{ EmbedLiveSample('Preventing_gaps_with_the_dense_keyword', '800', '900') }}

Sử dụng auto-placement với một số quy tắc được áp dụng cho các mục nhất định rất hữu ích và có thể giúp với nội dung bạn không thể kiểm soát, chẳng hạn như đầu ra CMS, nơi bạn có các mục lặp lại và có thể sử dụng [structural pseudo-classes](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#tree-structural_pseudo-classes) để nhắm mục tiêu chúng.

## Khám phá thêm

CSS grid layout cung cấp rất nhiều khả năng. Cách tốt nhất để học sử dụng grid layout là tiếp tục xây dựng các ví dụ như những ví dụ chúng ta đã trình bày ở đây. Hãy chọn một layout từ một trang web responsive bạn thích và xem bạn có thể xây dựng nó bằng grid không. Bạn thậm chí có thể lấy cảm hứng từ tạp chí hoặc các nguồn phi web khác.

- [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
- [CSS Layout: Grids](/en-US/docs/Learn_web_development/Core/CSS_layout/Grids)
- [CSS grid layout guide](https://css-tricks.com/complete-guide-css-grid-layout/) on CSS-Tricks (2021)
- [Grid by example](https://gridbyexample.com/)
- [CSS grid website layout examples](https://www.quackit.com/css/grid/examples/css_grid_website_layout_examples.cfm) on quackit.com
