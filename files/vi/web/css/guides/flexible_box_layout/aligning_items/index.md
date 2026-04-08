---
title: Aligning items in a flex container
short-title: Aligning flex items
slug: Web/CSS/Guides/Flexible_box_layout/Aligning_items
page-type: guide
sidebar: cssref
---

Một trong những lý do flexbox rất hữu ích là nó cho phép căn chỉnh đúng cách, bao gồm cung cấp phương pháp nhanh để căn giữa các phần tử theo chiều dọc. Trong hướng dẫn này, chúng ta sẽ xem xét kỹ lưỡng cách các thuộc tính alignment và justification hoạt động trong flexbox.

## Sử dụng alignment trong flexbox

Flexbox cung cấp một số thuộc tính để kiểm soát alignment và khoảng cách, với `align-items` và `justify-content` là căn bản để căn giữa các phần tử. Để căn giữa một phần tử, chúng ta sử dụng thuộc tính {{cssxref("align-items")}} để căn chỉnh phần tử trên {{glossary("cross axis")}}, trong trường hợp này là [block axis](/en-US/docs/Glossary/Flow_relative_values) chạy theo chiều dọc. Chúng ta sử dụng {{cssxref("justify-content")}} để căn chỉnh phần tử trên main axis, trong trường hợp này là inline axis chạy theo chiều ngang.

![Cross axis là trục dọc và main axis là trục ngang.](align1.png)

Thay đổi kích thước container hoặc phần tử lồng nhau trong ví dụ mã bên dưới. Phần tử lồng nhau luôn ở giữa.

```html live-sample___intro
<div class="box">
  <div></div>
</div>
```

```css live-sample___intro
.box {
  display: flex;
  align-items: center;
  justify-content: center;
  border: 2px dotted rgb(96 139 168);
}

.box div {
  width: 100px;
  height: 100px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
```

{{EmbedLiveSample("intro")}}

## Các thuộc tính kiểm soát alignment trong flexbox

Các thuộc tính chúng ta sẽ xem xét trong hướng dẫn này như sau.

- {{cssxref("justify-content")}}: Kiểm soát alignment của tất cả các phần tử trên main axis.
- {{cssxref("align-items")}}: Kiểm soát alignment của tất cả các phần tử trên cross axis.
- {{cssxref("align-self")}}: Kiểm soát alignment của từng flex item riêng lẻ trên cross axis.
- {{cssxref("align-content")}}: Kiểm soát không gian giữa các flex line trên cross axis.
- {{cssxref("gap")}}, {{cssxref("column-gap")}} và {{cssxref("row-gap")}}: Được dùng để tạo khoảng cách hoặc rãnh giữa các flex item.

Chúng ta cũng sẽ khám phá cách auto margin có thể được dùng để căn chỉnh trong flexbox.

## Căn chỉnh các phần tử trên cross axis

Thuộc tính {{cssxref("align-items")}}, được đặt trên flex container, và thuộc tính {{cssxref("align-self")}}, được đặt trên flex item, kiểm soát alignment của flex item trên cross axis. Cross axis chạy dọc theo các cột nếu {{cssxref("flex-direction")}} là `row` và dọc theo các hàng nếu `flex-direction` là `column`.

Trong ví dụ flex cơ bản này, chúng ta đang sử dụng cross-axis alignment. Khi chúng ta thêm `display: flex` vào container, các phần tử con trở thành flex item được sắp xếp theo hàng. Theo mặc định, tất cả chúng sẽ kéo dài để khớp với chiều cao của phần tử cao nhất, vì phần tử đó xác định chiều cao của các phần tử trên cross axis. Nếu flex container có chiều cao được đặt, các phần tử sẽ kéo dài đến chiều cao đó, bất kể lượng nội dung trong mỗi phần tử.

![Ba phần tử, một phần tử có thêm văn bản khiến nó cao hơn các phần tử còn lại.](align2.png)

![Ba phần tử được kéo dài đến 200 pixel chiều cao](align3.png)

Lý do các phần tử có cùng chiều cao là vì giá trị ban đầu của `align-items`, thuộc tính kiểm soát alignment trên cross axis, được đặt thành `stretch`.

Chúng ta có thể sử dụng các giá trị khác để kiểm soát cách các phần tử căn chỉnh:

- `align-items: stretch`
- `align-items: flex-start`
- `align-items: flex-end`
- `align-items: start`
- `align-items: end`
- `align-items: center`
- `align-items: baseline`
- `align-items: first baseline`
- `align-items: last baseline`

Trong ví dụ bên dưới, giá trị của `align-items` là `stretch`. Hãy thử các giá trị khác và xem cách các phần tử căn chỉnh so với nhau trong flex container.

```html live-sample___align-items
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three <br />has <br />extra <br />text</div>
</div>
```

```css live-sample___align-items
.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
  align-items: stretch;
}

.box div {
  width: 100px;
  background-color: rgb(96 139 168 / 0.2);
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
}
```

{{EmbedLiveSample("align-items")}}

### Căn chỉnh một phần tử với `align-self`

Thuộc tính `align-items` đặt thuộc tính `align-self` cho tất cả flex item như một nhóm. Điều này có nghĩa là bạn có thể khai báo tường minh thuộc tính {{cssxref("align-self")}} để nhắm đến một phần tử cụ thể. Thuộc tính `align-self` chấp nhận tất cả các giá trị giống như `align-items`, cộng thêm giá trị `auto`, giá trị này đặt lại giá trị về giá trị được định nghĩa trên flex container.

Trong ví dụ live tiếp theo, flex container có `align-items: flex-start`, có nghĩa là các phần tử đều được căn chỉnh về đầu của cross axis. Sử dụng bộ chọn `first-child`, phần tử đầu tiên được đặt thành `align-self: stretch`. Một phần tử khác với class `selected` có `align-self: center` được đặt. Thay đổi giá trị của `align-items` hoặc thay đổi các giá trị của `align-self` trên từng phần tử riêng lẻ để xem cách này hoạt động.

```html live-sample___align-self
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div class="selected">Three</div>
  <div>Four</div>
</div>
```

```css live-sample___align-self
.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
  align-items: flex-start;
  height: 200px;
}
.box div {
  background-color: rgb(96 139 168 / 0.2);
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  padding: 20px;
}
.box > *:first-child {
  align-self: stretch;
}
.box .selected {
  align-self: center;
}
```

{{EmbedLiveSample("align-self", "", "250px")}}

### Thay đổi main axis

Cho đến nay, chúng ta đã xem xét hành vi alignment khi `flex-direction` mặc định là `row` trong khi làm việc với ngôn ngữ viết từ trên xuống dưới, với main axis ngang và cross axis dọc.

![Ba phần tử, phần tử đầu tiên căn chỉnh với flex-start, phần tử thứ hai với center, phần tử thứ ba với flex-end. Căn chỉnh trên trục dọc.](align4.png)

Giữ nguyên chế độ viết, khi `flex-direction` được thay đổi thành `column`, các thuộc tính `align-items` và `align-self` sẽ căn chỉnh các phần tử sang trái và phải thay vì trên và dưới; những thuộc tính này vẫn đang căn chỉnh các phần tử dọc theo cross axis, nhưng cross axis giờ đây là ngang!

![Ba phần tử, phần tử đầu tiên căn chỉnh với flex-start, phần tử thứ hai với center, phần tử thứ ba với flex-end. Căn chỉnh trên trục ngang.](align5.png)

Bạn có thể thử điều này trong ví dụ bên dưới, có flex container với `flex-direction: column` nhưng về cơ bản giống với ví dụ trước.

```html live-sample___align-self-column
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div class="selected">Three</div>
  <div>Four</div>
</div>
```

```css live-sample___align-self-column
.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  width: 200px;
}
.box div {
  background-color: rgb(96 139 168 / 0.2);
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  padding: 20px;
}
.box > *:first-child {
  align-self: stretch;
}
.box .selected {
  align-self: center;
}
```

{{EmbedLiveSample("align-self-column", "", "300px")}}

## Căn chỉnh nội dung trên cross axis với thuộc tính `align-content`

Cho đến nay, chúng ta đã tập trung vào việc căn chỉnh các phần tử hoặc từng phần tử riêng lẻ trong vùng được xác định bởi {{glossary("flex container")}} chứa một dòng flex item duy nhất. Khi flex item được phép bao quanh nhiều dòng, thuộc tính {{cssxref("align-content")}} có thể được dùng để kiểm soát việc phân bổ không gian giữa các dòng, còn được gọi là **packing flex lines**.

