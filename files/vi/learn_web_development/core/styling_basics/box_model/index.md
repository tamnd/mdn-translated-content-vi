---
title: Mô hình hộp
short-title: Mô hình hộp
slug: Learn_web_development/Core/Styling_basics/Box_model
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Selectors", "Learn_web_development/Core/Styling_basics/Test_your_skills/Box_model", "Learn_web_development/Core/Styling_basics")}}

Mọi thứ trong CSS đều có một hộp xung quanh, và việc hiểu các hộp này là chìa khóa để có thể tạo bố cục phức tạp hơn với CSS, hoặc căn chỉnh các mục với các mục khác. Trong bài học này, chúng ta sẽ xem xét _Mô hình hộp_ CSS. Bạn sẽ hiểu cách nó hoạt động và các thuật ngữ liên quan.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về HTML (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >)
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Phần tử khối và phần tử nội tuyến</li>
          <li>Các hộp khác nhau tạo nên một phần tử và cách tạo kiểu cho chúng — nội dung, lề ngoài, đường viền, phần đệm.</li>
          <li>Mô hình hộp thay thế (truy cập qua <code>box-sizing: border-box</code>) và cách nó khác với mô hình hộp thông thường.</li>
          <li>Gộp lề ngoài.</li>
          <li>Các giá trị hiển thị cơ bản và cách chúng ảnh hưởng đến hành vi hộp — <code>block</code>, <code>inline</code>, <code>inline-block</code>, <code>none</code>.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Hộp khối và hộp nội tuyến

Trong CSS, chúng ta có một số loại hộp thường phù hợp với các danh mục **hộp khối** và **hộp nội tuyến**. Loại đề cập đến cách hộp hoạt động theo luồng trang và so với các hộp khác trên trang. Các hộp có **kiểu hiển thị nội bộ** và **kiểu hiển thị bên ngoài**.

Nhìn chung, bạn có thể đặt các giá trị khác nhau cho kiểu hiển thị bằng thuộc tính {{cssxref("display")}}.

Nếu một hộp có giá trị hiển thị là `block`, thì:

- Hộp sẽ xuống dòng mới.
- Các thuộc tính {{cssxref("width")}} và {{cssxref("height")}} được tuân theo.
- Phần đệm, lề ngoài và đường viền sẽ khiến các phần tử khác bị đẩy ra khỏi hộp.
- Nếu {{cssxref("width")}} không được chỉ định, hộp sẽ mở rộng theo hướng nội tuyến để lấp đầy không gian có sẵn trong vùng chứa của nó. Trong hầu hết các trường hợp, hộp sẽ rộng như vùng chứa của nó, lấp đầy 100% không gian có sẵn.

Một số phần tử HTML, như `<h1>` và `<p>`, sử dụng `block` làm kiểu hiển thị bên ngoài mặc định của chúng.

Nếu một hộp có kiểu hiển thị là `inline`, thì:

- Hộp sẽ không xuống dòng mới.
- Các thuộc tính {{cssxref("width")}}, {{cssxref("height")}} và lề ngoài trên và dưới sẽ không có tác dụng.
- Phần đệm và đường viền **trên và dưới** sẽ thay đổi kích thước hộp mà không ảnh hưởng đến vị trí của nội dung xung quanh, điều này có thể gây ra chồng chéo.
- Phần đệm, lề ngoài và đường viền **trái và phải** sẽ ảnh hưởng đến vị trí của nội dung nội tuyến xung quanh.

Một số phần tử HTML, như `<a>`, `<span>`, `<em>` và `<strong>`, sử dụng `inline` làm kiểu hiển thị bên ngoài mặc định của chúng.

