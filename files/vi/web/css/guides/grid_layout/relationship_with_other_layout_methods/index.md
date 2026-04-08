---
title: Relationship of grid layout to other layout methods
short-title: Grid and other layouts
slug: Web/CSS/Guides/Grid_layout/Relationship_with_other_layout_methods
page-type: guide
sidebar: cssref
---

[CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) được thiết kế để hoạt động cùng với các phần khác của CSS, như một phần của hệ thống hoàn chỉnh để thực hiện layout. Hướng dẫn này giải thích cách grid layout kết hợp với các kỹ thuật khác.

## Grid và flexbox

Sự khác biệt cơ bản giữa CSS grid layout và [CSS flexbox layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) là flexbox được thiết kế cho layout một chiều — theo hàng _hoặc_ theo cột. Grid được thiết kế cho layout hai chiều — hàng và cột cùng một lúc. Cả hai đặc tả đều sử dụng các tính năng [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment). Nếu bạn đã học cách sử dụng flexbox, những điểm tương đồng sẽ giúp bạn làm quen với grid.

### Layout một chiều so với hai chiều

Một ví dụ cơ bản có thể minh họa sự khác biệt giữa layout một chiều và hai chiều.

Trong ví dụ đầu tiên này, chúng ta sử dụng flexbox để bố trí một tập hợp các hộp. Chúng ta có năm phần tử con trong container, và chúng ta đã đặt các giá trị thuộc tính flex để chúng có thể co giãn từ flex-basis là 150 pixel.

Chúng ta cũng đặt thuộc tính {{cssxref("flex-wrap")}} thành `wrap`, sao cho nếu không gian trong container quá hẹp để duy trì flex basis, các phần tử sẽ xuống dòng mới.

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
  width: 500px;
  display: flex;
  flex-wrap: wrap;
}
.wrapper > div {
  flex: 1 1 150px;
}
```

{{ EmbedLiveSample('One-dimensional_versus_two-dimensional_layout', '500', '170') }}

Trong hình ảnh, bạn có thể thấy hai phần tử đã xuống dòng mới. Những phần tử này đang chia sẻ không gian có sẵn và không thẳng hàng dưới các phần tử phía trên. Điều này là vì khi bạn wrap các flex item, mỗi dòng mới (hoặc cột khi làm việc theo cột) là một flex line độc lập trong flex container. Việc phân bổ không gian xảy ra theo flex line.

Một câu hỏi phổ biến là làm thế nào để các phần tử đó thẳng hàng. Đây là nơi bạn muốn phương pháp layout hai chiều: Bạn muốn kiểm soát alignment theo hàng và cột, và đây là nơi grid phát huy tác dụng.

### Cùng layout đó với CSS grids

Trong ví dụ tiếp theo, chúng ta tạo cùng layout bằng cách sử dụng grid. Lần này chúng ta có ba `1fr` column track. Chúng ta không cần đặt bất cứ thứ gì trên các phần tử; chúng sẽ tự bố trí mỗi phần tử vào một ô của grid được tạo. Như bạn có thể thấy, chúng duy trì trong một grid nghiêm ngặt, thẳng hàng theo hàng và cột. Với năm phần tử, chúng ta có khoảng trống ở cuối hàng hai.

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
}
```

{{ EmbedLiveSample('The_same_layout_with_CSS_grids', '300', '170') }}

Một câu hỏi quan trọng cần tự hỏi khi quyết định giữa grid hay flexbox là:

- Chúng ta chỉ cần kiểm soát layout theo hàng _hoặc_ cột? Nếu có, hãy sử dụng flexbox.
- Chúng ta cần kiểm soát layout theo cả hàng _và_ cột? Nếu có, hãy sử dụng grid layout.

### Content out hay layout in?

Ngoài sự phân biệt một chiều so với hai chiều, còn có một cách khác để quyết định nên sử dụng flexbox hay grid cho layout. Flexbox hoạt động từ nội dung ra ngoài. Trường hợp sử dụng lý tưởng cho flexbox là khi bạn có một tập hợp các phần tử và muốn cách đều chúng trong một container. Bạn để kích thước của nội dung quyết định mỗi phần tử chiếm bao nhiêu không gian riêng lẻ. Nếu các phần tử xuống dòng mới, chúng sẽ tính toán khoảng cách dựa trên kích thước của chúng và không gian có sẵn _trên dòng đó_.

Grid hoạt động từ layout vào trong. Khi bạn sử dụng CSS grid layout, bạn tạo một layout và sau đó đặt các phần tử vào đó, hoặc bạn cho phép các quy tắc auto-placement đặt các phần tử vào các ô grid theo grid nghiêm ngặt đó. Có thể tạo các track phản hồi theo kích thước nội dung, tuy nhiên chúng cũng sẽ thay đổi toàn bộ track.

