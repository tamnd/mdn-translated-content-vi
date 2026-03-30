---
title: Kích thước các mục trong CSS
short-title: Kích thước
slug: Learn_web_development/Core/Styling_basics/Sizing
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Values", "Learn_web_development/Core/Styling_basics/Test_your_skills/Sizing", "Learn_web_development/Core/Styling_basics")}}

Trong các bài học khác nhau cho đến nay, bạn đã gặp một số cách để kích thước các mục trên trang web bằng CSS. Hiểu các tính năng khác nhau trong thiết kế của bạn sẽ lớn đến mức nào là quan trọng. Vì vậy, trong bài học này, chúng ta sẽ tóm tắt các cách khác nhau mà các phần tử được kích thước thông qua CSS và định nghĩa một số thuật ngữ về kích thước sẽ giúp bạn trong tương lai.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về HTML (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >), <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Getting_started">Cú pháp CSS cơ bản</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors">Bộ chọn CSS</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Hiểu khái niệm kích thước nội tại.</li>
          <li>Đặt kích thước tuyệt đối và phần trăm.</li>
          <li>Đặt chiều rộng và chiều cao tối đa và tối thiểu.</li>
          <li>Hiểu đơn vị viewport và lý do tại sao chúng hữu ích.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Kích thước tự nhiên hoặc nội tại của mọi thứ

Các phần tử HTML có kích thước tự nhiên, được đặt trước khi chúng bị ảnh hưởng bởi bất kỳ CSS nào. Một ví dụ đơn giản là hình ảnh. Một tệp hình ảnh chứa thông tin kích thước, được mô tả là **kích thước nội tại** của nó. Kích thước này được xác định bởi hình ảnh _chính nó_, không phải bởi bất kỳ định dạng nào chúng ta áp dụng.

Nếu bạn đặt một hình ảnh trên một trang và không thay đổi chiều cao hoặc chiều rộng của nó, bằng cách sử dụng các thuộc tính `<img>` hoặc CSS, nó sẽ được hiển thị bằng kích thước nội tại đó. Chúng ta đã tạo cho hình ảnh trong ví dụ bên dưới một đường viền để bạn có thể thấy phạm vi kích thước của nó được xác định trong tệp của nó.

```html live-sample___intrinsic-image
<img
  alt="star"
  src="https://mdn.github.io/shared-assets/images/examples/big-star.png" />
```

```css live-sample___intrinsic-image
img {
  border: 5px solid darkblue;
}
```

{{EmbedLiveSample("intrinsic-image","100%", "80")}}

Ngược lại, một {{htmlelement("div")}} trống không có kích thước riêng. Nếu bạn thêm một {{htmlelement("div")}} vào HTML của bạn mà không có nội dung, sau đó tạo cho nó một đường viền như chúng ta đã làm với hình ảnh, bạn sẽ thấy một đường thẳng trên trang. Đây là đường viền thu gọn của `<div>` — không có nội dung để giữ nó mở ra.

Trong ví dụ bên dưới, đường viền đó trải dài toàn bộ chiều rộng của vùng chứa, vì nó là phần tử cấp khối, một hành vi mà bạn nên bắt đầu quen thuộc. Nó không có chiều cao (hoặc kích thước trong chiều khối) vì nó không có nội dung.

```html live-sample___intrinsic-text
<div class="box"></div>
```

```css live-sample___intrinsic-text
.box {
  border: 5px solid darkblue;
}
```

{{EmbedLiveSample("intrinsic-text","100%", "60")}}

Trong ví dụ trên, hãy thử thêm một số văn bản vào bên trong phần tử trống. Bạn sẽ thấy đường viền mở ra vì chiều cao của phần tử được xác định bởi nội dung. Một lần nữa, đây là kích thước nội tại của phần tử — kích thước của nó được xác định bởi nội dung của nó.

## Đặt kích thước cụ thể

Tất nhiên, chúng ta có thể cung cấp cho các phần tử trong thiết kế của mình một kích thước cụ thể. Khi một kích thước được cung cấp cho một phần tử (nội dung của nó sau đó cần phải vừa vào kích thước đó), chúng ta gọi nó là **kích thước ngoại tại**.

