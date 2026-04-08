---
title: Aligning items in CSS grid layout
short-title: Aligning items
slug: Web/CSS/Guides/Grid_layout/Box_alignment
page-type: guide
sidebar: cssref
---

[CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) triển khai [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment), đây là cùng một tiêu chuẩn mà [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) sử dụng để căn chỉnh các mục trong flex container. Module alignment mô tả chi tiết cách alignment hoạt động trong tất cả các phương pháp layout.

Trong hướng dẫn này, chúng ta xem xét cách các thuộc tính box alignment được sử dụng để căn chỉnh các mục trong grid layout.

Bạn có thể nhận thấy sự tương đồng về cách các thuộc tính và giá trị này hoạt động trong flexbox. Do grid là hai chiều và flexbox là một chiều, có một số khác biệt nhỏ mà bạn nên chú ý. Vì lý do này, chúng ta sẽ bắt đầu bằng cách xem xét hai trục mà chúng ta xử lý khi căn chỉnh mọi thứ trong grid.

## Hai trục của grid layout

Khi làm việc với grid layout, bạn có hai trục để căn chỉnh – _block axis_ và _inline axis_. [Block axis](/en-US/docs/Glossary/Flow_relative_values#block_direction) là trục mà theo đó các khối được bố trí trong block layout. Nếu bạn có hai đoạn văn trên trang, chúng hiển thị bên dưới nhau, vì vậy đây là hướng chúng ta mô tả là block axis.

![Block axes theo chiều dọc.](block_axis.png)

[Inline axis](/en-US/docs/Glossary/Flow_relative_values#inline_direction) chạy ngang qua block axis, đây là hướng mà văn bản trong luồng inline thông thường chạy.

![Inline / row axis theo chiều ngang.](7_inline_axis.png)

Chúng ta có thể căn chỉnh nội dung bên trong các grid area, và các grid track trên hai trục này.

## Căn chỉnh các mục trên block axis

Các thuộc tính {{cssxref("align-self")}} và {{cssxref("align-items")}} kiểm soát alignment trên block axis. Khi chúng ta sử dụng các thuộc tính này, chúng ta đang thay đổi alignment của mục trong grid area mà bạn đã đặt nó.

### Sử dụng align-items

Trong ví dụ sau, chúng ta có bốn {{glossary("grid areas")}} trong grid. Chúng ta có thể sử dụng thuộc tính {{cssxref("align-items")}} trên {{glossary("grid container")}}, để căn chỉnh các mục bằng cách sử dụng các giá trị `normal`, `stretch`, hoặc {{cssxref("self-position")}} hoặc {{cssxref("baseline-position")}}:

- `normal`
- `stretch`
- `start`
- `end`
- `center`
- `baseline`
- `first baseline`
- `last baseline`
- `auto` (chỉ dành cho `align-self`)

Giá trị mặc định là `normal`, giải thành `stretch` cho grid container.

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
  grid-template-columns: repeat(8, 1fr);
  gap: 10px;
  grid-auto-rows: 100px;
  grid-template-areas:
    "a a a a b b b b"
    "a a a a b b b b"
    "c c c c d d d d"
    "c c c c d d d d";
  align-items: start;
}
.item1 {
  grid-area: a;
}
.item2 {
  grid-area: b;
}
.item3 {
  grid-area: c;
}
.item4 {
  grid-area: d;
}
```

```html
<div class="wrapper">
  <div class="item1">Item 1</div>
  <div class="item2">Item 2</div>
  <div class="item3">Item 3</div>
  <div class="item4">Item 4</div>
</div>
```

{{ EmbedLiveSample('Using_align-items', '500', '500') }}

Hãy nhớ rằng một khi bạn đặt `align-items: start`, chiều cao của mỗi `<div>` con sẽ được xác định bởi nội dung của `<div>`. Điều này trái ngược với việc bỏ qua hoàn toàn {{cssxref("align-items")}}, trong đó chiều cao của mỗi `<div>` kéo dài để lấp đầy grid area của nó.

Thuộc tính `align-items` đặt thuộc tính {{cssxref("align-self")}} cho tất cả các grid item con. Điều này có nghĩa là bạn có thể đặt thuộc tính riêng lẻ, bằng cách sử dụng `align-self` trực tiếp trên một grid item.

### Sử dụng align-self

Trong ví dụ tiếp theo, chúng ta đang sử dụng thuộc tính `align-self`, để minh họa các giá trị alignment khác nhau. Vùng đầu tiên hiển thị hành vi mặc định của `align-self`, trong trường hợp này giải thành `stretch`. Mục thứ hai có giá trị `align-self` là `start`, thứ ba là `end` và thứ tư là `center`.

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
  grid-template-columns: repeat(8, 1fr);
  gap: 10px;
  grid-auto-rows: 100px;
  grid-template-areas:
    "a a a a b b b b"
    "a a a a b b b b"
    "c c c c d d d d"
    "c c c c d d d d";
}
.item1 {
  grid-area: a;
}
.item2 {
  grid-area: b;
  align-self: start;
}
.item3 {
  grid-area: c;
  align-self: end;
}
.item4 {
  grid-area: d;
  align-self: center;
}
```

```html
<div class="wrapper">
  <div class="item1">Item 1</div>
  <div class="item2">Item 2</div>
  <div class="item3">Item 3</div>
  <div class="item4">Item 4</div>
</div>
```

{{ EmbedLiveSample('Using_align-self', '500', '500') }}

### Các mục có tỷ lệ khung hình nội tại

Hành vi mặc định của {{cssxref("align-self")}} là kế thừa từ thuộc tính `align-items` của grid container, trong đó mặc định `normal` là stretch, ngoại trừ các mục có {{glossary("aspect ratio")}} nội tại, trong trường hợp này chúng hoạt động như `start`. Lý do cho điều này là nếu các mục có aspect ratio được kéo dài, chúng sẽ bị biến dạng.

## Justify các mục trên inline axis

Trong khi `align-items` và `align-self` căn chỉnh các mục trên block axis, {{cssxref("justify-items")}} và {{cssxref("justify-self")}} căn chỉnh các mục trên inline axis. Các giá trị bạn có thể chọn tương tự với các giá trị `normal`, `stretch`, {{cssxref("self-position")}} và {{cssxref("baseline-position")}} của thuộc tính `align-self`, cùng với `left` và `right`. Các giá trị bao gồm:

- `normal`
- `start`
- `end`
- `left`
- `right`
- `center`
- `stretch`
- `baseline`
- `first baseline`
- `last baseline`
- `auto` (chỉ dành cho `justify-self`)

Bạn có thể thấy ví dụ tương tự như đã sử dụng cho {{cssxref("align-items")}}, bên dưới. Lần này, chúng ta đang áp dụng thuộc tính {{cssxref("justify-self")}}.

Một lần nữa, mặc định là `stretch` ngoại trừ các mục có aspect ratio nội tại. Điều này có nghĩa là các grid item sẽ bao phủ grid area của chúng theo mặc định, trừ khi bạn thay đổi alignment. Trong ví dụ này, mục đầu tiên minh họa giá trị alignment `stretch` mặc định:

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
  grid-template-columns: repeat(8, 1fr);
  gap: 10px;
  grid-auto-rows: 100px;
  grid-template-areas:
    "a a a a b b b b"
    "a a a a b b b b"
    "c c c c d d d d"
    "c c c c d d d d";
}
.item1 {
  grid-area: a;
}
.item2 {
  grid-area: b;
  justify-self: start;
}
.item3 {
  grid-area: c;
  justify-self: end;
}
.item4 {
  grid-area: d;
  justify-self: center;
}
```

```html
<div class="wrapper">
  <div class="item1">Item 1</div>
  <div class="item2">Item 2</div>
  <div class="item3">Item 3</div>
  <div class="item4">Item 4</div>
