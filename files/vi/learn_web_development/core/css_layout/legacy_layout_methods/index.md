---
title: Các phương pháp bố cục cũ
slug: Learn_web_development/Core/CSS_layout/Legacy_Layout_Methods
page-type: learn-module-chapter
sidebar: learnsidebar
---

Hệ thống lưới là một tính năng rất phổ biến được sử dụng trong bố cục CSS, và trước bố cục lưới CSS, chúng thường được triển khai bằng floats hoặc các tính năng bố cục khác. Bạn hình dung bố cục của mình là một số cột được đặt sẵn (ví dụ: 4, 6 hoặc 12), sau đó đặt nội dung vào các cột ảo này. Trong bài viết này, chúng ta sẽ khám phá cách các phương pháp cũ này hoạt động, để bạn hiểu cách chúng được sử dụng nếu bạn làm việc trên một dự án cũ.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về HTML (nghiên cứu
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Giới thiệu về HTML</a
        >), và hiểu biết về cách CSS hoạt động (nghiên cứu
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>.)
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu các khái niệm cơ bản đằng sau các hệ thống bố cục lưới được sử dụng
        trước khi bố cục lưới CSS có sẵn trong trình duyệt.
      </td>
    </tr>
  </tbody>
</table>

## Bố cục và hệ thống lưới trước bố cục lưới CSS

Có thể ngạc nhiên với bất kỳ ai đến từ nền tảng thiết kế khi CSS không có hệ thống lưới tích hợp cho đến gần đây, và thay vào đó chúng ta dường như đã sử dụng nhiều phương pháp không tối ưu để tạo các thiết kế giống lưới. Chúng ta bây giờ gọi những thứ này là các phương pháp "kế thừa".

Đối với các dự án mới, trong hầu hết các trường hợp, bố cục lưới CSS sẽ được sử dụng kết hợp với một hoặc nhiều phương pháp bố cục hiện đại khác để tạo nền tảng cho bất kỳ bố cục nào. Tuy nhiên, bạn sẽ thỉnh thoảng gặp "hệ thống lưới" sử dụng các phương pháp kế thừa này. Hiểu cách chúng hoạt động là điều đáng để biết, và tại sao chúng khác với bố cục lưới CSS.

Bài học này sẽ giải thích cách các hệ thống lưới và framework lưới dựa trên floats và flexbox hoạt động. Sau khi nghiên cứu bố cục lưới, bạn có thể sẽ ngạc nhiên về sự phức tạp của tất cả điều này! Kiến thức này sẽ hữu ích nếu bạn cần tạo mã dự phòng cho các trình duyệt không hỗ trợ các phương pháp mới hơn, ngoài việc cho phép bạn làm việc trên các dự án hiện có sử dụng các loại hệ thống này.

Cần lưu ý, khi chúng ta khám phá các hệ thống này, rằng không có hệ thống nào trong số chúng thực sự tạo ra lưới theo cách bố cục lưới CSS tạo ra lưới. Chúng hoạt động bằng cách cho các mục một kích thước và đẩy chúng xung quanh để căn hàng theo cách _trông_ giống như lưới.

## Bố cục hai cột

Hãy bắt đầu với ví dụ đơn giản nhất có thể — bố cục hai cột. Bạn có thể theo dõi bằng cách tạo tệp `index.html` mới trên máy tính, điền vào đó [mẫu HTML đơn giản](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/getting-started/index.html) và chèn mã bên dưới vào các vị trí thích hợp. Ở cuối phần này bạn có thể thấy ví dụ trực tiếp về mã cuối cùng sẽ trông như thế nào.

Trước tiên, chúng ta cần một số nội dung để đặt vào các cột. Thay thế bất cứ thứ gì hiện có trong body bằng nội dung sau:

```html
<h1>2 column layout example</h1>
<div>
  <h2>First column</h2>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus
    aliquam dolor, eu lacinia lorem placerat vulputate. Duis felis orci,
    pulvinar id metus ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at
    ultricies tellus laoreet sit amet. Sed auctor cursus massa at porta. Integer
    ligula ipsum, tristique sit amet orci vel, viverra egestas ligula. Curabitur
    vehicula tellus neque, ac ornare ex malesuada et. In vitae convallis lacus.
    Aliquam erat volutpat. Suspendisse ac imperdiet turpis. Aenean finibus
    sollicitudin eros pharetra congue. Duis ornare egestas augue ut luctus.
    Proin blandit quam nec lacus varius commodo et a urna. Ut id ornare felis,
    eget fermentum sapien.
  </p>
</div>

<div>
  <h2>Second column</h2>
  <p>
    Nam vulputate diam nec tempor bibendum. Donec luctus augue eget malesuada
    ultrices. Phasellus turpis est, posuere sit amet dapibus ut, facilisis sed
    est. Nam id risus quis ante semper consectetur eget aliquam lorem. Vivamus
    tristique elit dolor, sed pretium metus suscipit vel. Mauris ultricies
    lectus sed lobortis finibus. Vivamus eu urna eget velit cursus viverra quis
    vestibulum sem. Aliquam tincidunt eget purus in interdum. Cum sociis natoque
    penatibus et magnis dis parturient montes, nascetur ridiculus mus.
  </p>
</div>
```

