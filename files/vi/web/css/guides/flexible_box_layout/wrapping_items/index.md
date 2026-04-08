---
title: Mastering wrapping of flex items
short-title: Wrapping flex items
slug: Web/CSS/Guides/Flexible_box_layout/Wrapping_items
page-type: guide
sidebar: cssref
---

Flexbox được thiết kế như một công cụ layout một chiều — nó xử lý việc bố cục các mục theo hàng hoặc cột — nhưng không phải cả hai cùng lúc. Tuy nhiên, có thể bọc các flex item sang các dòng mới, tạo hàng mới nếu {{cssxref("flex-direction")}} là `row` và cột mới nếu `flex-direction` là `column`. Hướng dẫn này giải thích về wrapping trong flexbox, mục đích thiết kế của nó, và những tình huống nào đòi hỏi [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) thay vì flexbox.

## Làm cho các mục xuống dòng

Giá trị khởi tạo của thuộc tính {{cssxref("flex-wrap")}} là `nowrap`. Điều này có nghĩa là nếu một tập hợp flex item quá rộng so với flex container, chúng sẽ tràn ra ngoài. Để cho chúng xuống dòng khi quá rộng, hãy thêm thuộc tính `flex-wrap` với giá trị `wrap`, hoặc sử dụng dạng viết tắt {{cssxref("flex-flow")}} với các giá trị `row wrap` hoặc `column wrap`. Các mục sau đó sẽ xuống dòng mới khi tràn ra ngoài container.

Trong ví dụ này, có mười flex item với `flex-basis` là `160px` có thể tăng trưởng và thu nhỏ. Khi không còn đủ không gian để đặt thêm một mục 160 pixel vào hàng, một flex line mới sẽ được tạo. Các dòng mới được tạo khi cần thiết cho đến khi tất cả các mục được đặt. Vì các mục có thể tăng trưởng, chúng sẽ mở rộng để lấp đầy mỗi hàng hoàn toàn. Nếu chỉ có một mục trên dòng cuối, nó sẽ kéo dài để lấp đầy toàn bộ dòng.

```html live-sample___row-wrap
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
  <div>Nine</div>
  <div>Ten</div>
</div>
```

```css live-sample___row-wrap
.box {
  width: 500px;
  border: 2px dotted rgb(96 139 168);
  display: flex;
  flex-wrap: wrap;
}

.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  flex: 1 1 160px;
}
```

{{EmbedLiveSample("row-wrap")}}

Điều tương tự xảy ra với các flex column. Để xuống dòng và tạo cột mới, container cần có chiều cao. Trong trường hợp cột, các mục kéo dài theo chiều dọc để lấp đầy mỗi cột hoàn toàn.

```html live-sample___column-wrap
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
  <div>Nine</div>
  <div>Ten</div>
</div>
```

```css live-sample___column-wrap
.box {
  border: 2px dotted rgb(96 139 168);
  height: 300px;
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
}
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  flex: 1 1 80px;
}
```

{{EmbedLiveSample("column-wrap", "", "320px")}}

## Wrapping và flex-direction

Wrapping hoạt động như bạn mong đợi khi kết hợp với `flex-direction`. Nếu `flex-direction` được đặt thành `row-reverse` thì các mục sẽ bắt đầu từ cạnh cuối của container và sắp xếp thành các dòng theo thứ tự ngược lại.

```html live-sample___row-reverse-wrap
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
  <div>Nine</div>
  <div>Ten</div>
</div>
```

```css live-sample___row-reverse-wrap
.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
  flex-wrap: wrap;
  flex-direction: row-reverse;
  width: 500px;
}
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  flex: 1 1 160px;
}
```

{{EmbedLiveSample("row-reverse-wrap")}}

Lưu ý rằng việc đảo ngược chỉ xảy ra theo hướng inline, hàng. Chúng ta bắt đầu ở bên phải rồi sang dòng thứ hai và lại bắt đầu từ bên phải. Chúng ta không đảo ngược theo cả hai hướng, bắt đầu từ dưới lên trên container!

## Giải thích về layout một chiều

Như chúng ta đã thấy từ các ví dụ trên nếu các mục được phép tăng trưởng và thu nhỏ, khi có ít mục hơn ở hàng hoặc cột cuối thì các mục đó sẽ tăng trưởng để lấp đầy khoảng trống có sẵn.

