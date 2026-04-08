---
title: Relationship of flexbox to other layout methods
short-title: Flexbox and other layouts
slug: Web/CSS/Guides/Flexible_box_layout/Relationship_with_other_layout_methods
page-type: guide
sidebar: cssref
---

Trong bài viết này, chúng ta sẽ xem xét flexbox phù hợp như thế nào với tất cả các module CSS khác. Chúng ta sẽ tìm hiểu xem specification nào bạn cũng cần chú ý nếu muốn học flexbox, và tại sao flexbox khác với một số module khác.

## Module box alignment

Nhiều người đầu tiên tìm đến flexbox khi họ muốn căn chỉnh đúng cách các flex item bên trong flex container. Flexbox cung cấp quyền truy cập vào các thuộc tính cho phép căn chỉnh các phần tử trên cross axis và justify các phần tử trên main axis.

Flexbox ban đầu được định nghĩa trong module [flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) riêng của nó, nhưng các thuộc tính và giá trị chung cho các phương pháp bố cục khác được định nghĩa trong module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment). Module này chi tiết cách alignment, justification, gap và gutter hoạt động trong tất cả các hệ thống bố cục — không chỉ flexbox. Khi một tính năng được định nghĩa trong cả hai specification, lưu ý rằng module box alignment thay thế module flexible box layout.

## Writing Modes

Trong bài viết [Các khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts), người ta lưu ý rằng flexbox **nhận biết writing mode**. Writing modes được mô tả đầy đủ trong module [CSS writing modes](/en-US/docs/Web/CSS/Guides/Writing_modes), chi tiết cách CSS hỗ trợ các writing mode khác nhau tồn tại trên toàn thế giới. Chúng ta cần nhận thức về cách điều này sẽ tác động đến flex layout của mình khi writing mode thay đổi hướng mà các block được bố cục trong tài liệu. Hiểu **block** và **inline** directions là chìa khóa cho các phương pháp bố cục mới.

Đáng chú ý rằng chúng ta có thể muốn thay đổi writing mode của tài liệu vì lý do khác ngoài việc xuất bản nội dung bằng ngôn ngữ sử dụng writing mode khác. Module CSS writing modes định nghĩa cách văn bản có thể được viết theo chiều ngang, trái sang phải và phải sang trái, và theo chiều dọc, trên xuống dưới. Điều này quan trọng cho quốc tế hóa và dịch thuật, nhưng những tính năng này cũng có thể được dùng cho thiết kế sáng tạo.

### Các writing mode

Specification writing modes định nghĩa các giá trị sau của thuộc tính {{cssxref("writing-mode")}}, phục vụ để thay đổi hướng mà các block được bố cục trên trang, để khớp với hướng mà các block bố cục khi nội dung được định dạng theo writing mode cụ thể đó. Bạn có thể thay đổi ví dụ live bên dưới sang các chế độ này để xem điều gì xảy ra với flex layout.

- `horizontal-tb`
- `vertical-rl`
- `vertical-lr`
- `sideways-rl`
- `sideways-lr`

```html live-sample___writing-modes
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
</div>
```

```css live-sample___writing-modes
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}

.box {
  width: 500px;
  border: 2px dotted rgb(96 139 168);
  display: flex;
  writing-mode: horizontal-tb;
}
```

{{EmbedLiveSample("writing-modes")}}

`sideways-rl` và `sideways-lr` hiện chỉ được hỗ trợ trong Firefox.

Lưu ý rằng thông thường bạn không dùng CSS và thuộc tính `writing-mode` để thay đổi toàn bộ tài liệu sang writing mode khác. Điều này sẽ được thực hiện thông qua HTML, bằng cách thêm thuộc tính [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir) và [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) vào phần tử {{htmlelement("html")}} để chỉ ra ngôn ngữ tài liệu và hướng văn bản mặc định. Điều này có nghĩa là tài liệu sẽ hiển thị đúng ngay cả khi CSS không được tải.

## Flexbox và các phương pháp bố cục khác

Một số thuộc tính được thiết kế giả định rằng nội dung được bố cục bằng hệ thống block layout tiêu chuẩn, và không áp dụng trong bối cảnh flex layout. Một phần tử được đặt thành `display: flex` hoạt động theo hầu hết các cách giống như bất kỳ block-level container nào khác thiết lập containing block. Float sẽ không xâm nhập, và margin của container sẽ không collapse.