Để `align-content` có hiệu lực, kích thước chiều cross axis (chiều cao trong trường hợp này) của flex container phải lớn hơn cần thiết để hiển thị các phần tử. Sau đó nó hoạt động trên tất cả các phần tử như một tập hợp. Các giá trị `align-content` xác định điều gì xảy ra với không gian sẵn có còn lại và alignment của toàn bộ tập hợp các phần tử trong đó.

Thuộc tính `align-content` nhận các giá trị sau:

- `align-content: flex-start`
- `align-content: flex-end`
- `align-content: start`
- `align-content: end`
- `align-content: center`
- `align-content: space-between`
- `align-content: space-around`
- `align-content: space-evenly`
- `align-content: stretch`
- `align-content: normal` (hoạt động như `stretch`)
- `align-content: baseline`
- `align-content: first baseline`
- `align-content: last baseline`

Trong ví dụ live bên dưới, flex container có chiều cao `400 pixels`, lớn hơn cần thiết để hiển thị các phần tử. Giá trị của `align-content` là `space-between`, có nghĩa là không gian sẵn có được chia đều _giữa_ các flex line, được đặt ngang với đầu và cuối của container trên cross axis.

Hãy thử các giá trị khác để xem thuộc tính `align-content` hoạt động như thế nào.

```html live-sample___align-content
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
</div>
```

```css live-sample___align-content
.box {
  width: 450px;
  border: 2px dotted rgb(96 139 168);
  display: flex;
  flex-wrap: wrap;
  height: 300px;
  align-content: space-between;
}

.box > * {
  padding: 20px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  flex: 1 1 100px;
}

.box div {
  background-color: rgb(96 139 168 / 0.2);
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  padding: 20px;
}
```

{{EmbedLiveSample("align-content", "", "380px")}}

Một lần nữa chúng ta có thể chuyển `flex-direction` thành `column` để xem thuộc tính này hoạt động như thế nào khi chúng ta làm việc theo cột. Như trước, chúng ta cần đủ không gian trong cross axis để có không gian trống sau khi hiển thị tất cả các phần tử.

```html live-sample___align-content-column
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
</div>
```

```css live-sample___align-content-column
.box {
  display: flex;
  flex-wrap: wrap;
  flex-direction: column;
  width: 400px;
  height: 300px;
  align-content: space-between;
  border: 2px dotted rgb(96 139 168);
}

.box > * {
  padding: 20px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  flex: 1 1 100px;
}

.box div {
  background-color: rgb(96 139 168 / 0.2);
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  padding: 20px;
}
```

{{EmbedLiveSample("align-content-column", "", "380px")}}

## Căn chỉnh nội dung trên main axis

Bây giờ chúng ta đã thấy cách alignment hoạt động trên cross axis, chúng ta có thể xem xét main axis. Ở đây chúng ta chỉ có một thuộc tính — `justify-content`. Điều này là vì chúng ta chỉ xử lý các phần tử như một nhóm trên main axis. Với `justify-content` chúng ta kiểm soát điều gì xảy ra với không gian sẵn có, nếu có nhiều không gian hơn cần thiết để hiển thị các phần tử.

Trong ví dụ ban đầu với `display: flex` trên container, các phần tử hiển thị theo hàng và tất cả xếp hàng ở đầu container. Điều này là do giá trị ban đầu của `justify-content` là `normal`, hoạt động như `start`. Bất kỳ không gian sẵn có nào đều được đặt ở cuối các phần tử.

![Ba phần tử, mỗi phần tử rộng 100 pixel trong container 500 pixel. Không gian sẵn có ở cuối các phần tử.](align6.png)

Các giá trị `baseline` không liên quan trong chiều này. Ngoài ra, thuộc tính `justify-content` chấp nhận các giá trị tương tự như `align-content`.

- `justify-content: flex-start`
- `justify-content: flex-end`
- `justify-content: start`
- `justify-content: end`
- `justify-content: left`
- `justify-content: right`
- `justify-content: center`
- `justify-content: space-between`
- `justify-content: space-around`
- `justify-content: space-evenly`
- `justify-content: stretch` (hoạt động như start)
- `justify-content: normal` (hoạt động như stretch, hoạt động như start)

Trong ví dụ bên dưới, giá trị của `justify-content` là `space-between`. Không gian sẵn có sau khi hiển thị các phần tử được phân bổ giữa các phần tử. Phần tử bên trái và bên phải nằm ngang với đầu và cuối.

```html live-sample___justify-content
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
</div>
```