Không có tính năng flexbox nào để cho các mục trong một hàng căn chỉnh với các mục trong hàng phía trên — mỗi flex line hoạt động như một flex container độc lập mới. Nó xử lý phân phối không gian dọc theo trục chính. Nếu chỉ có một mục, và mục đó được phép tăng trưởng, nó sẽ lấp đầy trục giống như bạn có một flex container một mục. Nếu bạn muốn layout theo hai chiều thì bạn có thể muốn grid layout.

Ví dụ này minh họa sự khác biệt, sử dụng CSS grid layout để tạo layout với nhiều cột ít nhất `160px` nhất có thể, phân phối khoảng trống thêm giữa tất cả các cột. Chúng ta sử dụng cùng HTML như [ví dụ flexbox wrapped row](#making_things_wrap) ở trên nhưng đặt `display: grid` trên nó. Thay vì dạng viết tắt {{cssxref("flex")}}, không có tác dụng bên ngoài flexbox, chúng ta đặt chiều rộng tối thiểu và khả năng tăng trưởng của mục trực tiếp trên container với {{cssxref("grid-template-columns")}}. Với CSS grid, mục cuối vẫn ở trong ô grid của nó; các grid item không kéo dài khi có ít mục hơn ở hàng cuối.

```html live-sample___grid-example
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
  <div>Nine</div>
  <div>Ten</div>
</div>
```

```css live-sample___grid-example
.box {
  border: 2px dotted rgb(96 139 168);
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
  width: 500px;
}

.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
```

{{EmbedLiveSample("grid-example")}}

Đây là sự khác biệt giữa layout một chiều và hai chiều. Trong phương pháp layout một chiều như flexbox, chúng ta chỉ kiểm soát hàng hoặc cột. Trong layout grid hai chiều, chúng ta kiểm soát cả hai cùng lúc. Nếu bạn muốn phân phối không gian theo từng hàng, hãy sử dụng Flexbox. Nếu không, hãy sử dụng CSS grid.

## Các hệ thống grid dựa trên flexbox hoạt động như thế nào?

Layout dựa trên Flexbox có thể bị buộc phải căn chỉnh như các hệ thống grid, nhưng đó không phải là mục đích dự kiến của flexbox. Nếu bạn gán chiều rộng theo phần trăm cho các flex item — bằng cách sử dụng `flex-basis` hoặc bằng cách thêm chiều rộng vào chính mục và để giá trị của `flex-basis` là `auto` — bạn có thể tạo ấn tượng về layout hai chiều.

Trong ví dụ này, `flex-grow` và `flex-shrink` được đặt thành `0` để tạo các flex item không linh hoạt. Tính linh hoạt được kiểm soát thông qua phần trăm.

```html live-sample___flex-grid
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
  <div>Nine</div>
  <div>Ten</div>
</div>
```

```css live-sample___flex-grid
* {
  box-sizing: border-box;
}

.box {
  width: 500px;
  border: 2px dotted rgb(96 139 168);
  display: flex;
  flex-wrap: wrap;
}

.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  flex: 0 0 33.3333%;
}
```

{{EmbedLiveSample("flex-grid")}}

Kỹ thuật này cho phép bạn căn chỉnh các flex item trên cross-axis. Tuy nhiên, khi bạn thấy mình đang thêm chiều rộng vào các flex item theo cách này hoặc thêm các flex item trống để chiếm không gian, đó là dấu hiệu tốt cho thấy bạn có thể muốn chuyển sang CSS grid layout cho thành phần đó.

## Tạo gutters giữa các mục

Để tạo khoảng cách hoặc gutters giữa các flex item, hãy sử dụng thuộc tính {{CSSXref("gap")}} trực tiếp trên flex container để tạo khoảng cách cố định giữa các flex item liền kề. Thuộc tính `gap` là dạng viết tắt của `row-gap` và `column-gap`. Các thuộc tính này chỉ định kích thước của gutters giữa các hàng và cột trong grid, flex, và layout multi-column.

Thuộc tính `gap` không phải là thứ duy nhất có thể thêm khoảng cách giữa các mục. Margins, padding, `justify-content`, và `align-content` cũng có thể tăng kích thước của gutter, ảnh hưởng đến kích thước thực tế của khoảng cách.

Để xem thuộc tính `gap` khác với `margin` ở cả hai trục như thế nào, hãy thử thay đổi giá trị `gap` trong container `.box` và thêm giá trị `margin` vào quy tắc `.box > *` trong stylesheet bên dưới. Nhấn nút "Reset" để quay lại các giá trị trước.

```html live-sample___gaps
<div class="wrapper">
  <div class="box">
    <div>One</div>
    <div>Two</div>
    <div>Three</div>
    <div>Four</div>
    <div>Five</div>
    <div>Six</div>
    <div>Seven</div>
    <div>Eight</div>
    <div>Nine</div>
    <div>Ten</div>
  </div>
</div>
```

```css live-sample___gaps
.wrapper {
  border: 2px dotted rgb(96 139 168);
  width: 500px;
}
.box {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}
.box > * {
  flex: 1 1 160px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
```

{{EmbedLiveSample("gaps", "", "220px")}}

## Các mục bị thu gọn

Đặc tả flexbox mô tả những gì sẽ xảy ra nếu một flex item bị thu gọn bằng cách đặt `visibility: collapse` trên mục. Xem tài liệu MDN về thuộc tính {{cssxref("visibility")}}. Đặc tả mô tả hành vi như sau:

> "Chỉ định `visibility: collapse` trên một flex item khiến nó trở thành _flex item bị thu gọn_, tạo ra hiệu ứng tương tự như `visibility: collapse` trên table-row hoặc table-column: flex item bị thu gọn được loại bỏ hoàn toàn khỏi rendering, nhưng để lại một "strut" giữ kích thước cross-size của flex line ổn định. Do đó, nếu flex container chỉ có một flex line, việc thu gọn hoặc mở rộng các mục một cách động có thể thay đổi kích thước chính của flex container, nhưng được đảm bảo không có tác dụng gì đến kích thước cross của nó và sẽ không gây ra việc "wobble" của phần còn lại trong layout của trang. Tuy nhiên, wrapping flex line _được_ thực hiện lại sau khi thu gọn, do đó kích thước cross của flex container có nhiều dòng có thể thay đổi hoặc không thay đổi." - [Collapsed items](https://drafts.csswg.org/css-flexbox-1/#visibility-collapse)

Hành vi này hữu ích nếu bạn muốn nhắm mục tiêu các flex item bằng JavaScript để hiển thị và ẩn nội dung chẳng hạn. Ví dụ trong đặc tả minh họa một pattern như vậy.

Trong ví dụ trực tiếp sau đây, flex container không xuống dòng chứa một hàng với ba flex item được đặt để flex theo kích thước bằng nhau. Mục thứ ba có nhiều dòng nội dung, làm tăng kích thước container. Giá trị mặc định cho `align-items` là `normal`; đối với flex item, `normal` hoạt động như `stretch`, vì vậy tất cả các mục kéo dài theo mặc định, lấp đầy chiều cao cross-size của container.

Mục tạo ra cross-size được đặt thành `visibility: collapse`, thu gọn hoặc ẩn flex item, tùy thuộc vào trình duyệt. Trong cả hai trường hợp, flex container giữ lại một _strut_ của cross-size ngay cả khi không hiển thị. Theo cách này, nếu mục được hiển thị, cross-size của flex container một dòng sẽ không thay đổi. Nếu bạn xóa `visibility: collapse` khỏi CSS hoặc đổi giá trị thành `visible`, bạn sẽ thấy mục xuất hiện và không gian main-size được phân phối lại giữa các mục không bị thu gọn, trong khi cross-size vẫn không thay đổi.

> [!NOTE]
> Sử dụng Firefox cho ví dụ bên dưới vì các trình duyệt phổ biến khác xử lý `collapse` như `hidden`.

```html hidden live-sample___visibility-collapse
<p>
  <label><input type="checkbox" /> Toggle <code>visibility</code> value</label>
</p>
```

```html live-sample___visibility-collapse
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div class="collapse">Three <br />has <br />extra <br />text</div>
</div>
```

```css live-sample___visibility-collapse
.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
  width: 600px;
}
.box > * {
  flex: 1 1 200px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
.collapse {
  visibility: collapse;
}
```

```css hidden live-sample___visibility-collapse
p:has(:checked) + div .collapse {
  visibility: visible;
}
```

{{EmbedLiveSample("visibility-collapse")}}

Ví dụ trên là flex container một dòng, không xuống dòng với kích thước cố định `600px` nên dù mục hiển thị hay bị thu gọn, chiều rộng vẫn như nhau. Điều quan trọng cần hiểu là trong khi container giữ lại strut của cross-size của mục bị thu gọn, kích thước chính không được bảo tồn. Flex container nhiều dòng sẽ bọc lại các mục sau khi loại bỏ các mục bị thu gọn khỏi rendering. Không gian mới mà mục bị thu gọn để lại theo hướng chính có thể khiến các mục không bị thu gọn được đặt vào dòng khác so với khi mục không bị thu gọn. Vì mỗi dòng được bố cục như flex container một dòng độc lập và thành phần của nó có thể thay đổi sau khi thu gọn, kích thước cross-axis của nó cũng có thể thay đổi.

Ví dụ sau đây cho thấy hành vi này. Flex item thứ ba bị thu gọn, vì vậy nó chiếm không gian bằng không dọc theo trục chính (inline-size là `0`). Khi bị thu gọn, strut của nó nằm trên hàng đầu tiên sau mục thứ tư, với hàng đầu tiên đủ cao để chứa ba dòng văn bản mà mục thứ ba đáng lẽ phải có. Sau đó, nếu bạn bỏ thu gọn mục (ví dụ bằng cách xóa class `collapse`), không còn đủ khoảng trống ngang cho mục thứ năm trên hàng đầu tiên và nó chuyển sang hàng thứ hai. Điều này làm cho hàng thứ hai tăng cao để chứa hai dòng văn bản của thành viên mới, và mục flex cuối cùng bị đẩy sang hàng mới. Với dòng thứ hai cao hơn và dòng thứ ba mới, flex container cao hơn nhiều so với trước.

> [!NOTE]
> Sử dụng Firefox cho ví dụ bên dưới vì các trình duyệt phổ biến khác xử lý `collapse` như `hidden`.

```html hidden live-sample___wrapped-visibility-collapse
<p>
  <label><input type="checkbox" /> Toggle <code>visibility</code> value</label>
</p>
```

```html live-sample___wrapped-visibility-collapse
<div class="box">
  <div>One</div>
  <div>Two is the width of this sentence.</div>
  <div class="collapse">Three <br />is <br />five <br />lines <br />tall.</div>
  <div>Four</div>
  <div>Five<br />Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
  <div>Nine</div>
  <div>Ten</div>
  <div>Eleven is longer</div>
</div>
```

```css live-sample___wrapped-visibility-collapse
.box {
  border: 2px dotted rgb(96 139 168);
  width: 500px;
  display: flex;
  flex-wrap: wrap;
}
.box > * {
  padding: 10px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  flex: 1 1 auto;
  min-width: 50px;
}
.collapse {
  visibility: collapse;
}
```

```css hidden live-sample___wrapped-visibility-collapse
p:has(:checked) + div .collapse {
  visibility: visible;
}
```

{{EmbedLiveSample("wrapped-visibility-collapse", "", "300")}}

Nếu điều này gây ra vấn đề cho layout của bạn, nó có thể cần phải xem xét lại cấu trúc, ví dụ đặt mỗi hàng vào một flex container riêng để chúng không thể chuyển hàng.

### Sử dụng `visibility: hidden` và `display: none`

Trong các ví dụ trực tiếp trước, hãy thử sử dụng `visibility: hidden` hoặc `display: none` thay vì `visibility: collapse`. Khi sử dụng `visibility: hidden`, mục trở nên vô hình, nhưng hộp được giữ trong cấu trúc định dạng, vì vậy nó vẫn hoạt động như thể nó là một phần của layout.
Khi bạn sử dụng `display: none`, mục bị loại bỏ hoàn toàn khỏi cấu trúc định dạng. Không chỉ vô hình mà cấu trúc cũng bị loại bỏ. Điều này có nghĩa là các bộ đếm bỏ qua nó và những thứ như transitions không chạy.