Về flex item, nếu một phần tử bị float hoặc clear và sau đó trở thành flex item do phần tử cha có `display: flex` được áp dụng, thì việc floating và clearing sẽ không còn xảy ra, và phần tử sẽ không bị lấy ra khỏi normal flow theo cách mà float được lấy ra. Nếu bạn đã sử dụng thuộc tính {{cssxref("vertical-align")}}, như được dùng với `inline-block` hoặc table layout để căn chỉnh, điều này sẽ không còn ảnh hưởng đến phần tử và bạn có thể sử dụng các thuộc tính alignment của flexbox thay thế.

Trong ví dụ live tiếp theo, các phần tử con đã được float, và sau đó container của chúng đã được thêm `display: flex`. Nếu bạn xóa `display: flex`, bạn sẽ thấy phần tử `.box` collapse vì chúng ta không áp dụng clearing. Điều này cho thấy float đang xảy ra. Áp dụng lại `display: flex` và việc collapse không xảy ra. Điều này là vì các phần tử không còn có float được áp dụng, vì chúng đã được chuyển đổi thành flex item.

```html live-sample___floats
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
</div>
```

```css live-sample___floats
.box {
  width: 500px;
  border: 2px dotted rgb(96 139 168);
  display: flex;
}

.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  float: left;
}
```

{{EmbedLiveSample("floats")}}

## Flexbox và grid layout

[CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) và flexbox chia sẻ nhiều thuộc tính và giá trị. Đối với các thuộc tính phân kỳ, nếu một flex item trở thành grid item, bất kỳ giá trị `flex` nào được gán cho các phần tử con, chẳng hạn như `flex-end`, sẽ bị bỏ qua. Như đã lưu ý ở trên, các giá trị được định nghĩa trong module box alignment hoạt động trên cả hai phương pháp bố cục thay thế những giá trị được định nghĩa chỉ trong flexbox.

### Flex và grid — sự khác biệt là gì?

Một câu hỏi phổ biến là hỏi về sự khác biệt giữa flexbox và CSS grid layout — tại sao chúng ta có hai specification đôi khi có vẻ làm cùng một điều?

Câu trả lời đơn giản nhất cho câu hỏi này được định nghĩa trong chính các specification. Flexbox là phương pháp bố cục một chiều trong khi grid layout là phương pháp bố cục hai chiều. Ví dụ bên dưới có flex layout. Như đã mô tả trong bài viết [Basic concepts](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts), flex item có thể được phép bao quanh nhưng, một khi chúng đã làm vậy, mỗi dòng hoạt động như thể nó là flex container riêng của nó. Khi không gian được phân bổ, flexbox không nhìn vào vị trí của các phần tử ở các hàng khác và không cố gắng xếp thẳng hàng mọi thứ với nhau.

```html live-sample___flex-layout
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
</div>
```

```css live-sample___flex-layout
.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
  flex-wrap: wrap;
  padding: 1em;
}

.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 1em;
  flex: 1 1 200px;
}
```

{{EmbedLiveSample("flex-layout", "", "300px")}}

Nếu chúng ta tạo một bố cục rất tương tự bằng grid, chúng ta có thể kiểm soát bố cục theo cả hàng và cột.

```html live-sample___grid-layout
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
</div>
```

```css live-sample___grid-layout
.box {
  border: 2px dotted rgb(96 139 168);
  padding: 1em;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, auto));
}

.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  padding: 1em;
  background-color: rgb(96 139 168 / 0.2);
}
```

{{EmbedLiveSample("grid-layout", "", "300px")}}

Các ví dụ này chỉ ra sự khác biệt quan trọng khác giữa các phương pháp bố cục này. Trong grid layout, bạn thực hiện phần lớn việc chỉ định kích thước trên container, thiết lập các track rồi đặt các phần tử vào chúng. Trong flexbox, mặc dù bạn tạo flex container và đặt hướng ở cấp độ đó, bất kỳ kiểm soát nào về kích thước phần tử cần xảy ra trên bản thân các phần tử.

Trong một số trường hợp, bạn có thể sử dụng cả hai phương pháp bố cục. Khi bạn tự tin với cả hai, bạn sẽ thấy mỗi phương pháp phù hợp hơn với các nhu cầu bố cục cụ thể, và bạn sẽ sử dụng cả hai phương pháp trong CSS của mình. Hiếm khi có câu trả lời đúng hay sai.

Theo quy tắc chung, nếu bạn đang đặt chiều rộng cho các flex item để làm cho các phần tử trong một hàng của flex container bọc ngang hàng với các phần tử phía trên chúng, bạn nên chọn grid layout hai chiều thay thế.

