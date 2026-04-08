---
title: Ordering flex items
slug: Web/CSS/Guides/Flexible_box_layout/Ordering_items
page-type: guide
sidebar: cssref
---

Các phương pháp bố cục như flexbox và grid cho phép kiểm soát thứ tự nội dung. Trong bài viết này, chúng ta sẽ xem xét các cách bạn có thể thay đổi thứ tự hiển thị của nội dung khi sử dụng flexbox. Chúng ta cũng sẽ xem xét tác động của việc sắp xếp lại các phần tử đối với khả năng tiếp cận.

## Đảo ngược việc hiển thị các phần tử

Thuộc tính {{cssxref("flex-direction")}} có thể nhận một trong bốn giá trị:

- `row`
- `column`
- `row-reverse`
- `column-reverse`

Hai giá trị đầu tiên giữ các phần tử theo cùng thứ tự mà chúng xuất hiện trong thứ tự nguồn tài liệu và hiển thị chúng tuần tự từ dòng bắt đầu.

![Các phần tử được hiển thị theo hàng bắt đầu từ bên trái.](basics1.png)

![Các phần tử được hiển thị theo cột bắt đầu từ trên cùng ](align10.png)

Hai giá trị tiếp theo đảo ngược các phần tử bằng cách đổi chỗ các dòng bắt đầu và kết thúc.

![Các phần tử được hiển thị theo thứ tự ngược lại bắt đầu từ dòng bên phải.](align9.png)

![Các phần tử được hiển thị theo cột theo thứ tự ngược lại bắt đầu từ dòng dưới cùng.](align11.png)

Hãy nhớ rằng dòng bắt đầu liên quan đến writing modes. Các ví dụ liên quan đến hàng ở trên minh họa cách `row` và `row-reverse` hoạt động trong ngôn ngữ trái sang phải như tiếng Anh. Nếu bạn đang làm việc trong ngôn ngữ phải sang trái như tiếng Ả Rập thì `row` sẽ bắt đầu từ bên phải, `row-reverse` từ bên trái.

![Flex container với chữ cái Ả Rập cho thấy cách row bắt đầu từ phía bên phải và row-reverse từ bên trái.](order-rtl.png)

Điều này có vẻ như là cách dễ dàng để hiển thị mọi thứ theo thứ tự ngược lại. Tuy nhiên, bạn nên lưu ý rằng các phần tử chỉ được hiển thị theo thứ tự ngược lại _trực quan_. Khả năng sắp xếp lại của flex layout chỉ ảnh hưởng đến rendering trực quan. Thứ tự tab và thứ tự đọc theo thứ tự mã nguồn. Điều này có nghĩa là chỉ có phần trình bày trực quan thay đổi; thứ tự nguồn vẫn giữ nguyên, cung cấp trải nghiệm người dùng khác nhau cho UA không phải CSS (nghĩ đến Siri hoặc Alexa) và người dùng công nghệ hỗ trợ. Nếu bạn thay đổi thứ tự của thanh điều hướng, thứ tự tab vẫn là thứ tự nguồn tài liệu, không phải thứ tự trực quan của bạn, điều này có thể gây ra nhầm lẫn về mặt nhận thức.

Nếu bạn đang sử dụng giá trị ngược, hoặc bằng cách nào đó đang sắp xếp lại các phần tử, bạn nên cân nhắc xem liệu bạn có thực sự nên thay đổi thứ tự logic trong nguồn không.

Specification của flexible box layout cảnh báo chúng ta không sử dụng việc sắp xếp lại như một cách để khắc phục các vấn đề nguồn:

> "Tác giả _không được_ sử dụng order hoặc các giá trị \*-reverse của {{cssxref("flex-flow")}}/`flex-direction` như một sự thay thế cho thứ tự nguồn đúng, vì điều đó có thể làm hỏng khả năng tiếp cận của tài liệu."

Khi bạn tab từ liên kết này sang liên kết khác trong ví dụ live bên dưới, kiểu focus được tô sáng, minh họa rằng việc thay đổi thứ tự flex item bằng `flex-direction` không thay đổi thứ tự tab, thứ tự này sẽ tiếp tục theo thứ tự mã nguồn.

```html live-sample___flex-direction
<div class="box">
  <div><a href="#">One</a></div>
  <div><a href="#">Two</a></div>
  <div><a href="#">Three</a></div>
</div>
```

```css live-sample___flex-direction
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
}

.box > * a:focus {
  background-color: yellow;
  color: black;
}

.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
  flex-direction: row-reverse;
}
```

{{EmbedLiveSample("flex-direction")}}

Giống như việc thay đổi giá trị của `flex-direction` không thay đổi thứ tự tab, việc thay đổi giá trị này cũng không thay đổi thứ tự vẽ. Đây chỉ là sự đảo ngược trực quan của các phần tử.