Trong ví dụ tiếp theo, chúng ta cung cấp cho hai `<div>` các giá trị {{cssxref("width")}} và {{cssxref("height")}} cụ thể, và chúng sẽ có kích thước đó bất kể nội dung gì được đặt bên trong chúng. Như `<div>` bên phải minh họa, một chiều cao cố định có thể khiến nội dung tràn nếu có nhiều nội dung hơn sẽ vừa bên trong phần tử chứa của nó (bạn sẽ tìm hiểu thêm về [tràn](/en-US/docs/Learn_web_development/Core/Styling_basics/Overflow) trong bài học tiếp theo).

```html live-sample___height
<div class="wrapper">
  <div class="box"></div>
  <div class="box">
    These boxes both have a height set, this box has content in it which will
    need more space than the assigned height, and so we get overflow.
  </div>
</div>
```

```css live-sample___height
body {
  font: 1.2em sans-serif;
}
.wrapper {
  display: flex;
}

.wrapper > * {
  margin: 20px;
}

.box {
  border: 5px solid darkblue;
  height: 100px;
  width: 200px;
}
```

{{EmbedLiveSample("height", "", "200px")}}

Do vấn đề tràn này, việc cố định chiều cao của các phần tử bằng độ dài hoặc phần trăm là điều chúng ta cần làm rất cẩn thận trên web.

### Sử dụng phần trăm

