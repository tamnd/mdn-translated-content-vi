---
title: Nội dung tràn
short-title: Tràn
slug: Learn_web_development/Core/Styling_basics/Overflow
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Backgrounds_and_borders", "Learn_web_development/Core/Styling_basics/Test_your_skills/Overflow", "Learn_web_development/Core/Styling_basics")}}

Tràn là điều xảy ra khi có quá nhiều nội dung để vừa vào trong một hộp phần tử. Trong bài học này, bạn sẽ học cách quản lý tràn bằng CSS.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về HTML (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >), CSS <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units">Giá trị và đơn vị</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Sizing">Kích thước</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Hiểu tràn là gì.</li>
          <li>Kiểm soát tràn với thuộc tính <code>overflow</code>.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Tràn là gì?

Mọi thứ trong CSS đều là hộp. Bạn có thể ràng buộc kích thước của các hộp này bằng cách gán các giá trị như {{cssxref("width")}} và {{cssxref("height")}}. **Tràn xảy ra khi có quá nhiều nội dung để vừa vào hộp.** CSS cung cấp nhiều công cụ khác nhau để quản lý tràn. Khi bạn đi xa hơn với CSS layout và viết CSS, bạn sẽ gặp nhiều tình huống tràn hơn.

## CSS cố gắng tránh "mất dữ liệu"

Hãy xem xét hai ví dụ minh họa hành vi mặc định của CSS khi xảy ra tràn.

Ví dụ đầu tiên có một hộp đã bị giới hạn bằng cách đặt `height`. Nội dung của hộp vượt quá không gian có sẵn, do đó nó tràn ra khỏi hộp và rơi vào đoạn văn bên dưới.

```html live-sample___block-overflow
<div class="box">
  This box has a height and a width. This means that if there is too much
  content to be displayed within the assigned height, there will be an overflow
  situation. If overflow is set to hidden then any overflow will not be visible.
</div>

<p>This content is outside of the box.</p>
```

```css live-sample___block-overflow
.box {
  border: 1px solid #333333;
  width: 250px;
  height: 100px;
}
```

{{EmbedLiveSample("block-overflow", "", "200px")}}

Ví dụ thứ hai có một từ trong một hộp. Hộp đã được làm quá nhỏ cho từ đó và do đó nó thoát ra ngoài hộp.

```html live-sample___inline-overflow
<div class="word">Overflow</div>
```

```css live-sample___inline-overflow
.word {
  border: 1px solid #333333;
  width: 100px;
  font-size: 250%;
}
```

{{EmbedLiveSample("inline-overflow")}}

Bạn có thể tự hỏi tại sao CSS hoạt động theo cách lộn xộn như vậy, hiển thị nội dung bên ngoài vùng chứa dự định của nó. Tại sao không ẩn nội dung tràn? Tại sao không thay đổi kích thước vùng chứa để vừa với tất cả nội dung?

Bất cứ khi nào có thể, CSS không ẩn nội dung. Điều này sẽ gây ra mất dữ liệu. Vấn đề với mất dữ liệu là bạn hoặc khách truy cập trang web của bạn có thể không nhận thấy. Nếu nút gửi trên biểu mẫu biến mất và không ai có thể hoàn thành biểu mẫu, đây có thể là vấn đề lớn! Thay vào đó, CSS tràn theo những cách có thể nhìn thấy. Bạn có nhiều khả năng nhận thấy có vấn đề. Tệ nhất là, khách truy cập trang web sẽ cho bạn biết rằng nội dung đang chồng lên nhau.

Nếu bạn ràng buộc hộp với `width` hoặc `height`, CSS tin tưởng bạn biết mình đang làm gì. CSS giả định rằng bạn đang quản lý khả năng tràn. Nói chung, việc ràng buộc kích thước khối là có vấn đề khi hộp chứa văn bản. Có thể có nhiều văn bản hơn bạn dự kiến khi thiết kế trang, hoặc văn bản có thể lớn hơn (ví dụ, nếu người dùng đã tăng cỡ chữ của họ).