Mỗi cột cần một phần tử bên ngoài để chứa nội dung và cho phép chúng ta thao tác tất cả cùng lúc. Trong ví dụ này chúng ta đã chọn {{htmlelement("div")}}, nhưng bạn có thể chọn thứ gì đó phù hợp hơn về mặt ngữ nghĩa như {{htmlelement("article")}}, {{htmlelement("section")}}, và {{htmlelement("aside")}}, hoặc bất cứ thứ gì.

Bây giờ cho CSS. Trước tiên, hãy áp dụng CSS sau cho HTML để cung cấp một số thiết lập cơ bản:

```css
body {
  width: 90%;
  max-width: 900px;
  margin: 0 auto;
}
```

Body sẽ rộng 90% của khung nhìn cho đến khi đạt 900px, lúc đó nó sẽ ở cố định tại chiều rộng này và tự căn giữa trong khung nhìn. Theo mặc định, các phần tử con của nó ({{htmlelement("Heading_Elements", "h1")}} và hai {{htmlelement("div")}}) sẽ chiếm 100% chiều rộng của body. Nếu chúng ta muốn hai {{htmlelement("div")}} được float cạnh nhau, chúng ta cần đặt chiều rộng của chúng tổng cộng bằng 100% chiều rộng của phần tử cha hoặc nhỏ hơn để chúng có thể nằm cạnh nhau. Thêm phần sau vào cuối CSS:

```css
div:nth-of-type(1) {
  width: 48%;
}

div:nth-of-type(2) {
  width: 48%;
}
```

Ở đây chúng ta đã đặt cả hai là 48% chiều rộng của cha — tổng cộng là 96%, để lại cho chúng ta 4% tự do để làm rãnh giữa hai cột, cung cấp cho nội dung không gian để thở. Bây giờ chúng ta chỉ cần float các cột, như sau:

```css
div:nth-of-type(1) {
  width: 48%;
  float: left;
}

div:nth-of-type(2) {
  width: 48%;
  float: right;
}
```

Kết hợp tất cả điều này sẽ cho chúng ta kết quả như sau:

{{ EmbedLiveSample('A_two_column_layout', '100%', 520) }}

Bạn sẽ lưu ý ở đây rằng chúng ta đang sử dụng phần trăm cho tất cả các chiều rộng — đây là chiến lược khá tốt, vì nó tạo ra **bố cục lỏng**, một bố cục điều chỉnh theo các kích thước màn hình khác nhau và giữ nguyên tỷ lệ cho chiều rộng cột ở kích thước màn hình nhỏ hơn. Hãy thử điều chỉnh chiều rộng cửa sổ trình duyệt để tự mình xem. Đây là công cụ có giá trị cho thiết kế web responsive.

