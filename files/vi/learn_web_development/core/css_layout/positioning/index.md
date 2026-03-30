---
title: Định vị (Positioning)
slug: Learn_web_development/Core/CSS_layout/Positioning
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Test_your_skills/Floats", "Learn_web_development/Core/CSS_layout/Test_your_skills/Position", "Learn_web_development/Core/CSS_layout")}}

Định vị cho phép bạn đưa các phần tử ra khỏi luồng tài liệu thông thường và làm cho chúng hoạt động khác đi, ví dụ: nằm chồng lên nhau hoặc luôn ở cùng một vị trí bên trong khung nhìn trình duyệt. Bài viết này giải thích các giá trị {{cssxref("position")}} khác nhau và cách sử dụng chúng.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Cấu trúc nội dung với HTML</a
        >,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals">Tạo kiểu văn bản và phông chữ cơ bản</a>,
        quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/CSS_layout/Introduction">các khái niệm cơ bản về bố cục CSS</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Định vị <code>static</code> là cách mặc định các phần tử được định vị trên trang.</li>
          <li>Các phần tử được định vị tương đối vẫn ở trong luồng thông thường, nhưng định vị tuyệt đối (và cố định/dính) đưa các phần tử hoàn toàn ra khỏi luồng thông thường để nằm trên một lớp riêng.</li>
          <li>Vị trí bố cục cuối cùng có thể được sửa đổi bằng các thuộc tính <code>top</code>, <code>bottom</code>, <code>left</code> và <code>right</code>, nhưng chúng có các hiệu ứng khác nhau tùy thuộc vào giá trị <code>position</code> được đặt.</li>
          <li>Đặt ngữ cảnh định vị của phần tử được định vị bằng cách định vị phần tử tổ tiên.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