</div>
```

{{ EmbedLiveSample('Justifying_Items_on_the_Inline_Axis', '500', '500') }}

Giống như với `align-self` và `align-items`, bạn có thể áp dụng `justify-items` cho grid container để đặt giá trị `justify-self` cho tất cả grid item trong container.

> [!NOTE]
> Các thuộc tính `justify-self` và `justify-items` không được triển khai trong flexbox. Điều này là do tính một chiều của [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout), và có thể có nhiều mục dọc theo trục, làm cho việc justify một mục duy nhất là không thể. Để căn chỉnh các mục dọc theo trục chính, inline axis trong flexbox, bạn sử dụng thuộc tính {{cssxref("justify-content")}}.

### Thuộc tính shorthand

Thuộc tính {{CSSxRef("place-items")}} là shorthand cho `align-items` và `justify-items`.

Thuộc tính {{CSSxRef("place-self")}} là shorthand cho `align-self` và `justify-self`.

## Căn giữa một mục trong vùng

Bằng cách kết hợp các thuộc tính align và justify, chúng ta có thể dễ dàng căn giữa một mục bên trong một grid area.

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
  grid-template-columns: repeat(4, 1fr);
  gap: 10px;
  grid-auto-rows: 200px;
  grid-template-areas:
    ". a a ."
    ". a a .";
}
.item1 {
  grid-area: a;
  align-self: center;
  justify-self: center;
}
```