> [!NOTE]
> Bạn có thể thấy ví dụ này chạy tại [0_two-column-layout.html](https://mdn.github.io/learning-area/css/css-layout/floats/0_two-column-layout.html) (xem thêm [mã nguồn](https://github.com/mdn/learning-area/blob/main/css/css-layout/floats/0_two-column-layout.html)).

## Tạo framework lưới kế thừa đơn giản

Phần lớn các framework kế thừa sử dụng hành vi của thuộc tính {{cssxref("float")}} để float một cột lên cạnh cột kia để tạo ra thứ gì đó trông giống như lưới. Làm việc qua quá trình tạo lưới bằng floats cho bạn thấy cách này hoạt động và cũng giới thiệu một số khái niệm nâng cao hơn để xây dựng trên những thứ bạn đã học trong bài học về [floats và clearing](/en-US/docs/Learn_web_development/Core/CSS_layout/Floats).

Loại framework lưới dễ tạo nhất là framework chiều rộng cố định — chúng ta chỉ cần tính toán tổng chiều rộng chúng ta muốn thiết kế của mình, bao nhiêu cột chúng ta muốn, và chiều rộng rãnh và cột nên là bao nhiêu. Nếu thay vào đó chúng ta quyết định bố cục thiết kế trên lưới với các cột phát triển và thu nhỏ theo chiều rộng trình duyệt, chúng ta cần tính toán chiều rộng phần trăm cho các cột và rãnh giữa chúng.

Trong các phần tiếp theo chúng ta sẽ xem cách tạo cả hai. Chúng ta sẽ tạo lưới 12 cột — một lựa chọn rất phổ biến được coi là rất thích ứng với các tình huống khác nhau vì 12 chia hết cho 6, 4, 3 và 2.

### Lưới chiều rộng cố định đơn giản

Trước tiên hãy tạo một hệ thống lưới sử dụng các cột có chiều rộng cố định.

Bắt đầu bằng cách tạo một bản sao cục bộ của tệp [simple-grid.html](https://github.com/mdn/learning-area/blob/main/css/css-layout/grids/simple-grid.html) mẫu, chứa markup sau trong body.

```html
<div class="wrapper">
  <div class="row">
    <div class="col">1</div>
    <div class="col">2</div>
    <div class="col">3</div>
    <div class="col">4</div>
    <div class="col">5</div>
    <div class="col">6</div>
    <div class="col">7</div>
    <div class="col">8</div>
    <div class="col">9</div>
    <div class="col">10</div>
    <div class="col">11</div>
    <div class="col">12</div>
  </div>
  <div class="row">
    <div class="col span1">13</div>
    <div class="col span6">14</div>
    <div class="col span3">15</div>
    <div class="col span2">16</div>
  </div>
</div>
```

Mục tiêu là biến điều này thành lưới demo gồm hai hàng trên lưới mười hai cột — hàng trên cùng thể hiện kích thước của các cột riêng lẻ, hàng thứ hai là một số vùng có kích thước khác nhau trên lưới.

![Lưới CSS với 16 mục lưới trải rộng qua mười hai cột và hai hàng. Hàng trên cùng có 12 mục lưới có chiều rộng bằng nhau trong 12 cột. Hàng thứ hai có các mục lưới có kích thước khác nhau. Mục 13 chiếm 1 cột, mục 14 chiếm sáu cột, 15 chiếm ba, và 16 chiếm hai.](simple-grid-finished.png)

Trong phần tử {{htmlelement("style")}}, thêm mã sau, cho vùng chứa wrapper chiều rộng 980 pixel, với đệm ở phía bên phải là 20 pixel. Điều này để lại cho chúng ta 960 pixel cho tổng chiều rộng cột/rãnh — trong trường hợp này, đệm được trừ từ tổng chiều rộng nội dung vì chúng ta đã đặt {{cssxref("box-sizing")}} thành `border-box` trên tất cả các phần tử trên trang (xem [Mô hình hộp CSS thay thế](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model#the_alternative_css_box_model) để có thêm giải thích).

```css
* {
  box-sizing: border-box;
}

body {
  width: 980px;
  margin: 0 auto;
}

.wrapper {
  padding-right: 20px;
}
```

Bây giờ sử dụng vùng chứa hàng được bao quanh mỗi hàng của lưới để xóa một hàng khỏi hàng khác. Thêm quy tắc sau bên dưới quy tắc trước:

```css
.row {
  clear: both;
}
```

Áp dụng clearing này có nghĩa là chúng ta không cần phải điền đầy đủ mỗi hàng với các phần tử tạo thành đủ mười hai cột. Các hàng sẽ vẫn được tách biệt và không can thiệp vào nhau.

Các rãnh giữa các cột rộng 20 pixel. Chúng ta tạo các rãnh này dưới dạng lề ở phía bên trái của mỗi cột — kể cả cột đầu tiên, để cân bằng 20 pixel đệm ở phía bên phải của vùng chứa. Vậy chúng ta có tổng cộng 12 rãnh — 12 x 20 = 240.

Chúng ta cần trừ số đó từ tổng chiều rộng 960 pixel, cho chúng ta 720 pixel cho các cột. Nếu chúng ta chia số đó cho 12, chúng ta biết rằng mỗi cột nên rộng 60 pixel.

Bước tiếp theo là tạo quy tắc cho class `.col`, float nó sang trái, cho nó {{cssxref("margin-left")}} 20 pixel để tạo rãnh, và {{cssxref("width")}} 60 pixel. Thêm quy tắc sau vào cuối CSS:

```css
.col {
  float: left;
  margin-left: 20px;
  width: 60px;
  background: rgb(255 150 150);
}
```

Hàng trên cùng gồm các cột đơn sẽ bây giờ được sắp xếp gọn gàng như một lưới.

> [!NOTE]
> Chúng ta cũng đã cho mỗi cột một màu đỏ nhạt để bạn có thể thấy chính xác mỗi cái chiếm bao nhiêu không gian.

Các vùng chứa bố cục mà chúng ta muốn mở rộng qua nhiều hơn một cột cần được cho các class đặc biệt để điều chỉnh giá trị {{cssxref("width")}} theo số cột cần thiết (cộng rãnh ở giữa). Chúng ta cần tạo thêm class để cho phép vùng chứa mở rộng từ 2 đến 12 cột. Mỗi chiều rộng là kết quả của việc cộng chiều rộng cột của số cột đó cộng chiều rộng rãnh, số lượng rãnh sẽ luôn ít hơn một so với số cột.

Thêm phần sau vào cuối CSS:

```css
/* Two column widths (120px) plus one gutter width (20px) */
.col.span2 {
  width: 140px;
}
/* Three column widths (180px) plus two gutter widths (40px) */
.col.span3 {
  width: 220px;
}
/* And so on… */
.col.span4 {
  width: 300px;
}
.col.span5 {
  width: 380px;
}
.col.span6 {
  width: 460px;
}
.col.span7 {
  width: 540px;
}
.col.span8 {
  width: 620px;
}
.col.span9 {
  width: 700px;
}
.col.span10 {
  width: 780px;
}
.col.span11 {
  width: 860px;
}
.col.span12 {
  width: 940px;
}
```

Với các class này được tạo, bây giờ chúng ta có thể bố cục các cột có chiều rộng khác nhau trên lưới. Hãy thử lưu và tải trang trong trình duyệt để xem các hiệu ứng.

> [!NOTE]
> Nếu bạn gặp khó khăn khi làm cho ví dụ trên hoạt động, hãy thử so sánh nó với [phiên bản hoàn chỉnh](https://github.com/mdn/learning-area/blob/main/css/css-layout/grids/simple-grid-finished.html) trên GitHub ([xem nó chạy trực tiếp](https://mdn.github.io/learning-area/css/css-layout/grids/simple-grid-finished.html) cũng vậy).

Hãy thử sửa đổi các class trên các phần tử hoặc thậm chí thêm và xóa một số vùng chứa, để xem cách bạn có thể thay đổi bố cục. Ví dụ, bạn có thể làm cho hàng thứ hai trông như thế này:

```html
<div class="row">
  <div class="col span8">13</div>
  <div class="col span4">14</div>
</div>
```

Bây giờ bạn đã có hệ thống lưới hoạt động, bạn có thể định nghĩa các hàng và số cột trong mỗi hàng, sau đó điền vào mỗi vùng chứa với nội dung cần thiết.

### Tạo lưới linh hoạt

Lưới của chúng ta hoạt động tốt, nhưng nó có chiều rộng cố định. Chúng ta thực sự muốn một lưới linh hoạt (fluid) sẽ phát triển và thu nhỏ với không gian có sẵn trong {{Glossary("viewport")}} trình duyệt. Để đạt được điều này chúng ta có thể chuyển đổi các chiều rộng pixel tham chiếu thành phần trăm.

Phương trình chuyển đổi chiều rộng cố định thành chiều rộng linh hoạt dựa trên phần trăm như sau.

```plain
target / context = result
```

Đối với chiều rộng cột, **chiều rộng mục tiêu** của chúng ta là 60 pixel và **ngữ cảnh** là wrapper 960 pixel. Chúng ta có thể sử dụng công thức sau để tính phần trăm.

```plain
60 / 960 = 0.0625
```

Sau đó chúng ta di chuyển dấu thập phân 2 vị trí cho chúng ta phần trăm 6.25%. Vì vậy, trong CSS chúng ta có thể thay thế chiều rộng cột 60 pixel bằng 6.25%.

Chúng ta cần làm điều tương tự với chiều rộng rãnh:

```plain
20 / 960 = 0.02083333333
```

Vì vậy chúng ta cần thay thế {{cssxref("margin-left")}} 20 pixel trên quy tắc `.col` và {{cssxref("padding-right")}} 20 pixel trên `.wrapper` bằng 2.08333333%.

#### Cập nhật lưới của chúng ta

Để bắt đầu trong phần này, hãy tạo bản sao mới của trang ví dụ trước, hoặc tạo bản sao cục bộ của mã [simple-grid-finished.html](https://github.com/mdn/learning-area/blob/main/css/css-layout/grids/simple-grid-finished.html) để sử dụng làm điểm khởi đầu.

Cập nhật quy tắc CSS thứ hai (với selector `.wrapper`) như sau:

```css
body {
  width: 90%;
  max-width: 980px;
  margin: 0 auto;
}

.wrapper {
  padding-right: 2.08333333%;
}
```

Chúng ta không chỉ cho nó một {{cssxref("width")}} phần trăm, chúng ta cũng đã thêm thuộc tính {{cssxref("max-width")}} để ngăn bố cục trở nên quá rộng.

Tiếp theo, cập nhật quy tắc CSS thứ tư (với selector `.col`) như sau:

```css
.col {
  float: left;
  margin-left: 2.08333333%;
  width: 6.25%;
  background: rgb(255 150 150);
}
```

Bây giờ đến phần hơi mất công hơn — chúng ta cần cập nhật tất cả quy tắc `.col.span` để sử dụng phần trăm thay vì chiều rộng pixel. Điều này mất một ít thời gian với máy tính; để tiết kiệm cho bạn một số nỗ lực, chúng ta đã làm điều đó cho bạn bên dưới.

Cập nhật khối quy tắc CSS ở dưới cùng với phần sau:

```css
/* Two column widths (12.5%) plus one gutter width (2.08333333%) */
.col.span2 {
  width: 14.58333333%;
}
/* Three column widths (18.75%) plus two gutter widths (4.1666666) */
.col.span3 {
  width: 22.91666666%;
}
/* And so on… */
.col.span4 {
  width: 31.24999999%;
}
.col.span5 {
  width: 39.58333332%;
}
.col.span6 {
  width: 47.91666665%;
}
.col.span7 {
  width: 56.24999998%;
}
.col.span8 {
  width: 64.58333331%;
}
.col.span9 {
  width: 72.91666664%;
}
.col.span10 {
  width: 81.24999997%;
}
.col.span11 {
  width: 89.5833333%;
}
.col.span12 {
  width: 97.91666663%;
}
```

Bây giờ hãy lưu mã, tải nó trong trình duyệt và thử thay đổi chiều rộng khung nhìn — bạn sẽ thấy chiều rộng cột điều chỉnh đẹp để phù hợp.

> [!NOTE]
> Nếu bạn gặp khó khăn khi làm cho ví dụ trên hoạt động, hãy thử so sánh nó với [phiên bản hoàn chỉnh trên GitHub](https://github.com/mdn/learning-area/blob/main/css/css-layout/grids/fluid-grid.html) ([xem nó chạy trực tiếp](https://mdn.github.io/learning-area/css/css-layout/grids/fluid-grid.html) cũng vậy).

### Tính toán dễ dàng hơn bằng hàm calc()

Bạn có thể sử dụng hàm {{cssxref("calc", "calc()")}} để thực hiện toán học ngay bên trong CSS — điều này cho phép bạn chèn các phương trình toán học đơn giản vào các giá trị CSS, để tính toán giá trị nên là bao nhiêu. Nó đặc biệt hữu ích khi có toán học phức tạp cần thực hiện, và bạn thậm chí có thể tính toán với các đơn vị khác nhau, ví dụ "Tôi muốn chiều cao của phần tử này luôn là 100% chiều cao của cha, trừ 50px". Xem [ví dụ này từ hướng dẫn MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API#keeping_the_interface_constrained_to_the_viewport_regardless_of_device_height_with_calc).

Dù sao, quay lại lưới! Bất kỳ cột nào mở rộng qua nhiều hơn một cột của lưới có tổng chiều rộng là 6.25% nhân với số cột mở rộng cộng 2.08333333% nhân với số rãnh (sẽ luôn là số cột trừ 1). Hàm `calc()` cho phép chúng ta thực hiện phép tính này ngay bên trong giá trị chiều rộng, vì vậy đối với bất kỳ mục nào mở rộng 4 cột chúng ta có thể làm điều này, ví dụ:

```css
.col.span4 {
  width: calc((6.25% * 4) + (2.08333333% * 3));
}
```

Hãy thử thay thế khối quy tắc ở dưới cùng bằng nội dung sau, sau đó tải lại nó trong trình duyệt để xem liệu bạn có nhận được kết quả tương tự không:

```css
.col.span2 {
  width: calc((6.25% * 2) + 2.08333333%);
}
.col.span3 {
  width: calc((6.25% * 3) + (2.08333333% * 2));
}
.col.span4 {
  width: calc((6.25% * 4) + (2.08333333% * 3));
}
.col.span5 {
  width: calc((6.25% * 5) + (2.08333333% * 4));
}
.col.span6 {
  width: calc((6.25% * 6) + (2.08333333% * 5));
}
.col.span7 {
  width: calc((6.25% * 7) + (2.08333333% * 6));
}
.col.span8 {
  width: calc((6.25% * 8) + (2.08333333% * 7));
}
.col.span9 {
  width: calc((6.25% * 9) + (2.08333333% * 8));
}
.col.span10 {
  width: calc((6.25% * 10) + (2.08333333% * 9));
}
.col.span11 {
  width: calc((6.25% * 11) + (2.08333333% * 10));
}
.col.span12 {
  width: calc((6.25% * 12) + (2.08333333% * 11));
}
```

> [!NOTE]
> Bạn có thể xem phiên bản hoàn chỉnh của chúng ta trong [fluid-grid-calc.html](https://github.com/mdn/learning-area/blob/main/css/css-layout/grids/fluid-grid-calc.html) (cũng [xem trực tiếp](https://mdn.github.io/learning-area/css/css-layout/grids/fluid-grid-calc.html)).

### Hệ thống lưới ngữ nghĩa và "không ngữ nghĩa"

Thêm các class vào markup để định nghĩa bố cục có nghĩa là nội dung và markup của bạn trở nên gắn kết với biểu hiện trực quan của bạn. Bạn sẽ đôi khi nghe việc sử dụng các class CSS này được mô tả là "không ngữ nghĩa" — mô tả cách nội dung trông như thế nào — thay vì sử dụng ngữ nghĩa của các class mô tả nội dung. Đây là trường hợp với các class `span2`, `span3`, v.v.

Đây không phải là cách tiếp cận duy nhất. Thay vào đó bạn có thể quyết định về lưới và sau đó thêm thông tin kích thước vào các quy tắc cho các class ngữ nghĩa hiện có. Ví dụ, nếu bạn có một {{htmlelement("div")}} với class `content` trên đó mà bạn muốn mở rộng 8 cột, bạn có thể sao chép chiều rộng từ class `span8`, cung cấp cho bạn quy tắc như sau:

```css
.content {
  width: calc((6.25% * 8) + (2.08333333% * 7));
}
```

> [!NOTE]
> Nếu bạn sử dụng bộ tiền xử lý như [Sass](https://sass-lang.com/), bạn có thể tạo một mixin đơn giản để chèn giá trị đó cho bạn.

### Kích hoạt vùng chứa offset trong lưới

Lưới chúng ta đã tạo hoạt động tốt miễn là chúng ta muốn bắt đầu tất cả các vùng chứa ở phía bên trái của lưới. Nếu chúng ta muốn để trống một khoảng cột trước vùng chứa đầu tiên — hoặc giữa các vùng chứa — chúng ta sẽ cần tạo một class offset để thêm lề trái vào trang web để đẩy nó qua lưới về mặt trực quan. Thêm toán học!

Hãy thử điều này.

Bắt đầu với mã trước, hoặc sử dụng tệp [fluid-grid.html](https://github.com/mdn/learning-area/blob/main/css/css-layout/grids/fluid-grid.html) làm điểm khởi đầu.

Hãy tạo một class trong CSS sẽ offset một phần tử vùng chứa một chiều rộng cột. Thêm phần sau vào cuối CSS:

```css
.offset-by-one {
  margin-left: calc(6.25% + (2.08333333% * 2));
}
```

Hoặc nếu bạn muốn tự tính phần trăm, hãy sử dụng cái này:

```css
.offset-by-one {
  margin-left: 10.41666666%;
}
```

Bây giờ bạn có thể thêm class này vào bất kỳ vùng chứa nào bạn muốn để lại một khoảng trống rộng một cột ở phía bên trái. Ví dụ, nếu bạn có điều này trong HTML:

```html
<div class="col span6">14</div>
```

Hãy thử thay thế bằng

```html
<div class="col span5 offset-by-one">14</div>
```

> [!NOTE]
> Lưu ý rằng bạn cần giảm số cột mở rộng, để tạo chỗ cho offset!

Hãy thử tải và làm mới để xem sự khác biệt, hoặc xem ví dụ [fluid-grid-offset.html](https://github.com/mdn/learning-area/blob/main/css/css-layout/grids/fluid-grid-offset.html) của chúng ta (xem nó [chạy trực tiếp](https://mdn.github.io/learning-area/css/css-layout/grids/fluid-grid-offset.html) cũng vậy). Ví dụ hoàn chỉnh sẽ trông như thế này:

![Lưới có 2 hàng. Hàng đầu tiên có 12 mục lưới có chiều rộng bằng nhau và hàng thứ hai có 4 mục có chiều rộng khác nhau. Mục 13 chiếm 1 cột, mục 14 chiếm năm cột, 15 chiếm ba, và 16 chiếm hai. Mục 14 có class 'offset-by-one' được áp dụng, nghĩa là nó bắt đầu ở cột thứ 3, thay vì thứ hai, để lại một khoảng trống rộng một cột ở cột thứ hai của hàng thứ hai.](offset-grid-finished.png)

> [!NOTE]
> Như một bài tập thêm, bạn có thể triển khai class `offset-by-two` không?

### Hạn chế của lưới float

Khi sử dụng một hệ thống như thế này, bạn cần chú ý rằng tổng chiều rộng của bạn cộng lại đúng, và bạn không bao gồm các phần tử trong một hàng mở rộng qua nhiều cột hơn hàng có thể chứa. Do cách floats hoạt động, nếu số cột lưới trở nên quá rộng cho lưới, các phần tử ở cuối sẽ rơi xuống dòng tiếp theo, làm hỏng lưới.

Ngoài ra hãy ghi nhớ rằng nếu nội dung của các phần tử trở nên rộng hơn các hàng chúng chiếm, nó sẽ tràn ra và trông lộn xộn.

Hạn chế lớn nhất của hệ thống này là về cơ bản nó là một chiều. Chúng ta đang xử lý các cột và mở rộng các phần tử qua các cột, nhưng không phải hàng. Rất khó với các phương pháp bố cục cũ hơn này để kiểm soát chiều cao của các phần tử mà không đặt chiều cao rõ ràng, và đây cũng là cách tiếp cận rất kém linh hoạt — nó chỉ hoạt động nếu bạn có thể đảm bảo nội dung của bạn sẽ có chiều cao nhất định.

## Lưới Flexbox?

Nếu bạn đọc bài viết trước về [flexbox](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox), bạn có thể nghĩ rằng flexbox là giải pháp lý tưởng để tạo hệ thống lưới. Có nhiều hệ thống lưới dựa trên flexbox và flexbox có thể giải quyết nhiều vấn đề chúng ta đã phát hiện khi tạo lưới ở trên.

Tuy nhiên, flexbox không bao giờ được thiết kế như một hệ thống lưới và đặt ra một tập hợp thách thức mới khi được sử dụng như vậy. Là ví dụ đơn giản, chúng ta có thể lấy cùng markup ví dụ chúng ta đã sử dụng ở trên và sử dụng CSS sau để tạo kiểu cho các class `wrapper`, `row` và `col`:

```css
body {
  width: 90%;
  max-width: 980px;
  margin: 0 auto;
}

.wrapper {
  padding-right: 2.08333333%;
}

.row {
  display: flex;
}

.col {
  margin-left: 2.08333333%;
  margin-bottom: 1em;
  width: 6.25%;
  flex: 1 1 auto;
  background: rgb(255 150 150);
}
```

Bạn có thể thử thực hiện các thay thế này trong ví dụ của riêng bạn, hoặc xem mã ví dụ [flexbox-grid.html](https://github.com/mdn/learning-area/blob/main/css/css-layout/grids/flexbox-grid.html) (xem nó [chạy trực tiếp](https://mdn.github.io/learning-area/css/css-layout/grids/flexbox-grid.html) cũng vậy).

Ở đây chúng ta đang biến mỗi hàng thành vùng chứa flex. Với lưới dựa trên flexbox, chúng ta vẫn cần các hàng để cho phép chúng ta có các phần tử cộng lại ít hơn 100%. Chúng ta đặt vùng chứa đó thành `display: flex`.

Trên `.col` chúng ta đặt giá trị đầu tiên ({{cssxref("flex-grow")}}) của thuộc tính {{cssxref("flex")}} thành 1 để các mục của chúng ta có thể phát triển, giá trị thứ hai ({{cssxref("flex-shrink")}}) thành 1 để các mục có thể thu nhỏ, và giá trị thứ ba ({{cssxref("flex-basis")}}) thành `auto`. Vì phần tử của chúng ta có {{cssxref("width")}} được đặt, `auto` sẽ sử dụng chiều rộng đó làm giá trị `flex-basis`.

Trên hàng trên cùng chúng ta có mười hai hộp gọn gàng trên lưới và chúng phát triển và thu nhỏ đều nhau khi chúng ta thay đổi chiều rộng khung nhìn. Tuy nhiên trên hàng tiếp theo, chúng ta chỉ có bốn mục và chúng cũng phát triển và thu nhỏ từ cơ sở 60px đó. Với chỉ bốn mục chúng có thể phát triển nhiều hơn nhiều so với các mục trong hàng trên cùng, kết quả là chúng tất cả chiếm cùng chiều rộng trên hàng thứ hai.

![Lưới có hai hàng. Mỗi hàng là vùng chứa flex. Hàng đầu tiên có mười hai mục flex có chiều rộng bằng nhau. Hàng thứ hai có bốn mục flex có chiều rộng bằng nhau.](flexbox-grid-incomplete.png)

Để sửa điều này, chúng ta vẫn cần bao gồm các class `span` để cung cấp chiều rộng sẽ thay thế giá trị được sử dụng bởi `flex-basis` cho phần tử đó.

Chúng cũng không tôn trọng lưới được sử dụng bởi các mục ở trên vì chúng không biết gì về nó.

Flexbox về thiết kế là **một chiều**. Nó xử lý một chiều, chiều của một hàng hoặc một cột. Chúng ta không thể tạo lưới nghiêm ngặt cho các cột và hàng, nghĩa là nếu chúng ta sử dụng flexbox cho lưới, chúng ta vẫn cần tính phần trăm như với bố cục float.

Trong dự án của bạn, bạn vẫn có thể chọn sử dụng lưới flexbox do khả năng căn lề và phân phối không gian bổ sung mà flexbox cung cấp so với floats. Tuy nhiên, bạn nên biết rằng bạn vẫn đang sử dụng công cụ cho mục đích khác với những gì nó được thiết kế. Vì vậy bạn có thể cảm thấy như nó đang khiến bạn phải vượt qua các rào cản thêm để đạt được kết quả cuối cùng bạn muốn.

## Hệ thống lưới bên thứ ba

Bây giờ khi chúng ta hiểu toán học đằng sau các phép tính lưới, chúng ta đang ở vị trí tốt để xem xét một số hệ thống lưới bên thứ ba thường được sử dụng. Nếu bạn tìm kiếm "CSS grid framework" trên Web, bạn sẽ tìm thấy một danh sách lớn các tùy chọn để lựa chọn. Các framework phổ biến như [Bootstrap](https://getbootstrap.com/) và [Foundation](https://get.foundation/) bao gồm một hệ thống lưới. Cũng có các hệ thống lưới độc lập, được phát triển bằng CSS hoặc sử dụng bộ tiền xử lý.

Hãy xem một trong các hệ thống độc lập này vì nó minh họa các kỹ thuật phổ biến để làm việc với framework lưới. Lưới chúng ta sẽ sử dụng là một phần của Skeleton, một framework CSS đơn giản.

Để bắt đầu hãy truy cập [trang web Skeleton](http://getskeleton.com/), và chọn "Download" để tải xuống tệp ZIP. Giải nén tệp này và sao chép skeleton.css và normalize.css vào một thư mục mới.

Tạo bản sao của tệp [html-skeleton.html](https://github.com/mdn/learning-area/blob/main/css/css-layout/grids/html-skeleton.html) và lưu nó vào cùng thư mục với skeleton và normalize CSS.

Bao gồm skeleton và normalize CSS trong trang HTML, bằng cách thêm phần sau vào head:

```html
<link href="normalize.css" rel="stylesheet" />
<link href="skeleton.css" rel="stylesheet" />
```

Skeleton bao gồm nhiều hơn một hệ thống lưới — nó cũng chứa CSS cho typography và các phần tử trang khác mà bạn có thể sử dụng làm điểm khởi đầu. Chúng ta sẽ để những thứ này ở mặc định hiện tại — đây là lưới mà chúng ta thực sự quan tâm.

> [!NOTE]
> [Normalize](https://necolas.github.io/normalize.css/) là một thư viện CSS nhỏ rất hữu ích được viết bởi Nicolas Gallagher, tự động thực hiện một số sửa chữa bố cục cơ bản hữu ích và làm cho kiểu dáng phần tử mặc định nhất quán hơn trên các trình duyệt.

Chúng ta sẽ sử dụng HTML tương tự như ví dụ trước. Thêm phần sau vào body HTML:

```html
<div class="container">
  <div class="row">
    <div class="col">1</div>
    <div class="col">2</div>
    <div class="col">3</div>
    <div class="col">4</div>
    <div class="col">5</div>
    <div class="col">6</div>
    <div class="col">7</div>
    <div class="col">8</div>
    <div class="col">9</div>
    <div class="col">10</div>
    <div class="col">11</div>
    <div class="col">12</div>
  </div>
  <div class="row">
    <div class="col">13</div>
    <div class="col">14</div>
    <div class="col">15</div>
    <div class="col">16</div>
  </div>
</div>
```

Để bắt đầu sử dụng Skeleton, chúng ta cần cho wrapper {{htmlelement("div")}} một class `container` — điều này đã được bao gồm trong HTML. Điều này căn giữa nội dung với chiều rộng tối đa 960 pixel. Bạn có thể thấy các hộp bây giờ không bao giờ trở nên rộng hơn 960 pixel.

Bạn có thể xem trong tệp skeleton.css để thấy CSS được sử dụng khi chúng ta áp dụng class này. `<div>` được căn giữa sử dụng `auto` lề trái và phải, và đệm 20 pixel được áp dụng trái và phải. Skeleton cũng đặt thuộc tính {{cssxref("box-sizing")}} thành `border-box` như chúng ta đã làm trước, vì vậy đệm và viền của phần tử này sẽ được bao gồm trong tổng chiều rộng.

```css
.container {
  position: relative;
  width: 100%;
  max-width: 960px;
  margin: 0 auto;
  padding: 0 20px;
  box-sizing: border-box;
}
```

Các phần tử chỉ có thể là một phần của lưới nếu chúng nằm trong một hàng, vì vậy như ví dụ trước chúng ta cần thêm `<div>` hoặc phần tử khác với class `row` được lồng giữa các phần tử `<div>` nội dung và vùng chứa `<div>`. Chúng ta đã làm điều đó rồi.

Bây giờ hãy bố cục các hộp vùng chứa. Skeleton dựa trên lưới 12 cột. Các hộp hàng trên cùng tất cả cần các class `one column` để làm chúng mở rộng một cột.

Thêm những thứ này bây giờ, như được hiển thị trong đoạn sau:

```html
<div class="container">
  <div class="row">
    <div class="one column">1</div>
    <div class="one column">2</div>
    <div class="one column">3</div>
    /* and so on */
  </div>
</div>
```

Tiếp theo, cho các vùng chứa trên hàng thứ hai các class giải thích số cột chúng nên mở rộng, như sau:

```html
<div class="row">
  <div class="one column">13</div>
  <div class="six columns">14</div>
  <div class="three columns">15</div>
  <div class="two columns">16</div>
</div>
```

Hãy thử lưu tệp HTML và tải nó trong trình duyệt để xem hiệu ứng.

> [!NOTE]
> Nếu bạn gặp khó khăn khi làm cho ví dụ này hoạt động, hãy thử mở rộng cửa sổ bạn đang sử dụng để xem nó (lưới sẽ không được hiển thị như được mô tả ở đây nếu cửa sổ quá hẹp). Nếu điều đó không hoạt động, hãy thử so sánh nó với tệp [html-skeleton-finished.html](https://github.com/mdn/learning-area/blob/main/css/css-layout/grids/html-skeleton-finished.html) (xem nó [chạy trực tiếp](https://mdn.github.io/learning-area/css/css-layout/grids/html-skeleton-finished.html) cũng vậy).

Nếu bạn xem trong tệp skeleton.css bạn có thể thấy cách này hoạt động. Ví dụ, Skeleton có định nghĩa sau để tạo kiểu cho các phần tử với class "three columns" được thêm vào.

```css
.three.columns {
  width: 22%;
}
```

Tất cả những gì Skeleton (hoặc bất kỳ framework lưới nào khác) đang làm là thiết lập các class được định nghĩa sẵn mà bạn có thể sử dụng bằng cách thêm chúng vào markup. Nó hoàn toàn giống như nếu bạn tự làm công việc tính toán phần trăm này.

Như bạn có thể thấy, chúng ta cần viết rất ít CSS khi sử dụng Skeleton. Nó xử lý tất cả floats cho chúng ta khi chúng ta thêm các class vào markup. Chính khả năng chuyển giao trách nhiệm bố cục cho thứ gì đó khác đã làm cho việc sử dụng framework cho hệ thống lưới là lựa chọn hấp dẫn! Tuy nhiên ngày nay, với bố cục lưới CSS, nhiều nhà phát triển đang rời bỏ các framework này để sử dụng lưới gốc tích hợp mà CSS cung cấp.

## Tóm tắt

Bây giờ bạn hiểu cách các hệ thống lưới khác nhau được tạo, điều này sẽ hữu ích khi làm việc với các trang web cũ và trong việc hiểu sự khác biệt giữa lưới gốc của bố cục lưới CSS và các hệ thống cũ hơn này.