```css live-sample___justify-content
.box {
  display: flex;
  justify-content: space-between;
  border: 2px dotted rgb(96 139 168);
}

.box > * {
  padding: 20px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
```

{{EmbedLiveSample("justify-content")}}

Nếu main axis nằm theo hướng block vì `flex-direction` được đặt thành `column`, thì `justify-content` sẽ phân bổ không gian giữa các phần tử theo chiều đó miễn là có không gian trong flex container để phân bổ.

```html live-sample___justify-content-column
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
</div>
```

```css live-sample___justify-content-column
.box {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 300px;
  border: 2px dotted rgb(96 139 168);
}

.box > * {
  padding: 20px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
```

{{EmbedLiveSample("justify-content-column", "", "380px")}}

### Alignment và writing modes

Hãy nhớ rằng với tất cả các phương pháp alignment này, các giá trị `start` và `end` nhận biết writing mode. Nếu giá trị của `justify-content` là `start` và writing mode là trái sang phải, như tiếng Anh, các phần tử sẽ căn chỉnh bắt đầu từ cạnh trái của container.

![Ba phần tử xếp hàng bên trái](basics5.png)

Tuy nhiên nếu writing mode là phải sang trái như tiếng Ả Rập, các phần tử sẽ xếp hàng bắt đầu từ cạnh phải của container.

![Ba phần tử xếp hàng từ bên phải](basics6.png)

Ví dụ live bên dưới có thuộc tính `direction` được đặt thành `rtl` để buộc luồng từ phải sang trái cho các phần tử. Bạn có thể xóa điều này, hoặc thay đổi các giá trị của `justify-content` để xem flexbox hoạt động như thế nào khi đầu của inline direction ở bên phải.

```html live-sample___justify-content-writing-mode
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
</div>
```

```css live-sample___justify-content-writing-mode
.box {
  direction: rtl;
  display: flex;
  justify-content: flex-end;
  border: 2px dotted rgb(96 139 168);
}

.box > * {
  padding: 20px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
```

{{EmbedLiveSample("justify-content-writing-mode")}}

## Alignment và `flex-direction`

Hướng `start` của dòng cũng sẽ thay đổi nếu bạn thay đổi thuộc tính `flex-direction` — ví dụ, sử dụng `row-reverse` thay vì `row`.

Trong ví dụ tiếp theo này, `flex-direction: row-reverse` và `justify-content: flex-end` xác định hướng và vị trí của các phần tử trong flex container. Trong ngôn ngữ trái sang phải, các phần tử xếp hàng ở bên trái. Hãy thử thay đổi `flex-direction: row-reverse` thành `flex-direction: row`. Bạn sẽ thấy rằng các phần tử giờ đây di chuyển sang phía bên phải, và thứ tự hiển thị của các phần tử bị đảo ngược.

```html live-sample___justify-content-reverse
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
</div>
```

```css live-sample___justify-content-reverse
.box {
  display: flex;
  flex-direction: row-reverse;
  justify-content: flex-end;
  border: 2px dotted rgb(96 139 168);
}

.box > * {
  padding: 20px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
```

{{EmbedLiveSample("justify-content-reverse")}}

Mặc dù tất cả điều này có vẻ hơi khó hiểu, quy tắc cần nhớ là trừ khi bạn làm gì đó để thay đổi, flex item tự sắp xếp theo hướng mà các từ được đặt trong ngôn ngữ của tài liệu dọc theo inline, row axis. `start` và `flex-start` sẽ là nơi câu văn bản bắt đầu.

![Sơ đồ cho thấy start ở bên trái và end ở bên phải.](align8.png)

Bạn có thể chuyển chúng để hiển thị theo hướng block cho ngôn ngữ của tài liệu bằng cách chọn `flex-direction: column`. Sau đó, `start` và `flex-start` sẽ là nơi đoạn văn đầu tiên của bạn bắt đầu.

![Sơ đồ cho thấy start ở trên cùng và end ở dưới cùng.](align10.png)

Nếu bạn thay đổi `flex-direction` thành một trong các giá trị reverse, chúng sẽ tự sắp xếp từ end axis và theo thứ tự ngược lại với cách các từ được viết trong ngôn ngữ của tài liệu. Sau đó, `start` và `flex-start` sẽ thay đổi thành end của trục đó — vì vậy đến vị trí mà các dòng của bạn sẽ bao quanh nếu làm việc theo hàng, hoặc ở cuối đoạn văn cuối cùng của bạn theo hướng block.