## Thuộc tính overflow

Thuộc tính {{cssxref("overflow")}} cho phép bạn chỉ định cách trình duyệt xử lý nội dung tràn. Giá trị mặc định của kiểu giá trị {{cssxref("&lt;overflow&gt;")}} là `visible`. Với cài đặt mặc định này, người ta có thể thấy nội dung khi nó tràn.

### Ẩn nội dung tràn

Để ẩn nội dung khi nó tràn, bạn có thể đặt `overflow: hidden`. Điều này thực hiện chính xác những gì nó nói: nó ẩn tràn. Hãy cẩn thận rằng điều này có thể làm cho một số nội dung vô hình. Bạn chỉ nên làm điều này nếu việc ẩn nội dung không gây ra vấn đề.

```html live-sample___hidden
<div class="box">
  This box has a height and a width. This means that if there is too much
  content to be displayed within the assigned height, there will be an overflow
  situation. If overflow is set to hidden then any overflow will not be visible.
</div>

<p>This content is outside of the box.</p>
```

```css live-sample___hidden
.box {
  border: 1px solid #333333;
  width: 250px;
  height: 100px;
  overflow: hidden;
}
```

{{EmbedLiveSample("hidden", "", "200px")}}

Hãy thử chỉnh sửa ví dụ trên để đặt giá trị `overflow` thành `visible`, rồi trở lại `hidden`, để xem hiệu ứng là gì.

### Cuộn nội dung tràn

Thay vào đó, có thể bạn muốn cho phép người dùng cuộn nội dung để đọc tất cả? Khi bạn đặt `overflow: scroll` trên nội dung tràn, các trình duyệt có thanh cuộn hiển thị sẽ luôn hiển thị chúng — ngay cả khi không có đủ nội dung để tràn. Điều này mang lại lợi thế là giữ cho bố cục nhất quán, thay vì các thanh cuộn xuất hiện hoặc biến mất, tùy thuộc vào lượng nội dung trong vùng chứa.

Hãy xem điều này trong hành động. Chỉnh sửa ví dụ sau để xóa một số nội dung từ `box` `<div>`. Lưu ý rằng các thanh cuộn vẫn còn, ngay cả khi không cần cuộn:

```html live-sample___scroll
<div class="box">
  This box has a height and a width. This means that if there is too much
  content to be displayed within the assigned height, there will be an overflow
  situation. If overflow is set to hidden then any overflow will not be visible.
</div>

<p>This content is outside of the box.</p>
```

```css live-sample___scroll
.box {
  border: 1px solid #333333;
  width: 250px;
  height: 100px;
  overflow: scroll;
}
```

{{EmbedLiveSample("scroll", "", "200px")}}

> [!NOTE]
> Khả năng hiển thị của thanh cuộn phụ thuộc vào hệ điều hành.
> Bạn có thể phải thay đổi cài đặt trình duyệt để luôn hiển thị thanh cuộn để các thanh cuộn luôn hiển thị trong các ví dụ sau.

Trong ví dụ trên, chúng ta chỉ cần cuộn trên trục `y`, nhưng chúng ta nhận được thanh cuộn trên cả hai trục. Để chỉ cuộn trên trục `y`, bạn có thể sử dụng thuộc tính {{cssxref("overflow-y")}}, đặt `overflow-y: scroll`. Hãy thử đặt thuộc tính này trong ví dụ trên.

Bạn cũng có thể kích hoạt cuộn dọc theo trục x bằng cách sử dụng {{cssxref("overflow-x")}}, mặc dù đây không phải là cách được khuyến nghị để chứa các từ dài! Nếu bạn có một từ dài trong hộp nhỏ, hãy xem xét sử dụng các thuộc tính {{cssxref("word-break")}} hoặc {{cssxref("overflow-wrap")}}. Ngoài ra, một số phương pháp được thảo luận trong [Kích thước các mục trong CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Sizing) có thể giúp bạn tạo các hộp co giãn tốt hơn với các lượng nội dung khác nhau.

```html live-sample___scroll-x
<div class="word">Overflow</div>
```

