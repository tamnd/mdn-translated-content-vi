---
title: Grids, logical values, and writing modes
short-title: Logical values and writing modes
slug: Web/CSS/Guides/Grid_layout/Logical_values_and_writing_modes
page-type: guide
sidebar: cssref
---

Một trong những tính năng quan trọng nhất của CSS grid layout là hỗ trợ cho các writing mode khác nhau được tích hợp sẵn trong đặc tả. Trong hướng dẫn này, chúng ta sẽ xem xét tính năng này của CSS grid layout và các phương pháp layout hiện đại khác, đồng thời tìm hiểu một chút về writing modes và các thuộc tính logical so với physical.

## Thuộc tính và giá trị logical và physical

CSS có đầy đủ các thuộc tính và từ khóa định vị **physical** – `left` và `right`, `top` và `bottom`. Trong đoạn code dưới đây, chúng ta định vị một phần tử bằng absolute positioning và sử dụng các {{glossary("inset properties")}} physical làm giá trị offset để dịch chuyển phần tử. Phần tử được đặt cách 20 pixel từ trên cùng và 30 pixel từ bên trái của container:

```css
.container {
  position: relative;
}
.item {
  position: absolute;
  top: 20px;
  left: 30px;
}
```

```html
<div class="container">
  <div class="item">Item</div>
</div>
```

Ví dụ này sử dụng các thuộc tính {{cssxref("left")}} và {{cssxref("right")}}; đây chỉ là hai trong số nhiều **{{glossary("physical properties")}}** trong CSS. Chúng ta cũng có thể thêm margin, padding và border bằng các thuộc tính physical, ví dụ {{cssxref("margin-left")}} và {{cssxref("padding-left")}}. Bạn cũng có thể thấy các từ khóa physical được sử dụng, chẳng hạn khi dùng `text-align: right` để căn chỉnh văn bản sang phải.

Chúng ta gọi các từ khóa và thuộc tính này là _physical_ vì chúng liên quan đến màn hình bạn đang xem. Left luôn là trái, bất kể văn bản của bạn đang chạy theo hướng nào.

### Vấn đề với thuộc tính physical

Các thuộc tính physical có thể gây ra vấn đề khi phát triển một trang web cần hoạt động với nhiều ngôn ngữ, bao gồm các ngôn ngữ mà văn bản chạy từ phải sang trái, hoặc từ trên xuống dưới. Các trình duyệt được thiết kế để hiển thị nội dung chính xác bất kể ngôn ngữ. Một số tính năng CSS có thể ghi đè các mặc định của trình duyệt và khiến nội dung hiển thị kém tối ưu.

Trong ví dụ này, thuộc tính {{cssxref("direction")}} đã được đặt thành {{glossary("rtl")}}, điều này chuyển writing mode từ mặc định `ltr` của tài liệu tiếng Anh. Chúng ta có hai đoạn văn. Cả hai đều phải chạy từ phải sang trái do giá trị `direction` được đặt trên phần tử tổ tiên (`<body>`). Đoạn đầu tiên có {{cssxref("text-align")}} được đặt thành `left`, vì vậy nó căn trái với container. Đoạn thứ hai căn phải và chạy từ phải sang trái.

```html hidden
<p class="left">
  I have my text set to <code>text-align: left</code> I will always align left
  even if the direction of the text in this document is rtl.
</p>

<p>I have no alignment set and use the direction set in the document.</p>
```

```css
body {
  direction: rtl;
}
.left {
  text-align: left;
}
```

```css hidden
p {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  margin: 1em;
  color: #d9480f;
}
```

{{EmbedLiveSample("Issues with physical properties","",170)}}

Đây là một minh họa cơ bản về các vấn đề có thể phát sinh khi sử dụng các giá trị và thuộc tính physical trong CSS. Nếu chúng ta viết CSS bằng các thuộc tính và từ khóa physical, chúng ta đang nói với trình duyệt về giả định của mình về cách văn bản sẽ chạy và ngăn trình duyệt xử lý các writing mode khác.

### Thuộc tính và giá trị logical

**{{glossary("Logical properties")}} và giá trị** không giả định hướng văn bản. Đây là lý do tại sao chúng ta sử dụng từ khóa `start` trong CSS grid layout để căn chỉnh thứ gì đó với điểm bắt đầu của container. Khi làm việc với nội dung tiếng Anh, `start` sẽ ở bên trái, tuy nhiên nó không nhất thiết phải là như vậy. Từ `start` không ngụ ý vị trí physical nào, cho phép các trang web bắt đầu nội dung ở bên phải khi sử dụng các ngôn ngữ từ phải sang trái như tiếng Ả Rập.

## Block và Inline