```html
<div class="wrapper">
  <div class="item1">Item 1</div>
</div>
```

{{ EmbedLiveSample('Center_an_item_in_the_area', '500', '500') }}

## Căn chỉnh grid track trên block axis

Nếu bạn có tình huống trong đó các grid track sử dụng một vùng nhỏ hơn grid container, bạn có thể căn chỉnh các grid track bên trong container đó. Thuộc tính {{cssxref("align-content")}} căn chỉnh các track trên block axis và {{cssxref("justify-content")}} căn chỉnh trên inline axis. Giống như các thuộc tính `*-items` và `*-item`, thuộc tính {{CSSxRef("place-content")}} là shorthand cho `align-content` và `justify-content`.

Các giá trị cho `align-content`, `justify-content` và `place-content` đều bao gồm các giá trị {{cssxref("content-distribution")}} và {{cssxref("content-position")}}. Thuộc tính `align-content` cũng chấp nhận các giá trị {{cssxref("baseline-position")}} và, giống như các thuộc tính `justify-*` khác, `justify-content` cũng chấp nhận `left` và `right`.

Các từ khóa hợp lệ cho `place-content` bao gồm:

- `normal`
- `start`
- `end`
- `center`
- `stretch`
- `space-around`
- `space-between`
- `space-evenly`
- `baseline`
- `first baseline`
- `last baseline`
- `left`
- `right`

Thuộc tính `align-content` được áp dụng cho grid container vì nó hoạt động trên toàn bộ grid.

### Alignment mặc định

Trong ví dụ này, grid container 500px x 500px có ba track hàng và ba cột track 100px với gutter 10px. Điều này có nghĩa là có không gian bên trong grid container theo cả hướng block và inline.

Theo mặc định, các grid track của chúng ta nằm ở góc trên bên trái của grid, được căn chỉnh với các đường grid bắt đầu, vì hành vi mặc định trong grid layout là `start`:

```css
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
  grid-template-columns: repeat(3, 100px);
  grid-template-rows: repeat(3, 100px);
  height: 500px;
  width: 500px;
  gap: 10px;
  grid-template-areas:
    "a a b"
    "a a b"
    "c d d";
}
.item1 {
  grid-area: a;
}
.item2 {
  grid-area: b;
}
.item3 {
  grid-area: c;
}
.item4 {
  grid-area: d;
}
```

```html
<div class="wrapper">
  <div class="item1">Item 1</div>
  <div class="item2">Item 2</div>
  <div class="item3">Item 3</div>
  <div class="item4">Item 4</div>
</div>
```

{{ EmbedLiveSample('Default_alignment', '500', '550') }}

### Đặt align-content: end

Sử dụng cùng CSS và HTML, trong ví dụ này chúng ta thêm `align-content` với giá trị `end` vào container, vì vậy tất cả các track di chuyển đến đường kết thúc của grid container trong block dimension:

```css
.wrapper {
  align-content: end;
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

.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 100px);
  grid-template-rows: repeat(3, 100px);
  height: 500px;
  width: 500px;
  gap: 10px;
  grid-template-areas:
    "a a b"
    "a a b"
    "c d d";
}
.item1 {
  grid-area: a;
}
.item2 {
  grid-area: b;
}
.item3 {
  grid-area: c;
}
.item4 {
  grid-area: d;
}
```

```html hidden
<div class="wrapper">
  <div class="item1">Item 1</div>
  <div class="item2">Item 2</div>
  <div class="item3">Item 3</div>
  <div class="item4">Item 4</div>
</div>
```

{{ EmbedLiveSample('Setting_align-content_end', '500', '550') }}

### Đặt align-content: space-between

Chúng ta cũng có thể áp dụng các giá trị phân phối khoảng cách {{cssxref("content-distribution")}} như `space-between`, `space-around`, `space-evenly`, và `stretch`. Trong ví dụ này, chúng ta đặt {{cssxref("align-content")}}, căn chỉnh các track trên block axis, thành `space-between`, điều này phân phối các track đều nhau:

```css
.wrapper {
  align-content: space-between;
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

.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 100px);
  grid-template-rows: repeat(3, 100px);
  height: 500px;
  width: 500px;
  gap: 10px;
  grid-template-areas:
    "a a b"
    "a a b"
    "c d d";
}
.item1 {
  grid-area: a;
}
.item2 {
  grid-area: b;
}
.item3 {
  grid-area: c;
}
.item4 {
  grid-area: d;
}
```

```html hidden
<div class="wrapper">
  <div class="item1">Item 1</div>
  <div class="item2">Item 2</div>
  <div class="item3">Item 3</div>
  <div class="item4">Item 4</div>
</div>
```

{{ EmbedLiveSample('Setting_align-content_space-between', '500', '600') }}

Nếu một mục trải qua nhiều hơn một grid track, việc sử dụng giá trị phân phối khoảng cách có thể khiến các mục trên grid trở nên lớn hơn vì khoảng cách được thêm vào giữa các track được thêm vào mục trải qua. Do đó, nếu bạn sử dụng các giá trị này, hãy đảm bảo nội dung của các track có thể chứa thêm khoảng cách hoặc bạn đã sử dụng các thuộc tính alignment trên các mục, để chúng di chuyển đến đầu hoặc cuối thay vì stretch.

Trong hình ảnh dưới đây, chúng ta đặt grid với hai giá trị `align-content` khác nhau để so sánh `start` và `space-between`. Bạn có thể thấy hai mục đầu tiên, trải qua hai row track, đã tăng thêm chiều cao trong ví dụ `space-between` vì chúng đạt được khoảng cách tồn tại do không gian trống được phân phối _giữa_ ba hàng:

![Minh họa cách các mục trở nên lớn hơn nếu chúng ta sử dụng space-between.](7_space-between.png)

## Justify các grid track trên inline axis

Chúng ta có thể sử dụng `justify-content` để thực hiện cùng loại alignment trên inline axis mà chúng ta đã sử dụng `align-content` cho block axis.

Sử dụng ví dụ tương tự, chúng ta đặt {{cssxref("justify-content")}} thành `space-around`. Điều này một lần nữa khiến các track trải qua nhiều hơn một column track đạt được thêm khoảng cách:

```css
.wrapper {
  align-content: space-between;
  justify-content: space-around;
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

.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 100px);
  grid-template-rows: repeat(3, 100px);
  height: 500px;
  width: 500px;
  gap: 10px;
  grid-template-areas:
    "a a b"
    "a a b"
    "c d d";
}
.item1 {
  grid-area: a;
}
.item2 {
  grid-area: b;
}
.item3 {
  grid-area: c;
}
.item4 {
  grid-area: d;
}
```

```html hidden
<div class="wrapper">
  <div class="item1">Item 1</div>
  <div class="item2">Item 2</div>
  <div class="item3">Item 3</div>
  <div class="item4">Item 4</div>
</div>
```