Nếu bạn đang sử dụng flexbox và thấy mình đang vô hiệu hóa một số tính linh hoạt, có lẽ bạn cần sử dụng CSS grid layout. Ví dụ, nếu bạn đang đặt chiều rộng trên một flex item để nó thẳng hàng với các phần tử trong hàng phía trên, grid có thể là lựa chọn tốt hơn.

### Box alignment

Hầu hết các tính năng grid alignment ban đầu được định nghĩa trong [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout). Các tính năng này cung cấp kiểm soát alignment thích hợp lần đầu tiên và cho phép căn giữa một hộp trên trang. Các flex item có thể kéo dài đến chiều cao của flex container, có nghĩa là các cột có chiều cao bằng nhau là có thể. Các thuộc tính này hiện được định nghĩa trong module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment), và được sử dụng trong nhiều layout mode, bao gồm grid layout.

Chúng ta sẽ xem xét kỹ hơn về [Căn chỉnh các phần tử trong CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Box_alignment) sau. Hiện tại, đây là so sánh giữa các ví dụ flexbox và grid.

Trong ví dụ đầu tiên, sử dụng flexbox, chúng ta có một container với ba phần tử bên trong. `min-height` của container được đặt, vì vậy nó xác định chiều cao của flex container. Chúng ta đặt {{cssxref("align-items")}} trên flex container thành `flex-end` để các phần tử sẽ thẳng hàng ở cuối flex container. Chúng ta cũng đặt thuộc tính {{cssxref("align-self")}} trên `box1` để nó sẽ ghi đè mặc định và kéo dài đến chiều cao của container và trên `box2` để nó căn chỉnh ở đầu flex container.

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

```html
<div class="wrapper">
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
</div>
```

```css
.wrapper {
  display: flex;
  align-items: flex-end;
  min-height: 200px;
}
.box1 {
  align-self: stretch;
}
.box2 {
  align-self: flex-start;
}
```

{{ EmbedLiveSample('Box_alignment', '300', '230') }}

### Alignment trong CSS grids

Ví dụ này sử dụng grid để tạo cùng layout. Chúng ta sử dụng các thuộc tính box alignment khi áp dụng cho grid layout. Chúng ta căn chỉnh theo `start` và `end`. (Chúng ta có thể đã sử dụng các từ đồng nghĩa {{cssxref("content-position")}} là `flex-start` và `flex-end`.) Trong trường hợp grid layout, chúng ta đang căn chỉnh các phần tử bên trong grid area của chúng. Trong trường hợp này là một ô grid đơn lẻ, nhưng có thể là một vùng bao gồm nhiều ô grid.

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

```html
<div class="wrapper">
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  align-items: end;
  grid-auto-rows: 200px;
}
.box1 {
  align-self: stretch;
}
.box2 {
  align-self: start;
}
```

{{ EmbedLiveSample('Alignment_in_CSS_Grids', '200', '240') }}

### Đơn vị `fr` và `flex-basis`

Chúng ta đã thấy cách đơn vị `fr` hoạt động để phân bổ tỷ lệ không gian có sẵn trong grid container cho các grid track. Đơn vị `fr`, khi kết hợp với hàm {{cssxref("minmax()")}}, có thể cho chúng ta hành vi rất giống với các thuộc tính `flex` trong flexbox trong khi vẫn cho phép tạo layout hai chiều.

Nếu chúng ta nhìn lại ví dụ trước nơi chúng ta minh họa sự khác biệt giữa layout một chiều và hai chiều, bạn có thể thấy có sự khác biệt trong cách hai layout hoạt động theo responsive. Với flex layout, nếu chúng ta kéo rộng hoặc thu hẹp cửa sổ, flexbox sẽ điều chỉnh số phần tử trên mỗi hàng theo không gian có sẵn một cách tốt. Nếu chúng ta có nhiều không gian, tất cả năm phần tử có thể nằm trên một hàng. Nếu chúng ta có container rất hẹp, chúng ta có thể chỉ có không gian cho một phần tử.

So với đó, phiên bản grid luôn có ba column track. Các track tự chúng sẽ lớn lên và thu nhỏ, nhưng luôn có ba vì chúng ta yêu cầu ba khi định nghĩa grid.

#### Auto-filling grid tracks

Chúng ta có thể sử dụng grid để tạo hiệu ứng tương tự flexbox, trong khi vẫn giữ nội dung được sắp xếp trong các hàng và cột nghiêm ngặt, bằng cách tạo track listing bằng ký hiệu repeat và các thuộc tính `auto-fill` và `auto-fit`.