Khi sử dụng các thuộc tính logical thay vì physical, chúng ta không nhìn thế giới theo hướng trái phải và trên dưới. Chúng ta có một điểm tham chiếu khác. Đây là nơi việc hiểu các trục _block_ và _inline_, được giới thiệu trong [hướng dẫn căn chỉnh grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Box_alignment), trở nên rất hữu ích. Nếu bạn nghĩ về layout theo block và inline, cách mọi thứ hoạt động trong CSS grid layout trở nên rất có ý nghĩa.

![Hình ảnh hiển thị hướng mặc định của các trục block và inline.](8-horizontal-tb.png)

## CSS writing modes

Module [CSS writing modes](/en-US/docs/Web/CSS/Guides/Writing_modes) chỉ định cách writing modes hoạt động trong CSS. Các tính năng này không chỉ để hỗ trợ các ngôn ngữ có writing mode khác tiếng Anh; chúng cũng có thể được sử dụng cho mục đích sáng tạo. Các ví dụ trong phần này sử dụng thuộc tính {{cssxref("writing-mode")}} để thực hiện các thay đổi đối với writing mode được áp dụng cho grid, minh họa cách các giá trị logical hoạt động trong quá trình đó.

### `writing-mode`

Writing modes không chỉ là văn bản từ trái sang phải và từ phải sang trái, và thuộc tính `writing-mode` giúp chúng ta hiển thị văn bản chạy theo các hướng khác. Thuộc tính {{cssxref("writing-mode")}} có thể có các giá trị:

- `horizontal-tb`
- `vertical-rl`
- `vertical-lr`
- `sideways-rl`
- `sideways-lr`

Giá trị `horizontal-tb`, nghĩa là "horizontal, top to bottom" (nằm ngang, từ trên xuống dưới), là mặc định cho văn bản trên web. Đó là hướng bạn đang đọc hướng dẫn này. Các giá trị khác thay đổi cách văn bản chạy trong tài liệu, phù hợp với các writing mode khác nhau trên toàn thế giới.

Ví dụ, chúng ta có hai đoạn văn bên dưới. Đoạn đầu tiên sử dụng giá trị `horizontal-tb` mặc định, và đoạn thứ hai sử dụng `vertical-rl`. Trong writing mode thứ hai, văn bản vẫn chạy từ trái sang phải, tuy nhiên hướng của văn bản là dọc — văn bản inline bây giờ chạy xuống trang, từ trên xuống dưới.

```css hidden
.wrapper > p {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  margin: 1em;
  color: #d9480f;
  max-width: 300px;
}
```

```html
<div class="wrapper">
  <p class="horizontal-tb">
    I have writing mode set to the default <code>horizontal-tb</code>
  </p>
  <p class="vertical-rl">I have writing mode set to <code>vertical-rl</code></p>
</div>
```

```css
.horizontal-tb {
  writing-mode: horizontal-tb;
}
.vertical-rl {
  writing-mode: vertical-rl;
}
```

{{ EmbedLiveSample('writing-mode', '500', '420') }}

## Writing modes trong grid layout

Áp dụng điều này vào ví dụ grid layout, chúng ta có thể thấy rằng việc thay đổi writing mode có nghĩa là thay đổi ý tưởng của chúng ta về vị trí các trục block và inline.

### Writing mode mặc định

Trong ví dụ này, grid có ba cột và hai row track. Điều này có nghĩa là có ba track chạy dọc theo trục block. Trong writing mode mặc định, grid tự động đặt các phần tử bắt đầu từ góc trên bên trái, di chuyển sang phải, lấp đầy ba ô trên trục inline. Sau đó nó chuyển sang dòng tiếp theo, tạo một row track mới và lấp đầy thêm các phần tử:

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
  grid-template-rows: repeat(2, 100px);
  gap: 10px;
}
```

```html
<div class="wrapper">
  <div class="item1">Item 1</div>
  <div class="item2">Item 2</div>
  <div class="item3">Item 3</div>
  <div class="item4">Item 4</div>
  <div class="item5">Item 5</div>
</div>
```

{{ EmbedLiveSample('Default_writing_mode', '500', '230') }}

### Thiết lập writing mode

Nếu chúng ta thêm `writing-mode: vertical-lr` vào grid container trong ví dụ trước, chúng ta có thể thấy rằng các trục block và inline bây giờ chạy theo hướng khác. Trục block hay _column_ bây giờ chạy ngang trang từ trái sang phải, trong khi trục inline chạy xuống trang, tạo các hàng từ trên xuống dưới.

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
  grid-template-rows: repeat(2, 100px);
  gap: 10px;
}
```

```css
.wrapper {
  writing-mode: vertical-lr;
}
```

```html hidden
<div class="wrapper">
  <div class="item1">Item 1</div>
  <div class="item2">Item 2</div>
  <div class="item3">Item 3</div>
  <div class="item4">Item 4</div>
  <div class="item5">Item 5</div>
</div>
```

