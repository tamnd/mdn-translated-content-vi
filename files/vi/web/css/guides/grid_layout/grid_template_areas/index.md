---
title: Grid template areas
slug: Web/CSS/Guides/Grid_layout/Grid_template_areas
page-type: guide
sidebar: cssref
---

Trong [hướng dẫn grid layout sử dụng line-based placement](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement), chúng ta đã xem xét grid line và cách định vị các mục theo các đường đó. Khi bạn sử dụng CSS grid layout, bạn luôn có các đường, và đây có thể là một cách đơn giản để đặt các mục lên grid. Tuy nhiên, có một phương pháp thay thế để sử dụng cho việc định vị các mục trên grid mà bạn có thể dùng một mình hoặc kết hợp với line-based placement. Phương pháp này liên quan đến việc đặt các mục bằng cách sử dụng named template area. Bạn sẽ nhanh chóng thấy tại sao đôi khi chúng ta gọi đây là phương pháp ascii-art của grid layout!

## Đặt tên cho một grid area

Bạn đã gặp thuộc tính {{cssxref("grid-area")}}. Đây là thuộc tính có thể nhận như một giá trị tất cả bốn đường được sử dụng để định vị một grid area.

```css
.box1 {
  grid-area: 1 / 1 / 4 / 2;
}
```

Những gì chúng ta đang làm ở đây khi định nghĩa tất cả bốn đường, là xác định vùng bằng cách chỉ định các đường bao quanh vùng đó.

![Grid area được xác định bởi các đường](4_area.png)

Chúng ta cũng có thể định nghĩa một vùng bằng cách đặt tên cho nó và sau đó chỉ định vị trí của vùng đó trong giá trị của thuộc tính {{cssxref("grid-template-areas")}}. Bạn có thể chọn tên bạn muốn cho vùng của mình. Ví dụ, nếu chúng ta muốn tạo layout được hiển thị bên dưới, chúng ta có thể xác định bốn vùng chính.

- một header
- một footer
- một sidebar
- nội dung chính

![Hình ảnh hiển thị layout hai cột với header và footer](4_layout.png)

Với thuộc tính {{cssxref("grid-area")}}, chúng ta có thể gán một tên cho mỗi vùng này. Bản thân điều này không tạo ra layout nào. Thay vào đó, nó cung cấp các vùng được đặt tên để sử dụng trong layout.

```css
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
```

Sau khi định nghĩa các tên này, chúng ta tạo layout. Lần này, thay vì đặt các mục bằng số đường được chỉ định trên chính các mục, chúng ta tạo toàn bộ layout trên grid container. Ở đây chúng ta tạo một grid 9 cột và chỉ định rằng các vùng `hd` và `ft` trải qua tất cả 9 cột, trong khi `sd` trải qua ba và `main` trải qua sáu. Mỗi vùng chỉ trải qua một hàng.

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
```

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
  max-width: 940px;
  margin: 0 auto;
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
  <div class="header">Header</div>
  <div class="sidebar">Sidebar</div>
  <div class="content">Content</div>
  <div class="footer">Footer</div>
</div>
```

{{ EmbedLiveSample('Naming_a_grid_area', '300', '330') }}

Sử dụng phương pháp này, chúng ta không cần chỉ định bất cứ điều gì trên các grid item riêng lẻ; mọi thứ xảy ra trên grid container. Chúng ta có thể thấy layout được mô tả như giá trị của thuộc tính {{cssxref("grid-template-areas")}}.

## Để trống một ô grid

Chúng ta đã lấp đầy hoàn toàn grid với các vùng trong ví dụ này, không để lại khoảng trắng. Tuy nhiên, bạn có thể để các ô grid trống với phương pháp layout này. Để để trống một ô, hãy sử dụng ký tự dấu chấm, `.`. Nếu chúng ta chỉ muốn hiển thị footer trực tiếp dưới nội dung chính, chúng ta cần để trống ba ô bên dưới sidebar.

```css
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
```

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
  max-width: 940px;
  margin: 0 auto;
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
    ".  .  .  ft   ft   ft   ft   ft   ft";
}
```

```html
<div class="wrapper">
  <div class="header">Header</div>
  <div class="sidebar">Sidebar</div>
  <div class="content">Content</div>
  <div class="footer">Footer</div>