{{ EmbedLiveSample('Justifying_the_grid_tracks_on_the_inline_axis', '500', '550') }}

## Alignment và auto margin

Một cách khác để căn chỉnh các mục bên trong vùng là sử dụng auto margin. Nếu bạn đã từng căn giữa một layout trong viewport, hoặc bất kỳ phần tử block level nào trong cha của nó, bạn có thể đã làm bằng cách đặt margin phải và trái của phần tử bạn muốn căn giữa thành `auto`. Auto margin hấp thụ tất cả không gian khả dụng. Đặt margin thành `auto` trên cả hai phía đẩy phần tử block-level vào giữa vì cả hai margin cố gắng chiếm tất cả không gian.

Trong ví dụ tiếp theo, mục 1 có thuộc tính {{cssxref("margin-left")}} được đặt thành `auto`. Điều này đẩy nội dung sang phía bên phải của vùng, vì auto margin chiếm không gian khả dụng còn lại sau khi không gian cần cho nội dung đã được giao:

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
  grid-template-columns: repeat(3, 100px);
  grid-template-rows: repeat(3, 100px);
  height: 500px;
  width: 500px;
  gap: 10px;
  grid-template-areas:
    "a a b"
    "a a b"
    "c d d";
}
.item1 {
  grid-area: a;
  margin-left: auto;
}
.item2 {
  grid-area: b;
}
.item3 {
  grid-area: c;
}
.item4 {
  grid-area: d;
}
```

```html
<div class="wrapper">
  <div class="item1">Item 1</div>
  <div class="item2">Item 2</div>
  <div class="item3">Item 3</div>
  <div class="item4">Item 4</div>
</div>
```

{{ EmbedLiveSample('Alignment_and_auto_margins', '500', '550') }}

Sử dụng grid inspector trong công cụ phát triển của trình duyệt để xem cách mục được căn chỉnh:

![Hình ảnh hiển thị auto-margin sử dụng Firefox grid highlighter.](7_auto_margins.png)

## Alignment và writing modes

Tất cả các ví dụ này đều bằng tiếng Anh, một ngôn ngữ trái sang phải. Điều này có nghĩa là các đường bắt đầu của chúng ta nằm ở trên cùng và bên trái của grid khi nghĩ theo hướng vật lý.

CSS grid layout và CSS box alignment hoạt động với writing mode trong CSS. Khi hiển thị một ngôn ngữ phải sang trái, chẳng hạn như tiếng Ả Rập, điểm bắt đầu của grid là phía trên bên phải, vì vậy mặc định của `justify-content: start` là để grid track bắt đầu ở phía bên phải của grid.

Đặt {{glossary("physical properties")}}, chẳng hạn như đặt auto margin sử dụng {{cssxref("margin-right")}} hoặc {{cssxref("margin-left")}}, hoặc định vị các mục tuyệt đối sử dụng các offset {{cssxref("top")}}, {{cssxref("right")}}, {{cssxref("bottom")}}, và {{cssxref("left")}}, không tôn trọng writing mode. Trong hướng dẫn [grids, logical values, và writing modes](/en-US/docs/Web/CSS/Guides/Grid_layout/Logical_values_and_writing_modes), chúng ta sẽ tìm hiểu thêm về sự tương tác giữa CSS grid layout, box alignment và writing mode. Điều này sẽ quan trọng để hiểu, nếu bạn phát triển các trang web sau đó được hiển thị bằng nhiều ngôn ngữ, hoặc nếu bạn muốn kết hợp các ngôn ngữ hoặc writing mode trong một thiết kế.

## Xem thêm

- [Khái niệm cơ bản về grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts)
- [Mối quan hệ của grid layout với các phương pháp layout khác](/en-US/docs/Web/CSS/Guides/Grid_layout/Relationship_with_other_layout_methods)
- [Grid layout sử dụng line-based placement](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement)
- [Grid template areas](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas)
- [Grid layout sử dụng named grid lines](/en-US/docs/Web/CSS/Guides/Grid_layout/Named_grid_lines)
- [Auto-placement trong grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Auto-placement)
- [Box alignment trong CSS grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