![Sơ đồ cho thấy start ở bên phải và end ở bên trái.](align9.png)

![Sơ đồ cho thấy end ở trên cùng và start ở dưới cùng](align11.png)

## Sử dụng auto margin để căn chỉnh trên main axis

Chúng ta không có thuộc tính `justify-items` hoặc `justify-self` sẵn dùng trên main axis vì các phần tử được coi là một nhóm trên trục đó. Tuy nhiên, có thể thực hiện một số alignment riêng lẻ để tách biệt một phần tử hoặc một nhóm phần tử khỏi các phần tử khác bằng cách sử dụng auto margin cùng với flexbox.

Một mẫu phổ biến là thanh điều hướng trong đó một số mục chính được căn chỉnh về bên phải, với nhóm chính ở bên trái. Bạn có thể nghĩ rằng đây nên là trường hợp sử dụng cho thuộc tính `justify-self`. Tuy nhiên, hãy xem xét hình ảnh bên dưới. Như một ví dụ, lấy hình ảnh sau với ba phần tử ở một phía và hai phần tử ở phía kia. Nếu `justify-self` hoạt động trên flex item và được đặt trên phần tử _d_, nó cũng sẽ thay đổi alignment của phần tử _e_ theo sau, có thể hoặc không theo ý muốn.

![Năm phần tử, trong hai nhóm. Ba ở bên trái và hai ở bên phải.](align7.png)

Thay vào đó, phần tử _d_ có thể được đẩy sang bằng cách sử dụng CSS margins.

Trong ví dụ live này, phần tử 4 được tách khỏi ba phần tử đầu tiên bằng cách đặt {{cssxref("margin-left")}} thành `auto`, tiêu thụ tất cả không gian có thể theo trục của nó. Đây là cách căn giữa một block với {{cssxref("margin")}} auto trái và phải hoạt động. Mỗi phía cố gắng chiếm nhiều không gian nhất có thể, và vì vậy block được đẩy vào giữa.

Trong ví dụ live này, các flex item được sắp xếp theo hàng với các giá trị flex cơ bản, và class `push`, được đặt trên phần tử thứ tư, áp dụng `margin-left: auto` cho phần tử đó. Hãy thử xóa class trên phần tử thứ tư hoặc thêm class vào một phần tử khác để xem cách hoạt động.

```html live-sample___auto-margins
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div class="push">Four</div>
  <div>Five</div>
</div>
```

```css live-sample___auto-margins
.box {
  display: flex;
  border: 2px dotted rgb(96 139 168);
}

.box > * {
  padding: 20px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
.push {
  margin-left: auto;
}
```

{{EmbedLiveSample("auto-margins")}}

## Tạo khoảng cách giữa các phần tử

Để tạo khoảng cách giữa các flex item, sử dụng các thuộc tính {{cssxref("gap")}}, {{cssxref("column-gap")}} và {{cssxref("row-gap")}}. Thuộc tính {{cssxref("column-gap")}} tạo khoảng cách giữa các phần tử trong một hàng. Thuộc tính {{cssxref("row-gap")}} tạo khoảng cách giữa các flex line khi bạn có {{cssxref("flex-wrap")}} được đặt thành `wrap`.

Thuộc tính {{cssxref("gap")}} là shorthand đặt cả `row-gap` và `column-gap`.
Khoảng cách giữa các flex item hoặc flex line phụ thuộc vào hướng. Nếu thuộc tính {{cssxref("flex-direction")}} tạo các hàng, giá trị đầu tiên xác định khoảng cách giữa các flex line, và giá trị thứ hai xác định khoảng cách giữa các phần tử trong mỗi dòng. Với cột (khi `flex-direction` được đặt thành `column` hoặc `column-reverse`), giá trị đầu tiên xác định khoảng cách giữa các flex item, và giá trị thứ hai xác định khoảng cách giữa các flex line.

```html live-sample___gap
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
</div>
```

```css live-sample___gap
.box {
  display: flex;
  flex-wrap: wrap;
  row-gap: 10px;
  column-gap: 2em;
  border: 2px dotted rgb(96 139 168);
}

.box > * {
  flex: 1;
  padding: 20px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
```

{{EmbedLiveSample("gap")}}

## Xem thêm

- Module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment)
- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- [Box alignment trong flexbox](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox)
- [Box alignment trong grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