{{ EmbedLiveSample('Setting_writing_mode', '500', '330') }}

## Giá trị logical cho alignment

Với các trục block và inline có khả năng thay đổi hướng, các giá trị logical cho các thuộc tính alignment bắt đầu có ý nghĩa hơn.

Trong ví dụ này, chúng ta sử dụng alignment (các thuộc tính {{cssxref("align-self")}} và {{cssxref("justify-self")}}) để căn chỉnh các phần tử bên trong một grid được đặt thành `writing-mode: vertical-lr`. Các thuộc tính `start` và `end` hoạt động theo cách hoàn toàn giống như chúng làm trong writing mode mặc định, và vẫn mang tính logical theo cách mà việc sử dụng left và right, top và bottom để căn chỉnh các phần tử sẽ không làm được. Điều này xảy ra khi chúng ta lật grid sang một bên, như thế này:

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
  writing-mode: vertical-lr;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(3, 100px);
  gap: 10px;
}

.item1 {
  grid-column: 1 / 4;
  align-self: start;
}

.item2 {
  grid-column: 1 / 3;
  grid-row: 2 / 4;
  align-self: start;
}

.item3 {
  grid-column: 3;
  grid-row: 2 / 4;
  align-self: end;
  justify-self: end;
}
```

```html
<div class="wrapper">
  <div class="item1">Item 1</div>
  <div class="item2">Item 2</div>
  <div class="item3">Item 3</div>
</div>
```

{{ EmbedLiveSample('Logical_values_for_alignment', '500', '280') }}

Nếu bạn muốn xem cách chúng hoạt động với writing mode từ phải sang trái cũng như từ trên xuống dưới, hãy chuyển `vertical-lr` thành `vertical-rl`, là writing mode dọc chạy từ phải sang trái.

## Auto-placement và writing modes

Như chúng ta đã thấy trong các ví dụ trước, writing mode có thể thay đổi hướng trực quan mà các phần tử tự đặt trên grid. Các phần tử theo mặc định sẽ tự đặt dọc theo trục inline, thêm các hàng mới theo hướng block. Chúng ta đã thấy rằng trục inline không luôn chạy từ trái sang phải, và trục block không luôn chạy từ trên xuống dưới.

## Line-based placement và Writing Modes

Điều quan trọng cần nhớ khi đặt các phần tử theo số đường kẻ là đường kẻ 1 là đường kẻ bắt đầu và đường kẻ -1 là đường kẻ kết thúc, bất kể bạn đang ở trong writing mode nào.

### Line-based placement với văn bản từ trái sang phải

Trong ví dụ này, chúng ta có một grid được bố trí theo hướng `ltr` mặc định, với ba phần tử được định vị bằng line-based placement.

- Item 1 bắt đầu tại đường kẻ cột 1, trải dài qua một track.
- Item 2 bắt đầu tại đường kẻ cột -1, trải dài đến -3.
- Item 3 bắt đầu tại đường kẻ cột 1, trải dài đến đường kẻ cột 3.

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
  grid-template-rows: repeat(2, 100px);
  gap: 10px;
}
.item1 {
  grid-column: 1;
}
.item2 {
  grid-column: -1 / -3;
}
.item3 {
  grid-column: 1 / 3;
  grid-row: 2;
}
```

```html
<div class="wrapper">
  <div class="item1">Item 1</div>
  <div class="item2">Item 2</div>
  <div class="item3">Item 3</div>
</div>
```

{{ EmbedLiveSample('Line-based_placement_with_left_to_right_text', '500', '240') }}

### Line-based placement với văn bản từ phải sang trái

Nếu chúng ta thêm thuộc tính {{cssxref("direction")}} với giá trị `rtl` vào grid container trong ví dụ trước, đường kẻ 1 được đặt ở phía bên phải của grid, và đường kẻ -1 ở bên trái.

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
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(2, 100px);
  gap: 10px;
}

.item1 {
  grid-column: 1;
}

.item2 {
  grid-column: -1 / -3;
}

.item3 {
  grid-column: 1 / 3;
  grid-row: 2;
}
```

```css
.wrapper {
  direction: rtl;
}
```

```html hidden
<div class="wrapper">
  <div class="item1">Item 1</div>
  <div class="item2">Item 2</div>
  <div class="item3">Item 3</div>