</div>
```

{{ EmbedLiveSample('Leaving_a_grid_cell_empty', '300', '330') }}

Để làm layout gọn gàng hơn, chúng ta có thể sử dụng nhiều ký tự `.`. Miễn là có ít nhất một khoảng trắng giữa các dấu chấm, nó sẽ được tính là một ô. Đối với layout phức tạp, có lợi ích khi có các hàng và cột được căn chỉnh gọn gàng. Điều đó có nghĩa là bạn thực sự có thể thấy, ngay trong CSS, layout này trông như thế nào.

## Trải qua nhiều ô

Trong ví dụ của chúng ta, mỗi vùng trải qua nhiều ô grid và chúng ta đạt được điều này bằng cách lặp lại tên của grid area đó nhiều lần với khoảng trắng giữa chúng. Bạn có thể thêm khoảng trắng thêm để giữ các cột được căn chỉnh gọn gàng trong giá trị của `grid-template-areas`. Bạn có thể thấy rằng chúng ta đã làm điều này để các vùng `hd` và `ft` căn chỉnh với `main`.

Vùng mà bạn tạo bằng cách nối các tên vùng phải là hình chữ nhật; ở thời điểm này không có cách nào để tạo một vùng hình chữ L. Đặc tả có lưu ý rằng một cấp độ tương lai có thể cung cấp tính năng này. Tuy nhiên, bạn có thể trải qua các hàng dễ dàng như cột. Ví dụ, chúng ta có thể làm sidebar trải dài xuống đến cuối footer bằng cách thay thế `.` bằng `sd`.

```css
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
```

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
  max-width: 940px;
  margin: 0 auto;
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
    "sd sd sd  ft  ft   ft   ft   ft   ft";
}
```

```html hidden
<div class="wrapper">
  <div class="header">Header</div>
  <div class="sidebar">Sidebar</div>
  <div class="content">Content</div>
  <div class="footer">Footer</div>
</div>
```

{{ EmbedLiveSample('Spanning_multiple_cells', '300', '330') }}

Giá trị của {{cssxref("grid-template-areas")}} phải hiển thị một grid hoàn chỉnh, nếu không nó không hợp lệ (và thuộc tính bị bỏ qua). Điều này có nghĩa là bạn phải có cùng số ô cho mỗi hàng, nếu trống thì dùng ký tự dấu chấm để thể hiện rằng ô đó bị để trống. Bạn cũng sẽ tạo ra một grid không hợp lệ nếu các vùng của bạn không phải hình chữ nhật.

## Xác định lại grid bằng media query

Vì layout của chúng ta bây giờ được chứa trong một phần của CSS, chúng ta có thể thực hiện các thay đổi cho các breakpoint khác nhau ở một vị trí trong codebase. Bạn có thể làm điều này bằng cách xác định lại grid, vị trí của các mục trên grid, hoặc cả hai cùng một lúc.

Khi làm điều này, hãy xác định tên cho các vùng của bạn bên ngoài bất kỳ media query nào. Bằng cách đó, vùng content sẽ luôn được gọi là `main` bất kể nó ở đâu trên grid.

Đối với layout của chúng ta ở trên, chúng ta có thể muốn có một layout rất cơ bản ở chiều rộng hẹp, xác định một grid một cột và xếp bốn mục của chúng ta thành bốn hàng.

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
  max-width: 940px;
  margin: 0 auto;
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

.wrapper {
  display: grid;
  grid-auto-rows: minmax(100px, auto);
  grid-template-columns: 1fr;
  grid-template-areas:
    "hd"
    "main"
    "sd"
    "ft";
}
```

Sau đó chúng ta có thể xác định lại layout đó bên trong [media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using) để chuyển sang layout hai cột, và có thể chuyển sang layout ba cột nếu không gian khả dụng rộng hơn. Lưu ý rằng đối với layout rộng, chúng ta giữ grid 9 cột, xác định lại vị trí các mục bằng cách sử dụng `grid-template-areas`.

```css
@media (width >= 30em) {
  .wrapper {
    grid-template-columns: repeat(9, 1fr);
    grid-template-areas:
      "hd hd hd hd   hd   hd   hd   hd   hd"
      "sd sd sd main main main main main main"
      "sd sd sd  ft  ft   ft   ft   ft   ft";
  }
}
@media (width >= 60em) {
  .wrapper {
    grid-template-areas:
      "hd hd hd   hd   hd   hd   hd   hd hd"
      "sd sd main main main main main ft ft";
  }
}
```

```html hidden
<div class="wrapper">
  <div class="header">Header</div>
  <div class="sidebar">Sidebar</div>
  <div class="content">Content</div>
  <div class="footer">Footer</div>
