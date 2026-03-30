---
title: Giá trị và đơn vị CSS
short-title: Giá trị và đơn vị
slug: Learn_web_development/Core/Styling_basics/Values_and_units
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Fixing_blog_styles", "Learn_web_development/Core/Styling_basics/Test_your_skills/Values", "Learn_web_development/Core/Styling_basics")}}

Các quy tắc CSS chứa [các khai báo](/en-US/docs/Web/CSS/Guides/Syntax/Introduction#css_declarations), vốn được tạo thành từ các thuộc tính và giá trị.
Mỗi thuộc tính được sử dụng trong CSS có một **kiểu giá trị** mô tả loại giá trị mà nó được phép có.
Trong bài học này, chúng ta sẽ xem xét một số kiểu giá trị được sử dụng phổ biến nhất, chúng là gì và cách chúng hoạt động.

> [!NOTE]
> Mỗi [trang thuộc tính CSS](/en-US/docs/Web/CSS/Reference#index) có phần cú pháp liệt kê các kiểu giá trị mà bạn có thể sử dụng với thuộc tính đó.

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
          <li>Hiểu rằng các giá trị thuộc tính có thể có nhiều kiểu khác nhau và những kiểu này đại diện cho điều gì.</li>
          <li>Quen thuộc với việc sử dụng các kiểu cơ bản: Số, độ dài, phần trăm, màu sắc, hình ảnh, vị trí, chuỗi và định danh, và hàm.</li>
          <li>Hiểu đơn vị tuyệt đối và tương đối là gì và sự khác biệt giữa chúng.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Giá trị CSS là gì?

Giá trị CSS xác định loại giá trị nào hợp lệ cho mỗi thuộc tính CSS. Ví dụ, bạn có thể chỉ định màu sắc cho các giá trị của {{cssxref("color")}} hoặc {{cssxref("border-color")}}, nhưng không phải độ dài hoặc phần trăm.

Trong các thông số kỹ thuật CSS và trên các trang thuộc tính ở đây trên MDN, bạn sẽ có thể nhận ra các kiểu giá trị vì chúng sẽ được bao quanh bởi dấu ngoặc nhọn (`<`, `>`) — chẳng hạn như {{cssxref("&lt;color&gt;")}} hoặc {{cssxref("length")}}. Khi bạn thấy kiểu giá trị `<color>` là hợp lệ cho một thuộc tính cụ thể, điều đó có nghĩa là bạn có thể sử dụng bất kỳ màu hợp lệ nào làm giá trị cho thuộc tính đó, như được liệt kê trên trang tham chiếu {{cssxref("&lt;color&gt;")}}.

Đôi khi các kiểu giá trị và thuộc tính có thể có cùng hoặc tương tự tên — Ví dụ, có thuộc tính {{cssxref("color")}} và kiểu dữ liệu {{cssxref("&lt;color&gt;")}}. Bạn có thể sử dụng dấu ngoặc nhọn để xác định cái nào bạn đang nghiên cứu trong từng trường hợp. Các phần tử HTML cũng sử dụng dấu ngoặc nhọn, nhưng điều đó sẽ rõ ràng từ ngữ cảnh khi nào bạn đang xem xét cái nào. Nếu bạn không chắc, hãy thử tìm kiếm trên MDN.

> [!NOTE]
> Bạn sẽ thấy các kiểu giá trị CSS được gọi là _kiểu dữ liệu_. Các thuật ngữ về cơ bản có thể hoán đổi cho nhau — khi bạn thấy một thứ gì đó trong CSS được gọi là kiểu dữ liệu, đó thực sự chỉ là cách diễn đạt hào nhoáng về kiểu giá trị. Thuật ngữ _giá trị_ đề cập đến bất kỳ biểu thức cụ thể nào được hỗ trợ bởi kiểu giá trị mà bạn chọn sử dụng.

Trong ví dụ sau, chúng ta đã đặt màu văn bản cho tiêu đề của chúng ta bằng từ khóa màu và nền bằng kiểu giá trị màu khác — hàm `rgb()`:

```css
h1 {
  color: black;
  background-color: rgb(197 93 161);
}
```

Một kiểu giá trị trong CSS xác định một bộ sưu tập các giá trị được phép. Điều này có nghĩa là nếu bạn thấy `<color>` là hợp lệ, bạn không cần tự hỏi loại giá trị màu nào có thể được sử dụng — từ khóa, giá trị hex, hàm `rgb()`, v.v. Bạn có thể sử dụng _bất kỳ_ giá trị `<color>` nào có sẵn, miễn là trình duyệt của bạn hỗ trợ chúng. Trang trên MDN cho mỗi giá trị sẽ cung cấp cho bạn thông tin về hỗ trợ trình duyệt. Ví dụ, nếu bạn xem trang cho {{cssxref("&lt;color&gt;")}}, bạn sẽ thấy phần tương thích trình duyệt liệt kê các kiểu giá trị màu khác nhau và hỗ trợ cho chúng.

Hãy xem một số loại giá trị và đơn vị mà bạn có thể thường xuyên gặp, với các ví dụ để bạn có thể thử các giá trị khác nhau có thể.

## Số, độ dài và phần trăm

Có nhiều kiểu giá trị số khác nhau mà bạn có thể thấy mình sử dụng trong CSS. Sau đây là tất cả được phân loại là số:

<table class="standard-table no-markdown">
  <thead>
    <tr>
      <th scope="col">Kiểu dữ liệu</th>
      <th scope="col">Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/CSS/Reference/Values/integer">&#x3C;integer></a></code>
      </td>
      <td>
        <code>&#x3C;integer></code> là số nguyên như
        <code>1024</code> hoặc <code>-55</code>.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/CSS/Reference/Values/number">&#x3C;number></a></code>
      </td>
      <td>
        <code>&#x3C;number></code> đại diện cho số thập phân — nó có thể có hoặc không có điểm thập phân với thành phần phân số. Ví dụ,
        <code>0.255</code>, <code>128</code>, hoặc <code>-1.2</code>.
      </td>
    </tr>
    <tr>
      <td>
        <code
          ><a href="/en-US/docs/Web/CSS/Reference/Values/dimension">&#x3C;dimension></a></code
        >
      </td>
      <td>
        <code>&#x3C;dimension></code> là <code>&#x3C;number></code> với đơn vị đính kèm. Ví dụ, <code>45deg</code>, <code>5s</code>,
        hoặc <code>10px</code>. <code>&#x3C;dimension></code> là danh mục bao gồm các kiểu {{cssxref("length")}}, <code><a href="/en-US/docs/Web/CSS/Reference/Values/angle">&#x3C;angle></a></code
        >, <code><a href="/en-US/docs/Web/CSS/Reference/Values/time">&#x3C;time></a></code
        > và
        <code
          ><a href="/en-US/docs/Web/CSS/Reference/Values/resolution">&#x3C;resolution></a></code
        >.
      </td>
    </tr>
    <tr>
      <td>{{cssxref("percentage")}}</td>
      <td>
        <code>&#x3C;percentage></code> đại diện cho một phần của một giá trị khác. Ví dụ, <code>50%</code>. Giá trị phần trăm luôn tương đối so với một đại lượng khác. Ví dụ, độ dài của phần tử là tương đối so với độ dài phần tử cha của nó.
      </td>
    </tr>
  </tbody>
</table>

### Độ dài

Kiểu số bạn sẽ gặp thường xuyên nhất là {{cssxref("length")}}. Ví dụ, `10px` (pixel) hoặc `30em`. Có hai loại độ dài được sử dụng trong CSS — tương đối và tuyệt đối. Điều quan trọng là biết sự khác biệt để hiểu mọi thứ sẽ lớn như thế nào.

#### Đơn vị độ dài tuyệt đối

Sau đây là tất cả các đơn vị độ dài **tuyệt đối** — chúng không tương đối so với bất cứ thứ gì khác và thường được coi là luôn có cùng kích thước.

| Đơn vị | Tên             | Tương đương              |
| ------ | --------------- | ------------------------ |
| `cm`   | Centimet        | 1cm = 37.8px = 25.2/64in |
| `mm`   | Milimet         | 1mm = 1/10th of 1cm      |
| `Q`    | Quarter-milimet | 1Q = 1/40th of 1cm       |
| `in`   | Inch            | 1in = 2.54cm = 96px      |
| `pc`   | Pica            | 1pc = 1/6th of 1in       |
| `pt`   | Điểm            | 1pt = 1/72nd of 1in      |
| `px`   | Pixel           | 1px = 1/96th of 1in      |

Hầu hết các đơn vị này hữu ích hơn khi sử dụng để in, thay vì đầu ra màn hình. Ví dụ, chúng ta thường không sử dụng `cm` (centimet) trên màn hình. Giá trị duy nhất mà bạn sẽ thường xuyên sử dụng là `px` (pixel).

Lưu ý rằng `1px` không nhất thiết bằng một pixel thiết bị vật lý. Trên màn hình HD, nó có thể trải qua nhiều pixel vật lý.
Tương tự, `1cm` trong CSS thường không tương ứng với một phần trăm của mét [SI](https://en.wikipedia.org/wiki/International_System_of_Units). Trên màn hình TV lớn, thường dài hơn thế.
Các độ dài là perceptual: `16px` trông gần như giống nhau trên điện thoại, laptop hoặc màn hình TV ở khoảng cách xem thông thường.

#### Đơn vị độ dài tương đối

Đơn vị độ dài tương đối là tương đối so với một thứ khác. Ví dụ:

- `em` là tương đối so với cỡ chữ của phần tử này, hoặc cỡ chữ của phần tử cha khi được sử dụng cho {{cssxref("font-size")}}. `rem` là tương đối so với cỡ chữ của phần tử gốc.
- `vh` và `vw` là tương đối so với chiều cao và chiều rộng của viewport, tương ứng.

Lợi ích của việc sử dụng đơn vị tương đối là với một số lập kế hoạch cẩn thận, bạn có thể làm cho kích thước văn bản hoặc các phần tử khác thay đổi tương đối so với mọi thứ khác trên trang. Để có danh sách đầy đủ các đơn vị tương đối có sẵn, hãy xem trang tham chiếu cho kiểu {{cssxref("length")}}.

Trong phần này, chúng ta sẽ khám phá một số đơn vị tương đối phổ biến nhất.

#### Khám phá một ví dụ

Trong ví dụ bên dưới, bạn có thể thấy cách một số đơn vị độ dài tương đối và tuyệt đối hoạt động. Hộp đầu tiên có {{cssxref("width")}} được đặt bằng pixel. Là đơn vị tuyệt đối, chiều rộng này sẽ giữ nguyên bất kể điều gì khác thay đổi.

Hộp thứ hai có chiều rộng được đặt bằng đơn vị `vw` (chiều rộng viewport). Giá trị này là tương đối so với chiều rộng viewport, vì vậy `10vw` là 10 phần trăm chiều rộng của viewport. Nếu bạn thay đổi chiều rộng cửa sổ trình duyệt, kích thước hộp sẽ thay đổi. Tuy nhiên, ví dụ này được nhúng vào trang bằng [`<iframe>`](/en-US/docs/Web/HTML/Reference/Elements/iframe), vì vậy điều này sẽ không hoạt động. Để xem điều này hoạt động, bạn sẽ phải [thử ví dụ sau khi mở nó trong tab trình duyệt riêng](https://mdn.github.io/css-examples/learn/values-units/length.html).

Hộp thứ ba sử dụng đơn vị `em`. Chúng tương đối so với cỡ chữ phần tử. Tôi đã đặt cỡ chữ `1em` trên {{htmlelement("div")}} chứa, có lớp `.wrapper`. Thay đổi giá trị này thành `1.5em` và bạn sẽ thấy cỡ chữ của tất cả các phần tử tăng lên, nhưng chỉ mục cuối cùng sẽ rộng hơn, vì chiều rộng của nó là tương đối so với cỡ chữ đó.

Sau khi thực hiện theo hướng dẫn trên, hãy thử nghiệm với các giá trị theo các cách khác để xem kết quả.

```html live-sample___length
<div class="wrapper">
  <div class="box px">I am 200px wide</div>
  <div class="box vw">I am 10vw wide</div>
  <div class="box em">I am 10em wide</div>
</div>
```

```css live-sample___length
.box {
  background-color: lightblue;
  border: 5px solid darkblue;
  padding: 10px;
  margin: 1em 0;
}

.wrapper {
  font-size: 1em;
}

.px {
  width: 200px;
}

.vw {
  width: 10vw;
}

.em {
  width: 10em;
}
```

{{EmbedLiveSample("length", "", "250px")}}

#### em và rem

`em` và `rem` là hai độ dài tương đối bạn có thể gặp thường xuyên nhất khi kích thước bất cứ thứ gì từ hộp đến văn bản. Đáng hiểu cách chúng hoạt động và sự khác biệt giữa chúng, đặc biệt khi bạn bắt đầu tìm hiểu các chủ đề phức tạp hơn như [tạo kiểu văn bản](/en-US/docs/Learn_web_development/Core/Text_styling) hoặc [CSS layout](/en-US/docs/Learn_web_development/Core/CSS_layout). Ví dụ bên dưới cung cấp minh họa.

Ví dụ tiếp theo là tập hợp các danh sách lồng nhau — chúng ta có hai danh sách tổng cộng và cả hai ví dụ đều có cùng HTML. Sự khác biệt duy nhất là ví dụ đầu tiên có lớp _ems_ và ví dụ thứ hai có lớp _rems_.

Để bắt đầu, chúng ta đặt `16px` làm cỡ chữ trên phần tử `<html>`.

Tóm tắt, đơn vị `em` có nghĩa là **"cỡ chữ phần tử cha của tôi"** nếu được sử dụng cho `font-size`, và **"cỡ chữ của tôi"** khi được sử dụng cho bất cứ thứ gì khác. Các phần tử {{htmlelement("li")}} bên trong {{htmlelement("ul")}} với `class` là `ems` lấy kích thước của chúng từ cha của chúng. Vì vậy, mỗi cấp độ lồng nhau tiếp theo lớn hơn dần, vì mỗi cấp có cỡ chữ được đặt thành `1.3em` — 1.3 lần cỡ chữ phần tử cha của nó.

Tóm tắt, đơn vị `rem` có nghĩa là **"Cỡ chữ phần tử gốc"** (rem là viết tắt của "root em"). Các phần tử {{htmlelement("li")}} bên trong {{htmlelement("ul")}} với `class` là `rems` lấy kích thước của chúng từ phần tử gốc (`<html>`). Điều này có nghĩa là mỗi cấp độ lồng nhau tiếp theo không tiếp tục lớn hơn.

Tuy nhiên, nếu bạn thay đổi `font-size` của phần tử `<html>` trong CSS, bạn sẽ thấy rằng mọi thứ khác thay đổi tương đối so với nó — cả văn bản có kích thước `rem` và `em`. Hãy thử điều này ngay bây giờ trong MDN Playground.

```html live-sample___em-rem
<ul class="ems">
  <li>One</li>
  <li>Two</li>
  <li>
    Three
    <ul>
      <li>Three A</li>
      <li>
        Three B
        <ul>
          <li>Three B 2</li>
        </ul>
      </li>
    </ul>
  </li>
</ul>

<ul class="rems">
  <li>One</li>
  <li>Two</li>
  <li>
    Three
    <ul>
      <li>Three A</li>
      <li>
        Three B
        <ul>
          <li>Three B 2</li>
        </ul>
      </li>
    </ul>
  </li>
</ul>
```

```css live-sample___em-rem
html {
  font-size: 16px;
}

.ems li {
  font-size: 1.3em;
}

.rems li {
  font-size: 1.3rem;
}
```

{{EmbedLiveSample("em-rem", "", "400px")}}

### Phần trăm

Trong nhiều trường hợp, phần trăm được xử lý theo cách tương tự như đơn vị độ dài, và như chúng ta [đã thảo luận trong bài học về giá trị và đơn vị](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#percentages), chúng thường có thể được sử dụng thay thế cho nhau với độ dài. Khi sử dụng phần trăm, bạn cần biết nó là phần trăm _của_ cái gì. Trong trường hợp hộp bên trong vùng chứa khác, nếu bạn cho hộp con chiều rộng phần trăm, nó sẽ là phần trăm của chiều rộng vùng chứa cha.

```html live-sample___percentage
<div class="box px">I am 200px wide</div>
<div class="box percent">I am 40% wide</div>
<div class="wrapper">
  <div class="box px">I am 200px wide</div>
  <div class="box percent">I am 40% wide</div>
</div>
```

```css live-sample___percentage
.box {
  background-color: lightblue;
  border: 5px solid darkblue;
  padding: 10px;
  margin: 1em 0;
}
.wrapper {
  width: 400px;
  border: 5px solid rebeccapurple;
}

.px {
  width: 200px;
}

.percent {
  width: 40%;
}
```

{{EmbedLiveSample("percentage", "", "350px")}}

Ví dụ tiếp theo có cỡ chữ được đặt theo phần trăm. Mỗi `<li>` có `font-size` là `80%`; do đó, các mục danh sách lồng nhau ngày càng nhỏ hơn khi chúng kế thừa kích thước từ cha của chúng.

```html live-sample___percentage-fonts
<ul>
  <li>One</li>
  <li>Two</li>
  <li>
    Three
    <ul>
      <li>Three A</li>
      <li>
        Three B
        <ul>
          <li>Three B 2</li>
        </ul>
      </li>
    </ul>
  </li>
</ul>
```

```css live-sample___percentage-fonts
li {
  font-size: 80%;
}
```

{{EmbedLiveSample("percentage-fonts")}}

Trong khi nhiều thuộc tính chấp nhận độ dài hoặc phần trăm làm giá trị, một số chỉ chấp nhận độ dài, ví dụ {{cssxref("border-width")}}. Các trang tham chiếu thuộc tính của MDN cung cấp chi tiết về kiểu giá trị mà chúng chấp nhận. Nếu giá trị được phép bao gồm {{cssxref("length-percentage")}}, thì bạn có thể sử dụng độ dài hoặc phần trăm. Nếu giá trị được phép chỉ bao gồm `<length>`, thì không thể sử dụng phần trăm.

### Số

Một số kiểu giá trị chấp nhận các số không có đơn vị; ví dụ là thuộc tính `opacity`, kiểm soát độ mờ của phần tử (độ trong suốt của nó). Thuộc tính này chấp nhận số giữa `0` (hoàn toàn trong suốt) và `1` (hoàn toàn đục).

Trong ví dụ bên dưới, hãy thử thay đổi giá trị của `opacity` thành các giá trị thập phân khác nhau giữa `0` và `1` và xem hộp và nội dung của nó trở nên mờ hơn hoặc đục hơn như thế nào:

```html live-sample___opacity
<div class="wrapper">
  <div class="box">I am a box with opacity</div>
</div>
```

```css live-sample___opacity
.wrapper {
  background-image: url("https://mdn.github.io/shared-assets/images/examples/balloons.jpg");
  background-repeat: no-repeat;
  background-position: bottom left;
  padding: 20px;
}

.box {
  margin: 40px auto;
  width: 200px;
  background-color: lightblue;
  border: 5px solid darkblue;
  padding: 30px;
  opacity: 0.6;
}
```

{{EmbedLiveSample("opacity", "", "210px")}}

> [!NOTE]
> Khi bạn sử dụng số trong CSS làm giá trị, nó không nên được bao quanh bởi dấu ngoặc kép.

## Màu sắc

Giá trị màu có thể được sử dụng ở nhiều nơi trong CSS, cho dù bạn đang chỉ định màu của văn bản, nền, đường viền và nhiều hơn nữa.
Có nhiều cách để đặt màu trong CSS, cho phép bạn kiểm soát nhiều thuộc tính thú vị.

Hệ thống màu tiêu chuẩn có trong máy tính hiện đại hỗ trợ màu 24-bit, cho phép hiển thị khoảng 16,7 triệu màu khác nhau thông qua sự kết hợp của các kênh đỏ, xanh lá và xanh lam khác nhau với 256 giá trị khác nhau trên mỗi kênh (256 x 256 x 256 = 16,777,216).

Trong phần này, trước tiên chúng ta sẽ xem xét các cách phổ biến nhất để chỉ định màu: sử dụng từ khóa, thập lục phân và giá trị `rgb()`.
Chúng ta cũng sẽ xem qua các hàm màu bổ sung, cho phép bạn nhận ra chúng khi bạn thấy chúng hoặc thử nghiệm với các cách khác nhau để áp dụng màu.

### Từ khóa màu

Bạn sẽ thấy các từ khóa màu (hoặc "màu được đặt tên") được sử dụng trong nhiều ví dụ mã MDN. Vì kiểu dữ liệu {{cssxref("named-color")}} chứa số lượng giá trị màu hữu hạn, chúng không thường được sử dụng trên các trang web sản xuất với ngôn ngữ thiết kế phức tạp. Mặt khác, màu được đặt tên được sử dụng trong các ví dụ mã để rõ ràng cho người dùng biết màu nào được mong đợi để người học có thể tập trung vào nội dung đang được dạy.

Trong ví dụ tiếp theo, hãy thử nghiệm với các từ khóa màu khác nhau để có thêm ý tưởng về cách chúng hoạt động. Bạn có thể tra cứu chúng bằng trang tham chiếu {{cssxref("named-color")}}.

```html live-sample___color-keywords
<div class="wrapper">
  <div class="box one">antiquewhite</div>
  <div class="box two">blueviolet</div>
  <div class="box three">greenyellow</div>
</div>
```

```css live-sample___color-keywords
.box {
  padding: 10px;
  margin: 0.5em 0;
  border-radius: 0.5em;
}
.one {
  background-color: antiquewhite;
}

.two {
  background-color: blueviolet;
}

.three {
  background-color: greenyellow;
}
```

{{EmbedLiveSample("color-keywords")}}

### Giá trị RGB thập lục phân

Kiểu giá trị màu tiếp theo bạn có thể gặp là mã thập lục phân (hex).

Các số thập lục phân sử dụng 16 ký tự từ `0-9` và `a-f`, vì vậy toàn bộ phạm vi là `0123456789abcdef`. Mỗi giá trị màu hex bao gồm ký hiệu hash/pound (`#`) theo sau là sáu ký tự thập lục phân (`#ffc0cb`, ví dụ). Mỗi **cặp** ký tự thập lục phân đại diện cho một trong các kênh của màu RGB — đỏ, xanh lá và xanh lam — và cho phép chúng ta chỉ định bất kỳ giá trị nào trong 256 giá trị có sẵn cho mỗi kênh (16 x 16 = 256).

Các giá trị này kém trực quan hơn từ khóa để xác định màu, nhưng chúng linh hoạt hơn nhiều vì bạn có thể _biểu diễn_ bất kỳ màu RGB nào với chúng.

Trong ví dụ tiếp theo, hãy thử thay đổi các giá trị để xem màu thay đổi như thế nào:

```html live-sample___color-hex
<div class="wrapper">
  <div class="box one">#02798b</div>
  <div class="box two">#c55da1</div>
  <div class="box three">#128a7d</div>
</div>
```

```css live-sample___color-hex
.box {
  padding: 10px;
  margin: 0.5em 0;
  border-radius: 0.5em;
}

.one {
  background-color: #02798b;
}

.two {
  background-color: #c55da1;
}

.three {
  background-color: #128a7d;
}
```

{{EmbedLiveSample("color-hex")}}

> [!NOTE]
> Bạn có thể thấy các giá trị màu hex được viết bằng ba ký tự thay vì sáu. Đây là viết tắt có thể được sử dụng khi các ký tự trong mỗi cặp giống nhau. Ví dụ, `#ff00ff` và `#f0f` là tương đương. Bạn cũng có thể thấy các giá trị màu hex được viết bằng tám (hoặc bốn) ký tự, với giá trị thứ tư đại diện cho độ trong suốt alpha của ba giá trị trước đó — ví dụ `#ff00ff66`.

### Giá trị RGB

Để tạo giá trị RGB trực tiếp, hàm {{cssxref("color_value/rgb")}} nhận ba tham số đại diện cho các giá trị kênh **đỏ**, **xanh lá** và **xanh lam** của màu, với giá trị thứ tư tùy chọn được phân tách bằng dấu gạch chéo (`/`) đại diện cho độ mờ, theo cách tương tự như giá trị hex. Sự khác biệt với RGB là mỗi kênh không được đại diện bằng hai chữ số hex, mà là số thập phân từ `0` đến `255` hoặc phần trăm từ `0%` đến `100%` (nhưng không phải hỗn hợp của cả hai).

Hãy viết lại ví dụ cuối cùng của chúng ta để sử dụng màu RGB:

```html live-sample___color-rgb
<div class="wrapper">
  <div class="box one">rgb(2 121 139)</div>
  <div class="box two">rgb(197 93 161)</div>
  <div class="box three">rgb(18 138 125)</div>
</div>
```

```css live-sample___color-rgb
.box {
  padding: 10px;
  margin: 0.5em 0;
  border-radius: 0.5em;
}
.one {
  background-color: rgb(2 121 139);
}

.two {
  background-color: rgb(197 93 161);
}

.three {
  background-color: rgb(18 138 125);
}
```

{{EmbedLiveSample("color-rgb")}}

#### Ví dụ RGB với độ mờ

Trong ví dụ tiếp theo, chúng ta đã thêm hình ảnh nền vào khối chứa các hộp màu của chúng ta. Sau đó chúng ta đặt các hộp có các giá trị độ mờ khác nhau — lưu ý rằng nền hiển thị qua nhiều hơn khi giá trị kênh alpha nhỏ hơn. Nếu bạn đặt giá trị này thành `0`, nó sẽ làm cho màu hoàn toàn trong suốt, trong khi `1` sẽ làm cho nó hoàn toàn đục. Các giá trị ở giữa cho bạn các mức độ trong suốt khác nhau.

Hãy thử thay đổi các giá trị kênh alpha để xem cách nó ảnh hưởng đến đầu ra màu.

```html live-sample___color-rgba
<div class="wrapper">
  <div class="box one">rgb(2 121 139 / .3)</div>
  <div class="box two">rgb(197 93 161 / .7)</div>
  <div class="box three">rgb(18 138 125 / .9)</div>
</div>
```

```css live-sample___color-rgba
.wrapper {
  background-image: url("https://mdn.github.io/shared-assets/images/examples/balloons.jpg");
  padding: 40px 20px;
}

.box {
  padding: 10px;
  margin: 0.5em 0;
  border-radius: 0.5em;
}

.one {
  background-color: rgb(2 121 139 / 0.3);
}

.two {
  background-color: rgb(197 93 161 / 0.7);
}

.three {
  background-color: rgb(18 138 125 / 0.9);
}
```

{{EmbedLiveSample("color-rgba", "", "250px")}}

> [!NOTE]
> Đặt kênh alpha trên màu có một sự khác biệt quan trọng so với việc sử dụng thuộc tính {{cssxref("opacity")}} mà chúng ta đã đề cập trước đó. Khi bạn sử dụng `opacity`, bạn làm cho phần tử và mọi thứ bên trong nó trong suốt, trong khi sử dụng RGB với tham số alpha chỉ làm cho màu bạn đang chỉ định trong suốt.

### Sử dụng màu sắc để chỉ định màu

Nếu bạn muốn vượt ra ngoài từ khóa, thập lục phân và {{cssxref("color_value/rgb")}} cho màu sắc, bạn có thể muốn thử sử dụng {{cssxref("hue")}}.
Màu sắc là kiểu giá trị cho phép chúng ta biết sự khác biệt hoặc tương đồng giữa các màu như đỏ, cam, vàng, xanh lá, xanh lam, v.v.
Khái niệm chính là bạn có thể chỉ định màu sắc trong {{cssxref("angle")}} vì hầu hết các mô hình màu mô tả màu sắc bằng cách sử dụng {{glossary("color wheel")}}.

Có một số hàm màu bao gồm thành phần {{cssxref("hue")}}, bao gồm {{cssxref("color_value/hsl")}}, {{cssxref("color_value/hwb")}} và {{cssxref("color_value/lch")}}. Các hàm màu khác, như {{cssxref("color_value/lab")}}, xác định màu dựa trên những gì con người có thể nhìn thấy.

Nếu bạn muốn tìm hiểu thêm về các hàm và không gian màu này, hãy xem hướng dẫn [Áp dụng màu cho các phần tử HTML bằng CSS](/en-US/docs/Web/CSS/Guides/Colors/Applying_color), tham chiếu {{cssxref("&lt;color&gt;")}} liệt kê tất cả các cách khác nhau bạn có thể sử dụng màu trong CSS và [mô-đun màu CSS](/en-US/docs/Web/CSS/Guides/Colors) cung cấp tổng quan về tất cả các loại màu trong CSS và các thuộc tính sử dụng giá trị màu.

### HSL

Tương tự như hàm {{cssxref("color_value/hwb")}} là hàm {{cssxref("color_value/hsl")}}, cũng chỉ định màu `srgb()`.
HSL sử dụng `Hue`, cùng với `Saturation` và `Lightness`:

- **Hue (Màu sắc)**: Một lần nữa, điều này đại diện cho gốc màu.
- **Saturation (Độ bão hòa)**: Màu bão hòa như thế nào? Giá trị này từ `0`–`100%`, trong đó `0` là không có màu (sẽ xuất hiện như là sắc xám), và `100%` là màu bão hòa đầy đủ.
- **Lightness (Độ sáng)**: Màu sáng hoặc sáng như thế nào? Giá trị này từ `0`–`100%`, trong đó `0` là không có ánh sáng (sẽ xuất hiện hoàn toàn đen) và `100%` là ánh sáng đầy đủ (sẽ xuất hiện hoàn toàn trắng).

Giá trị màu {{cssxref("color_value/hsl")}} cũng có giá trị thứ tư tùy chọn, được phân tách khỏi màu bằng dấu gạch chéo (`/`), đại diện cho độ trong suốt alpha.

Hãy cập nhật ví dụ RGB để sử dụng màu HSL thay thế:

```html live-sample___color-hsl
<div class="wrapper">
  <div class="box one">hsl(188 97% 28%)</div>
  <div class="box two">hsl(321 47% 57%)</div>
  <div class="box three">hsl(174 77% 31%)</div>
</div>
```

```css live-sample___color-hsl
.box {
  padding: 10px;
  margin: 0.5em 0;
  border-radius: 0.5em;
}

.one {
  background-color: hsl(188 97% 28%);
}

.two {
  background-color: hsl(321 47% 57%);
}

.three {
  background-color: hsl(174 77% 31%);
}
```

{{EmbedLiveSample("color-hsl")}}

Cũng giống như với `rgb()`, bạn có thể truyền tham số alpha cho `hsl()` để chỉ định độ mờ:

```html live-sample___color-hsla
<div class="wrapper">
  <div class="box one">hsl(188 97% 28% / .3)</div>
  <div class="box two">hsl(321 47% 57% / .7)</div>
  <div class="box three">hsl(174 77% 31% / .9)</div>
</div>
```

```css live-sample___color-hsla
.wrapper {
  background-image: url("https://mdn.github.io/shared-assets/images/examples/balloons.jpg");
  padding: 40px 20px;
}

.box {
  padding: 10px;
  margin: 0.5em 0;
  border-radius: 0.5em;
}

.one {
  background-color: hsl(188 97% 28% / 0.3);
}

.two {
  background-color: hsl(321 47% 57% / 0.7);
}

.three {
  background-color: hsl(174 77% 31% / 0.9);
}
```

{{EmbedLiveSample("color-hsla", "", "250px")}}

Trước khi tiếp tục, hãy thử sửa đổi hai ví dụ trước để sử dụng một số giá trị màu dựa trên màu sắc. Thử thay đổi giá trị màu sắc trong từng trường hợp để xem điều này ảnh hưởng đến màu cơ sở như thế nào, và sau đó thử thay đổi các tham số khác.

## Hình ảnh

Kiểu giá trị {{cssxref("image")}} được sử dụng ở bất cứ nơi nào hình ảnh là giá trị hợp lệ. Đây có thể là tệp hình ảnh thực sự được trỏ qua hàm `url()`, hoặc một gradient.

Trong ví dụ bên dưới, chúng ta đang sử dụng hình ảnh và gradient làm giá trị cho thuộc tính CSS `background-image`.

```html live-sample___image
<div class="box image"></div>
<div class="box gradient"></div>
```

```css live-sample___image
.box {
  height: 150px;
  width: 300px;
  margin: 20px auto;
  border-radius: 0.5em;
}

.image {
  background-image: url("https://mdn.github.io/shared-assets/images/examples/big-star.png");
}

.gradient {
  background-image: linear-gradient(
    90deg,
    rgb(119 0 255 / 39%),
    rgb(0 212 255 / 25%)
  );
}
```

{{EmbedLiveSample("image", "", "380px")}}

> [!NOTE]
> Có một số giá trị khả dụng khác cho `<image>`, tuy nhiên những giá trị này mới hơn và hiện tại có hỗ trợ trình duyệt kém. Hãy xem trang trên MDN cho kiểu dữ liệu {{cssxref("image")}} nếu bạn muốn đọc về chúng.

Bạn sẽ tìm hiểu về giá trị hình ảnh sâu hơn trong bài viết [Nền và đường viền](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders) của chúng ta sau này.

## Vị trí

Kiểu giá trị {{cssxref("&lt;position&gt;")}} đại diện cho tập hợp tọa độ 2D, được sử dụng để định vị mục như hình ảnh nền (qua {{cssxref("background-position")}}). Nó có thể nhận các từ khóa như `top`, `left`, `bottom`, `right` và `center` để căn chỉnh các mục với các ranh giới cụ thể của hộp 2D, và độ dài, đại diện cho khoảng bù từ các cạnh trên và trái của hộp.

Giá trị vị trí điển hình bao gồm hai giá trị — giá trị đầu tiên đặt vị trí theo chiều ngang, giá trị thứ hai theo chiều dọc. Nếu bạn chỉ chỉ định giá trị cho một trục, trục kia sẽ mặc định là `center`.

Trong ví dụ sau, chúng ta đã định vị hình ảnh nền `60px` từ trên cùng và vào `right` của vùng chứa bằng từ khóa.

Hãy thử nghiệm với các giá trị này để xem cách bạn có thể đẩy hình ảnh xung quanh.

```html live-sample___position
<div class="box"></div>
```

```css live-sample___position
.box {
  height: 200px;
  width: 400px;
  background-image: url("https://mdn.github.io/shared-assets/images/examples/big-star.png");
  background-repeat: no-repeat;
  background-position: right 60px;
  margin: 20px auto;
  border-radius: 0.5em;
  border: 5px solid rebeccapurple;
}
```

{{EmbedLiveSample("position", "100%", "260px")}}

## Chuỗi và định danh

Trong suốt các ví dụ trên, chúng ta đã thấy những nơi mà từ khóa được sử dụng làm giá trị (ví dụ từ khóa `<color>` như `red`, `black`, `rebeccapurple` và `goldenrod`). Các từ khóa này chính xác hơn được mô tả là _định danh_, một giá trị đặc biệt mà CSS hiểu. Vì vậy, chúng không được trích dẫn — chúng không được xử lý như chuỗi.

Có những nơi bạn sử dụng chuỗi trong CSS. Ví dụ, [khi chỉ định nội dung được tạo ra](/en-US/docs/Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements#generating_content_with_before_and_after). Trong trường hợp này, giá trị được trích dẫn để minh chứng rằng nó là chuỗi. Trong ví dụ bên dưới, chúng ta sử dụng từ khóa màu không được trích dẫn cùng với chuỗi nội dung được tạo ra được trích dẫn.

```html live-sample___strings-idents
<div class="box"></div>
```

```css live-sample___strings-idents
.box {
  width: 400px;
  padding: 1em;
  border-radius: 0.5em;
  border: 5px solid rebeccapurple;
  background-color: lightblue;
}

.box::after {
  content: "This is a string. I know because it is quoted in the CSS.";
}
```

{{EmbedLiveSample("strings-idents", "100%", "80")}}

## Hàm

Trong lập trình, hàm là một đoạn mã thực hiện một tác vụ cụ thể.
Các hàm hữu ích vì bạn có thể viết mã một lần sau đó tái sử dụng nhiều lần thay vì viết cùng logic lặp đi lặp lại.
Hầu hết các ngôn ngữ lập trình không chỉ hỗ trợ hàm mà còn đi kèm với các hàm tích hợp tiện lợi cho các tác vụ phổ biến để bạn không phải tự viết chúng từ đầu.

CSS cũng có [hàm](/en-US/docs/Web/CSS/Reference/Values/Functions), hoạt động theo cách tương tự như hàm trong các ngôn ngữ khác.
Thực ra, chúng ta đã thấy các hàm CSS trong phần [Màu sắc](#color) ở trên, chẳng hạn như {{cssxref("color_value/rgb")}} và {{cssxref("color_value/hsl")}}.

Ngoài việc áp dụng màu sắc, bạn có thể sử dụng hàm trong CSS để làm nhiều thứ khác.
Ví dụ, [các hàm Transform](/en-US/docs/Web/CSS/Reference/Values/Functions#transform_functions) là cách phổ biến để di chuyển, xoay và thay đổi tỷ lệ các phần tử trên trang.
Bạn có thể thấy {{cssxref("transform-function/translate")}} để di chuyển thứ gì đó theo chiều ngang hoặc dọc, {{cssxref("transform-function/rotate")}} để xoay thứ gì đó, hoặc {{cssxref("transform-function/scale")}} để làm thứ gì đó lớn hơn hoặc nhỏ hơn.

### Hàm toán học

Khi bạn đang tạo kiểu cho một dự án, bạn có thể bắt đầu với các số như `300px` cho độ dài hoặc `200ms` cho thời gian.
Nếu bạn muốn các giá trị này thay đổi dựa trên các giá trị khác, bạn sẽ cần thực hiện một số phép toán.
Bạn có thể tính phần trăm của một giá trị hoặc cộng một số với số khác, sau đó cập nhật CSS của bạn với kết quả.
CSS có hỗ trợ cho [hàm toán học](/en-US/docs/Web/CSS/Reference/Values/Functions#math_functions), cho phép chúng ta thực hiện các phép tính trong CSS thay vì dựa vào các giá trị tĩnh hoặc thực hiện toán học trong JavaScript.
Một trong các hàm toán học phổ biến nhất là {{cssxref("calc()")}}, cho phép bạn thực hiện các phép toán như cộng, trừ, nhân và chia.

Ví dụ, giả sử chúng ta muốn đặt chiều rộng của phần tử là `20%` của vùng chứa cha cộng `100px`.
Chúng ta không thể chỉ định chiều rộng này bằng giá trị tĩnh — nếu cha sử dụng chiều rộng phần trăm (hoặc đơn vị tương đối như `em` hoặc `rem`) thì nó sẽ thay đổi tùy thuộc vào ngữ cảnh được sử dụng và các yếu tố khác như chiều rộng thiết bị hoặc cửa sổ trình duyệt của người dùng.
Tuy nhiên, chúng ta có thể sử dụng `calc()` để đặt chiều rộng của phần tử là `20%` của vùng chứa cha cộng `100px`.
`20%` dựa trên chiều rộng của vùng chứa cha (`.wrapper`) và nếu chiều rộng đó thay đổi, phép tính cũng sẽ thay đổi:

```html live-sample___calc
<div class="wrapper">
  <div class="box">My width is calculated.</div>
</div>
```

```css live-sample___calc
.wrapper {
  width: 400px;
}
.box {
  padding: 1em;
  border-radius: 0.5em;
  border: 5px solid rebeccapurple;
  background-color: lightblue;
  width: calc(20% + 100px);
}
```

{{EmbedLiveSample("calc")}}

Có nhiều hàm toán học khác mà bạn có thể sử dụng trong CSS, chẳng hạn như {{cssxref("min()")}}, {{cssxref("max()")}} và {{cssxref("clamp()")}}; tương ứng chúng cho phép bạn chọn giá trị nhỏ nhất, lớn nhất hoặc trung bình từ một tập hợp giá trị. Khám phá trang tham chiếu [hàm giá trị CSS](/en-US/docs/Web/CSS/Reference/Values/Functions) để kiểm tra tất cả các hàm CSS có sẵn.

Biết về các hàm CSS rất hữu ích để bạn nhận ra chúng khi thấy chúng. Bạn nên bắt đầu thử nghiệm với chúng trong các dự án — chúng sẽ giúp bạn tránh viết mã tùy chỉnh hoặc lặp lại để đạt được kết quả mà bạn có thể nhận được với CSS thông thường.

## Tóm tắt

Đây là cái nhìn tổng quan nhanh về các kiểu giá trị và đơn vị phổ biến nhất mà bạn có thể gặp. Bạn có thể xem tất cả các kiểu khác nhau trên trang mô-đun [Giá trị và đơn vị CSS](/en-US/docs/Web/CSS/Guides/Values_and_units) — bạn sẽ gặp nhiều trong số đó khi làm việc qua các bài học này.

Điều quan trọng cần nhớ là mỗi thuộc tính có danh sách xác định các kiểu giá trị được phép, và mỗi kiểu giá trị có định nghĩa giải thích các giá trị là gì. Sau đó, bạn có thể tra cứu chi tiết ở đây trên MDN. Ví dụ, hiểu rằng {{cssxref("image")}} cũng cho phép bạn tạo gradient màu là kiến thức hữu ích nhưng có thể không rõ ràng!

Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ hiểu và ghi nhớ thông tin chúng ta đã cung cấp về giá trị và đơn vị.

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Fixing_blog_styles", "Learn_web_development/Core/Styling_basics/Test_your_skills/Values", "Learn_web_development/Core/Styling_basics")}}
