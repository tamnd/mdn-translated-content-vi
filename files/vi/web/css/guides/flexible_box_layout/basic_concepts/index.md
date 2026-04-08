---
title: Basic concepts of flexbox
short-title: Basic concepts
slug: Web/CSS/Guides/Flexible_box_layout/Basic_concepts
page-type: guide
sidebar: cssref
---

Module [flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) (thường được gọi là flexbox) là mô hình bố cục một chiều để phân bổ không gian giữa các phần tử và bao gồm nhiều khả năng alignment. Bài viết này đưa ra tổng quan về các tính năng chính của flexbox, mà chúng ta sẽ khám phá chi tiết hơn trong phần còn lại của các hướng dẫn này.

Khi chúng ta mô tả flexbox là một chiều, chúng ta đang mô tả thực tế rằng flexbox xử lý bố cục theo một chiều tại một thời điểm — theo hàng hoặc theo cột. Điều này có thể đối lập với mô hình hai chiều của [CSS Grid Layout](/en-US/docs/Web/CSS/Guides/Grid_layout), kiểm soát cả cột và hàng cùng nhau.

## Hai trục của flexbox

Khi làm việc với flexbox, bạn cần suy nghĩ theo hai trục — _main axis_ và _cross axis_. [Main axis](#the_main_axis) được xác định bởi thuộc tính {{cssxref("flex-direction")}}, và [cross axis](#the_cross_axis) chạy vuông góc với nó. Tất cả mọi thứ chúng ta làm với flexbox đều liên quan đến những trục này, vì vậy việc hiểu cách chúng hoạt động từ đầu là rất quan trọng.

### Main axis

{{glossary("main axis")}} được xác định bởi `flex-direction`, có bốn giá trị có thể:

- `row`
- `row-reverse`
- `column`
- `column-reverse`

Nếu bạn chọn `row` hoặc `row-reverse`, main axis của bạn sẽ chạy dọc theo hàng theo **hướng inline**.

![Nếu flex-direction được đặt thành row thì main axis chạy dọc theo hàng theo hướng inline.](basics1.svg)

Chọn `column` hoặc `column-reverse` và main axis của bạn sẽ chạy theo **hướng block**, từ trên xuống dưới của trang.

![Nếu flex-direction được đặt thành column thì main axis chạy theo hướng block.](basics2.svg)

### Cross axis

{{glossary("cross axis")}} chạy vuông góc với main axis. Do đó, nếu `flex-direction` (main axis) của bạn được đặt thành `row` hoặc `row-reverse` thì cross axis chạy dọc theo các cột.

![Nếu flex-direction được đặt thành row thì cross axis chạy theo hướng block.](basics3.svg)

Nếu main axis của bạn là `column` hoặc `column-reverse` thì cross axis chạy dọc theo các hàng.

![Nếu flex-direction được đặt thành column thì cross axis chạy theo hướng inline.](basics4.svg)

## Đường bắt đầu và kết thúc

Một lĩnh vực quan trọng khác cần hiểu là flexbox không đưa ra giả định về writing mode của tài liệu. Flexbox không chỉ giả định rằng tất cả các dòng văn bản bắt đầu từ trên cùng bên trái của tài liệu và chạy về phía bên phải, với các dòng mới xuất hiện một dưới cái kia. Thay vào đó, nó hỗ trợ tất cả các writing mode, giống như các [thuộc tính và giá trị logical](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values) khác.

Bạn có thể [đọc thêm về mối quan hệ giữa flexbox và writing modes](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Relationship_with_other_layout_methods#writing_modes) trong một bài viết sau; tuy nhiên, mô tả sau đây sẽ giúp giải thích tại sao chúng ta không nói về trái và phải và trên và dưới khi mô tả hướng mà các flex item của chúng ta chảy theo.

Nếu `flex-direction` là `row` và tôi đang làm việc trong tiếng Anh, thì cạnh bắt đầu của main axis sẽ ở bên trái, cạnh kết thúc ở bên phải.

![Làm việc trong tiếng Anh thì cạnh bắt đầu ở bên trái.](basics5.svg)

Nếu tôi làm việc trong tiếng Ả Rập, thì cạnh bắt đầu của main axis sẽ ở bên phải và cạnh kết thúc ở bên trái.

![Cạnh bắt đầu trong ngôn ngữ RTL ở bên phải.](basics6.svg)

Trong cả hai trường hợp, cạnh bắt đầu của cross axis ở đầu flex container và cạnh kết thúc ở dưới cùng, vì cả hai ngôn ngữ đều có writing mode ngang.

Sau một thời gian, suy nghĩ về bắt đầu và kết thúc thay vì trái và phải trở nên tự nhiên, và sẽ hữu ích cho bạn khi xử lý các phương pháp bố cục khác như CSS Grid Layout tuân theo cùng một mẫu.

## Flex container

Một vùng của tài liệu được bố cục bằng flexbox được gọi là **flex container**. Để tạo {{glossary("flex container")}}, đặt thuộc tính {{cssxref("display")}} của vùng thành `flex`. Khi chúng ta làm điều này, các phần tử con trực tiếp của container đó trở thành **flex item**. Bạn có thể kiểm soát rõ ràng việc container hiển thị inline hay trong block formatting context bằng cách sử dụng `inline flex` hoặc `inline-flex` cho inline flex container hay `block flex` hoặc `flex` cho block level flex container.

### Giá trị ban đầu

Như với tất cả các thuộc tính trong CSS, một số giá trị ban đầu được xác định, vì vậy nội dung của flex container mới sẽ hoạt động như sau:

- Các phần tử hiển thị theo hàng (giá trị mặc định của thuộc tính {{cssxref("flex-direction")}} là `row`).
- Các phần tử bắt đầu từ cạnh bắt đầu của main axis.
- Các phần tử không kéo dài trên chiều chính nhưng có thể co lại (giá trị mặc định của thuộc tính {{cssxref("flex-grow")}} của flex item là `0` và giá trị mặc định của thuộc tính {{cssxref("flex-shrink")}} là `1`).
- Các phần tử sẽ kéo dài để lấp đầy kích thước của cross axis (giá trị mặc định của thuộc tính {{cssxref("align-items")}} là `stretch`).
- Giá trị mặc định của thuộc tính {{cssxref("flex-basis")}} của flex item là `auto`. Điều này có nghĩa là, trong mỗi trường hợp, nó sẽ bằng với {{cssxref("width")}} của flex item trong writing mode ngang, và {{cssxref("height")}} của flex item trong writing mode dọc. Nếu `width`/`height` tương ứng cũng được đặt thành `auto`, giá trị `content` của `flex-basis` được sử dụng thay thế.
- Tất cả các phần tử sẽ nằm trong một hàng duy nhất (giá trị mặc định của thuộc tính {{cssxref("flex-wrap")}} là `nowrap`), tràn ra khỏi container nếu tổng `width`/`height` của chúng vượt quá `width`/`height` của phần tử chứa.

Kết quả là các phần tử của bạn sẽ tất cả xếp hàng theo hàng, sử dụng kích thước của nội dung làm kích thước của chúng trên main axis. Nếu có nhiều phần tử hơn có thể vừa vào container, chúng sẽ không bao quanh mà thay vào đó sẽ tràn ra. Nếu một số phần tử cao hơn các phần tử khác, tất cả các phần tử sẽ kéo dài theo toàn bộ chiều dài của cross axis.

Bạn có thể thấy trong mẫu live bên dưới cách điều này trông như thế nào. Nhấp vào "Play" để mở ví dụ trong MDN Playground và chỉnh sửa các phần tử hoặc thêm phần tử mới để thử nghiệm hành vi ban đầu của flexbox:

```html live-sample___the-flex-container
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three <br />has <br />extra <br />text</div>
</div>
```

```css live-sample___the-flex-container
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}

.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
}
```

{{EmbedLiveSample("the-flex-container")}}

### Thay đổi flex-direction

Thêm thuộc tính {{cssxref("flex-direction")}} vào flex container cho phép chúng ta thay đổi hướng hiển thị của các flex item. Đặt `flex-direction: row-reverse` sẽ giữ các phần tử hiển thị theo hàng, tuy nhiên các đường bắt đầu và kết thúc bị đổi chỗ.

Nếu chúng ta thay đổi `flex-direction` thành `column`, main axis chuyển đổi và các phần tử giờ đây hiển thị theo cột. Đặt `column-reverse` và các đường bắt đầu và kết thúc lại bị đổi chỗ.

Mẫu live bên dưới có `flex-direction` được đặt thành `row-reverse`. Hãy thử các giá trị khác — `row`, `column` và `column-reverse` — để xem điều gì xảy ra với nội dung.

```html live-sample___flex-direction
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
</div>
```

```css live-sample___flex-direction
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}

.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
  flex-direction: row-reverse;
}
```

{{EmbedLiveSample("flex-direction")}}

## Flex container nhiều dòng với flex-wrap

Mặc dù flexbox là mô hình một chiều, nhưng có thể làm cho flex item bao quanh nhiều dòng. Nếu bạn làm điều này, bạn nên coi mỗi dòng là flex container mới. Bất kỳ việc phân bổ không gian nào cũng sẽ xảy ra trên mỗi dòng, mà không tham chiếu đến các dòng trước hoặc sau.

Để gây ra hành vi bao quanh, thêm thuộc tính {{cssxref("flex-wrap")}} với giá trị `wrap`. Bây giờ, nếu các phần tử quá lớn để hiển thị hết trong một dòng, chúng sẽ bao quanh sang dòng khác. Mẫu live bên dưới chứa các phần tử đã được cho một `width`. Tổng chiều rộng của các phần tử quá rộng cho flex container. Vì `flex-wrap` được đặt thành `wrap`, các phần tử bao quanh nhiều dòng. Nếu bạn đặt thành `nowrap`, đây là giá trị ban đầu, chúng sẽ co lại để vừa vào container. Chúng co lại vì chúng đang sử dụng giá trị flexbox ban đầu, bao gồm `flex-shrink: 1`, cho phép các phần tử co lại. Sử dụng `nowrap` sẽ gây ra [overflow](/en-US/docs/Learn_web_development/Core/Styling_basics/Overflow) nếu các phần tử không thể co lại, hoặc không thể co lại đủ nhỏ để vừa.

```html live-sample___flex-wrap
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
</div>
```

```css live-sample___flex-wrap
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  width: 200px;
}

.box {
  width: 500px;
  border: 2px dotted rgb(96 139 168);
  display: flex;
  flex-wrap: wrap;
}
```

{{EmbedLiveSample("flex-wrap")}}

Tìm hiểu thêm về việc bao quanh flex item trong hướng dẫn [Làm chủ việc bao quanh flex item](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Wrapping_items).

## Shorthand flex-flow

Bạn có thể kết hợp hai thuộc tính `flex-direction` và `flex-wrap` thành shorthand {{cssxref("flex-flow")}}.

Trong mẫu live bên dưới, hãy thử thay đổi giá trị đầu tiên thành một trong các giá trị được phép cho `flex-direction` - `row`, `row-reverse`, `column` hoặc `column-reverse`, và cũng thay đổi giá trị thứ hai thành `wrap` và `nowrap`.

```html live-sample___flex-flow
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
</div>
```

```css live-sample___flex-flow
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  width: 200px;
}

.box {
  width: 500px;
  border: 2px dotted rgb(96 139 168);
  display: flex;
  flex-flow: row wrap;
}
```

{{EmbedLiveSample("flex-flow")}}

## Các thuộc tính áp dụng cho flex item

Để kiểm soát kích thước inline của mỗi flex item, chúng ta nhắm đến chúng trực tiếp thông qua ba thuộc tính:

- {{cssxref("flex-grow")}}
- {{cssxref("flex-shrink")}}
- {{cssxref("flex-basis")}}

Chúng ta sẽ xem qua những thuộc tính này ngắn gọn bên dưới, nhưng nếu bạn muốn thông tin toàn diện hơn, hãy xem hướng dẫn [Kiểm soát tỷ lệ flex item trên main axis](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios).

Trước khi chúng ta có thể hiểu rõ những thuộc tính này, chúng ta cần xem xét khái niệm **available space** (không gian sẵn có). Những gì chúng ta làm khi thay đổi giá trị của các thuộc tính flex này là thay đổi cách phân bổ không gian sẵn có giữa các phần tử. Khái niệm không gian sẵn có này cũng quan trọng khi chúng ta xem xét việc căn chỉnh các phần tử.

Nếu chúng ta có ba phần tử rộng 100 pixel trong container rộng 500 pixel, thì không gian chúng ta cần để bố cục các phần tử là 300 pixel. Điều này để lại 200 pixel không gian sẵn có. Nếu chúng ta không thay đổi các giá trị ban đầu thì flexbox sẽ đặt không gian đó sau phần tử cuối cùng.

![Flex container này có không gian sẵn có sau khi bố cục các phần tử.](basics7.svg)

Nếu thay vào đó chúng ta muốn các phần tử phát triển và lấp đầy không gian, thì chúng ta cần có phương pháp phân bổ không gian còn lại giữa các phần tử. Các thuộc tính `flex` mà chúng ta áp dụng cho bản thân các phần tử cho phép xác định cách phân bổ không gian sẵn có đó giữa các flex item anh em.

### Thuộc tính flex-basis

`flex-basis` là thứ xác định kích thước của phần tử đó theo không gian mà nó để lại làm không gian sẵn có. Giá trị ban đầu của thuộc tính này là `auto` — trong trường hợp này trình duyệt kiểm tra xem phần tử có kích thước không. Trong ví dụ trên, tất cả các phần tử đều có chiều rộng 100 pixel. Điều này được sử dụng làm `flex-basis`.

Nếu các phần tử không có kích thước thì kích thước của nội dung được dùng làm flex-basis. Đó là lý do tại sao khi chúng ta chỉ khai báo `display: flex` trên phần tử cha để tạo flex item, tất cả các phần tử di chuyển vào một hàng và chỉ chiếm nhiều không gian bằng cần thiết để hiển thị nội dung của chúng.

### Thuộc tính flex-grow

Với thuộc tính `flex-grow` được đặt thành một số nguyên dương, nếu có không gian sẵn có, flex item có thể phát triển dọc theo main axis từ `flex-basis` của nó. Liệu phần tử có kéo dài để chiếm tất cả không gian sẵn có trên trục đó, hay chỉ một phần của không gian sẵn có phụ thuộc vào liệu các phần tử khác có được phép phát triển hay không và giá trị `flex-grow` của chúng.

Mỗi phần tử có giá trị dương tiêu thụ một phần của bất kỳ không gian sẵn có nào dựa trên giá trị `flex-grow` của chúng. Nếu chúng ta cho tất cả các phần tử trong ví dụ trên giá trị `flex-grow` là 1 thì không gian sẵn có trong flex container sẽ được chia đều giữa các phần tử và chúng sẽ kéo dài để lấp đầy container trên main axis. Nếu chúng ta cho phần tử đầu tiên giá trị `flex-grow` là 2, và các phần tử khác mỗi cái giá trị là 1, thì có tổng cộng 4 phần; 2 phần không gian sẵn có sẽ được cho phần tử đầu tiên (100px trên 200px trong trường hợp ví dụ trên) và 1 phần mỗi phần tử còn lại (50px mỗi cái trên 200px tổng).

### Thuộc tính flex-shrink

Trong khi thuộc tính `flex-grow` xử lý việc thêm không gian trong main axis, thuộc tính `flex-shrink` kiểm soát cách không gian được lấy đi. Nếu chúng ta không có đủ không gian trong container để bố cục các phần tử, và `flex-shrink` được đặt thành một số nguyên dương, thì phần tử có thể trở nên nhỏ hơn `flex-basis`. Cũng như với `flex-grow`, các giá trị khác nhau có thể được gán để khiến một phần tử co lại nhanh hơn các phần tử khác — một phần tử có giá trị cao hơn được đặt cho `flex-shrink` sẽ co lại nhanh hơn các phần tử anh em có giá trị thấp hơn.

Một phần tử có thể co lại xuống đến kích thước {{cssxref("min-content")}} của nó. Kích thước tối thiểu này được tính đến trong khi tính toán lượng co lại thực sự sẽ xảy ra, có nghĩa là `flex-shrink` có khả năng ít nhất quán hơn `flex-grow` về hành vi. Do đó chúng ta sẽ xem xét kỹ hơn cách thuật toán này hoạt động trong bài viết [Kiểm soát tỷ lệ của các phần tử theo main axis](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios).

> [!NOTE]
> Các giá trị này cho `flex-grow` và `flex-shrink` là tỷ lệ. Thông thường nếu chúng ta có tất cả các phần tử được đặt thành `flex: 1 1 200px` và sau đó muốn một phần tử phát triển với tốc độ gấp đôi, chúng ta sẽ đặt phần tử đó thành `flex: 2 1 200px`. Tuy nhiên bạn cũng có thể sử dụng `flex: 10 1 200px` và `flex: 20 1 200px` nếu muốn.

### Giá trị shorthand cho các thuộc tính flex

Bạn sẽ hiếm khi thấy các thuộc tính `flex-grow`, `flex-shrink` và `flex-basis` được sử dụng riêng lẻ; thay vào đó chúng được kết hợp thành shorthand {{cssxref("flex")}}. Shorthand `flex` cho phép bạn đặt ba giá trị theo thứ tự này — `flex-grow`, `flex-shrink`, `flex-basis`.

Mẫu live bên dưới cho phép bạn thử nghiệm các giá trị khác nhau của flex shorthand; hãy nhớ rằng giá trị đầu tiên là `flex-grow`. Cho giá trị dương có nghĩa là phần tử có thể phát triển. Giá trị thứ hai là `flex-shrink` — với giá trị dương các phần tử có thể co lại, nhưng chỉ khi tổng giá trị của chúng tràn qua main axis. Giá trị cuối cùng là `flex-basis`; đây là giá trị mà các phần tử đang sử dụng làm giá trị cơ sở để phát triển và co lại.

```html live-sample___flex-properties
<div class="box">
  <div class="one">One</div>
  <div class="two">Two</div>
  <div class="three">Three</div>
</div>
```

```css live-sample___flex-properties
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}

.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
}

.one {
  flex: 1 1 auto;
}

.two {
  flex: 1 1 auto;
}

.three {
  flex: 1 1 auto;
}
```

{{EmbedLiveSample("flex-properties")}}

Ngoài ra còn có một số giá trị shorthand được xác định trước bao gồm hầu hết các trường hợp sử dụng. Bạn sẽ thường thấy chúng được sử dụng trong các hướng dẫn, và trong nhiều trường hợp đây là tất cả những gì bạn cần sử dụng. Các giá trị được xác định trước như sau:

- `flex: initial`
- `flex: auto`
- `flex: none`
- `flex: <positive-number>`

Giá trị `initial` là một [CSS-wide keyword](/en-US/docs/Web/CSS/Reference/Values/Data_types#css-wide_keywords) đại diện cho giá trị ban đầu của thuộc tính. Đặt `flex: initial` đặt lại phần tử về [giá trị ban đầu](#initial_values) của ba thuộc tính longhand, giống như `flex: 0 1 auto`. Giá trị ban đầu của `flex-grow` là `0`, vì vậy các phần tử sẽ không phát triển lớn hơn kích thước `flex-basis` của chúng. Giá trị ban đầu của `flex-shrink` là `1`, vì vậy các phần tử có thể co lại nếu cần thay vì tràn ra. Giá trị ban đầu của `flex-basis` là `auto`. Các phần tử sẽ sử dụng bất kỳ kích thước nào được đặt trên phần tử trong chiều chính, hoặc chúng sẽ lấy kích thước từ kích thước nội dung.

Sử dụng `flex: auto` giống như sử dụng `flex: 1 1 auto`; điều này tương tự như `flex: initial`, ngoại trừ việc các phần tử có thể phát triển và lấp đầy container cũng như co lại nếu cần.

Sử dụng `flex: none` sẽ tạo ra các flex item hoàn toàn không linh hoạt. Nó như thể bạn đã viết `flex: 0 0 auto`. Các phần tử không thể phát triển hoặc co lại và sẽ được bố cục bằng flexbox với `flex-basis` là `auto`.

Shorthand mà bạn thường thấy trong các hướng dẫn là `flex: 1` hoặc `flex: 2` và như vậy. Điều này giống như viết `flex: 1 1 0` hoặc `flex: 2 1 0` và như vậy tương ứng. Các phần tử có kích thước tối thiểu do `flex-basis: 0` và sau đó phát triển tỷ lệ để lấp đầy không gian sẵn có. Trong trường hợp này, giá trị `flex-shrink` là `1` là dư thừa vì các phần tử bắt đầu với kích thước tối thiểu — chúng không được cho bất kỳ kích thước nào có thể khiến chúng tràn qua flex container.

Hãy thử các giá trị shorthand này trong mẫu live bên dưới.

```html live-sample___flex-shorthands
<div class="box">
  <div class="one">One</div>
  <div class="two">Two</div>
  <div class="three">Three</div>
</div>
```

```css live-sample___flex-shorthands
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}

.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
}

.one {
  flex: 1;
}

.two {
  flex: 1;
}

.three {
  flex: 1;
}
```

{{EmbedLiveSample("flex-shorthands")}}

## Alignment, justification và phân bổ không gian trống giữa các phần tử

Một tính năng quan trọng của flexbox là khả năng căn chỉnh và justify các phần tử trên main axis và cross axis, và phân bổ không gian giữa các flex item. Lưu ý rằng các thuộc tính này được đặt trên flex container, không phải trên bản thân các phần tử.

### align-items

Thuộc tính {{cssxref("align-items")}} căn chỉnh tất cả các flex item trên cross axis.

Giá trị ban đầu của thuộc tính này là `stretch` và đó là lý do tại sao các flex item theo mặc định kéo dài đến chiều cao của flex container (hoặc chiều rộng nếu `flex-direction` được đặt thành `column` hoặc `column-reverse`). Chiều cao này có thể đến từ phần tử cao nhất trong container hoặc kích thước được đặt trên flex container.

Thay vào đó bạn có thể đặt `align-items` thành `flex-start`, hoặc đơn giản là `start`, để làm cho các phần tử xếp hàng ở đầu flex container, `flex-end`, hoặc chỉ là `end`, để căn chỉnh chúng về cuối, hoặc `center` để căn chỉnh chúng ở giữa. Hãy thử điều này trong mẫu live — Tôi đã cho flex container một chiều cao để bạn có thể thấy cách các phần tử có thể được di chuyển xung quanh trong container. Xem điều gì xảy ra nếu bạn đặt giá trị của align-items thành:

- `stretch`
- `flex-start`
- `flex-end`
- `start`
- `end`
- `center`
- `baseline`
- `last baseline`

```html live-sample___align-items
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three <br />has <br />extra <br />text</div>
</div>
```

```css live-sample___align-items
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}

.box {
  width: 500px;
  height: 130px;
  border: 2px dotted rgb(96 139 168);
  display: flex;
  align-items: flex-start;
}
```

{{EmbedLiveSample("align-items")}}

`align-items` được đặt trên flex container và tác động đến tất cả flex item. Nếu bạn muốn căn chỉnh một flex item khác so với các phần tử khác, bạn có thể đặt {{cssxref("align-self")}} trên flex item đó.

### justify-content

Thuộc tính {{cssxref("justify-content")}} được dùng để căn chỉnh các phần tử trên main axis, hướng mà `flex-direction` đã đặt luồng. Giá trị ban đầu là `flex-start` sẽ xếp hàng các phần tử ở cạnh bắt đầu của container, nhưng bạn cũng có thể đặt giá trị thành `flex-end` để xếp hàng chúng ở cuối, hoặc `center` để xếp hàng chúng ở giữa.

Bạn cũng có thể sử dụng giá trị `space-between` để lấy tất cả không gian còn lại sau khi các phần tử được bố cục, và chia đều nó giữa các phần tử để có một lượng không gian bằng nhau giữa mỗi phần tử. Để gây ra một lượng không gian bằng nhau ở bên phải và bên trái (hoặc trên và dưới cho cột) của mỗi phần tử, sử dụng giá trị `space-around`. Với `space-around`, các phần tử có không gian nửa kích thước ở mỗi đầu. Hoặc, để khiến các phần tử có không gian bằng nhau xung quanh chúng, sử dụng giá trị `space-evenly`. Với `space-evenly`, các phần tử có không gian đầy kích thước ở mỗi đầu.

Hãy thử các giá trị `justify-content` sau trong mẫu live:

- `start`
- `end`
- `left`
- `right`
- `normal`
- `flex-start`
- `flex-end`
- `center`
- `space-around`
- `space-between`
- `space-evenly`
- `stretch`

```html live-sample___justify-content
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
</div>
```

```css live-sample___justify-content
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}

.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
  justify-content: flex-start;
}
```

{{EmbedLiveSample("justify-content")}}

Bài viết [Căn chỉnh các phần tử trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items) khám phá những thuộc tính này sâu hơn, để hiểu rõ hơn cách chúng hoạt động. Tuy nhiên những ví dụ cơ bản này hữu ích trong hầu hết các trường hợp sử dụng.

### justify-items

Thuộc tính {{cssxref("justify-items")}} bị bỏ qua trong flexbox layouts.

### place-items và place-content

Thuộc tính {{cssxref("place-items")}} là thuộc tính shorthand cho `align-items` và `justify-items`. Nếu được đặt trên flex container, nó sẽ đặt alignment nhưng không phải justification, vì `justify-items` bị bỏ qua trong flexbox.

Có một thuộc tính shorthand khác, {{cssxref("place-content")}}, xác định các thuộc tính {{cssxref("align-content")}} và `justify-content`. Thuộc tính `align-content` chỉ ảnh hưởng đến flex container có wrap, và được thảo luận trong [Căn chỉnh các phần tử trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items).

## Bước tiếp theo

Sau khi đọc bài viết này, bạn nên có hiểu biết về các tính năng cơ bản của flexbox. Trong bài tiếp theo, chúng ta sẽ xem xét [cách specification này liên quan đến các phần khác của CSS](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Relationship_with_other_layout_methods).