</div>
```

{{ EmbedLiveSample('Redefining_the_grid_using_media_queries', '550', '330') }}

## Sử dụng `grid-template-areas` cho các phần tử UI

Nhiều ví dụ grid bạn sẽ tìm thấy trực tuyến giả định bạn đang sử dụng grid cho toàn bộ page layout; tuy nhiên, grid có thể hữu ích như nhau để bố trí các phần nhỏ. Sử dụng {{cssxref("grid-template-areas")}} có thể đặc biệt tốt vì nó cho phép bạn hình dung phần tử của mình trông như thế nào trong code.

### Ví dụ media object

Ví dụ, chúng ta có thể tạo một "[media object](/en-US/docs/Web/CSS/How_to/Layout_cookbook/Media_objects)". Đây là một component có không gian cho một hình ảnh hoặc phương tiện khác ở một phía và nội dung ở phía kia. Hình ảnh có thể được hiển thị ở bên phải hoặc bên trái của hộp.

![Hình ảnh hiển thị thiết kế media object mẫu](4_media_objects.png)

Grid của chúng ta là một grid hai column track, với cột cho hình ảnh có kích thước `1fr` và văn bản `3fr`. Nếu bạn muốn một vùng hình ảnh có chiều rộng cố định, thì bạn có thể đặt cột hình ảnh là chiều rộng pixel, và giao vùng văn bản `1fr`. Một column track `1fr` sẽ chiếm phần còn lại của không gian.

Chúng ta đặt vùng hình ảnh tên grid area là `img` và vùng văn bản là `content`, sau đó chúng ta có thể bố trí chúng bằng cách sử dụng thuộc tính `grid-template-areas`.

```css
* {
  box-sizing: border-box;
}

.media {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
  max-width: 400px;
  display: grid;
  grid-template-columns: 1fr 3fr;
  grid-template-areas: "img content";
  margin-bottom: 1em;
}

.media .image {
  grid-area: img;
  background-color: #ffd8a8;
}

.media .text {
  grid-area: content;
  padding: 10px;
}
```

```html
<div class="media">
  <div class="image"></div>
  <div class="text">
    This is a media object example. We can use grid-template-areas to switch
    around the image and text part of the media object.
  </div>
</div>
```

{{ EmbedLiveSample('Media_object_example', '300', '105') }}

### Hiển thị hình ảnh ở phía bên kia của hộp

Chúng ta có thể muốn hiển thị hộp của mình với hình ảnh ở chiều ngược lại. Để làm điều này, chúng ta xác định lại grid để đặt track `1fr` cuối cùng, và lật các giá trị trong {{cssxref("grid-template-areas")}}.

```css
* {
  box-sizing: border-box;
}

.media {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
  max-width: 400px;
  display: grid;
  grid-template-columns: 1fr 3fr;
  grid-template-areas: "img content";
  margin-bottom: 1em;
}

.media.flipped {
  grid-template-columns: 3fr 1fr;
  grid-template-areas: "content img";
}

.media .image {
  grid-area: img;
  background-color: #ffd8a8;
}

.media .text {
  grid-area: content;
  padding: 10px;
}
```

```html
<div class="media flipped">
  <div class="image"></div>
  <div class="text">
    This is a media object example. We can use grid-template-areas to switch
    around the image and text part of the media object.
  </div>