Theo nhiều cách, phần trăm hoạt động như các đơn vị độ dài, và như chúng ta [đã thảo luận trong bài học về giá trị và đơn vị](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#percentages), chúng thường có thể được sử dụng thay thế cho nhau với độ dài. Khi sử dụng phần trăm, bạn cần lưu ý đó là phần trăm của _cái gì_. Trong trường hợp hộp bên trong một vùng chứa khác, nếu bạn cho hộp con một phần trăm chiều rộng, nó sẽ là phần trăm chiều rộng của vùng chứa cha.

```html live-sample___percent-width
<div class="container">
  <div class="box">I have a percentage width.</div>
</div>
```

```css live-sample___percent-width
body {
  font: 1.2em sans-serif;
}

.box {
  border: 5px solid darkblue;
  width: 50%;
}
```

{{EmbedLiveSample("percent-width")}}

Điều này xảy ra vì phần trăm được giải quyết dựa trên kích thước của khối chứa. Khi không có phần trăm nào được áp dụng, `<div>` `box` chiếm `100%` không gian có sẵn, vì nó là phần tử cấp khối. Nếu chúng ta cho nó một phần trăm chiều rộng, điều này trở thành phần trăm không gian mà nó thường lấp đầy.

Hãy thử chỉnh sửa ví dụ trên:

1. Xóa khai báo `width` của `<div>` `box` để xác minh rằng nó mặc định chiếm `100%` `width` có sẵn.
2. Hoàn nguyên thay đổi trước của bạn — cho `<div>` `box` một `width` là `50%` một lần nữa.
3. Bây giờ hãy cho `<div>` `container` một `width` là `50%`. Bạn sẽ thấy `width` của `<div>` `box` nhỏ hơn, vì nó tương đối với `width` của vùng chứa của nó.

### Lề và khoảng đệm theo phần trăm

Nếu bạn đặt `margins` và `padding` theo phần trăm, bạn có thể nhận thấy một số hành vi kỳ lạ.

Trong ví dụ bên dưới, chúng ta có một hộp, trên đó chúng ta đã đặt {{cssxref("margin")}} là 10% và {{cssxref("padding")}} là `10%`. Khoảng đệm và lề ở trên cùng và dưới cùng của hộp có cùng kích thước với khoảng đệm và lề ở bên trái và bên phải.

```html live-sample___percent-mp
<div class="box">I have margin and padding set to 10% on all sides.</div>
```

```css live-sample___percent-mp
body {
  font: 1.2em sans-serif;
}
.box {
  border: 5px solid darkblue;
  width: 200px;
  margin: 10%;
  padding: 10%;
}
```

{{EmbedLiveSample("percent-mp", "", "380px")}}

Bạn có thể mong đợi lề trên và dưới theo phần trăm là phần trăm chiều cao của phần tử, và lề trái và phải theo phần trăm là phần trăm chiều rộng của phần tử. Tuy nhiên, đây không phải là trường hợp!

Khi bạn sử dụng lề và khoảng đệm đặt theo phần trăm, giá trị được tính từ **kích thước nội tuyến** của khối chứa — do đó, chiều rộng khi làm việc trong ngôn ngữ nằm ngang. Trong ví dụ của chúng ta, tất cả lề và khoảng đệm đều là `10%` chiều rộng. Điều này có nghĩa là bạn có thể có lề và khoảng đệm có kích thước bằng nhau xung quanh hộp. Đây là một thực tế đáng nhớ nếu bạn sử dụng phần trăm theo cách này.

## Kích thước min- và max-

Ngoài việc cung cấp cho mọi thứ một kích thước cố định, chúng ta có thể yêu cầu CSS cung cấp cho một phần tử kích thước tối thiểu hoặc tối đa. Nếu bạn có một hộp có thể chứa một lượng nội dung biến đổi, và bạn luôn muốn nó có _ít nhất_ một chiều cao nhất định, bạn có thể đặt thuộc tính {{cssxref("min-height")}} trên đó. Hộp sẽ luôn có ít nhất chiều cao này, nhưng sau đó sẽ cao hơn nếu có nhiều nội dung hơn không gian hộp có ở chiều cao tối thiểu của nó.

Trong ví dụ tiếp theo, bạn có thể thấy hai hộp, cả hai đều có `min-height` được xác định là 100 pixel. Hộp bên trái cao 100 pixel; hộp bên phải có nội dung cần nhiều không gian hơn, và vì vậy nó đã cao hơn 100 pixel.

```html live-sample___min-height
<div class="wrapper">
  <div class="box"></div>
  <div class="box">
    These boxes both have a min-height set. This box has content in it, which
    will need more space than the assigned height, and so it grows from the
    minimum.
  </div>
</div>
```

```css live-sample___min-height
body {
  font: 1.2em sans-serif;
}
.wrapper {
  display: flex;
  align-items: flex-start;
}

.wrapper > * {
  margin: 20px;
}

.box {
  border: 5px solid darkblue;
  min-height: 100px;
  width: 200px;
}
```

{{EmbedLiveSample("min-height", "", "220px")}}

Điều này rất hữu ích để tránh tràn khi xử lý các lượng nội dung biến đổi.

### `max-width` trên hình ảnh

Một cách sử dụng phổ biến của {{cssxref("max-width")}} là làm cho hình ảnh thu nhỏ nếu không có đủ không gian để hiển thị chúng ở chiều rộng nội tại của chúng, trong khi đảm bảo chúng không trở nên lớn hơn chiều rộng đó.

Ví dụ, nếu bạn đặt `width: 100%` trên một hình ảnh, và chiều rộng nội tại của nó nhỏ hơn vùng chứa của nó, hình ảnh sẽ bị buộc phải kéo giãn và trở nên lớn hơn, làm cho nó trông bị vỡ pixel.

Nếu bạn sử dụng `max-width: 100%` thay thế, và chiều rộng nội tại của nó nhỏ hơn vùng chứa của nó, hình ảnh sẽ không bị buộc phải kéo giãn và trở nên lớn hơn, do đó ngăn chặn việc vỡ pixel.

Trong ví dụ bên dưới, chúng ta đã nhúng cùng một hình ảnh ba lần:

- Hình ảnh đầu tiên đã được cho `width: 100%` và nằm trong một vùng chứa lớn hơn nó, do đó nó kéo giãn đến chiều rộng vùng chứa.
- Hình ảnh thứ hai có `max-width: 100%` được đặt trên nó và do đó không kéo giãn để lấp đầy vùng chứa.
- Hộp thứ ba chứa cùng một hình ảnh, cũng với `max-width: 100%` được đặt; trong trường hợp này bạn có thể thấy nó đã thu nhỏ để vừa vào hộp.

```html live-sample___max-width
<div class="wrapper">
  <div class="box">
    <img
      alt="star"
      class="width"
      src="https://mdn.github.io/shared-assets/images/examples/big-star.png" />
  </div>
  <div class="box">
    <img
      alt="star"
      class="max"
      src="https://mdn.github.io/shared-assets/images/examples/big-star.png" />
  </div>
  <div class="mini-box">
    <img
      alt="star"
      class="max"
      src="https://mdn.github.io/shared-assets/images/examples/big-star.png" />
  </div>
</div>
```

```css hidden live-sample___max-width
.wrapper {
  display: flex;
  align-items: flex-start;
}

.wrapper > * {
  margin: 20px;
}

.box,
.mini-box {
  border: 5px solid darkblue;
}
```

```css live-sample___max-width
.box {
  width: 200px;
}
.mini-box {
  width: 30px;
}
.width {
  width: 100%;
}
.max {
  max-width: 100%;
}
```

{{EmbedLiveSample("max-width", "", "260px")}}

Kỹ thuật này được sử dụng để làm cho hình ảnh _phản hồi_, để khi xem trên thiết bị nhỏ hơn, chúng thu nhỏ một cách phù hợp. Tuy nhiên, bạn không nên sử dụng kỹ thuật này để tải các hình ảnh thực sự lớn và sau đó thu nhỏ chúng trong trình duyệt. Hình ảnh nên được điều chỉnh kích thước phù hợp để không lớn hơn mức cần thiết cho kích thước lớn nhất mà chúng được hiển thị trong thiết kế. Tải xuống hình ảnh quá lớn sẽ làm cho trang web của bạn trở nên chậm, và nó có thể tốn người dùng nhiều tiền hơn nếu họ trả tiền theo megabyte.

## Đơn vị viewport

Viewport — là vùng hiển thị của trang của bạn trong trình duyệt bạn đang sử dụng để xem trang web — cũng có kích thước. Trong CSS, chúng ta có các đơn vị liên quan đến kích thước của viewport — đơn vị `vw` cho chiều rộng viewport, và `vh` cho chiều cao viewport. Sử dụng các đơn vị này, bạn có thể kích thước thứ gì đó tương đối với viewport của người dùng.

`1vh` bằng `1%` chiều cao viewport, và `1vw` bằng `1%` chiều rộng viewport. Bạn có thể sử dụng các đơn vị này để kích thước hộp, nhưng cũng cả văn bản. Trong ví dụ bên dưới, chúng ta có một hộp được kích thước là `20vh` và `20vw`. Hộp chứa chữ cái `A`, được cấp {{cssxref("font-size")}} là `10vh`.

```html live-sample___vw-vh
<div class="box">A</div>
```

```css live-sample___vw-vh
body {
  font-family: sans-serif;
}

.box {
  border: 5px solid darkblue;
  width: 20vw;
  height: 20vh;
  font-size: 10vh;
}
```

{{EmbedLiveSample("vw-vh")}}

Thay đổi các giá trị `vh` và `vw` sẽ thay đổi kích thước của hộp và phông chữ tương ứng; thay đổi kích thước viewport cũng sẽ thay đổi kích thước hộp và phông chữ vì chúng được kích thước tương đối với viewport. Để xem kích thước hộp và văn bản thay đổi khi bạn điều chỉnh kích thước viewport, {{LiveSampleLink("vw-vh", "tải ví dụ trong tab mới")}} và thay đổi kích thước cửa sổ trình duyệt.

Kích thước mọi thứ theo viewport có thể hữu ích trong thiết kế của bạn. Ví dụ, nếu bạn muốn một banner toàn trang hiển thị trước phần còn lại của nội dung của bạn, việc làm cho phần đó của trang của bạn cao `100vh` sẽ đẩy phần còn lại của nội dung xuống dưới viewport, có nghĩa là nó sẽ chỉ xuất hiện khi tài liệu được cuộn.

## Tóm tắt

Bài học này đã cung cấp cho bạn tóm tắt về một số vấn đề chính mà bạn có thể gặp phải khi kích thước mọi thứ trên web. Khi bạn chuyển sang [CSS Layout](/en-US/docs/Learn_web_development/Core/CSS_layout), kích thước sẽ trở nên rất quan trọng trong việc nắm vững các phương pháp bố cục khác nhau, vì vậy đáng để hiểu các khái niệm ở đây trước khi tiếp tục.

Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ hiểu và ghi nhớ thông tin chúng ta đã cung cấp về kích thước CSS.

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Values", "Learn_web_development/Core/Styling_basics/Test_your_skills/Sizing", "Learn_web_development/Core/Styling_basics")}}