Chúng ta muốn bạn thực hiện các bài tập sau trên máy tính cục bộ của mình. Nếu có thể, hãy lấy một bản sao của [`0_basic-flow.html`](https://mdn.github.io/learning-area/css/css-layout/positioning/0_basic-flow.html) từ kho GitHub của chúng ta ([mã nguồn ở đây](https://github.com/mdn/learning-area/blob/main/css/css-layout/positioning/0_basic-flow.html)) và sử dụng nó làm điểm khởi đầu.

## Giới thiệu về định vị

Định vị cho phép chúng ta tạo ra các kết quả thú vị bằng cách ghi đè luồng tài liệu thông thường. Nếu bạn muốn thay đổi một chút vị trí của một số hộp so với vị trí luồng mặc định của chúng để tạo cảm giác khác lạ, độc đáo? Định vị là công cụ của bạn. Hoặc nếu bạn muốn tạo một phần tử giao diện người dùng nổi lên trên các phần khác của trang và/hoặc luôn nằm ở cùng một vị trí bên trong cửa sổ trình duyệt bất kể trang có cuộn bao nhiêu? Định vị làm cho công việc bố cục như vậy trở nên khả thi.

Có một số loại định vị khác nhau mà bạn có thể áp dụng cho các phần tử HTML. Để kích hoạt một loại định vị cụ thể trên một phần tử, chúng ta sử dụng thuộc tính {{cssxref("position")}}.

## Định vị tĩnh

Định vị tĩnh là mặc định mà mọi phần tử nhận được. Nó chỉ có nghĩa là "đặt phần tử vào vị trí mặc định của nó trong luồng thông thường — không có gì đặc biệt ở đây."

Để xem điều này (và thiết lập ví dụ của bạn cho các phần tiếp theo), trước tiên hãy thêm `class` là `positioned` vào {{htmlelement("p")}} thứ hai trong HTML:

```html
<p class="positioned">…</p>
```

Bây giờ hãy thêm quy tắc sau vào cuối CSS của bạn:

```css
.positioned {
  position: static;
  background: yellow;
}
```

Nếu bạn lưu và làm mới, bạn sẽ không thấy sự khác biệt nào cả, ngoại trừ màu nền được cập nhật của đoạn văn thứ 2. Điều này ổn — như chúng ta đã nói trước đó, định vị tĩnh là hành vi mặc định!

> [!NOTE]
> Bạn có thể xem ví dụ tại điểm này trực tiếp tại [`1_static-positioning.html`](https://mdn.github.io/learning-area/css/css-layout/positioning/1_static-positioning.html) ([xem mã nguồn](https://github.com/mdn/learning-area/blob/main/css/css-layout/positioning/1_static-positioning.html)).

## Định vị tương đối

Định vị tương đối là loại định vị đầu tiên chúng ta sẽ xem xét. Điều này rất giống với định vị tĩnh, ngoại trừ khi phần tử được định vị đã lấy vị trí của nó trong luồng thông thường, bạn có thể sửa đổi vị trí cuối cùng của nó, bao gồm cả việc làm nó chồng lên các phần tử khác trên trang. Hãy tiếp tục và cập nhật khai báo `position` trong mã của bạn:

```css
position: relative;
```

Nếu bạn lưu và làm mới tại giai đoạn này, bạn sẽ không thấy sự thay đổi nào trong kết quả. Vậy làm thế nào để bạn sửa đổi vị trí của phần tử? Bạn cần sử dụng các thuộc tính {{cssxref("top")}}, {{cssxref("bottom")}}, {{cssxref("left")}} và {{cssxref("right")}}, mà chúng ta sẽ giải thích trong phần tiếp theo.

### Giới thiệu về top, bottom, left và right

{{cssxref("top")}}, {{cssxref("bottom")}}, {{cssxref("left")}} và {{cssxref("right")}} được sử dụng cùng với {{cssxref("position")}} để xác định chính xác nơi di chuyển phần tử được định vị đến. Để thử điều này, hãy thêm các khai báo sau vào quy tắc `.positioned` trong CSS của bạn:

```css
top: 30px;
left: 30px;
```

> [!NOTE]
> Các giá trị của các thuộc tính này có thể sử dụng bất kỳ [đơn vị](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units) nào mà bạn có thể mong đợi: pixel, mm, rem, %, v.v.

Nếu bạn lưu và làm mới bây giờ, bạn sẽ nhận được kết quả như sau:

```html hidden
<h1>Relative positioning</h1>

<p>
  I am a basic block level element. My adjacent block level elements sit on new
  lines below me.
</p>

<p class="positioned">
  By default we span 100% of the width of our parent element, and we are as tall
  as our child content. Our total width and height is our content + padding +
  border width/height.
</p>

<p>
  We are separated by our margins. Because of margin collapsing, we are
  separated by the width of one of our margins, not both.
</p>

<p>
  Inline elements <span>like this one</span> and <span>this one</span> sit on
  the same line as one another, and adjacent text nodes, if there is space on
  the same line. Overflowing inline elements
  <span>wrap onto a new line if possible — like this one containing text</span>,
  or just go on to a new line if not, much like this image will do:
  <img
    src="https://mdn.github.io/shared-assets/images/examples/long.jpg"
    alt="snippet of cloth" />
</p>
```

```css hidden
body {
  width: 500px;
  margin: 0 auto;
}

p {
  background: aqua;
  border: 3px solid blue;
  padding: 10px;
  margin: 10px;
}

span {
  background: red;
  border: 1px solid black;
}

.positioned {
  position: relative;
  background: yellow;
  top: 30px;
  left: 30px;
}
```

{{ EmbedLiveSample('Introducing_top_bottom_left_and_right', '100%', 500) }}

Thú vị đấy, phải không? Được rồi, vậy có lẽ đây không phải là điều bạn mong đợi. Tại sao nó di chuyển xuống dưới và sang phải nếu chúng ta chỉ định _top_ và _left_? Điều này có vẻ ngược lại. Bạn cần nghĩ đến nó như thể có một lực vô hình đẩy cạnh được chỉ định của hộp được định vị, di chuyển nó theo hướng ngược lại. Ví dụ: nếu bạn chỉ định `top: 30px;`, đó như thể một lực đẩy lên đỉnh hộp, khiến nó di chuyển xuống 30px.

> [!NOTE]
> Bạn có thể xem ví dụ tại điểm này trực tiếp tại [`2_relative-positioning.html`](https://mdn.github.io/learning-area/css/css-layout/positioning/2_relative-positioning.html) ([xem mã nguồn](https://github.com/mdn/learning-area/blob/main/css/css-layout/positioning/2_relative-positioning.html)).

## Định vị tuyệt đối

Định vị tuyệt đối mang lại kết quả rất khác.

### Đặt position: absolute

Hãy thử thay đổi khai báo position trong mã của bạn như sau:

```css
position: absolute;
```

Nếu bạn lưu và làm mới bây giờ, bạn sẽ thấy thứ gì đó như sau:

```html hidden
<h1>Absolute positioning</h1>

<p>
  I am a basic block level element. My adjacent block level elements sit on new
  lines below me.
</p>

<p class="positioned">
  By default we span 100% of the width of our parent element, and we are as tall
  as our child content. Our total width and height is our content + padding +
  border width/height.
</p>

<p>
  We are separated by our margins. Because of margin collapsing, we are
  separated by the width of one of our margins, not both.
</p>

<p>
  inline elements <span>like this one</span> and <span>this one</span> sit on
  the same line as one another, and adjacent text nodes, if there is space on
  the same line. Overflowing inline elements
  <span>wrap onto a new line if possible — like this one containing text</span>,
  or just go on to a new line if not, much like this image will do:
  <img
    src="https://mdn.github.io/shared-assets/images/examples/long.jpg"
    alt="snippet of cloth" />
</p>
```

```css hidden
body {
  width: 500px;
  margin: 0 auto;
}

p {
  background: aqua;
  border: 3px solid blue;
  padding: 10px;
  margin: 10px;
}

span {
  background: red;
  border: 1px solid black;
}

.positioned {
  position: absolute;
  background: yellow;
  top: 30px;
  left: 30px;
}
```

{{ EmbedLiveSample('Setting_position_absolute', '100%', 450) }}

Trước tiên, lưu ý rằng khoảng trống mà phần tử được định vị nên có trong luồng tài liệu không còn ở đó nữa — các phần tử thứ nhất và thứ ba đã khép lại như thể nó không còn tồn tại nữa! Thực ra, điều này đúng theo một nghĩa nào đó. Một phần tử được định vị tuyệt đối không còn tồn tại trong luồng tài liệu thông thường. Thay vào đó, nó nằm trên lớp riêng của nó tách biệt với mọi thứ khác. Điều này rất hữu ích: nó có nghĩa là chúng ta có thể tạo các tính năng giao diện người dùng cô lập không ảnh hưởng đến bố cục của các phần tử khác trên trang. Ví dụ: hộp thông tin popup, menu điều khiển, bảng cuộn, các tính năng giao diện người dùng có thể kéo và thả ở bất kỳ đâu trên trang, v.v.

Thứ hai, chú ý rằng vị trí của phần tử đã thay đổi. Điều này là vì {{cssxref("top")}}, {{cssxref("bottom")}}, {{cssxref("left")}} và {{cssxref("right")}} hoạt động theo cách khác với định vị tuyệt đối. Thay vì định vị phần tử dựa trên vị trí tương đối của nó trong luồng tài liệu thông thường, chúng xác định khoảng cách phần tử nên cách mỗi cạnh của phần tử chứa nó. Trong trường hợp này, chúng ta đang nói rằng phần tử được định vị tuyệt đối nên nằm cách 30px từ đỉnh của **phần tử chứa** (**khối chứa ban đầu**, trong trường hợp này, xem bên dưới) và 30px từ bên trái.

> [!NOTE]
> Bạn có thể sử dụng {{cssxref("top")}}, {{cssxref("bottom")}}, {{cssxref("left")}} và {{cssxref("right")}} để thay đổi kích thước các phần tử nếu cần. Hãy thử đặt `top: 0; bottom: 0; left: 0; right: 0;` và `margin: 0;` trên các phần tử được định vị của bạn và xem điều gì xảy ra! Sau đó hãy đặt lại...

> [!NOTE]
> Đúng, lề vẫn ảnh hưởng đến các phần tử được định vị. Tuy nhiên, sụp lề thì không.

> [!NOTE]
> Bạn có thể xem ví dụ tại điểm này trực tiếp tại [`3_absolute-positioning.html`](https://mdn.github.io/learning-area/css/css-layout/positioning/3_absolute-positioning.html) ([xem mã nguồn](https://github.com/mdn/learning-area/blob/main/css/css-layout/positioning/3_absolute-positioning.html)).

### Ngữ cảnh định vị

Phần tử nào là "phần tử chứa" của phần tử được định vị tuyệt đối? Điều này phụ thuộc rất nhiều vào giá trị thuộc tính `position` của các phần tử tổ tiên của phần tử được định vị.

Nếu không có phần tử tổ tiên nào có thuộc tính position được xác định rõ ràng, thì theo mặc định tất cả các phần tử tổ tiên sẽ có vị trí tĩnh. Kết quả là phần tử được định vị tuyệt đối sẽ được chứa trong **khối chứa ban đầu**. Khối chứa ban đầu có kích thước của khung nhìn và cũng là khối chứa phần tử {{htmlelement("html")}}. Nói cách khác, phần tử được định vị tuyệt đối sẽ được hiển thị bên ngoài phần tử {{htmlelement("html")}} và được định vị liên quan đến khung nhìn ban đầu.

Phần tử được định vị được lồng bên trong {{htmlelement("body")}} trong nguồn HTML, nhưng trong bố cục cuối cùng nó cách 30px từ đỉnh và cạnh trái của trang. Chúng ta có thể thay đổi **ngữ cảnh định vị**, tức là phần tử mà phần tử được định vị tuyệt đối được định vị liên quan đến. Điều này được thực hiện bằng cách đặt định vị trên một trong các phần tử tổ tiên: trên một trong các phần tử mà nó được lồng bên trong (bạn không thể định vị nó liên quan đến phần tử mà nó không được lồng bên trong). Để xem điều này, hãy thêm khai báo sau vào quy tắc `body` của bạn:

```css
position: relative;
```

Điều này sẽ cho kết quả sau:

```html hidden
<h1>Positioning context</h1>

<p>
  I am a basic block level element. My adjacent block level elements sit on new
  lines below me.
</p>

<p class="positioned">
  Now I'm absolutely positioned relative to the
  <code>&lt;body&gt;</code> element, not the <code>&lt;html&gt;</code> element!
</p>

<p>
  We are separated by our margins. Because of margin collapsing, we are
  separated by the width of one of our margins, not both.
</p>

<p>
  inline elements <span>like this one</span> and <span>this one</span> sit on
  the same line as one another, and adjacent text nodes, if there is space on
  the same line. Overflowing inline elements
  <span>wrap onto a new line if possible — like this one containing text</span>,
  or just go on to a new line if not, much like this image will do:
  <img
    src="https://mdn.github.io/shared-assets/images/examples/long.jpg"
    alt="snippet of cloth" />
</p>
```

```css hidden
body {
  width: 500px;
  margin: 0 auto;
  position: relative;
}

p {
  background: aqua;
  border: 3px solid blue;
  padding: 10px;
  margin: 10px;
}

span {
  background: red;
  border: 1px solid black;
}

.positioned {
  position: absolute;
  background: yellow;
  top: 30px;
  left: 30px;
}
```

{{ EmbedLiveSample('Positioning_contexts', '100%', 420) }}

Phần tử được định vị bây giờ nằm liên quan đến phần tử {{htmlelement("body")}}.

> [!NOTE]
> Bạn có thể xem ví dụ tại điểm này trực tiếp tại [`4_positioning-context.html`](https://mdn.github.io/learning-area/css/css-layout/positioning/4_positioning-context.html) ([xem mã nguồn](https://github.com/mdn/learning-area/blob/main/css/css-layout/positioning/4_positioning-context.html)).

### Giới thiệu về z-index

Tất cả định vị tuyệt đối này thật thú vị, nhưng có một tính năng khác mà chúng ta chưa xem xét. Khi các phần tử bắt đầu chồng lên nhau, điều gì quyết định phần tử nào xuất hiện trên các phần tử khác và phần tử nào xuất hiện dưới các phần tử khác? Trong ví dụ chúng ta đã thấy cho đến nay, chúng ta chỉ có một phần tử được định vị trong ngữ cảnh định vị, và nó xuất hiện ở trên vì các phần tử được định vị thắng so với các phần tử không được định vị. Còn khi có nhiều hơn một phần tử?

Hãy thử thêm nội dung sau vào CSS của bạn để làm cho đoạn văn đầu tiên cũng được định vị tuyệt đối:

```css
p:nth-of-type(1) {
  position: absolute;
  background: lime;
  top: 10px;
  right: 30px;
}
```

Tại điểm này bạn sẽ thấy đoạn văn đầu tiên có màu xanh lá cây, được di chuyển ra khỏi luồng tài liệu và được định vị một chút phía trên vị trí ban đầu. Nó cũng được xếp chồng bên dưới đoạn văn `.positioned` gốc nơi hai đoạn chồng lên nhau. Điều này là vì đoạn văn `.positioned` là đoạn văn thứ hai theo thứ tự nguồn, và các phần tử được định vị ở sau trong thứ tự nguồn sẽ thắng so với các phần tử được định vị ở trước trong thứ tự nguồn.

Bạn có thể thay đổi thứ tự xếp chồng không? Có, bạn có thể, bằng cách sử dụng thuộc tính {{cssxref("z-index")}}. "z-index" là tham chiếu đến trục z. Bạn có thể nhớ từ các điểm trước trong khóa học rằng chúng ta đã thảo luận về các trang web sử dụng tọa độ nằm ngang (trục x) và dọc (trục y) để xác định vị trí cho các thứ như hình nền và độ lệch bóng đổ. Đối với các ngôn ngữ chạy từ trái sang phải, (0,0) ở góc trên bên trái của trang (hoặc phần tử), và các trục x và y chạy sang phải và xuống trang.

Các trang web cũng có trục z: một đường tưởng tượng chạy từ bề mặt màn hình của bạn về phía mặt bạn (hoặc bất cứ thứ gì bạn thích có trước màn hình). Các giá trị {{cssxref("z-index")}} ảnh hưởng đến vị trí các phần tử được định vị nằm trên trục đó; các giá trị dương di chuyển chúng lên trên trong ngăn xếp, các giá trị âm di chuyển chúng xuống trong ngăn xếp. Theo mặc định, tất cả các phần tử được định vị đều có `z-index` là `auto`, thực chất là 0.

Để thay đổi thứ tự xếp chồng, hãy thử thêm khai báo sau vào quy tắc `p:nth-of-type(1)` của bạn:

```css
z-index: 1;
```

Bây giờ bạn sẽ thấy đoạn văn màu xanh lá cây ở trên:

```html hidden
<h1>z-index</h1>

<p>
  I am a basic block level element. My adjacent block level elements sit on new
  lines below me.
</p>

<p class="positioned">
  Now I'm absolutely positioned relative to the
  <code>&lt;body&gt;</code> element, not the <code>&lt;html&gt;</code> element!
</p>

<p>
  We are separated by our margins. Because of margin collapsing, we are
  separated by the width of one of our margins, not both.
</p>

<p>
  inline elements <span>like this one</span> and <span>this one</span> sit on
  the same line as one another, and adjacent text nodes, if there is space on
  the same line. Overflowing inline elements
  <span>wrap onto a new line if possible — like this one containing text</span>,
  or just go on to a new line if not, much like this image will do:
  <img
    src="https://mdn.github.io/shared-assets/images/examples/long.jpg"
    alt="snippet of cloth" />
</p>
```

```css hidden
body {
  width: 500px;
  margin: 0 auto;
  position: relative;
}

p {
  background: aqua;
  border: 3px solid blue;
  padding: 10px;
  margin: 10px;
}

span {
  background: red;
  border: 1px solid black;
}

.positioned {
  position: absolute;
  background: yellow;
  top: 30px;
  left: 30px;
}

p:nth-of-type(1) {
  position: absolute;
  background: lime;
  top: 10px;
  right: 30px;
  z-index: 1;
}
```

{{ EmbedLiveSample('Introducing_z-index', '100%', 400) }}

Lưu ý rằng `z-index` chỉ chấp nhận các giá trị chỉ số không có đơn vị; bạn không thể chỉ định rằng bạn muốn một phần tử lên 23 pixel trên trục Z — nó không hoạt động như vậy. Các giá trị cao hơn sẽ đi trên các giá trị thấp hơn và tùy thuộc vào bạn những giá trị nào bạn sử dụng. Sử dụng các giá trị 2 hoặc 3 sẽ cho cùng hiệu ứng như các giá trị 300 hoặc 40000.

> [!NOTE]
> Bạn có thể xem ví dụ cho điều này trực tiếp tại [`5_z-index.html`](https://mdn.github.io/learning-area/css/css-layout/positioning/5_z-index.html) ([xem mã nguồn](https://github.com/mdn/learning-area/blob/main/css/css-layout/positioning/5_z-index.html)).

## Định vị cố định

Bây giờ hãy xem định vị cố định. Điều này hoạt động theo cách chính xác giống như định vị tuyệt đối, với một sự khác biệt quan trọng: trong khi định vị tuyệt đối cố định một phần tử tại chỗ liên quan đến phần tử tổ tiên được định vị gần nhất (khối chứa ban đầu nếu không có), **định vị cố định** cố định một phần tử tại chỗ liên quan đến phần nhìn thấy được của khung nhìn. Điều này có nghĩa là bạn có thể tạo các mục giao diện người dùng hữu ích được cố định tại chỗ, như menu điều hướng liên tục luôn hiển thị bất kể trang có cuộn bao nhiêu.

Hãy cùng tổng hợp một ví dụ đơn giản để cho thấy những gì chúng ta muốn nói. Đầu tiên, hãy xóa các quy tắc `p:nth-of-type(1)` và `.positioned` hiện có khỏi CSS của bạn.

Bây giờ hãy cập nhật quy tắc `body` để xóa khai báo `position: relative;` và thêm chiều cao cố định, như sau:

```css
body {
  width: 500px;
  height: 1400px;
  margin: 0 auto;
}
```

Bây giờ chúng ta sẽ đặt phần tử {{htmlelement("Heading_Elements", "&lt;h1>")}} `position: fixed;` và đặt nó ở đỉnh của khung nhìn. Thêm quy tắc sau vào CSS của bạn:

```css
h1 {
  position: fixed;
  top: 0;
  width: 500px;
  margin-top: 0;
  background: white;
  padding: 10px;
}
```

`top: 0;` là cần thiết để làm cho nó dính vào đỉnh màn hình. Chúng ta đặt cho tiêu đề cùng chiều rộng với cột nội dung rồi thêm nền trắng và một số đệm và lề để nội dung không bị hiển thị bên dưới nó.

Nếu bạn lưu và làm mới, bạn sẽ thấy một hiệu ứng thú vị là tiêu đề giữ cố định — nội dung xuất hiện cuộn lên và biến mất bên dưới nó. Nhưng chú ý rằng một phần nội dung ban đầu bị cắt dưới tiêu đề. Điều này là vì tiêu đề được định vị không còn xuất hiện trong luồng tài liệu, vì vậy phần còn lại của nội dung di chuyển lên đỉnh. Chúng ta có thể cải thiện điều này bằng cách di chuyển tất cả các đoạn văn xuống một chút. Chúng ta có thể làm điều này bằng cách đặt một lề trên ở đoạn văn đầu tiên. Hãy thêm điều này bây giờ:

```css
p:nth-of-type(1) {
  margin-top: 60px;
}
```

Bây giờ bạn sẽ thấy ví dụ đã hoàn thành:

```html hidden
<h1>Fixed positioning</h1>

<p>
  I am a basic block level element. My adjacent block level elements sit on new
  lines below me.
</p>

<p class="positioned">I'm not positioned any more.</p>

<p>
  We are separated by our margins. Because of margin collapsing, we are
  separated by the width of one of our margins, not both.
</p>

<p>
  Inline elements <span>like this one</span> and <span>this one</span> sit on
  the same line as one another, and adjacent text nodes, if there is space on
  the same line. Overflowing inline elements
  <span>wrap onto a new line if possible — like this one containing text</span>,
  or just go on to a new line if not, much like this image will do:
  <img
    src="https://mdn.github.io/shared-assets/images/examples/long.jpg"
    alt="snippet of cloth" />
</p>
```

```css hidden
body {
  width: 500px;
  height: 1400px;
  margin: 0 auto;
}

p {
  background: aqua;
  border: 3px solid blue;
  padding: 10px;
  margin: 10px;
}

span {
  background: red;
  border: 1px solid black;
}

h1 {
  position: fixed;
  top: 0px;
  width: 500px;
  background: white;
  padding: 10px;
}

p:nth-of-type(1) {
  margin-top: 60px;
}
```

{{ EmbedLiveSample('Fixed_positioning', '100%', 400) }}

> [!NOTE]
> Bạn có thể xem ví dụ cho điều này trực tiếp tại [`6_fixed-positioning.html`](https://mdn.github.io/learning-area/css/css-layout/positioning/6_fixed-positioning.html) ([xem mã nguồn](https://github.com/mdn/learning-area/blob/main/css/css-layout/positioning/6_fixed-positioning.html)).

## Định vị dính

Có một giá trị vị trí khác có sẵn gọi là `position: sticky`, mới hơn so với các giá trị khác. Về cơ bản đây là kết hợp giữa vị trí tương đối và cố định. Nó cho phép một phần tử được định vị hoạt động như được định vị tương đối cho đến khi nó cuộn đến một ngưỡng nhất định (ví dụ: 10px từ đỉnh của khung nhìn), sau đó nó trở nên cố định.

### Ví dụ cơ bản

Định vị dính có thể được sử dụng, ví dụ: để khiến thanh điều hướng cuộn cùng với trang cho đến một điểm nhất định rồi dính vào đỉnh trang.

```html hidden
<h1>Sticky positioning</h1>

<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus aliquam
  dolor, eu lacinia lorem placerat vulputate. Duis felis orci, pulvinar id metus
  ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at ultricies tellus
  laoreet sit amet. Sed auctor cursus massa at porta. Integer ligula ipsum,
  tristique sit amet orci vel, viverra egestas ligula. Curabitur vehicula tellus
  neque, ac ornare ex malesuada et. In vitae convallis lacus. Aliquam erat
  volutpat. Suspendisse ac imperdiet turpis. Aenean finibus sollicitudin eros
  pharetra congue. Duis ornare egestas augue ut luctus. Proin blandit quam nec
  lacus varius commodo et a urna. Ut id ornare felis, eget fermentum sapien.
</p>

<div class="positioned">Sticky</div>

<p>
  Nam vulputate diam nec tempor bibendum. Donec luctus augue eget malesuada
  ultrices. Phasellus turpis est, posuere sit amet dapibus ut, facilisis sed
  est. Nam id risus quis ante semper consectetur eget aliquam lorem. Vivamus
  tristique elit dolor, sed pretium metus suscipit vel. Mauris ultricies lectus
  sed lobortis finibus. Vivamus eu urna eget velit cursus viverra quis
  vestibulum sem. Aliquam tincidunt eget purus in interdum. Cum sociis natoque
  penatibus et magnis dis parturient montes, nascetur ridiculus mus.
</p>

<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus aliquam
  dolor, eu lacinia lorem placerat vulputate. Duis felis orci, pulvinar id metus
  ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at ultricies tellus
  laoreet sit amet. Sed auctor cursus massa at porta. Integer ligula ipsum,
  tristique sit amet orci vel, viverra egestas ligula. Curabitur vehicula tellus
  neque, ac ornare ex malesuada et. In vitae convallis lacus. Aliquam erat
  volutpat. Suspendisse ac imperdiet turpis. Aenean finibus sollicitudin eros
  pharetra congue. Duis ornare egestas augue ut luctus. Proin blandit quam nec
  lacus varius commodo et a urna. Ut id ornare felis, eget fermentum sapien.
</p>
```

```css hidden
body {
  width: 500px;
  margin: 0 auto;
}

.positioned {
  background: rgb(255 84 104 / 30%);
  border: 2px solid rgb(255 84 104);
  padding: 10px;
  margin: 10px;
  border-radius: 5px;
}
```

```css
.positioned {
  position: sticky;
  top: 30px;
  left: 30px;
}
```

{{ EmbedLiveSample('Basic_example', '100%', 200) }}

### Chỉ mục cuộn

Một cách sử dụng thú vị và phổ biến của `position: sticky` là tạo một trang chỉ mục cuộn nơi các tiêu đề khác nhau dính vào đỉnh trang khi chúng đến đó. Đánh dấu cho ví dụ như vậy có thể trông như thế này:

```html
<h1>Sticky positioning</h1>

<dl>
  <dt>A</dt>
  <dd>Apple</dd>
  <dd>Ant</dd>
  <dd>Altimeter</dd>
  <dd>Airplane</dd>
  <dt>B</dt>
  <dd>Bird</dd>
  <dd>Buzzard</dd>
  <dd>Bee</dd>
  <dd>Banana</dd>
  <dd>Beanstalk</dd>
  <dt>C</dt>
  <dd>Calculator</dd>
  <dd>Cane</dd>
  <dd>Camera</dd>
  <dd>Camel</dd>
  <dt>D</dt>
  <dd>Duck</dd>
  <dd>Dime</dd>
  <dd>Dipstick</dd>
  <dd>Drone</dd>
  <dt>E</dt>
  <dd>Egg</dd>
  <dd>Elephant</dd>
  <dd>Egret</dd>
</dl>
```

CSS có thể trông như sau. Trong luồng thông thường, các phần tử {{htmlelement("dt")}} sẽ cuộn cùng với nội dung. Khi chúng ta thêm `position: sticky` vào phần tử {{htmlelement("dt")}}, cùng với giá trị {{cssxref("top")}} là 0, các trình duyệt hỗ trợ sẽ dính tiêu đề vào đỉnh của khung nhìn khi chúng đến vị trí đó. Mỗi tiêu đề tiếp theo sẽ thay thế tiêu đề trước khi nó cuộn lên đến vị trí đó.

```css
dt {
  background-color: black;
  color: white;
  padding: 10px;
  position: sticky;
  top: 0;
  left: 0;
  margin: 1em 0;
}
```

```css hidden
body {
  width: 500px;
  height: 880px;
  margin: 0 auto;
}
```

{{ EmbedLiveSample('Scrolling_index', '100%', 200) }}

Các phần tử dính được "dính" liên quan đến tổ tiên gần nhất có "cơ chế cuộn", được xác định bởi thuộc tính [overflow](/en-US/docs/Web/CSS/Reference/Properties/overflow) của tổ tiên của nó.

> [!NOTE]
> Bạn có thể xem ví dụ này trực tiếp tại [`7_sticky-positioning.html`](https://mdn.github.io/learning-area/css/css-layout/positioning/7_sticky-positioning.html) ([xem mã nguồn](https://github.com/mdn/learning-area/blob/main/css/css-layout/positioning/7_sticky-positioning.html)).

## Tóm tắt

Tôi chắc rằng bạn đã có niềm vui khi thử nghiệm với định vị cơ bản. Mặc dù nó không phải là phương pháp lý tưởng để sử dụng cho toàn bộ bố cục, nhưng có nhiều mục tiêu cụ thể mà nó phù hợp.

Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra để kiểm tra mức độ hiểu và ghi nhớ tất cả thông tin này của bạn.

## Xem thêm

- Tham chiếu thuộc tính {{cssxref("position")}}.
- [Ví dụ định vị thực tế](/en-US/docs/Learn_web_development/Core/CSS_layout/Practical_positioning_examples), để có thêm ý tưởng hữu ích.

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Test_your_skills/Floats", "Learn_web_development/Core/CSS_layout/Test_your_skills/Position", "Learn_web_development/Core/CSS_layout")}}
