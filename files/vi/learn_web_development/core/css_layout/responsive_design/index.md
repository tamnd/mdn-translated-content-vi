---
title: Thiết kế web responsive
slug: Learn_web_development/Core/CSS_layout/Responsive_Design
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Fundamental_Layout_Comprehension", "Learn_web_development/Core/CSS_layout/Media_queries", "Learn_web_development/Core/CSS_layout")}}

_Thiết kế web responsive_ (RWD) là cách tiếp cận thiết kế web để làm cho các trang web hiển thị tốt trên mọi kích thước màn hình và độ phân giải, đồng thời đảm bảo tính dễ sử dụng tốt. Đây là cách thiết kế cho web đa thiết bị. Trong bài viết này, chúng ta sẽ giúp bạn hiểu một số kỹ thuật có thể được sử dụng để nắm vững nó.

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
          <li>Thiết kế responsive là gì — thiết kế bố cục web để chúng linh hoạt và hoạt động tốt trên các kích thước màn hình thiết bị, độ phân giải khác nhau, v.v.</li>
          <li>Mối quan hệ giữa các công cụ bố cục hiện đại như lưới và flexbox, và thiết kế responsive.</li>
          <li>Các khái niệm đằng sau việc sử dụng truy vấn phương tiện cho thiết kế responsive, bao gồm ưu tiên mobile-first và điểm ngắt.</li>
          <li>Tại sao <code>&lt;meta viewport=""&gt;</code> cần thiết để các tài liệu web hiển thị đúng trên thiết bị di động.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Tiền thân của thiết kế responsive: thiết kế web di động

Trước khi thiết kế web responsive trở thành cách tiếp cận tiêu chuẩn để làm cho các trang web hoạt động trên các loại thiết bị khác nhau, các nhà phát triển web đã nói về thiết kế web di động, phát triển web di động, hoặc đôi khi là thiết kế thân thiện với mobile. Về cơ bản đây giống như thiết kế web responsive — mục tiêu là đảm bảo các trang web hoạt động tốt trên các thiết bị với các thuộc tính vật lý khác nhau (kích thước màn hình, độ phân giải) về bố cục, nội dung (văn bản và phương tiện) và hiệu suất.

Sự khác biệt chủ yếu liên quan đến các thiết bị liên quan, và các công nghệ có sẵn để tạo giải pháp:

- Chúng ta từng nói về máy tính để bàn hoặc di động, nhưng bây giờ có nhiều loại thiết bị khác nhau như máy tính để bàn, laptop, điện thoại di động, máy tính bảng, đồng hồ, v.v. Thay vì phục vụ một vài kích thước màn hình khác nhau, chúng ta bây giờ cần thiết kế trang web theo cách phòng thủ để phục vụ các kích thước màn hình và độ phân giải phổ biến, cộng với những cái chưa biết.
- Các thiết bị di động từng yếu về CPU/GPU và băng thông có sẵn. Một số không hỗ trợ CSS hoặc thậm chí HTML, và do đó, người ta thường thực hiện dò kiểu trình duyệt phía máy chủ để xác định loại thiết bị/trình duyệt trước khi phục vụ trang web mà thiết bị có thể xử lý được. Các thiết bị di động thường được phục vụ trải nghiệm rất đơn giản, cơ bản vì đó là tất cả những gì chúng có thể xử lý. Ngày nay, các thiết bị di động có khả năng xử lý các công nghệ tương tự như máy tính để bàn, vì vậy các kỹ thuật đó ít phổ biến hơn.
  - Bạn vẫn nên sử dụng các kỹ thuật được thảo luận trong bài viết này để phục vụ người dùng di động một trải nghiệm phù hợp, vì vẫn còn các ràng buộc như tuổi thọ pin và băng thông cần lo lắng.
  - Trải nghiệm người dùng vẫn là một mối quan tâm. Người dùng di động của một trang web du lịch có thể chỉ muốn kiểm tra giờ bay và thông tin trì hoãn, ví dụ, và không được trình bày một quả cầu 3D hoạt hình hiển thị các lộ trình bay và lịch sử công ty của bạn.
