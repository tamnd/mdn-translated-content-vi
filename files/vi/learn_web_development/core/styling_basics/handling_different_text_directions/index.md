---
title: Xử lý các hướng văn bản khác nhau
short-title: Nhiều hướng văn bản
slug: Learn_web_development/Core/Styling_basics/Handling_different_text_directions
page-type: learn-module-chapter
sidebar: learnsidebar
---

Nhiều thuộc tính và giá trị mà chúng ta đã gặp cho đến nay trong việc học CSS của mình đều gắn liền với các kích thước vật lý của màn hình. Chúng ta tạo đường viền ở trên, phải, dưới và trái của hộp, ví dụ. Các kích thước vật lý này ánh xạ rất gọn gàng tới nội dung được xem theo chiều ngang, và theo mặc định web có xu hướng hỗ trợ các ngôn ngữ từ trái sang phải (ví dụ: tiếng Anh hoặc tiếng Pháp) tốt hơn các ngôn ngữ từ phải sang trái (chẳng hạn như tiếng Ả Rập).

Tuy nhiên, trong những năm gần đây, CSS đã phát triển để hỗ trợ tốt hơn các hướng khác nhau của nội dung, bao gồm từ phải sang trái nhưng cũng bao gồm nội dung từ trên xuống dưới (chẳng hạn như tiếng Nhật) — các hướng khác nhau này được gọi là **chế độ viết**. Khi bạn tiến bộ trong việc học và bắt đầu làm việc với bố cục, hiểu biết về chế độ viết sẽ rất hữu ích cho bạn, do đó chúng ta sẽ giới thiệu chúng ngay bây giờ.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software"
          >Phần mềm cơ bản được cài đặt</a
        >, kiến thức cơ bản về
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Dealing_with_files"
          >làm việc với tệp</a
        >, kiến thức cơ bản về HTML (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Giới thiệu về HTML</a
        >), và ý tưởng về cách CSS hoạt động (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về CSS</a>.)
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Hiểu tầm quan trọng của chế độ viết đối với CSS hiện đại.</td>
    </tr>
  </tbody>
</table>

## Chế độ viết là gì?

Chế độ viết trong CSS đề cập đến việc văn bản chạy theo chiều ngang hay dọc. Thuộc tính {{cssxref("writing-mode")}} cho phép chúng ta chuyển từ chế độ viết này sang chế độ viết khác. Bạn không cần phải làm việc trong ngôn ngữ sử dụng chế độ viết dọc để muốn làm điều này — bạn cũng có thể thay đổi chế độ viết của các phần trong bố cục của mình cho mục đích sáng tạo.

Trong ví dụ bên dưới, chúng ta có tiêu đề hiển thị sử dụng `writing-mode: vertical-rl`. Văn bản bây giờ chạy theo chiều dọc. Văn bản dọc phổ biến trong thiết kế đồ họa, và có thể là cách để thêm giao diện và cảm giác thú vị hơn cho thiết kế web của bạn.

```html live-sample___simple-vertical
<h1>Play with writing modes</h1>
```

```css live-sample___simple-vertical
body {
  font-family: sans-serif;
  height: 300px;
}
h1 {
  writing-mode: vertical-rl;
  color: white;
  background-color: black;
  padding: 10px;
}
```

{{EmbedLiveSample("simple-vertical", "", "350px")}}

Ba giá trị có thể cho thuộc tính {{cssxref("writing-mode")}} là:

- `horizontal-tb`: Hướng luồng khối từ trên xuống dưới. Câu chạy theo chiều ngang.
- `vertical-rl`: Hướng luồng khối từ phải sang trái. Câu chạy theo chiều dọc.
- `vertical-lr`: Hướng luồng khối từ trái sang phải. Câu chạy theo chiều dọc.

Vì vậy, thuộc tính `writing-mode` thực ra đang đặt hướng mà các phần tử cấp khối được hiển thị trên trang — từ trên xuống dưới, từ phải sang trái, hoặc từ trái sang phải. Điều này sau đó quyết định hướng văn bản chảy trong câu.

## Chế độ viết và bố cục khối và nội tuyến

Chúng ta đã thảo luận về [bố cục khối và nội tuyến](/en-US/docs/Web/CSS/Guides/Display/Block_and_inline_layout), và thực tế là một số thứ hiển thị như phần tử khối và một số khác như phần tử nội tuyến. Như chúng ta đã mô tả ở trên, khối và nội tuyến gắn liền với chế độ viết của tài liệu, không phải màn hình vật lý. Các khối chỉ hiển thị từ trên xuống dưới trang nếu bạn đang sử dụng chế độ viết hiển thị văn bản theo chiều ngang, chẳng hạn như tiếng Anh.