Trong ví dụ tiếp theo, chúng ta đã sử dụng từ khóa `auto-fill` thay cho số nguyên trong ký hiệu repeat và đặt track listing thành 200 pixel. Điều này có nghĩa là grid sẽ tạo ra nhiều column track 200 pixel nhất có thể nằm trong container.

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

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(auto-fill, 200px);
}
```

{{ EmbedLiveSample('Auto-filling_grid_tracks', '500', '70') }}

### Số lượng track linh hoạt

Đây không hoàn toàn giống với flexbox. Trong ví dụ flexbox, các phần tử lớn hơn 200 pixel basis trước khi xuống dòng. Chúng ta có thể đạt được điều tương tự trong grid bằng cách kết hợp `auto-fit` và hàm {{cssxref("minmax()")}}.

Trong ví dụ này, chúng ta tạo các auto filled track với `minmax`. Chúng ta muốn các track của mình tối thiểu 200 pixel, vì vậy chúng ta đặt tối đa là `1fr`. Khi trình duyệt đã tính toán số lần 200 pixel nằm trong container — cũng tính đến các grid gap — nó sẽ coi `1fr` là tối đa là hướng dẫn để chia sẻ không gian còn lại giữa các phần tử.

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

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
}
```

{{ EmbedLiveSample('A_flexible_number_of_tracks', '500', '70') }}

Với grid layout, chúng ta có thể tạo một grid với số lượng track linh hoạt động và có các phần tử được bố trí trên grid căn chỉnh theo hàng và cột.

## Grid và các phần tử absolutely positioned