Bố cục khối và nội tuyến là cách mọi thứ hoạt động mặc định trên web. Theo mặc định và không có bất kỳ hướng dẫn nào khác, các phần tử bên trong hộp cũng được đặt theo **[luồng thông thường](/en-US/docs/Learn_web_development/Core/CSS_layout/Introduction#normal_layout_flow)** và hoạt động như hộp khối hoặc nội tuyến.

## Kiểu hiển thị nội bộ và bên ngoài

Các giá trị hiển thị `block` và `inline` được gọi là kiểu hiển thị **bên ngoài** — chúng ảnh hưởng đến cách hộp được đặt so với các hộp khác xung quanh nó. Các hộp cũng có kiểu hiển thị **nội bộ**, quyết định cách các phần tử bên trong hộp đó được đặt.

Bạn có thể thay đổi kiểu hiển thị nội bộ bằng cách đặt giá trị hiển thị nội bộ, ví dụ `display: flex;`. Phần tử vẫn sẽ sử dụng kiểu hiển thị bên ngoài `block` nhưng điều này thay đổi kiểu hiển thị nội bộ thành `flex`. Bất kỳ phần tử con trực tiếp nào của hộp này sẽ trở thành mục flex và hoạt động theo thông số kỹ thuật [Flexbox](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox).

Khi bạn tiếp tục học về CSS Layout chi tiết hơn, bạn sẽ gặp [`flex`](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox), và các giá trị nội bộ khác mà các hộp của bạn có thể có, ví dụ [`grid`](/en-US/docs/Learn_web_development/Core/CSS_layout/Grids).

Đừng lo lắng quá nhiều về thuật ngữ nội bộ và bên ngoài hiện tại; đây là những gì đang xảy ra bên trong, và chúng tôi đề cập ở đây phòng trường hợp bạn gặp nó ở nơi khác. Nhìn chung, bạn sẽ chỉ xử lý các giá trị `display` đơn và không cần nghĩ nhiều về nó.

## Ví dụ về các kiểu hiển thị khác nhau

Ví dụ bên dưới có ba phần tử HTML khác nhau, tất cả đều có kiểu hiển thị bên ngoài là `block`.

- Một đoạn văn có đường viền được thêm vào trong CSS. Trình duyệt hiển thị đây là hộp khối. Đoạn văn bắt đầu trên một dòng mới và mở rộng theo chiều ngang để lấp đầy toàn bộ chiều rộng có sẵn.

- Danh sách, được đặt bằng `display: flex`. Điều này tạo ra bố cục flex cho các phần tử con của vùng chứa, là các mục flex được đặt mặc định trong một hàng. Chính danh sách là một hộp khối và — giống như đoạn văn — mở rộng ra chiều rộng vùng chứa đầy đủ và xuống dòng mới.

- Đoạn văn cấp khối, bên trong có hai phần tử `<span>`. Các phần tử này thường là `inline`, tuy nhiên, một trong các phần tử có lớp `block` và được đặt thành `display: block`. Kết quả là, từ đó bắt đầu trên một dòng mới trải dài toàn bộ chiều rộng của cha nó.

```html live-sample___block
<p>I am a paragraph. A short one.</p>
<ul>
  <li>Item One</li>
  <li>Item Two</li>
  <li>Item Three</li>
</ul>
<p>
  I am another paragraph. Some of the <span class="block">words</span> have been
  wrapped in a <span>span element</span>.
</p>
```

```css live-sample___block
body {
  font-family: sans-serif;
}
p,
ul {
  border: 2px solid rebeccapurple;
  padding: 0.2em;
}

.block,
li {
  border: 2px solid blue;
  padding: 0.2em;
}

ul {
  display: flex;
  list-style: none;
}

.block {
  display: block;
}
```

{{EmbedLiveSample("block", "", "220px")}}

Trong ví dụ tiếp theo, chúng ta có thể thấy cách các phần tử `inline` hoạt động.

- Các phần tử `<span>` trong đoạn đầu tiên là inline theo mặc định và do đó không buộc ngắt dòng.

- Phần tử `<ul>` được đặt thành `display: inline-flex` tạo ra hộp inline chứa một số mục flex.

- Hai đoạn văn đều được đặt thành `display: inline`. Container flex nội tuyến và các đoạn đều chạy cùng nhau trên một dòng thay vì xuống dòng mới (như chúng sẽ làm nếu chúng hiển thị là các phần tử cấp khối).

Để chuyển đổi giữa các chế độ hiển thị, bạn có thể thay đổi `display: inline` thành `display: block` hoặc `display: inline-flex` thành `display: flex`:

```html live-sample___inline
<p>
  I am a paragraph. Some of the
  <span>words</span> have been wrapped in a <span>span element</span>.
</p>
<ul>
  <li>Item One</li>
  <li>Item Two</li>
  <li>Item Three</li>
</ul>
<p class="inline">I am a paragraph. A short one.</p>
<p class="inline">I am another paragraph. Also a short one.</p>
```

```css live-sample___inline
body {
  font-family: sans-serif;
}
p,
ul {
  border: 2px solid rebeccapurple;
}

span,
li {
  border: 2px solid blue;
}

ul {
  display: inline-flex;
  list-style: none;
  padding: 0;
}

.inline {
  display: inline;
}
```

{{EmbedLiveSample("inline")}}

Điều quan trọng cần nhớ hiện tại là: Thay đổi giá trị của thuộc tính `display` có thể thay đổi kiểu hiển thị bên ngoài của hộp là khối hay nội tuyến. Điều này thay đổi cách nó hiển thị cùng với các phần tử khác trong bố cục.

## Mô hình hộp CSS là gì?

Mô hình hộp CSS tổng thể áp dụng cho các hộp khối và xác định cách các phần khác nhau của hộp — lề ngoài, đường viền, phần đệm và nội dung — hoạt động cùng nhau để tạo ra hộp bạn có thể nhìn thấy trên trang. Các hộp nội tuyến chỉ sử dụng _một số_ hành vi được xác định trong mô hình hộp.

Để tăng thêm độ phức tạp, có mô hình hộp tiêu chuẩn và mô hình hộp thay thế. Theo mặc định, các trình duyệt sử dụng mô hình hộp tiêu chuẩn.

### Các phần của hộp

Tạo nên hộp khối trong CSS, chúng ta có:

- **Hộp nội dung**: Khu vực nội dung của bạn được hiển thị; kích thước bằng các thuộc tính như {{cssxref("width")}} và {{cssxref("height")}}.
- **Hộp phần đệm**: Phần đệm bao quanh nội dung như khoảng trắng; kích thước bằng {{cssxref("padding")}} và các thuộc tính liên quan.
- **Hộp đường viền**: Hộp đường viền bao bọc nội dung và bất kỳ phần đệm nào; kích thước bằng {{cssxref("border")}} và các thuộc tính liên quan.
- **Hộp lề ngoài**: Lề ngoài là lớp ngoài cùng, bao bọc nội dung, phần đệm và đường viền như khoảng trắng giữa hộp này và các phần tử khác; kích thước bằng {{cssxref("margin")}} và các thuộc tính liên quan.

Sơ đồ dưới đây hiển thị các lớp này:

![Sơ đồ mô hình hộp](box-model.png)

### Mô hình hộp CSS tiêu chuẩn

Trong mô hình hộp tiêu chuẩn, nếu bạn đặt các giá trị thuộc tính `width` và `height` trên hộp, các giá trị này xác định `width` và `height` của _hộp nội dung_. Bất kỳ phần đệm và đường viền nào sau đó được thêm vào các kích thước đó để có kích thước tổng mà hộp chiếm dụng (xem hình ảnh bên dưới).

Nếu chúng ta giả sử rằng một hộp có CSS sau:

```css
.box {
  width: 350px;
  height: 150px;
  margin: 10px;
  padding: 25px;
  border: 5px solid black;
}
```

Không gian _thực sự_ được hộp chiếm dụng sẽ rộng `410px` (350 + 25 + 25 + 5 + 5) và cao `210px` (150 + 25 + 25 + 5 + 5).

![Hiển thị kích thước hộp khi sử dụng mô hình hộp tiêu chuẩn.](standard-box-model.png)

> [!NOTE]
> Lề ngoài không được tính vào kích thước thực sự của hộp — tất nhiên, nó ảnh hưởng đến tổng không gian mà hộp sẽ chiếm dụng trên trang, nhưng chỉ là không gian bên ngoài hộp. Khu vực của hộp dừng lại ở đường viền — nó không mở rộng vào lề ngoài.

### Mô hình hộp CSS thay thế

Trong mô hình hộp thay thế, bất kỳ chiều rộng nào là chiều rộng của hộp hiển thị trên trang. Chiều rộng vùng nội dung là chiều rộng đó trừ chiều rộng của phần đệm và đường viền (xem hình ảnh bên dưới). Điều này tiện lợi vì không cần cộng đường viền và phần đệm để có kích thước thực sự của hộp.

Để bật mô hình thay thế cho một phần tử, đặt `box-sizing: border-box` trên nó:

```css
.box {
  box-sizing: border-box;
}
```

Nếu chúng ta giả sử hộp có CSS giống như trên:

```css
.box {
  width: 350px;
  height: 150px;
  margin: 10px;
  padding: 25px;
  border: 5px solid black;
}
```

Không gian _thực sự_ được hộp chiếm dụng bây giờ sẽ là `350px` theo hướng nội tuyến và `150px` theo hướng khối.

![Hiển thị kích thước hộp khi sử dụng mô hình hộp thay thế.](alternate-box-model.png)

Để sử dụng mô hình hộp thay thế cho tất cả các phần tử (đây là lựa chọn phổ biến trong số các nhà phát triển), đặt thuộc tính `box-sizing` trên phần tử `<html>` và đặt tất cả các phần tử khác để kế thừa giá trị đó:

```css
html {
  box-sizing: border-box;
}

*,
*::before,
*::after {
  box-sizing: inherit;
}
```

Để hiểu ý tưởng cơ bản, bạn có thể đọc [bài viết CSS Tricks về box-sizing](https://css-tricks.com/inheriting-box-sizing-probably-slightly-better-best-practice/).

## Thử nghiệm với các mô hình hộp

Trong ví dụ bên dưới, bạn có thể thấy hai hộp. Cả hai đều có lớp `.box`, cho chúng cùng `width`, `height`, `margin`, `border` và `padding`. Sự khác biệt duy nhất là hộp thứ hai được đặt để sử dụng mô hình hộp thay thế.
Bạn có thể thay đổi kích thước hộp thứ hai (bằng cách thêm CSS vào lớp `.alternate`) để khớp với hộp đầu tiên về chiều rộng và chiều cao không?

```html live-sample___box-models
<div class="box">I use the standard box model.</div>
<div class="box alternate">I use the alternate box model.</div>
```

```css live-sample___box-models
.box {
  border: 5px solid rebeccapurple;
  background-color: lightgray;
  padding: 40px;
  margin: 40px;
  width: 300px;
  height: 150px;
}

.alternate {
  box-sizing: border-box;
}
```

{{EmbedLiveSample("box-models", "", "400px")}}

> [!NOTE]
> Bạn có thể tìm giải pháp cho tác vụ này [trong repo css-examples của chúng tôi](https://github.com/mdn/css-examples/blob/main/learn/solutions.md#the-box-model).

### Sử dụng DevTools của trình duyệt để xem mô hình hộp

[Công cụ dành cho nhà phát triển](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools) của trình duyệt có thể làm cho việc hiểu mô hình hộp trở nên dễ dàng hơn nhiều — chúng có thể hiển thị cho bạn kích thước của phần tử cùng với lề ngoài, phần đệm và đường viền của nó. Kiểm tra một phần tử theo cách này là một cách tuyệt vời để tìm hiểu xem hộp của bạn có thực sự là kích thước bạn nghĩ không!

![Kiểm tra mô hình hộp của một phần tử bằng Firefox DevTools](box-model-devtools.png)

## Lề ngoài, phần đệm và đường viền

Bạn đã thấy các thuộc tính {{cssxref("margin")}}, {{cssxref("padding")}} và {{cssxref("border")}} hoạt động trong ví dụ trên. Các thuộc tính được sử dụng trong ví dụ đó là **viết tắt** và cho phép chúng ta đặt cả bốn cạnh của hộp cùng một lúc. Các viết tắt này cũng có các thuộc tính dạng dài tương đương, cho phép kiểm soát các cạnh khác nhau của hộp riêng lẻ.

Hãy khám phá các thuộc tính này chi tiết hơn.

### Lề ngoài

Lề ngoài là khoảng trống vô hình xung quanh hộp của bạn. Nó đẩy các phần tử khác ra khỏi hộp. Lề ngoài có thể có giá trị dương hoặc âm. Đặt lề ngoài âm trên một cạnh của hộp có thể khiến nó chồng lên các thứ khác trên trang. Dù bạn đang sử dụng mô hình hộp tiêu chuẩn hay thay thế, lề ngoài luôn được thêm vào sau khi kích thước của hộp hiển thị đã được tính.

Chúng ta có thể kiểm soát tất cả lề ngoài của một phần tử cùng một lúc bằng thuộc tính {{cssxref("margin")}}, hoặc từng cạnh riêng lẻ bằng các thuộc tính dạng dài tương đương:

- {{cssxref("margin-top")}}
- {{cssxref("margin-right")}}
- {{cssxref("margin-bottom")}}
- {{cssxref("margin-left")}}

#### Thử nghiệm với lề ngoài

Chỉnh sửa ví dụ bên dưới. Hãy thử thay đổi các giá trị lề ngoài để xem hộp bị đẩy xung quanh như thế nào do lề ngoài tạo ra hoặc loại bỏ khoảng cách (nếu là lề ngoài âm) giữa phần tử này và phần tử chứa.

```html live-sample___margin
<div class="container">
  <div class="box">Change my margin.</div>
</div>
```

```css live-sample___margin
.container {
  border: 5px solid blue;
  margin: 40px;
}

.box {
  border: 5px solid rebeccapurple;
  background-color: lightgray;
  padding: 10px;
  height: 100px;
  /* try changing the margin properties: */
  margin-top: -40px;
  margin-right: 30px;
  margin-bottom: 40px;
  margin-left: 4em;
}
```

{{EmbedLiveSample("margin", "", "220px")}}

#### Gộp lề ngoài

Tùy thuộc vào việc hai phần tử có lề ngoài tiếp xúc nhau có lề ngoài dương hay âm, kết quả sẽ khác nhau:

- Hai lề ngoài dương sẽ kết hợp thành một lề ngoài. Kích thước của nó sẽ bằng lề ngoài riêng lẻ lớn nhất.
- Hai lề ngoài âm sẽ gộp lại và giá trị nhỏ nhất (xa nhất từ số không) sẽ được sử dụng.
- Nếu một lề ngoài là âm, giá trị của nó sẽ bị _trừ_ đi từ tổng.

Trong ví dụ bên dưới, chúng ta có hai đoạn văn. Đoạn trên có `margin-bottom` là 50 pixel, đoạn kia có `margin-top` là 30 pixel. Các lề ngoài đã gộp lại với nhau nên lề ngoài thực sự giữa các hộp là 50 pixel và không phải tổng của hai lề ngoài.

Bạn có thể kiểm tra điều này bằng cách đặt `margin-top` của đoạn hai thành `0`. Lề ngoài hiển thị giữa hai đoạn sẽ không thay đổi — nó giữ nguyên 50 pixel được đặt trong `margin-bottom` của đoạn một. Nếu bạn đặt nó thành `-10px`, bạn sẽ thấy rằng lề ngoài tổng thể trở thành `40px` — nó trừ đi từ `50px`.

```html live-sample___margin-collapse
<div class="container">
  <p class="one">I am paragraph one.</p>
  <p class="two">I am paragraph two.</p>
</div>
```

```css live-sample___margin-collapse
.container {
  border: 5px solid blue;
  margin: 40px;
}

p {
  border: 5px solid rebeccapurple;
  background-color: lightgray;
  padding: 10px;
}
.one {
  margin-bottom: 50px;
}

.two {
  margin-top: 30px;
}
```

{{EmbedLiveSample("margin-collapse", "", "280px")}}

Một số quy tắc quyết định khi nào lề ngoài có và không gộp lại. Để biết thêm thông tin, hãy xem trang chi tiết về [nắm vững gộp lề ngoài](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing). Điều quan trọng cần nhớ là gộp lề ngoài là điều xảy ra nếu bạn đang tạo khoảng cách bằng lề ngoài và không nhận được khoảng cách bạn mong đợi.

> [!NOTE]
> [Learn margins via flags](https://scrimba.com/frontend-path-c0j/~01e?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> từ Scrimba là bài học tương tác cung cấp một số thực hành hữu ích với lề ngoài.

### Đường viền

Đường viền được vẽ giữa lề ngoài và phần đệm của hộp. Nếu bạn đang sử dụng mô hình hộp tiêu chuẩn, kích thước của đường viền được thêm vào `width` và `height` của hộp nội dung. Nếu bạn đang sử dụng mô hình hộp thay thế, thì đường viền càng lớn, hộp nội dung càng nhỏ, vì đường viền chiếm một phần `width` và `height` có sẵn của hộp phần tử.

Để tạo kiểu đường viền, có rất nhiều thuộc tính — có bốn đường viền, và mỗi đường viền có kiểu, chiều rộng và màu mà chúng ta có thể muốn thao tác.

Bạn có thể đặt chiều rộng, kiểu hoặc màu của cả bốn đường viền cùng một lúc bằng thuộc tính {{cssxref("border")}}.

Để đặt các thuộc tính của từng cạnh riêng lẻ, sử dụng:

- {{cssxref("border-top")}}
- {{cssxref("border-right")}}
- {{cssxref("border-bottom")}}
- {{cssxref("border-left")}}

Để đặt chiều rộng, kiểu hoặc màu của tất cả các cạnh, sử dụng:

- {{cssxref("border-width")}}
- {{cssxref("border-style")}}
- {{cssxref("border-color")}}

Để đặt chiều rộng, kiểu hoặc màu của một cạnh duy nhất, sử dụng một trong các thuộc tính dạng dài chi tiết hơn:

- {{cssxref("border-top-width")}}
- {{cssxref("border-top-style")}}
- {{cssxref("border-top-color")}}
- {{cssxref("border-right-width")}}
- {{cssxref("border-right-style")}}
- {{cssxref("border-right-color")}}
- {{cssxref("border-bottom-width")}}
- {{cssxref("border-bottom-style")}}
- {{cssxref("border-bottom-color")}}
- {{cssxref("border-left-width")}}
- {{cssxref("border-left-style")}}
- {{cssxref("border-left-color")}}

#### Thử nghiệm với đường viền

Trong ví dụ bên dưới, chúng ta đã sử dụng nhiều viết tắt và dạng dài khác nhau để tạo đường viền. Chỉnh sửa các thuộc tính khác nhau để kiểm tra bạn hiểu cách chúng hoạt động. Các trang MDN cho các thuộc tính đường viền cung cấp cho bạn thông tin về các kiểu đường viền khác nhau có sẵn.

```html live-sample___border
<div class="container">
  <div class="box">Change my borders.</div>
</div>
```

```css live-sample___border
body {
  font-family: sans-serif;
}
.container {
  margin: 40px;
  padding: 20px;
  border-top: 5px dotted green;
  border-right: 1px solid black;
  border-bottom: 20px double rgb(23 45 145);
}

.box {
  padding: 20px;
  background-color: lightgray;
  border: 1px solid #333333;
  border-top-style: dotted;
  border-right-width: 20px;
  border-bottom-color: hotpink;
}
```

{{EmbedLiveSample("border", "", "220px")}}

### Phần đệm

Phần đệm nằm giữa đường viền và vùng nội dung và được sử dụng để đẩy nội dung ra khỏi đường viền. Không giống như lề ngoài, bạn không thể có phần đệm âm. Bất kỳ nền nào được áp dụng cho phần tử của bạn sẽ hiển thị phía sau phần đệm.

Thuộc tính {{cssxref("padding")}} kiểm soát phần đệm trên tất cả các cạnh của phần tử. Để kiểm soát từng cạnh riêng lẻ, sử dụng các thuộc tính dạng dài này:

- {{cssxref("padding-top")}}
- {{cssxref("padding-right")}}
- {{cssxref("padding-bottom")}}
- {{cssxref("padding-left")}}

#### Thử nghiệm với phần đệm

Trong ví dụ bên dưới, hãy chỉnh sửa các giá trị phần đệm trên lớp `.box` và xem cách điều này thay đổi vị trí bắt đầu văn bản so với hộp. Bạn cũng có thể thay đổi phần đệm trên lớp `.container` để tạo khoảng cách giữa vùng chứa và hộp. Bạn có thể thay đổi phần đệm trên bất kỳ phần tử nào để tạo khoảng cách giữa đường viền của nó và bất cứ thứ gì bên trong phần tử.

```html live-sample___padding
<div class="container">
  <div class="box">Change my padding.</div>
</div>
```

```css live-sample___padding
body {
  font-family: sans-serif;
}
.box {
  border: 5px solid rebeccapurple;
  background-color: lightgray;
  padding-top: 0;
  padding-right: 30px;
  padding-bottom: 40px;
  padding-left: 4em;
}

.container {
  border: 5px solid blue;
  margin: 40px;
  padding: 20px;
}
```

{{EmbedLiveSample("padding", "", "220px")}}

## Mô hình hộp và hộp nội tuyến

Tất cả những điều trên áp dụng hoàn toàn cho các hộp khối. Một số thuộc tính cũng có thể áp dụng cho các hộp nội tuyến, chẳng hạn như những hộp được tạo bởi phần tử `<span>`.

Trong ví dụ bên dưới, chúng ta có một `<span>` bên trong một đoạn văn. Chúng ta đã áp dụng `width`, `height`, `margin`, `border` và `padding` cho nó. Bạn có thể thấy rằng chiều rộng, chiều cao và lề ngoài trên và dưới không ảnh hưởng đến `<span>`. Phần đệm và đường viền trên và dưới thay đổi kích thước hộp nội tuyến nhưng không ảnh hưởng đến vị trí của nội dung xung quanh. Thay vào đó, phần đệm và đường viền trên và dưới chồng lên các từ khác trong đoạn. Chỉ có phần đệm, lề ngoài và đường viền trái và phải ảnh hưởng đến vị trí của văn bản xung quanh `<span>`.

```html live-sample___inline-box-model
<p>
  I am a paragraph and this is a <span>span</span> inside that paragraph. A span
  is an inline element and so does not respect width and height.
</p>
```

```css live-sample___inline-box-model
body {
  font-family: sans-serif;
}
p {
  border: 2px solid rebeccapurple;
  width: 200px;
}
span {
  margin: 20px 30px;
  padding: 10px 20px;
  width: 80px;
  height: 150px;
  background-color: lightblue;
  border: solid blue;
  border-width: 7px 1px;
}
```

{{EmbedLiveSample("inline-box-model")}}

## Sử dụng display: inline-block

`display: inline-block` là giá trị đặc biệt của `display`, cung cấp nền tảng trung gian giữa `inline` và `block`. Sử dụng nó nếu bạn không muốn mục xuống dòng mới, nhưng muốn nó tuân theo `width` và `height` và tránh chồng chéo đã thấy ở trên.

Một phần tử với `display: inline-block` thực hiện một tập hợp con những thứ khối mà chúng ta đã biết:

- Các thuộc tính `width` và `height` được tuân theo.
- `padding`, `margin` và `border` sẽ khiến các phần tử khác bị đẩy ra khỏi hộp.

Tuy nhiên, nó không xuống dòng mới, và sẽ chỉ lớn hơn nội dung của nó nếu bạn thêm rõ ràng các thuộc tính `width` và `height`.

### Thử nghiệm với inline-block

Trong ví dụ tiếp theo, chúng ta đã thêm `display: inline-block` vào phần tử `<span>`. Hãy thử thay đổi thành `display: block` hoặc xóa dòng hoàn toàn để thấy sự khác biệt trong các mô hình hiển thị:

```html live-sample___inline-block
<p>
  I am a paragraph and this is a <span>span</span> inside that paragraph. A span
  is an inline element and so does not respect width and height.
</p>
```

```css live-sample___inline-block
body {
  font-family: sans-serif;
}
p {
  border: 2px solid rebeccapurple;
  width: 300px;
}

span {
  margin: 20px;
  padding: 20px;
  width: 80px;
  height: 50px;
  background-color: lightblue;
  border: 2px solid blue;
  display: inline-block;
}
```

{{EmbedLiveSample("inline-block", "", "240px")}}

Nơi điều này có thể hữu ích là khi bạn muốn cung cấp cho liên kết khu vực nhấp lớn hơn bằng cách thêm `padding`. `<a>` là phần tử nội tuyến giống như `<span>`; bạn có thể sử dụng `display: inline-block` để cho phép đặt phần đệm trên nó, giúp người dùng dễ dàng nhấp vào liên kết hơn.

Bạn thấy điều này khá thường xuyên trong thanh điều hướng. Thanh điều hướng bên dưới được hiển thị trong một hàng bằng flexbox và chúng ta đã thêm phần đệm vào phần tử `<a>` vì chúng ta muốn có thể thay đổi `background-color` khi `<a>` được di chuột qua. Phần đệm xuất hiện chồng lên đường viền trên phần tử `<ul>`. Điều này là vì `<a>` là phần tử nội tuyến.

Thêm `display: inline-block;` vào quy tắc với bộ chọn `.links-list a`, và bạn sẽ thấy cách nó sửa vấn đề này bằng cách khiến phần đệm được tuân theo bởi các phần tử khác:

```html live-sample___inline-block-nav
<nav>
  <ul class="links-list">
    <li><a href="">Link one</a></li>
    <li><a href="">Link two</a></li>
    <li><a href="">Link three</a></li>
  </ul>
</nav>
```

```css live-sample___inline-block-nav
ul {
  font-family: sans-serif;
  display: flex;
  list-style: none;
  border: 1px solid black;
}

li {
  margin: 5px;
}

.links-list a {
  background-color: rgb(179 57 81);
  color: white;
  text-decoration: none;
  padding: 1em 2em;
}

.links-list a:hover {
  background-color: rgb(66 28 40);
  color: white;
}
```

{{EmbedLiveSample("inline-block-nav")}}

## Tóm tắt

Đó là hầu hết những gì bạn cần hiểu về mô hình hộp. Bạn có thể muốn quay lại bài học này trong tương lai nếu bạn thấy mình bị nhầm lẫn về kích thước các hộp trong bố cục.

Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ hiểu và ghi nhớ thông tin chúng ta đã cung cấp về mô hình hộp CSS.

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Selectors", "Learn_web_development/Core/Styling_basics/Test_your_skills/Box_model", "Learn_web_development/Core/Styling_basics")}}