## Thuộc tính order

Ngoài việc đảo ngược thứ tự hiển thị trực quan của flex item, bạn có thể nhắm đến từng phần tử riêng lẻ và thay đổi nơi chúng xuất hiện trong thứ tự trực quan bằng thuộc tính {{cssxref("order")}}.

Thuộc tính {{cssxref("order")}} được thiết kế để bố cục các phần tử trong _nhóm thứ tự_. Điều này có nghĩa là các phần tử được gán một số nguyên đại diện cho nhóm của chúng. Các phần tử sau đó được đặt trong thứ tự trực quan theo số nguyên đó, giá trị thấp nhất trước. Nếu nhiều hơn một phần tử có cùng giá trị số nguyên, thì trong nhóm đó các phần tử được bố cục theo thứ tự nguồn.

Như một ví dụ, năm flex item được gán giá trị `order` như sau:

- Source item 1: `order: 2`
- Source item 2: `order: 3`
- Source item 3: `order: 1`
- Source item 4: `order: 3`
- Source item 5: `order: 1`

Các phần tử này sẽ được hiển thị trên trang theo thứ tự sau:

- Source item 3: `order: 1`
- Source item 5: `order: 1`
- Source item 1: `order: 2`
- Source item 2: `order: 3`
- Source item 4: `order: 3`

![Các phần tử có số cho thấy thứ tự nguồn của chúng đã được sắp xếp lại.](order-property.png)

Hãy thử nghiệm với các giá trị trong ví dụ live bên dưới và xem cách điều đó thay đổi thứ tự. Ngoài ra, hãy thử thay đổi `flex-direction` thành `row-reverse` và xem điều gì xảy ra — dòng bắt đầu bị đổi chỗ để việc sắp xếp bắt đầu từ phía đối diện.

```html live-sample___order
<div class="box">
  <div><a href="#">1</a></div>
  <div><a href="#">2</a></div>
  <div><a href="#">3</a></div>
  <div><a href="#">4</a></div>
  <div><a href="#">5</a></div>
</div>
```

```css live-sample___order
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
}

.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
  flex-direction: row;
}
.box :nth-child(1) {
  order: 2;
}
.box :nth-child(2) {
  order: 3;
}
.box :nth-child(3) {
  order: 1;
}
.box :nth-child(4) {
  order: 3;
}
.box :nth-child(5) {
  order: 1;
}
```

{{EmbedLiveSample("order")}}

Flex item có giá trị `order` mặc định là `0`. Do đó, các phần tử có giá trị số nguyên lớn hơn `0` sẽ được hiển thị sau bất kỳ phần tử nào chưa được gán giá trị `order` tường minh.

Bạn cũng có thể sử dụng giá trị âm với `order`, điều này có thể khá hữu ích. Nếu bạn muốn một phần tử hiển thị đầu tiên và để thứ tự của tất cả các phần tử khác không thay đổi, bạn có thể cho phần tử đó order `-1`. Vì đây là giá trị thấp hơn `0`, phần tử sẽ luôn được hiển thị đầu tiên.

Trong ví dụ mã live bên dưới, các phần tử được bố cục bằng flexbox. Bằng cách thay đổi phần tử nào được gán class `active` trong HTML, bạn có thể thay đổi phần tử nào hiển thị đầu tiên và do đó trở thành toàn chiều rộng ở đầu bố cục, với các phần tử khác hiển thị bên dưới nó.

```html live-sample___negative-order
<div class="box">
  <div><a href="#">1</a></div>
  <div><a href="#">2</a></div>
  <div class="active"><a href="#">3</a></div>
  <div><a href="#">4</a></div>
  <div><a href="#">5</a></div>
</div>
```

```css live-sample___negative-order
* {
  box-sizing: border-box;
}

.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
}

.box {
  width: 500px;
  border: 2px dotted rgb(96 139 168);
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
}

.active {
  order: -1;
  flex: 1 0 100%;
}
```

{{EmbedLiveSample("negative-order")}}

Các phần tử được hiển thị theo _thứ tự tài liệu được sửa đổi bởi order_, có nghĩa là giá trị của thuộc tính `order` được tính đến trước khi các phần tử được hiển thị.

`Order` cũng thay đổi thứ tự vẽ của các phần tử; các phần tử có giá trị `order` thấp hơn được vẽ trước và các phần tử có giá trị `order` cao hơn được vẽ sau.

## Thuộc tính order và khả năng tiếp cận