</div>
```

{{ EmbedLiveSample('Line-based_placement_with_right_to_left_text', '500', '240') }}

Nếu bạn đang chuyển hướng văn bản, cho toàn bộ trang hay cho một phần của trang, và đang sử dụng các đường kẻ, bạn có thể muốn [đặt tên cho các đường kẻ](/en-US/docs/Web/CSS/Guides/Grid_layout/Named_grid_lines) để tránh bố cục hoàn toàn đổi hướng. Đối với một số thứ, ví dụ khi một grid chứa nội dung văn bản, sự chuyển đổi này có thể là đúng như bạn muốn. Đối với các mục đích sử dụng khác thì có thể không.

### Thứ tự kỳ lạ của các giá trị trong thuộc tính `grid-area`

Bạn có thể sử dụng thuộc tính {{cssxref("grid-area")}} để chỉ định tất cả bốn đường kẻ của một grid area dưới dạng một giá trị. Khi mọi người lần đầu gặp điều này, họ thường ngạc nhiên rằng các giá trị không tuân theo cùng thứ tự như shorthand cho {{cssxref("margin")}} – chạy theo chiều kim đồng hồ: top, right, bottom, left.

Thứ tự các giá trị `grid-area` là:

- `grid-row-start`
- `grid-column-start`
- `grid-row-end`
- `grid-column-end`

Với tiếng Anh, trong left-to-right có nghĩa thứ tự là:

- `top`
- `left`
- `bottom`
- `right`

Đây là ngược chiều kim đồng hồ! Đó là ngược với những gì chúng ta làm với margin và padding. Nếu chúng ta nhớ rằng `grid-area` nhìn thế giới là "block và inline", bạn sẽ nhận thấy chúng ta đang thiết lập hai điểm bắt đầu, sau đó hai điểm kết thúc, điều này hợp lý hơn nhiều khi bạn hiểu!

## Kết hợp writing modes và grid layout

Ngoài việc hiển thị tài liệu bằng writing mode chính xác cho ngôn ngữ, writing modes có thể được sử dụng sáng tạo trong các tài liệu vốn là `ltr`. Trong ví dụ này, chúng ta có grid layout với một tập hợp các liên kết dọc một bên. Chúng ta sử dụng writing modes (`writing-mode: vertical-lr`) để xoay chúng sang một bên trong column track:

```css
.wrapper {
  display: grid;
  grid-gap: 20px;
  grid-template-columns: 1fr auto;
  font:
    1em "Helvetica",
    "Arial",
    sans-serif;
}
nav {
  writing-mode: vertical-lr;
}
nav ul {
  list-style: none;
  margin: 0;
  padding: 1em;
  display: flex;
  justify-content: space-between;
}
nav a {
  text-decoration: none;
}
```

```html
<div class="wrapper">
  <div class="content">
    <p>
      Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
      kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus
      winter purslane kale. Celery potato scallion desert raisin horseradish
      spinach carrot soko. Lotus root water spinach fennel kombu maize bamboo
      shoot green bean swiss chard seakale pumpkin onion chickpea gram corn pea.
      Brussels sprout coriander water chestnut gourd swiss chard wakame kohlrabi
      beetroot carrot watercress. Corn amaranth salsify bunya nuts nori azuki
      bean chickweed potato bell pepper artichoke.
    </p>
    <p>
      Nori grape silver beet broccoli kombu beet greens fava bean potato
      quandong celery. Bunya nuts black-eyed pea prairie turnip leek lentil
      turnip greens parsnip. Sea lettuce water chestnut eggplant winter purslane
      fennel azuki bean earthnut pea sierra leone bologi leek soko chicory
      celtuce parsley jícama salsify.
    </p>
  </div>
  <nav>
    <ul>
      <li><a href="">Link 1</a></li>
      <li><a href="">Link 2</a></li>
      <li><a href="">Link 3</a></li>
    </ul>
  </nav>
</div>
```

{{ EmbedLiveSample('Mixed_writing_modes_and_grid_layout', '500', '280') }}

## Giá trị physical và thuộc tính logical

Nếu bạn kết hợp các thuộc tính grid logical với các thuộc tính physical, hãy nhớ rằng các thuộc tính physical sẽ không thay đổi theo writing mode. Trong hướng dẫn [Căn chỉnh các phần tử trong CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Box_alignment), chúng ta sử dụng auto margins để đẩy một phần tử ra khỏi các phần tử khác; điều này dùng các thuộc tính physical. Có các thuộc tính logical tương đương cho hầu hết các thuộc tính physical, tôn trọng writing modes theo cách giống như các thuộc tính và giá trị grid placement và alignment.

Tương tự, khi sử dụng absolute positioning trong một grid area, bạn có thể sử dụng các {{glossary("inset properties")}} logical để đặt các phần tử bên trong grid area. Khi kết hợp các thuộc tính và giá trị logical và physical, hãy nhận thức về sự căng thẳng giữa chúng. Ví dụ, bạn có thể cần thay đổi CSS của mình để đối phó với sự chuyển đổi từ `ltr` sang `rtl`. Sự hiểu biết của bạn về block và inline thông qua grid sẽ giúp bạn hiểu [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values).