- Các công nghệ hiện đại tốt hơn nhiều để tạo ra các trải nghiệm responsive. Ví dụ: [công nghệ hình ảnh/phương tiện responsive](#responsive_imagesmedia) bây giờ cho phép phương tiện phù hợp được phục vụ cho các thiết bị khác nhau mà không phải dựa vào các kỹ thuật như dò kiểu trình duyệt phía máy chủ.

## Giới thiệu thiết kế web responsive

HTML về cơ bản là responsive, hay _linh hoạt_. Nếu bạn tạo một trang web chỉ chứa HTML, không có CSS, và thay đổi kích thước cửa sổ, trình duyệt sẽ tự động chỉnh lại luồng văn bản để vừa với khung nhìn.

Mặc dù hành vi responsive mặc định nghe có vẻ như không cần giải pháp, nhưng các dòng văn bản dài được hiển thị trên toàn màn hình trên màn hình rộng có thể khó đọc. Vấn đề này có thể được giải quyết bằng CSS, ví dụ: bằng cách tạo các cột hẹp để giới hạn độ dài dòng. Tuy nhiên, điều này có thể tạo ra vấn đề mới cho những người thu hẹp cửa sổ trình duyệt hoặc xem trang web trên thiết bị di động — các cột sẽ trông bị ép lại và khó đọc hơn.

![Bố cục với hai cột bị ép vào kích thước khung nhìn di động.](mdn-rwd-liquid.png)

Tạo trang web không thay đổi kích thước bằng cách đặt chiều rộng cố định cũng không hoạt động; dẫn đến thanh cuộn trên các thiết bị hẹp và quá nhiều không gian trống trên màn hình rộng.

Thiết kế web responsive, hay RWD, là một cách tiếp cận thiết kế giải quyết toàn bộ phạm vi của các thiết bị và kích thước thiết bị có sẵn, cho phép thích ứng tự động với màn hình, cho dù nội dung được xem trên máy tính bảng, điện thoại, tivi hay đồng hồ.

Thiết kế web responsive không phải là một công nghệ riêng biệt — đây là một cách tiếp cận. Đây là thuật ngữ được sử dụng để mô tả một tập hợp các thực hành tốt nhất được sử dụng để tạo bố cục có thể _phản hồi_ với bất kỳ thiết bị nào đang được sử dụng để xem nội dung.

Thuật ngữ _thiết kế responsive_, [được đặt ra bởi Ethan Marcotte vào năm 2010](https://alistapart.com/article/responsive-web-design/), mô tả việc sử dụng lưới linh hoạt, hình ảnh linh hoạt và truy vấn phương tiện để tạo nội dung responsive.

Vào thời điểm đó, khuyến nghị là sử dụng CSS `float` cho bố cục và truy vấn phương tiện để truy vấn chiều rộng trình duyệt, tạo bố cục cho các điểm ngắt khác nhau. Hình ảnh linh hoạt được đặt để không vượt quá chiều rộng vùng chứa của chúng; chúng có thuộc tính `max-width` được đặt thành `100%`. Hình ảnh linh hoạt co lại khi cột chứa chúng thu hẹp nhưng không tăng lớn hơn kích thước nội tại của chúng khi cột phát triển. Điều này cho phép hình ảnh co lại để vừa với nội dung, thay vì tràn ra ngoài, nhưng không phát triển lớn hơn và trở nên xô khi vùng chứa rộng hơn hình ảnh.

Các phương pháp bố cục CSS hiện đại vốn đã là responsive, và, kể từ khi bài viết của Marcotte được xuất bản, chúng ta có nhiều tính năng được tích hợp vào nền tảng web để làm cho việc thiết kế trang web responsive dễ dàng hơn.

Phần còn lại của bài viết này sẽ giải thích các tính năng nền tảng web khác nhau mà bạn có thể muốn sử dụng khi tạo trang web responsive.

## Truy vấn phương tiện

[Truy vấn phương tiện](/en-US/docs/Web/CSS/Guides/Media_queries/Using) cho phép chúng ta chạy một loạt bài kiểm tra (ví dụ: liệu màn hình của người dùng có lớn hơn chiều rộng hoặc độ phân giải nhất định không) và áp dụng CSS có chọn lọc để tạo kiểu trang phù hợp với nhu cầu của người dùng.

Ví dụ: truy vấn phương tiện sau kiểm tra để xem trang web hiện tại đang được hiển thị dưới dạng phương tiện màn hình (do đó không phải là tài liệu in) và khung nhìn có chiều rộng ít nhất `80rem`. Quy tắc `.container` sẽ chỉ được áp dụng nếu cả hai điều này đều đúng.

```css
@media screen and (width >= 80rem) {
  .container {
    margin: 1em 2em;
  }
}
```

Bạn có thể thêm nhiều truy vấn phương tiện trong một stylesheet, điều chỉnh toàn bộ bố cục hoặc các phần của nó để phù hợp nhất với các kích thước màn hình khác nhau. Các điểm mà truy vấn phương tiện được giới thiệu, và bố cục thay đổi, được gọi là _điểm ngắt_.

Một cách tiếp cận phổ biến khi sử dụng truy vấn phương tiện là tạo bố cục một cột đơn giản cho các thiết bị màn hình hẹp (ví dụ: điện thoại di động), sau đó kiểm tra các màn hình rộng hơn và triển khai bố cục nhiều cột khi bạn biết rằng bạn có đủ chiều rộng màn hình để xử lý. Thiết kế cho mobile trước được biết đến là thiết kế **mobile first**.

Nếu sử dụng điểm ngắt, các thực hành tốt nhất khuyến khích xác định điểm ngắt truy vấn phương tiện bằng [đơn vị tương đối](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#relative_length_units) thay vì kích thước tuyệt đối của thiết bị riêng lẻ.

Có các cách tiếp cận khác nhau đối với các kiểu được xác định trong khối truy vấn phương tiện; từ việc sử dụng truy vấn phương tiện để {{htmlelement("link")}} các stylesheet dựa trên phạm vi kích thước trình duyệt đến chỉ bao gồm các biến thuộc tính tùy chỉnh để lưu trữ các giá trị liên quan đến mỗi điểm ngắt.

Truy vấn phương tiện có thể giúp với RWD, nhưng không phải là yêu cầu bắt buộc. Lưới linh hoạt, đơn vị tương đối và các giá trị đơn vị tối thiểu và tối đa có thể được sử dụng mà không cần truy vấn phương tiện.

> [!NOTE]
> Scrimba có hướng dẫn gọi là [Aside: Media queries](https://scrimba.com/frontend-path-c0j/~0j3?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>, cung cấp giới thiệu tương tác về truy vấn phương tiện cộng với thách thức để kiểm tra rằng bạn hiểu những kiến thức cơ bản.

## Các công nghệ bố cục responsive

Các trang responsive được xây dựng trên các lưới linh hoạt, có nghĩa là bạn không cần nhắm đến mọi kích thước thiết bị có thể với bố cục hoàn hảo theo pixel.

Bằng cách sử dụng lưới linh hoạt, bạn có thể thay đổi tính năng hoặc thêm điểm ngắt và thay đổi thiết kế tại điểm mà nội dung bắt đầu trông xấu. Ví dụ: để đảm bảo độ dài dòng không trở nên quá dài khi kích thước màn hình tăng, bạn có thể sử dụng {{cssxref('columns')}}; nếu một hộp bị ép với hai từ trên mỗi dòng khi nó thu hẹp, bạn có thể đặt điểm ngắt.

Một số phương pháp bố cục — bao gồm [Flexbox](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox) và [CSS Grid](/en-US/docs/Learn_web_development/Core/CSS_layout/Grids) — là responsive theo mặc định. Tất cả chúng đều giả định rằng bạn đang cố gắng tạo lưới linh hoạt và cung cấp cho bạn các cách dễ dàng hơn để làm như vậy.

### Flexbox

Trong flexbox, các mục flex co lại hoặc phát triển, phân phối không gian giữa các mục theo không gian trong vùng chứa của chúng. Bằng cách thay đổi các giá trị cho `flex-grow` và `flex-shrink`, bạn có thể chỉ ra cách bạn muốn các mục hoạt động khi chúng gặp nhiều hoặc ít không gian hơn xung quanh chúng.

Trong ví dụ bên dưới, các mục flex sẽ mỗi cái chiếm lượng không gian bằng nhau trong vùng chứa flex, sử dụng viết tắt `flex: 1` như đã thảo luận trước đó (xem [Flexbox: Kích thước linh hoạt của các mục flex](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox#flexible_sizing_of_flex_items)).

```css
.container {
  display: flex;
}

.item {
  flex: 1;
}
```

Đây là cách chúng ta có thể sử dụng flexbox với truy vấn phương tiện cho thiết kế responsive.

```html live-sample___flex-based-rwd
<div class="wrapper">
  <div class="col1">
    <p>
      This layout is responsive. See what happens if you make the browser window
      wider or narrow.
    </p>
  </div>
  <div class="col2">
    <p>
      One November night in the year 1782, so the story runs, two brothers sat
      over their winter fire in the little French town of Annonay, watching the
      grey smoke-wreaths from the hearth curl up the wide chimney. Their names
      were Stephen and Joseph Montgolfier, they were papermakers by trade, and
      were noted as possessing thoughtful minds and a deep interest in all
      scientific knowledge and new discovery.
    </p>
    <p>
      Before that night—a memorable night, as it was to prove—hundreds of
      millions of people had watched the rising smoke-wreaths of their fires
      without drawing any special inspiration from the fact.
    </p>
  </div>
</div>
```

```css hidden live-sample___flex-based-rwd
body {
  font: 1.2em / 1.5 sans-serif;
  margin: 20px;
  padding: 0;
  background-color: #eeeeee;
}
.wrapper {
  max-width: 960px;
  margin: 2em auto;
}

.col1,
.col2 {
  background-color: white;
}
```

```css live-sample___flex-based-rwd
@media screen and (width >= 600px) {
  .wrapper {
    display: flex;
  }

  .col1 {
    flex: 1;
    margin-right: 5%;
  }

  .col2 {
    flex: 2;
  }
}
```

{{EmbedLiveSample("flex-based-rwd", "", "550px")}}

Thay đổi kích thước cửa sổ trình duyệt của bạn. Bố cục sẽ thay đổi giữa bố cục một cột và bố cục hai cột khi kích thước của ví dụ trên vượt qua ngưỡng chiều rộng `600px`.

### CSS grid

Trong bố cục lưới CSS, đơn vị `fr` cho phép phân phối không gian có sẵn trên các track lưới. Ví dụ tiếp theo tạo một vùng chứa lưới với ba track có kích thước `1fr`. Điều này sẽ tạo ba track cột, mỗi cái chiếm một phần không gian có sẵn trong vùng chứa. Bạn đã xem cách tiếp cận này (xem [Lưới linh hoạt với đơn vị fr](/en-US/docs/Learn_web_development/Core/CSS_layout/Grids#flexible_grids_with_the_fr_unit) để tóm tắt).

```css
.container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
}
```

Đây là cách chúng ta có thể sử dụng bố cục lưới với truy vấn phương tiện cho thiết kế responsive.

```html live-sample___grid-based-rwd
<div class="wrapper">
  <div class="col1">
    <p>
      This layout is responsive. See what happens if you make the browser window
      wider or narrow.
    </p>
  </div>
  <div class="col2">
    <p>
      One November night in the year 1782, so the story runs, two brothers sat
      over their winter fire in the little French town of Annonay, watching the
      grey smoke-wreaths from the hearth curl up the wide chimney. Their names
      were Stephen and Joseph Montgolfier, they were papermakers by trade, and
      were noted as possessing thoughtful minds and a deep interest in all
      scientific knowledge and new discovery.
    </p>
    <p>
      Before that night—a memorable night, as it was to prove—hundreds of
      millions of people had watched the rising smoke-wreaths of their fires
      without drawing any special inspiration from the fact.
    </p>
  </div>
</div>
```

```css hidden live-sample___grid-based-rwd
body {
  font: 1.2em / 1.5 sans-serif;
  margin: 20px;
  padding: 0;
  background-color: #eeeeee;
}
.wrapper {
  max-width: 960px;
  margin: 2em auto;
}

.col1,
.col2 {
  background-color: white;
}
```

```css live-sample___grid-based-rwd
@media screen and (width >= 600px) {
  .wrapper {
    display: grid;
    grid-template-columns: 1fr 2fr;
    column-gap: 5%;
  }
}
```

{{EmbedLiveSample("grid-based-rwd", "", "550px")}}

Thử thay đổi kích thước cửa sổ trình duyệt của bạn — bạn sẽ thấy bố cục ví dụ thay đổi ở ngưỡng chiều rộng `600px`, theo cách tương tự như ví dụ trước.

## Hình ảnh/phương tiện responsive

Để đảm bảo phương tiện không bao giờ lớn hơn vùng chứa responsive của nó, có thể sử dụng cách tiếp cận sau:

```css
img,
picture,
video {
  max-width: 100%;
}
```

Điều này co phương tiện để đảm bảo chúng không bao giờ tràn ra ngoài vùng chứa của chúng.

> [!NOTE]
> Sử dụng một hình ảnh lớn và co lại để vừa với thiết bị nhỏ lãng phí băng thông bằng cách tải xuống hình ảnh lớn hơn cần thiết. Nó cũng có thể trông xấu — hình ảnh ngang ví dụ có thể trông đẹp trên màn hình rộng, nhưng có thể khó nhìn trên thiết bị di động, nơi phù hợp hơn với hình ảnh dọc. Những vấn đề như vậy có thể được giải quyết bằng phần tử {{htmlelement("picture")}} và thuộc tính `srcset` và `sizes` của {{htmlelement("img")}}. Đây là các tính năng nâng cao nằm ngoài phạm vi của khóa học này, nhưng bạn có thể tìm hướng dẫn chi tiết tại [Hình ảnh responsive](/en-US/docs/Web/HTML/Guides/Responsive_images).

Các mẹo hữu ích khác:

- Luôn đảm bảo sử dụng định dạng hình ảnh phù hợp cho hình ảnh trang web của bạn (như PNG hoặc JPG), và đảm bảo tối ưu hóa kích thước tệp bằng trình chỉnh sửa đồ họa trước khi đưa chúng lên trang web của bạn.
- Bạn có thể sử dụng các tính năng CSS như [gradient](/en-US/docs/Web/CSS/Guides/Images/Using_gradients) và [bóng](/en-US/docs/Web/CSS/Reference/Properties/box-shadow) để triển khai các hiệu ứng hình ảnh mà không sử dụng hình ảnh.
- Bạn có thể sử dụng truy vấn phương tiện bên trong thuộc tính media trên các phần tử {{htmlelement("source")}} được lồng bên trong các phần tử {{htmlelement("video")}}/{{htmlelement("audio")}} để phục vụ các tệp video/âm thanh phù hợp cho các thiết bị khác nhau (video/âm thanh responsive).

## Typography responsive

Typography responsive mô tả việc thay đổi cỡ chữ trong các truy vấn phương tiện hoặc sử dụng các đơn vị khung nhìn để phản ánh lượng không gian màn hình ít hoặc nhiều hơn.

### Sử dụng truy vấn phương tiện cho typography responsive

Trong ví dụ này, chúng ta muốn đặt tiêu đề cấp 1 là `4rem`, có nghĩa là nó sẽ gấp bốn lần cỡ chữ cơ sở của chúng ta. Đó là tiêu đề thực sự lớn! Chúng ta chỉ muốn tiêu đề jumbo này trên kích thước màn hình lớn hơn, do đó chúng ta trước tiên đặt tiêu đề có kích thước nhỏ hơn là `2rem`, sau đó sử dụng truy vấn phương tiện để ghi đè nó với kích thước lớn hơn nếu chúng ta biết rằng người dùng có chiều rộng màn hình ít nhất `1200px`.

```css
html {
  font-size: 1em;
}

h1 {
  font-size: 2rem;
}

@media (width >= 1200px) {
  h1 {
    font-size: 4rem;
  }
}
```

Ví dụ tiếp theo là phiên bản sửa đổi của ví dụ lưới responsive trước đó của chúng ta, bao gồm tiêu đề responsive sử dụng phương pháp được nêu. Trên điện thoại di động, tiêu đề nhỏ hơn, nhưng trên máy tính để bàn, chúng ta thấy kích thước tiêu đề lớn hơn:

```html live-sample___type-rwd
<div class="wrapper">
  <div class="col1">
    <h1>Watch my size!</h1>
    <p>
      This layout is responsive. See what happens if you make the browser window
      wider or narrow.
    </p>
  </div>
  <div class="col2">
    <p>
      One November night in the year 1782, so the story runs, two brothers sat
      over their winter fire in the little French town of Annonay, watching the
      grey smoke-wreaths from the hearth curl up the wide chimney. Their names
      were Stephen and Joseph Montgolfier, they were papermakers by trade, and
      were noted as possessing thoughtful minds and a deep interest in all
      scientific knowledge and new discovery.
    </p>
    <p>
      Before that night—a memorable night, as it was to prove—hundreds of
      millions of people had watched the rising smoke-wreaths of their fires
      without drawing any special inspiration from the fact.
    </p>
  </div>
</div>
```

```css live-sample___type-rwd
html {
  font-size: 1em;
}

body {
  font:
    1.2em "Helvetica",
    "Arial",
    sans-serif;
  margin: 20px;
  padding: 0;
  background-color: #eeeeee;
}
.wrapper {
  max-width: 960px;
  margin: 2em auto;
}

h1 {
  font-size: 2rem;
  margin: 0;
}

.col1,
.col2 {
  background-color: white;
}

@media screen and (width >= 600px) {
  .wrapper {
    display: grid;
    grid-template-columns: 1fr 2fr;
    column-gap: 5%;
  }

  h1 {
    font-size: 4rem;
  }
}
```

{{EmbedLiveSample("type-rwd", "", "550px")}}

Như với các ví dụ trước, hãy thử thay đổi chiều rộng cửa sổ trình duyệt và lưu ý cách không chỉ bố cục thay đổi ở ngưỡng chiều rộng `600px`, mà kích thước tiêu đề cũng thay đổi.

Như cách tiếp cận typography này cho thấy, bạn không cần giới hạn truy vấn phương tiện chỉ để thay đổi bố cục của trang. Chúng có thể được sử dụng để điều chỉnh bất kỳ phần tử nào để làm cho nó dễ sử dụng hoặc hấp dẫn hơn ở kích thước màn hình khác.

### Sử dụng đơn vị khung nhìn cho typography responsive

Đơn vị khung nhìn `vw` cũng có thể được sử dụng để cho phép typography responsive, mà không cần thiết lập điểm ngắt với truy vấn phương tiện. `1vw` bằng một phần trăm chiều rộng khung nhìn, có nghĩa là nếu bạn đặt cỡ chữ bằng `vw`, nó sẽ luôn liên quan đến kích thước của khung nhìn.

```css
h1 {
  font-size: 6vw;
}
```

Vấn đề với việc làm trên là người dùng mất khả năng phóng to bất kỳ văn bản nào được đặt bằng đơn vị `vw`, vì văn bản đó luôn liên quan đến kích thước của khung nhìn. **Do đó bạn không bao giờ nên đặt văn bản chỉ sử dụng đơn vị khung nhìn**.

Có một giải pháp, và nó liên quan đến việc sử dụng {{cssxref("calc()")}}. Nếu bạn thêm đơn vị `vw` vào giá trị được đặt bằng kích thước cố định như `em` hoặc `rem` thì văn bản vẫn có thể phóng to. Về cơ bản, đơn vị `vw` thêm vào trên giá trị đã phóng to đó:

```css
h1 {
  font-size: calc(1.5rem + 4vw);
}
```

Điều này có nghĩa là chúng ta chỉ cần xác định cỡ chữ cho tiêu đề một lần, thay vì thiết lập nó cho điện thoại di động và xác định lại trong các truy vấn phương tiện. Phông chữ sau đó tăng dần khi bạn tăng kích thước của khung nhìn.

```html live-sample___type-vw
<div class="wrapper">
  <div class="col1">
    <h1>Watch my size!</h1>
    <p>
      This layout is responsive. See what happens if you make the browser window
      wider or narrow.
    </p>
  </div>
  <div class="col2">
    <p>
      One November night in the year 1782, so the story runs, two brothers sat
      over their winter fire in the little French town of Annonay, watching the
      grey smoke-wreaths from the hearth curl up the wide chimney. Their names
      were Stephen and Joseph Montgolfier, they were papermakers by trade, and
      were noted as possessing thoughtful minds and a deep interest in all
      scientific knowledge and new discovery.
    </p>
  </div>
</div>
```

```css live-sample___type-vw
body {
  font: 1.2em / 1.5 sans-serif;
  margin: 20px;
  padding: 0;
  background-color: #eeeeee;
}

.wrapper {
  max-width: 960px;
  margin: 2em auto;
}

h1 {
  font-size: calc(1.5rem + 4vw);
  margin: 0;
}

.col1,
.col2 {
  background-color: white;
}

@media screen and (width >= 600px) {
  .wrapper {
    display: grid;
    grid-template-columns: 1fr 2fr;
    column-gap: 5%;
  }
}
```

{{EmbedLiveSample("type-vw", "", "550px")}}

Thử thay đổi kích thước cửa sổ trình duyệt, như trước đây, và lưu ý lần này kích thước tiêu đề tăng _dần dần_ khi chiều rộng thay đổi.

## Thẻ meta viewport

Nếu bạn nhìn vào nguồn HTML của trang responsive, bạn thường sẽ thấy thẻ {{htmlelement("meta")}} sau trong `<head>` của tài liệu.

```html
<meta name="viewport" content="width=device-width,initial-scale=1" />
```

Thẻ meta [`viewport`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport) này nói với các trình duyệt di động rằng chúng nên đặt chiều rộng của khung nhìn bằng chiều rộng của thiết bị, và chia tỷ lệ tài liệu thành 100% kích thước dự kiến, hiển thị tài liệu ở kích thước tối ưu cho di động mà bạn dự định.

Tại sao điều này cần thiết? Vì các trình duyệt di động có xu hướng nói dối về chiều rộng khung nhìn của chúng.

Thẻ meta này tồn tại vì khi điện thoại thông minh đầu tiên xuất hiện, hầu hết các trang web không được tối ưu hóa cho thiết bị di động. Trình duyệt di động do đó sẽ đặt chiều rộng khung nhìn thành 980 pixel, hiển thị trang ở chiều rộng đó và hiển thị kết quả dưới dạng phiên bản thu nhỏ của bố cục máy tính để bàn. Người dùng có thể phóng to và xem xung quanh trang web để xem các phần họ quan tâm, nhưng nó trông xấu.

Bằng cách đặt `width=device-width` bạn đang ghi đè mặc định của thiết bị di động, như `width=980px` mặc định của iPhone, với chiều rộng thực tế của thiết bị. Không có nó, thiết kế responsive của bạn với điểm ngắt và truy vấn phương tiện có thể không hoạt động như dự định trên các trình duyệt di động. Nếu bạn có bố cục màn hình hẹp bắt đầu ở chiều rộng khung nhìn 480px hoặc ít hơn, nhưng thiết bị đang nói rằng nó rộng 980px, thì người dùng đó sẽ không thấy bố cục màn hình hẹp của bạn.

**Vì vậy, bạn nên _luôn luôn_ bao gồm thẻ meta viewport trong phần head của tài liệu.**

Có một số tùy chọn khác bạn có thể đặt bên trong thuộc tính `content` của thẻ meta viewport — xem tài liệu tham chiếu [`<meta name="viewport">`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport) để biết thêm chi tiết.

## Tóm tắt

Thiết kế responsive đề cập đến thiết kế trang web hoặc ứng dụng phản hồi với môi trường mà nó được xem. Nó bao gồm một số tính năng và kỹ thuật CSS và HTML và về cơ bản là cách chúng ta xây dựng trang web theo mặc định. Hãy xem xét các trang web bạn truy cập trên điện thoại — có lẽ khá hiếm khi gặp trang web là phiên bản máy tính để bàn được thu nhỏ lại, hoặc nơi bạn cần cuộn ngang để tìm thứ gì đó. Điều này là vì web đã chuyển sang cách tiếp cận thiết kế responsive này.

Nó cũng đã trở nên dễ dàng hơn nhiều để đạt được các thiết kế responsive với sự giúp đỡ của các phương pháp bố cục được trình bày trong bài viết này. Nếu bạn mới làm quen với phát triển web ngày nay, bạn có nhiều công cụ hơn trong thời kỳ đầu của thiết kế responsive. Do đó, việc kiểm tra tuổi của bất kỳ tài liệu nào bạn đang sử dụng là đáng giá. Mặc dù các bài viết lịch sử vẫn hữu ích, việc sử dụng CSS và HTML hiện đại làm cho việc tạo các thiết kế thanh lịch và hữu ích dễ dàng hơn nhiều, bất kể thiết bị nào khách truy cập xem trang web với.

Tiếp theo, chúng ta sẽ nghiên cứu truy vấn phương tiện chi tiết hơn và cho thấy cách sử dụng chúng để giải quyết một số vấn đề phổ biến.

## Xem thêm

- Làm việc với thiết bị màn hình cảm ứng:
  - [Sự kiện cảm ứng](/en-US/docs/Web/API/Touch_events) cung cấp khả năng giải thích hoạt động ngón tay (hoặc bút cảm ứng) trên màn hình cảm ứng hoặc bàn di chuột, cho phép hỗ trợ chất lượng cho giao diện người dùng dựa trên cảm ứng phức tạp.
  - Sử dụng truy vấn phương tiện [pointer](/en-US/docs/Web/CSS/Reference/At-rules/@media/pointer) hoặc [any-pointer](/en-US/docs/Web/CSS/Reference/At-rules/@media/any-pointer) để tải CSS khác nhau trên các thiết bị hỗ trợ cảm ứng.
- [Hướng dẫn CSS-Tricks về truy vấn phương tiện](https://css-tricks.com/a-complete-guide-to-css-media-queries/)
- [Lộ trình nghề nghiệp Nhà phát triển Frontend](https://scrimba.com/the-frontend-developer-career-path-c0j?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> từ Scrimba dạy bạn tất cả những gì bạn cần biết để trở thành một nhà phát triển web frontend có năng lực, với các bài học và thử thách tương tác thú vị, giáo viên có kiến thức và cộng đồng hỗ trợ. Từ không biết gì đến có được công việc frontend đầu tiên của bạn! Nhiều thành phần của khóa học có sẵn dưới dạng phiên bản miễn phí độc lập. Điều này bao gồm một mô-đun về thiết kế responsive.

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Fundamental_Layout_Comprehension", "Learn_web_development/Core/CSS_layout/Media_queries", "Learn_web_development/Core/CSS_layout")}}