Không có quy tắc cố định nào như "bạn nên sử dụng flexbox cho các component nhỏ và grid layout cho các component lớn hơn." Một component nhỏ có thể là hai chiều, và một bố cục lớn có thể được biểu diễn tốt hơn với bố cục theo một chiều. Hãy thử mọi thứ — bạn có lựa chọn về phương pháp bố cục, hãy tận dụng điều đó.

Để so sánh thêm về grid và flexbox, hãy xem bài viết [Mối quan hệ của grid layout với các phương pháp bố cục khác](/en-US/docs/Web/CSS/Guides/Grid_layout/Relationship_with_other_layout_methods). Bài viết này chi tiết nhiều cách grid layout khác với flex layout và minh họa một số chức năng bổ sung bạn có được khi sử dụng grid layout như layering của các phần tử trên grid. Điều này cũng có thể giúp bạn quyết định nên sử dụng phương pháp bố cục nào.

## Flexbox và display: contents

Giá trị `contents` của thuộc tính {{cssxref("display")}} được mô tả trong specification như sau:

> "Bản thân phần tử không tạo ra bất kỳ hộp nào, nhưng các con và pseudo-element của nó vẫn tạo ra hộp như bình thường. Cho mục đích tạo hộp và bố cục, phần tử phải được coi như thể nó đã được thay thế bằng các con và pseudo-element của nó trong cây tài liệu."

Giá trị `display` này kiểm soát việc tạo hộp, và liệu phần tử có nên tạo một hộp mà chúng ta có thể định kiểu và hiển thị trên trang hay không, hay thay vào đó hộp mà nó thông thường sẽ tạo ra nên được loại bỏ và các phần tử con về cơ bản được di chuyển lên để tham gia vào bất kỳ phương pháp bố cục nào mà phần tử cha sẽ là một phần. Điều này dễ hiểu hơn với một ví dụ.

Trong ví dụ live sau, chúng ta có flex container chứa ba flex item. Một cái có hai phần tử lồng nhau bên trong, thông thường sẽ không tham gia vào flex layout. Flex layout chỉ áp dụng cho các phần tử con trực tiếp của flex container.

Bằng cách thêm `display: contents` vào wrapper xung quanh các phần tử lồng nhau, bạn có thể thấy rằng phần tử đã biến mất khỏi bố cục, cho phép hai phần tử con được bố cục như thể chúng là phần tử con trực tiếp của flex container. Bạn có thể thử xóa dòng `display: contents` để xem nó quay lại.

Lưu ý rằng điều này chỉ loại bỏ hộp khỏi bố cục; các phần tử con không trở thành phần tử con trực tiếp theo bất kỳ cách nào khác. Chúng ta đã sử dụng bộ chọn phần tử con trực tiếp để thêm màu nền và viền cho các flex item; nó không được áp dụng cho các con lồng nhau của chúng ta. Chúng được bố cục như flex item, nhưng vì chúng không phải là phần tử con trực tiếp nên chúng không nhận được kiểu dáng khác.

Vì hộp bị loại bỏ, bạn không thể sử dụng nó để — ví dụ — thêm màu nền phía sau các phần tử con lồng nhau. Nếu bạn xóa `display: contents` trong ví dụ live này, bạn sẽ thấy rằng phần tử con trực tiếp mà chúng ta đang loại bỏ có màu nền cam. Điều này cũng biến mất khi hộp biến mất.

```html live-sample___display-contents
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div class="nested">
    <div>Sub-item 1</div>
    <div>Sub-item 2</div>
  </div>
</div>
```

```css live-sample___display-contents
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  padding: 1em;
  background-color: rgb(96 139 168 / 0.2);
}

.box {
  border: 2px dotted rgb(96 139 168);
  padding: 1em;
  display: flex;
}

.nested {
  background-color: orange;
  display: contents;
}
```

{{EmbedLiveSample("display-contents")}}

> [!WARNING]
> Một số trình duyệt không chính xác loại bỏ một số phần tử có `display: contents` khỏi cây accessibility (nhưng các phần tử con sẽ vẫn còn), loại bỏ ngữ nghĩa của các phần tử đó trong khi duy trì nội dung con của chúng. Điều này có nghĩa là bản thân phần tử có thể không được thông báo bởi các trình đọc màn hình. Xem [`display: contents`](/en-US/docs/Web/CSS/Reference/Properties/display#display_contents) và [`display: contents` considered harmful](https://ericwbailey.design/published/display-contents-considered-harmful/).