Nếu chúng ta nhìn vào một ví dụ, điều này sẽ trở nên rõ hơn. Trong ví dụ tiếp theo, tôi có hai hộp chứa tiêu đề và đoạn văn. Hộp đầu tiên sử dụng `writing-mode: horizontal-tb`, chế độ viết theo chiều ngang và từ trên trang xuống dưới. Hộp thứ hai sử dụng `writing-mode: vertical-rl`; đây là chế độ viết theo chiều dọc và từ phải sang trái.

```html live-sample___block-inline
<div class="wrapper">
  <div class="box horizontal">
    <h2>Heading</h2>
    <p>A paragraph demonstrating writing modes in CSS.</p>
  </div>
  <div class="box vertical">
    <h2>Heading</h2>
    <p>A paragraph demonstrating writing modes in CSS.</p>
  </div>
</div>
```

```css live-sample___block-inline
body {
  font-family: sans-serif;
  height: 300px;
}
.wrapper {
  display: flex;
}

.box {
  border: 1px solid #cccccc;
  padding: 0.5em;
  margin: 10px;
}

.horizontal {
  writing-mode: horizontal-tb;
}

.vertical {
  writing-mode: vertical-rl;
}
```

{{EmbedLiveSample("block-inline", "", "350px")}}

Khi chúng ta chuyển đổi chế độ viết, chúng ta đang thay đổi hướng nào là khối và hướng nào là nội tuyến. Trong chế độ viết `horizontal-tb`, hướng khối chạy từ trên xuống dưới; trong chế độ viết `vertical-rl`, hướng khối chạy từ phải sang trái theo chiều ngang. Vì vậy, **chiều khối** luôn là hướng mà các khối được hiển thị trên trang trong chế độ viết đang sử dụng. **Chiều nội tuyến** luôn là hướng một câu chảy.

Hình này cho thấy hai chiều khi ở chế độ viết ngang.![Hiển thị trục khối và nội tuyến cho chế độ viết ngang.](horizontal-tb.png)

Hình này cho thấy hai chiều trong chế độ viết dọc.

![Hiển thị trục khối và nội tuyến cho chế độ viết dọc.](vertical.png)

Khi bạn bắt đầu xem xét bố cục CSS, và đặc biệt là các phương pháp bố cục mới hơn, ý tưởng về khối và nội tuyến này trở nên rất quan trọng. Chúng ta sẽ xem lại điều này sau.

### Hướng

Ngoài chế độ viết, chúng ta cũng có hướng văn bản. Như đã đề cập ở trên, một số ngôn ngữ như tiếng Ả Rập được viết theo chiều ngang, nhưng từ phải sang trái. Đây không phải là điều bạn có thể sử dụng theo nghĩa sáng tạo — nếu bạn muốn căn chỉnh thứ gì đó ở bên phải, có những cách khác để làm điều đó — tuy nhiên điều quan trọng là phải hiểu điều này như một phần bản chất của CSS. Web không chỉ dành cho các ngôn ngữ được hiển thị từ trái sang phải!

Do thực tế là chế độ viết và hướng văn bản có thể thay đổi, các phương pháp bố cục CSS mới hơn không tham chiếu đến trái và phải, và trên và dưới. Thay vào đó, chúng sẽ nói về _bắt đầu_ và _kết thúc_ cùng với ý tưởng về nội tuyến và khối. Đừng lo lắng quá nhiều về điều đó ngay bây giờ, nhưng hãy ghi nhớ những ý tưởng này khi bạn bắt đầu xem xét bố cục; bạn sẽ thấy điều đó thực sự hữu ích trong việc hiểu CSS.

## Thuộc tính và giá trị logic

Lý do để nói về chế độ viết và hướng tại thời điểm này trong việc học của bạn là chúng ta đã xem xét rất nhiều thuộc tính gắn liền với các kích thước vật lý của màn hình, và những thứ này có ý nghĩa hơn khi ở chế độ viết ngang.

Hãy nhìn lại hai hộp của chúng ta — một với chế độ viết `horizontal-tb` và một với `vertical-rl`. Tôi đã cung cấp cho cả hai hộp này một {{cssxref("width")}}. Bạn có thể thấy rằng khi hộp ở chế độ viết dọc, nó vẫn có chiều rộng, và điều này gây ra văn bản bị tràn.