Grid tương tác với các phần tử [absolutely positioned](/en-US/docs/Web/CSS/Reference/Properties/position#absolute_positioning), điều này có thể hữu ích nếu bạn muốn định vị một phần tử bên trong grid hoặc grid area. Đặc tả định nghĩa hành vi khi grid container là containing block và là cha của phần tử absolutely positioned.

### Grid container như containing block

Để làm cho grid container trở thành [containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block), bạn cần thêm thuộc tính {{cssxref("position")}} vào container với giá trị `relative`, giống như bạn tạo containing block cho bất kỳ phần tử absolutely positioned nào khác. Khi bạn đã làm điều này, nếu bạn đặt `position: absolute` cho một grid item, nó sẽ lấy grid container làm containing block, hoặc nếu phần tử cũng có vị trí grid, đó là vùng của grid mà nó được đặt vào.

Trong ví dụ dưới đây, chúng ta có một wrapper chứa bốn phần tử con. Phần tử thứ ba được absolutely positioned và cũng được đặt trên grid bằng line-based placement. Grid container có `position: relative` và vì vậy trở thành positioning context của phần tử này.

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

```html
<div class="wrapper">
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">
    This block is absolutely positioned. In this example the grid container is
    the containing block and so the absolute positioning offset values are
    calculated in from the outer edges of the area it has been placed into.
  </div>
  <div class="box4">Four</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-auto-rows: 200px;
  gap: 20px;
  position: relative;
}
.box3 {
  grid-column-start: 2;
  grid-column-end: 4;
  grid-row-start: 1;
  grid-row-end: 3;
  position: absolute;
  top: 40px;
  left: 40px;
}
```

{{ EmbedLiveSample('A_grid_container_as_containing_block', '500', '270') }}

Bạn có thể thấy phần tử đang lấy vùng từ đường kẻ cột grid 2 đến 4, và bắt đầu sau đường kẻ 1. Sau đó nó được offset trong vùng đó bằng các thuộc tính top và left. Tuy nhiên, nó đã bị lấy ra khỏi flow như thường lệ với các phần tử absolutely positioned và vì vậy các quy tắc auto-placement bây giờ đặt các phần tử vào cùng không gian. Phần tử cũng không gây ra hàng bổ sung được tạo để trải dài đến đường kẻ hàng 3.

Nếu chúng ta xóa `position: absolute` khỏi các quy tắc cho `.box3`, bạn có thể thấy cách nó sẽ hiển thị mà không có positioning.

### Grid container như parent

Nếu phần tử con absolutely positioned có grid container làm cha nhưng container đó không tạo positioning context mới, thì nó bị lấy ra khỏi flow như trong ví dụ trước. _Positioning context_ là phần tử mà phần tử absolutely positioned được định vị tương đối. Positioning context sẽ là bất kỳ phần tử nào tạo positioning context như thường thấy trong các phương pháp layout khác. Trong trường hợp của chúng ta, nếu chúng ta xóa `position: relative` khỏi wrapper ở trên, positioning context là từ viewport, như được hiển thị trong hình ảnh này.

![Hình ảnh của grid container như parent](2_abspos_example.png)

Một lần nữa, phần tử không còn tham gia vào grid layout về mặt kích thước hay khi các phần tử khác được auto-placed.

### Với grid area như parent

Nếu phần tử absolutely positioned được lồng trong grid area, thì bạn có thể tạo positioning context trên vùng đó. Trong ví dụ này, chúng ta có grid như trước, nhưng lần này chúng ta đã lồng một phần tử bên trong `.box3` của grid.

Chúng ta đã đặt `position: relative` cho `.box3` và sau đó định vị sub-item với các thuộc tính offset. Trong trường hợp này, positioning context là grid area.

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

```html
<div class="wrapper">
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">
    Three
    <div class="abspos">
      This block is absolutely positioned. In this example the grid area is the
      containing block and so the absolute positioning offset values are
      calculated in from the outer edges of the grid area.
    </div>
  </div>
  <div class="box4">Four</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-auto-rows: 200px;
  gap: 20px;
}
.box3 {
  grid-column-start: 2;
  grid-column-end: 4;
  grid-row-start: 1;
  grid-row-end: 3;
  position: relative;
}
.abspos {
  position: absolute;
  top: 40px;
  left: 40px;
  background-color: rgb(255 255 255 / 50%);
  border: 1px solid rgb(0 0 0 / 50%);
  color: black;
  padding: 10px;
}
```

{{ EmbedLiveSample('With_a_grid_area_as_the_parent', '500', '460') }}

## Grid và display: contents

Một tương tác đáng chú ý cuối cùng là sự tương tác giữa CSS grid layout và `display: contents`, được định nghĩa trong module [CSS display](/en-US/docs/Web/CSS/Guides/Display). Khi thuộc tính {{cssxref("display")}} được đặt thành `contents`, phần tử đó không tạo ra bất kỳ hộp nào, nhưng các phần tử con và pseudo-element của nó vẫn tạo ra các hộp bình thường. Điều này có nghĩa là, đối với mục đích tạo hộp và layout, phần tử được coi như thể nó đã được thay thế bởi các phần tử con và pseudo-element của nó trong cây tài liệu.

Nếu bạn đặt một phần tử thành `display: contents`, hộp mà nó thường tạo ra sẽ biến mất và các hộp của các phần tử con xuất hiện như thể chúng đã được nâng lên một cấp. Điều này có nghĩa là các phần tử con của grid item có thể trở thành grid item. Nghe có vẻ lạ? Đây là một ví dụ.

### Grid layout với các phần tử con lồng nhau

Trong ví dụ này, phần tử đầu tiên trong grid được đặt để trải dài qua cả ba column track. Nó chứa ba phần tử lồng nhau. Vì những phần tử này không phải là phần tử con trực tiếp, chúng không trở thành một phần của grid layout và vì vậy hiển thị bằng block layout thông thường.

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
.nested {
  border: 2px solid #ffec99;
  border-radius: 5px;
  background-color: #fff9db;
  padding: 1em;
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
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: minmax(100px, auto);
}
.box1 {
  grid-column-start: 1;
  grid-column-end: 4;
}
```

{{ EmbedLiveSample('Grid_layout_with_nested_child_elements', '400', '440') }}

### Sử dụng display: contents

Nếu bây giờ chúng ta thêm `display: contents` vào các quy tắc cho `box1`, hộp cho phần tử đó sẽ biến mất và các sub-item bây giờ trở thành grid item và tự bố trí bằng các quy tắc auto-placement.

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
.nested {
  border: 2px solid #ffec99;
  border-radius: 5px;
  background-color: #fff9db;
  padding: 1em;
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
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: minmax(100px, auto);
}
.box1 {
  grid-column-start: 1;
  grid-column-end: 4;
  display: contents;
}
```

{{ EmbedLiveSample('Using_display_contents', '400', '350') }}

Đây có thể là một cách để các phần tử lồng nhau trong grid hoạt động như thể chúng là một phần của grid. Bạn cũng có thể sử dụng `display: contents` theo cách tương tự với flexbox để cho phép các phần tử lồng nhau trở thành flex item.

Như bạn có thể thấy từ hướng dẫn này, CSS grid layout chỉ là một phần trong bộ công cụ của bạn. Đừng ngại kết hợp nó với các phương pháp layout khác để đạt được các hiệu ứng khác nhau mà bạn cần.

## Xem thêm

- [Hướng dẫn Flexbox](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox)
- [Hướng dẫn Multiple-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout)