</div>
```

{{ EmbedLiveSample('Displaying_the_image_on_the_other_side_of_the_box', '300', '105') }}

## Shorthand định nghĩa grid

Sau khi xem qua nhiều cách khác nhau để đặt các mục trên grid và nhiều thuộc tính được sử dụng để định nghĩa grid, đây là thời điểm tốt để tìm hiểu một vài shorthand có sẵn để định nghĩa grid và nhiều thứ về nó trong một dòng CSS.

Chúng có thể nhanh chóng trở nên khó đọc đối với các nhà phát triển khác, hoặc thậm chí chính bạn trong tương lai. Tuy nhiên chúng là một phần của đặc tả và bạn có thể gặp chúng trong các ví dụ hoặc được các nhà phát triển khác sử dụng, ngay cả khi bạn chọn không sử dụng chúng.

Trước khi sử dụng bất kỳ shorthand nào, hãy nhớ rằng shorthand không chỉ cho phép đặt nhiều thuộc tính trong một lần, mà chúng còn **reset** mọi thứ bạn không (hoặc không thể) đặt trong shorthand về giá trị ban đầu của chúng. Do đó, nếu bạn sử dụng shorthand, hãy biết rằng nó có thể reset những thứ bạn đã áp dụng ở nơi khác.

Hai shorthand cho grid container là explicit grid shorthand {{cssxref("grid-template")}} và grid definition shorthand {{cssxref("grid")}}.

### `grid-template`

Thuộc tính shorthand {{cssxref("grid-template")}} đặt các longhand property sau:

- {{cssxref("grid-template-rows")}}
- {{cssxref("grid-template-columns")}}
- {{cssxref("grid-template-areas")}}

Thuộc tính này được gọi là _explicit grid shorthand_ vì nó đặt các giá trị bạn kiểm soát khi xác định một explicit grid, và không phải những giá trị ảnh hưởng đến bất kỳ implicit row hay column track nào có thể được tạo ra.

Code sau tạo một layout sử dụng {{cssxref("grid-template")}} giống với layout được tạo trước đó trong hướng dẫn này.

```css
.wrapper {
  display: grid;
  grid-template:
    "hd hd hd hd   hd   hd   hd   hd   hd" minmax(100px, auto)
    "sd sd sd main main main main main main" minmax(100px, auto)
    "ft ft ft ft   ft   ft   ft   ft   ft" minmax(100px, auto)
    / 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
}
```

Giá trị đầu tiên là giá trị `grid-template-areas` của chúng ta nhưng chúng ta cũng khai báo kích thước của hàng ở cuối mỗi hàng. Đây là những gì `minmax(100px, auto)` thực hiện.

Sau đó sau `grid-template-areas` chúng ta có một gạch chéo, sau đó là danh sách column track rõ ràng.

### `grid`

Shorthand {{cssxref("grid")}} đi xa hơn một bước và cũng đặt các thuộc tính được sử dụng bởi implicit grid. Vì vậy, bạn sẽ đặt:

- {{cssxref("grid-template-rows")}}
- {{cssxref("grid-template-columns")}}
- {{cssxref("grid-template-areas")}}
- {{cssxref("grid-auto-rows")}}
- {{cssxref("grid-auto-columns")}}
- {{cssxref("grid-auto-flow")}}

Bạn có thể sử dụng cú pháp này theo cùng cách như shorthand {{cssxref("grid-template")}}. Chỉ cần lưu ý rằng khi làm như vậy, bạn sẽ reset các giá trị khác được đặt bởi thuộc tính.

```css
.wrapper {
  display: grid;
  grid:
    "hd hd hd hd   hd   hd   hd   hd   hd" minmax(100px, auto)
    "sd sd sd main main main main main main" minmax(100px, auto)
    "ft ft ft ft   ft   ft   ft   ft   ft" minmax(100px, auto)
    / 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
}
```

Chúng ta sẽ xem xét lại các chức năng khác được cung cấp bởi shorthand này khi chúng ta xem xét [auto-placement trong grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Auto-placement) và thuộc tính `grid-auto-flow`.

## Các bước tiếp theo

Nếu bạn đã làm việc theo các [hướng dẫn grid](/en-US/docs/Web/CSS/Guides/Grid_layout#guides), bạn sẽ ở vị trí tạo grid layout bằng [line-based placement](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement) hoặc named template areas. Bây giờ hãy xem xét việc tạo [grid layout sử dụng named grid lines](/en-US/docs/Web/CSS/Guides/Grid_layout/Named_grid_lines).