```html live-sample___width
<div class="wrapper">
  <div class="box horizontal">
    <h2>Heading</h2>
    <p>A paragraph demonstrating writing modes in CSS.</p>
    <p>These boxes have a width.</p>
  </div>
  <div class="box vertical">
    <h2>Heading</h2>
    <p>A paragraph demonstrating writing modes in CSS.</p>
    <p>These boxes have a width.</p>
  </div>
</div>
```

```css live-sample___width
body {
  font-family: sans-serif;
  height: 300px;
}
.wrapper {
  display: flex;
}

.box {
  border: 1px solid #cccccc;
  padding: 0.5em;
  margin: 10px;
  width: 100px;
}

.horizontal {
  writing-mode: horizontal-tb;
}

.vertical {
  writing-mode: vertical-rl;
}
```

{{EmbedLiveSample("width", "", "350px")}}

Điều chúng ta thực sự muốn trong tình huống này là về cơ bản hoán đổi chiều cao với chiều rộng theo chế độ viết. Khi chúng ta ở chế độ viết dọc, chúng ta muốn hộp mở rộng theo chiều khối giống như nó làm trong chế độ ngang.

Để làm điều này dễ dàng hơn, CSS gần đây đã phát triển một tập hợp các thuộc tính được ánh xạ. Về cơ bản, chúng thay thế các thuộc tính vật lý — những thứ như `width` và `height` — bằng các phiên bản **logic**, hoặc **flow relative** (tương đối theo luồng).

Thuộc tính được ánh xạ tới `width` khi ở chế độ viết ngang được gọi là {{cssxref("inline-size")}} — nó đề cập đến kích thước theo chiều nội tuyến. Thuộc tính cho `height` được đặt tên là {{cssxref("block-size")}} và là kích thước theo chiều khối. Bạn có thể thấy cách hoạt động của nó trong ví dụ bên dưới nơi chúng ta đã thay thế `width` bằng `inline-size`.

```html live-sample___inline-size
<div class="wrapper">
  <div class="box horizontal">
    <h2>Heading</h2>
    <p>A paragraph demonstrating writing modes in CSS.</p>
    <p>These boxes have inline-size.</p>
  </div>
  <div class="box vertical">
    <h2>Heading</h2>
    <p>A paragraph demonstrating writing modes in CSS.</p>
    <p>These boxes have inline-size.</p>
  </div>
</div>
```

```css live-sample___inline-size
.wrapper {
  display: flex;
}

.box {
  border: 1px solid #cccccc;
  padding: 0.5em;
  margin: 10px;
  inline-size: 100px;
}

.horizontal {
  writing-mode: horizontal-tb;
}

.vertical {
  writing-mode: vertical-rl;
}
```

{{EmbedLiveSample("inline-size", "", "300px")}}

### Thuộc tính lề, đường viền và khoảng đệm logic

Trong hai bài học vừa qua, chúng ta đã học về mô hình hộp CSS, và đường viền CSS. Trong các thuộc tính lề, đường viền và khoảng đệm, bạn sẽ tìm thấy nhiều trường hợp của các thuộc tính vật lý, ví dụ {{cssxref("margin-top")}}, {{cssxref("padding-left")}}, và {{cssxref("border-bottom")}}. Theo cách tương tự như chúng ta có các ánh xạ cho chiều rộng và chiều cao, có các ánh xạ cho những thuộc tính này.

Thuộc tính `margin-top` được ánh xạ tới {{cssxref("margin-block-start")}} — điều này sẽ luôn đề cập đến lề ở đầu chiều khối.

Thuộc tính {{cssxref("padding-left")}} ánh xạ tới {{cssxref("padding-inline-start")}}, khoảng đệm được áp dụng ở đầu hướng nội tuyến. Đây sẽ là nơi câu bắt đầu trong chế độ viết đó. Thuộc tính {{cssxref("border-bottom")}} ánh xạ tới {{cssxref("border-block-end")}}, là đường viền ở cuối chiều khối.

Bạn có thể thấy sự so sánh giữa các thuộc tính vật lý và logic bên dưới.

Nếu bạn thay đổi chế độ viết của các hộp bằng cách chuyển thuộc tính `writing-mode` trên `.box` thành `vertical-rl`, bạn sẽ thấy cách các thuộc tính vật lý gắn với hướng vật lý của chúng, trong khi các thuộc tính logic chuyển theo chế độ viết.

Bạn cũng có thể thấy rằng {{htmlelement("Heading_Elements", "h2")}} có `border-bottom` màu đen. Bạn có thể tìm ra cách để làm cho đường viền dưới đó luôn đi bên dưới văn bản trong cả hai chế độ viết không?