```css live-sample___scroll-x
.word {
  border: 5px solid #333333;
  width: 100px;
  font-size: 250%;
  overflow-x: scroll;
}
```

{{EmbedLiveSample("scroll-x")}}

Cũng như với `scroll`, bạn nhận được thanh cuộn theo kích thước cuộn dù có hay không có đủ nội dung để gây ra thanh cuộn.

> [!NOTE]
> Bạn có thể chỉ định cuộn trục x và y bằng thuộc tính `overflow`, truyền hai giá trị. Nếu hai từ khóa được chỉ định, từ khóa đầu tiên áp dụng cho `overflow-x` và từ khóa thứ hai áp dụng cho `overflow-y`. Nếu không, cả `overflow-x` và `overflow-y` đều được đặt thành cùng một giá trị. Ví dụ, `overflow: scroll hidden` sẽ đặt `overflow-x` thành `scroll` và `overflow-y` thành `hidden`.

### Chỉ hiển thị thanh cuộn khi cần thiết

Nếu bạn chỉ muốn thanh cuộn xuất hiện khi có nhiều nội dung hơn có thể vừa vào hộp, hãy sử dụng `overflow: auto`. Điều này cho phép trình duyệt xác định xem nó có nên hiển thị thanh cuộn hay không.

Trong ví dụ bên dưới, hãy xóa nội dung cho đến khi nó vừa vào hộp. Bạn sẽ thấy thanh cuộn biến mất:

```html live-sample___auto
<div class="box">
  This box has a height and a width. This means that if there is too much
  content to be displayed within the assigned height, there will be an overflow
  situation. If overflow is set to hidden then any overflow will not be visible.
</div>

<p>This content is outside of the box.</p>
```

```css live-sample___auto
.box {
  border: 1px solid #333333;
  width: 250px;
  height: 100px;
  overflow: auto;
}
```

{{EmbedLiveSample("auto", "", "200px")}}

## Tràn không mong muốn trong thiết kế web

Các phương pháp bố cục hiện đại (mà bạn sẽ gặp sau này trong mô-đun [CSS layout](/en-US/docs/Learn_web_development/Core/CSS_layout)) quản lý tràn. Chúng phần lớn hoạt động mà không có giả định hoặc phụ thuộc vào lượng nội dung sẽ có trên trang web.

Điều này không phải lúc nào cũng là chuẩn mực. Trước đây, một số trang web được xây dựng với các vùng chứa chiều cao cố định để căn chỉnh đáy hộp. Các hộp này có thể không có mối quan hệ với nhau. Điều này mỏng manh. Nếu bạn gặp một hộp mà nội dung đang chồng lên nội dung khác, bây giờ bạn sẽ nhận ra rằng tràn có thể là nguyên nhân của điều này. Lý tưởng nhất, bạn sẽ cấu trúc lại bố cục để không dựa vào các vùng chứa chiều cao cố định.

Khi phát triển trang web, luôn ghi nhớ tràn. Kiểm tra thiết kế với nhiều và ít nội dung. Tăng và giảm cỡ chữ ít nhất hai gia số. Đảm bảo CSS của bạn mạnh mẽ. Việc thay đổi giá trị tràn để ẩn nội dung hoặc thêm thanh cuộn được dành riêng cho một vài trường hợp sử dụng được chọn (ví dụ, khi bạn muốn có hộp cuộn).

## Tóm tắt

Bài học này đã giới thiệu khái niệm tràn. Bạn nên hiểu rằng CSS mặc định tránh làm cho nội dung tràn vô hình. Bạn đã khám phá rằng bạn có thể quản lý tràn tiềm năng, và cũng rằng bạn nên kiểm tra công việc để đảm bảo nó không vô tình gây ra tràn có vấn đề.

Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ hiểu và ghi nhớ thông tin chúng ta đã cung cấp về tràn.

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Backgrounds_and_borders", "Learn_web_development/Core/Styling_basics/Test_your_skills/Overflow", "Learn_web_development/Core/Styling_basics")}}