Việc sử dụng thuộc tính `order` có những tác động đối với khả năng tiếp cận giống như việc thay đổi hướng bằng `flex-direction`. Sử dụng `order` thay đổi thứ tự mà các phần tử được vẽ và thứ tự chúng xuất hiện trực quan. Nó không thay đổi thứ tự điều hướng tuần tự của các phần tử. Do đó, nếu người dùng đang sử dụng bàn phím để tab qua nội dung trên trang, họ có thể thấy mình nhảy qua nội dung của bạn theo cách rất khó hiểu.

Bằng cách tab quanh bất kỳ ví dụ live nào trên trang này, bạn có thể thấy `order` có thể tạo ra trải nghiệm kỳ lạ như thế nào cho bất kỳ ai không sử dụng thiết bị trỏ như chuột. Để đọc thêm về sự ngắt kết nối giữa thứ tự trực quan và thứ tự logic này và một số vấn đề tiềm ẩn mà nó đặt ra cho khả năng tiếp cận, hãy xem các tài nguyên sau.

- [Flexbox and the keyboard navigation disconnect](https://tink.uk/flexbox-the-keyboard-navigation-disconnect/) via tink.uk (2016)
- [HTML Source Order vs CSS Display Order](https://adrianroselli.com/2015/10/html-source-order-vs-css-display-order.html) via adrianroselli.com (2015)
- [The Responsive Order Conflict for Keyboard Focus](https://alastairc.uk/2017/06/the-responsive-order-conflict/) via alastairc.uk (2017)

## Các trường hợp sử dụng cho `order`

Có một số trường hợp sử dụng mà thực tế là thứ tự logic và do đó thứ tự đọc của flex item tách biệt khỏi thứ tự trực quan, là hữu ích. Được sử dụng cẩn thận, thuộc tính `order` có thể cho phép một số mẫu phổ biến hữu ích được thực hiện dễ dàng.

Bạn có thể có một thiết kế, có lẽ là một thẻ sẽ hiển thị một tin tức. Tiêu đề của tin tức là thứ quan trọng nhất cần nổi bật và sẽ là phần tử mà người dùng có thể nhảy đến nếu họ đang tab giữa các tiêu đề để tìm nội dung họ muốn đọc. Thẻ cũng có ngày; thiết kế hoàn chỉnh mà chúng ta muốn tạo ra trông như thế này.

![Một component thiết kế với ngày, sau đó là tiêu đề và sau đó là nội dung.](order-card.png)

Về mặt trực quan, ngày xuất hiện phía trên tiêu đề, trong nguồn. Tuy nhiên, nếu thẻ được đọc bởi một trình đọc màn hình, tôi muốn tiêu đề được thông báo trước và sau đó là ngày xuất bản. Chúng ta có thể thực hiện điều này với thuộc tính `order`.

Thẻ là flex container của chúng ta, với `flex-direction` được đặt thành `column`. Chúng ta cho ngày một `order` là `-1`, đặt nó phía trên tiêu đề.

```html live-sample___usecase-order
<div class="wrapper">
  <div class="card">
    <h3>News item title</h3>
    <div class="date">1 Nov 2017</div>
    <p>This is the content of my news item. Very newsworthy.</p>
  </div>
  <div class="card">
    <h3>Another title</h3>
    <div class="date">6 Nov 2017</div>
    <p>This is the content of my news item. Very newsworthy.</p>
  </div>
</div>
```

```css live-sample___usecase-order
body {
  font-family: sans-serif;
}

.wrapper {
  display: flex;
  flex: 1 1 200px;
  gap: 1em;
}

.card {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 1em;
  display: flex;
  flex-direction: column;
}

.date {
  order: -1;
  text-align: right;
}
```

{{EmbedLiveSample("usecase-order", "", "220px")}}

Những điều chỉnh nhỏ này là loại trường hợp mà thuộc tính `order` có ý nghĩa. Giữ thứ tự logic giống như thứ tự đọc và tab của tài liệu, và duy trì điều đó theo cách dễ tiếp cận và có cấu trúc nhất. Sau đó sử dụng `order` cho các điều chỉnh thiết kế trực quan thuần túy. Đừng sắp xếp lại các phần tử nhận keyboard focus. Đảm bảo bạn luôn kiểm tra nội dung chỉ bằng bàn phím thay vì chuột hoặc màn hình cảm ứng; điều này sẽ cho thấy liệu các lựa chọn phát triển của bạn có làm phức tạp hơn việc điều hướng nội dung không.

## Xem thêm

- [Các khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Mối quan hệ của flexbox với các phương pháp bố cục khác](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Relationship_with_other_layout_methods)
- [Căn chỉnh các phần tử trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- [Kiểm soát tỷ lệ flex item theo main axis](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios)
- [Làm chủ việc bao quanh flex item](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Wrapping_items)
- [Các trường hợp sử dụng điển hình của flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Use_cases)
- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