```html live-sample___logical-mbp
<div class="wrapper">
  <div class="box physical">
    <h2>Physical Properties</h2>
    <p>A paragraph demonstrating logical properties in CSS.</p>
  </div>
  <div class="box logical">
    <h2>Logical Properties</h2>
    <p>A paragraph demonstrating logical properties in CSS.</p>
  </div>
</div>
```

```css live-sample___logical-mbp
.wrapper {
  display: flex;
  border: 5px solid #cccccc;
}

.box {
  margin-right: 30px;
  inline-size: 200px;
  writing-mode: horizontal-tb;
}

.logical {
  margin-block-start: 20px;
  padding-inline-end: 2em;
  padding-block-start: 2px;
  border-block-start: 5px solid pink;
  border-inline-end: 10px dotted rebeccapurple;
  border-block-end: 1em double orange;
  border-inline-start: 1px solid black;
}

.physical {
  margin-top: 20px;
  padding-right: 2em;
  padding-top: 2px;
  border-top: 5px solid pink;
  border-right: 10px dotted rebeccapurple;
  border-bottom: 1em double orange;
  border-left: 1px solid black;
}

h2 {
  border-bottom: 5px solid black;
}
```

{{EmbedLiveSample("logical-mbp", "", "200px")}}

Có rất nhiều thuộc tính khi bạn xem xét tất cả các thuộc tính đường viền riêng lẻ, và bạn có thể thấy tất cả các thuộc tính được ánh xạ trên trang MDN cho [Thuộc tính và giá trị logic](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values).

### Giá trị logic

Cho đến nay, chúng ta đã xem xét các tên thuộc tính logic. Ngoài ra còn có một số thuộc tính nhận các giá trị vật lý là `top`, `right`, `bottom`, và `left`. Những giá trị này cũng có các ánh xạ, đến các giá trị logic — `block-start`, `inline-end`, `block-end`, và `inline-start`.

Ví dụ, bạn có thể thả nổi hình ảnh sang trái để làm cho văn bản quấn quanh hình ảnh. Bạn có thể thay thế `left` bằng `inline-start` như trong ví dụ bên dưới.

Thay đổi chế độ viết trong ví dụ này thành `vertical-rl` để xem điều gì xảy ra với hình ảnh. Thay đổi `inline-start` thành `inline-end` để thay đổi float:

```html live-sample___float
<div class="wrapper">
  <div class="box logical">
    <img
      alt="star"
      src="https://mdn.github.io/shared-assets/images/examples/big-star.png" />
    <p>
      This box uses logical properties. The star image has been floated
      inline-start, it also has a margin on the inline-end and block-end.
    </p>
  </div>
</div>
```

```css live-sample___float
.wrapper {
  display: flex;
}

.box {
  margin: 10px;
  padding: 0.5em;
  border: 1px solid #cccccc;
  inline-size: 200px;
  writing-mode: horizontal-tb;
}

img {
  float: inline-start;
  margin-inline-end: 10px;
  margin-block-end: 10px;
}
```

{{EmbedLiveSample("float", "", "200px")}}

Ở đây, chúng ta cũng sử dụng các giá trị lề logic để đảm bảo lề ở đúng vị trí bất kể chế độ viết là gì.

### Bạn nên sử dụng thuộc tính vật lý hay thuộc tính logic?

Các thuộc tính logic và giá trị mới hơn so với các tương đương vật lý của chúng, và do đó chỉ gần đây mới được triển khai trong các trình duyệt. Bạn có thể kiểm tra bất kỳ trang thuộc tính nào trên MDN để xem hỗ trợ trình duyệt đi xa đến đâu. Nếu bạn không sử dụng nhiều chế độ viết, thì hiện tại bạn có thể thích sử dụng các phiên bản vật lý. Tuy nhiên, cuối cùng chúng ta kỳ vọng rằng mọi người sẽ chuyển sang các phiên bản logic cho hầu hết mọi thứ, vì chúng có nhiều ý nghĩa khi bạn cũng bắt đầu xử lý các phương pháp bố cục như flexbox và grid.

## Tóm tắt

Các khái niệm được giải thích trong bài học này ngày càng trở nên quan trọng trong CSS. Hiểu biết về hướng khối và nội tuyến — và cách luồng văn bản thay đổi khi chế độ viết thay đổi — sẽ rất hữu ích trong tương lai. Nó sẽ giúp bạn hiểu CSS ngay cả khi bạn không bao giờ sử dụng chế độ viết nào khác ngoài chế độ ngang.
