---
title: Hình ảnh, phương tiện và phần tử biểu mẫu
short-title: Hình ảnh, phương tiện, biểu mẫu
slug: Learn_web_development/Core/Styling_basics/Images_media_forms
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Size_decorate_content_panel", "Learn_web_development/Core/Styling_basics/Test_your_skills/Images", "Learn_web_development/Core/Styling_basics")}}

Trong bài học này, chúng ta sẽ xem xét cách một số phần tử đặc biệt được xử lý trong CSS. Hình ảnh, phương tiện khác, và các phần tử biểu mẫu hoạt động hơi khác so với các hộp thông thường về khả năng tạo kiểu chúng với CSS. Hiểu những gì có thể và không thể làm được có thể giúp tránh một số bực bội, và bài học này sẽ làm nổi bật một số điều chính bạn cần biết.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        HTML <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_images"
          >hình ảnh</a
        >, <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio"
          >video</a
        >, và <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_forms"
          >biểu mẫu</a
        >. CSS <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units">Giá trị và đơn vị</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Sizing">Kích thước</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Hiểu cách các phần tử thay thế được kích thước và bố cục.</li>
          <li>Tạo kiểu cơ bản cho các phần tử biểu mẫu dễ tạo kiểu, như ô nhập văn bản.</li>
          <li>Sử dụng CSS reset làm cơ sở để tạo kiểu cho các phần tử khó như biểu mẫu.</li>
          <li>Hiểu rằng không phải tất cả các phần tử biểu mẫu đều dễ tạo kiểu, và lý do tại sao.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Phần tử thay thế

Hình ảnh và video được mô tả là **{{ glossary("replaced elements")}}** (phần tử thay thế). Điều này có nghĩa là CSS không thể ảnh hưởng đến bố cục bên trong của những phần tử này — chỉ vị trí của chúng trên trang trong số các phần tử khác. Tuy nhiên, như chúng ta sẽ thấy, có nhiều thứ CSS có thể làm với hình ảnh.

Một số phần tử thay thế, chẳng hạn như hình ảnh và video, cũng được mô tả là có **{{glossary("aspect ratio")}}** (tỷ lệ khung hình). Điều này có nghĩa là nó có kích thước ở cả chiều ngang (x) và chiều dọc (y), và sẽ được hiển thị bằng các kích thước nội tại của tệp theo mặc định.

## Kích thước hình ảnh

Như bạn đã biết khi theo dõi các bài học này, mọi thứ trong CSS đều tạo ra hộp. Nếu bạn đặt hình ảnh trong hộp nhỏ hơn hoặc lớn hơn kích thước nội tại của tệp hình ảnh theo bất kỳ hướng nào, nó sẽ xuất hiện nhỏ hơn hộp, hoặc tràn ra ngoài hộp. Bạn cần đưa ra quyết định về điều gì xảy ra với phần tràn.

Trong ví dụ bên dưới, chúng ta có hai hộp, cả hai đều có kích thước 200 pixel:

- Một chứa hình ảnh nhỏ hơn 200 pixel — nó nhỏ hơn hộp và không kéo giãn để lấp đầy.
- Hộp kia lớn hơn 200 pixel và tràn ra ngoài hộp.

```html live-sample___size
<div class="wrapper">
  <div class="box">
    <img
      alt="star"
      src="https://mdn.github.io/shared-assets/images/examples/big-star.png" />
  </div>
  <div class="box">
    <img
      alt="balloons"
      src="https://mdn.github.io/shared-assets/images/examples/balloons.jpg" />
  </div>
</div>
```

```css live-sample___size
.wrapper {
  display: flex;
  align-items: flex-start;
}

.wrapper > * {
  margin: 20px;
}

.box {
  border: 5px solid darkblue;
  width: 200px;
}

img {
}
```

{{EmbedLiveSample("size", "", "250px")}}

Chúng ta có thể làm gì về vấn đề tràn?

Như chúng ta đã học trong [Kích thước các mục trong CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Sizing), một kỹ thuật phổ biến là đặt {{cssxref("max-width")}} của hình ảnh thành `100%`. Điều này sẽ cho phép hình ảnh trở nên nhỏ hơn hộp nhưng không lớn hơn. Kỹ thuật này cũng hoạt động với các phần tử thay thế khác như [`<video>`](/en-US/docs/Web/HTML/Reference/Elements/video) hoặc [`<iframe>`](/en-US/docs/Web/HTML/Reference/Elements/iframe).

Hãy thử thêm `max-width: 100%` vào quy tắc phần tử `<img>` trong ví dụ trên. Bạn sẽ thấy rằng hình ảnh nhỏ hơn vẫn không thay đổi, nhưng hình ảnh lớn hơn trở nên nhỏ hơn để vừa vào hộp.

### Xử lý vấn đề hiển thị hình ảnh với `object-fit`

Ví dụ trên tiết lộ một bộ vấn đề khác khi hiển thị hình ảnh bên trong các vùng chứa. Bạn sẽ nhận thấy rằng, sau khi bạn đặt `max-width: 100%` trên các hình ảnh, hình ảnh thứ hai không lấp đầy hoàn toàn vùng chứa của nó; có một khoảng cách ở phía dưới. Điều này là do việc cung cấp cho hình ảnh một chiều rộng cụ thể khiến chiều cao của nó được đặt để {{glossary("aspect ratio")}} của nó được giữ nguyên.

Làm thế nào chúng ta có thể kích thước hình ảnh để nó hoàn toàn bao phủ vùng chứa của nó? Chúng ta có thể đặt vùng chứa có `width` _và_ `height` cố định, sau đó đặt hình ảnh có `width` và `height` là `100%`, như trong ví dụ tiếp theo:

```html live-sample___object-fit1
<div class="box">
  <img
    alt="balloons"
    src="https://mdn.github.io/shared-assets/images/examples/balloons.jpg" />
</div>
```

```css live-sample___object-fit1
.box {
  border: 5px solid darkblue;
  width: 200px;
  height: 200px;
  margin: 20px;
}

img {
  width: 100%;
  height: 100%;
}
```

{{EmbedLiveSample("object-fit1", "", "250px")}}

Tuy nhiên, hình ảnh bị méo vì tỷ lệ khung hình của nó đã bị thay đổi — nó trông bị _kéo giãn_. Để khắc phục điều này, bạn có thể sử dụng thuộc tính {{cssxref("object-fit")}}, đặt cách hình ảnh được thay đổi kích thước để vừa vào vùng chứa (phần tử `<img>`). Thuộc tính `object-fit` có thể nhận một số giá trị khác nhau, hữu ích nhất là:

- `cover`: Hình ảnh lấp đầy hoàn toàn phần tử `<img>` trong khi duy trì tỷ lệ khung hình của nó, do đó một số phần của hình ảnh không được hiển thị.
- `contain`: Hình ảnh vừa hoàn toàn bên trong phần tử `<img>` trong khi duy trì tỷ lệ khung hình của nó, do đó một số phần của phần tử `<img>` không được lấp đầy. Điều này dẫn đến "letterboxing" hoặc "pillarboxing".

Ví dụ tiếp theo cho thấy các giá trị `cover` và `contain` được đặt trên hai bản sao của hình ảnh hiển thị trong ví dụ trước, vì vậy bạn có thể thấy hiệu ứng của chúng:

```html live-sample___object-fit
<div class="wrapper">
  <div class="box">
    <img
      alt="balloons"
      class="cover"
      src="https://mdn.github.io/shared-assets/images/examples/balloons.jpg" />
  </div>
  <div class="box">
    <img
      alt="balloons"
      class="contain"
      src="https://mdn.github.io/shared-assets/images/examples/balloons.jpg" />
  </div>
</div>
```

```css live-sample___object-fit
.wrapper {
  display: flex;
  align-items: flex-start;
}

.wrapper > * {
  margin: 20px;
}

.box {
  border: 5px solid darkblue;
  width: 200px;
  height: 200px;
}

img {
  height: 100%;
  width: 100%;
}

.cover {
  object-fit: cover;
}

.contain {
  object-fit: contain;
}
```

{{EmbedLiveSample("object-fit", "", "250px")}}

> [!NOTE]
> Các điểm chính cần ghi nhớ ở đây là:
>
> 1. Thuộc tính `object-fit` thay đổi kích thước chính hình ảnh để vừa bên trong phần tử `<img>` đang nhúng nó vào trang
> 2. Phần tử `<img>` cần được thay đổi kích thước để `object-fit` có hiệu lực.
>
> Nếu phần tử `<img>` không được thay đổi kích thước, hình ảnh sẽ được hiển thị ở kích thước gốc (hoặc _nội tại_) và tỷ lệ khung hình của nó, do đó `object-fit` sẽ không có hiệu lực.

## Phần tử thay thế trong bố cục

Khi sử dụng các kỹ thuật bố cục CSS khác nhau trên các phần tử thay thế, bạn có thể thấy rằng chúng hoạt động hơi khác so với các phần tử khác. Ví dụ, trong bố cục lưới, các phần tử được kéo giãn theo mặc định để lấp đầy toàn bộ [vùng lưới](/en-US/docs/Glossary/Grid_Areas) của chúng. Hình ảnh không kéo giãn; thay vào đó, chúng được căn chỉnh đến đầu vùng lưới của chúng.

Bạn có thể thấy điều này xảy ra trong ví dụ bên dưới nơi chúng ta có vùng chứa lưới hai cột, hai hàng, có bốn mục trong đó. Tất cả các phần tử `<div>` có màu nền và kéo giãn để lấp đầy hàng và cột. Tuy nhiên, hình ảnh không kéo giãn.

```html live-sample___layout
<div class="wrapper">
  <img
    alt="star"
    src="https://mdn.github.io/shared-assets/images/examples/big-star.png" />
  <div></div>
  <div></div>
  <div></div>
</div>
```

```css live-sample___layout
.wrapper {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 100px 100px;
  gap: 20px;
}

.wrapper > div {
  background-color: rebeccapurple;
  border-radius: 0.5em;
}
```

{{EmbedLiveSample("layout", "", "220px")}}

Bạn sẽ không học bố cục cho đến mô-đun sau. Hiện tại, chỉ cần ghi nhớ rằng các phần tử thay thế, khi chúng trở thành một phần của hệ thống bố cục cụ thể như grid hoặc flexbox, có các hành vi mặc định khác, về cơ bản để tránh chúng bị kéo giãn kỳ lạ bởi bố cục.

## Phần tử biểu mẫu

Các phần tử biểu mẫu có vấn đề khi tạo kiểu bằng CSS. [Mô-đun mở rộng Web Forms](/en-US/docs/Learn_web_development/Extensions/Forms) bao gồm các khía cạnh khó khăn hơn của việc tạo kiểu cho một số kiểu đầu vào biểu mẫu, mà chúng ta sẽ không đi vào ở đây. Tuy nhiên, có một vài điều cơ bản quan trọng đáng làm nổi bật trong phần này.

Nhiều điều khiển biểu mẫu được thêm vào trang của bạn thông qua phần tử [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input) — điều này xác định các trường biểu mẫu đơn giản như ô nhập văn bản, thông qua các trường phức tạp hơn như bộ chọn màu và ngày. Có một số phần tử bổ sung, như [`<textarea>`](/en-US/docs/Web/HTML/Reference/Elements/textarea) cho nhập văn bản nhiều dòng, và cũng các phần tử được sử dụng để chứa và nhãn các phần của biểu mẫu như [`<fieldset>`](/en-US/docs/Web/HTML/Reference/Elements/fieldset) và [`<legend>`](/en-US/docs/Web/HTML/Reference/Elements/legend).

HTML cũng chứa các thuộc tính cho phép các nhà phát triển web chỉ ra trường nào là bắt buộc, và thậm chí loại nội dung cần được nhập. Nếu người dùng nhập điều gì đó không mong đợi, hoặc để trống trường bắt buộc, trình duyệt có thể hiển thị thông báo lỗi. Các trình duyệt khác nhau về mức độ tạo kiểu và tùy chỉnh mà chúng cho phép cho các mục đó.

## Tạo kiểu phần tử nhập văn bản

Các phần tử cho phép nhập văn bản như `<input type="text">`, cụ thể hơn là `<input type="email">`, và phần tử `<textarea>`, khá dễ tạo kiểu và có xu hướng hoạt động giống như các hộp khác trên trang của bạn. Tuy nhiên, tạo kiểu mặc định của những phần tử này sẽ khác nhau, dựa trên hệ điều hành và trình duyệt mà người dùng của bạn truy cập trang web.

Trong ví dụ bên dưới, chúng ta đã tạo kiểu cho một số ô nhập văn bản bằng CSS. Bạn có thể thấy rằng các thứ như đường viền, lề và khoảng đệm đều áp dụng như bạn mong đợi. Chúng ta đang sử dụng bộ chọn thuộc tính để nhắm mục tiêu các kiểu nhập khác nhau.

Hãy thử chỉnh sửa ví dụ để thay đổi giao diện của biểu mẫu bằng cách điều chỉnh đường viền, thêm màu nền vào các trường, và thay đổi phông chữ và khoảng đệm.

```html live-sample___form
<form>
  <div><label for="name">Name</label> <input id="name" type="text" /></div>
  <div><label for="email">Email</label> <input id="email" type="email" /></div>

  <div class="buttons"><input type="submit" value="Submit" /></div>
</form>
```

```css hidden live-sample___form
body {
  font-family: sans-serif;
}
form > div {
  display: flex;
}

label {
  width: 10em;
}

.buttons {
  justify-content: center;
}
```

```css live-sample___form
input[type="text"],
input[type="email"] {
  border: 2px solid black;
  margin-bottom: 1em;
  padding: 10px;
  width: 80%;
}

input[type="submit"] {
  border: 3px solid #333333;
  background-color: #999999;
  border-radius: 5px;
  padding: 10px 2em;
  font-weight: bold;
  color: white;
}

input[type="submit"]:hover,
input[type="submit"]:focus {
  background-color: #333333;
}
```

{{EmbedLiveSample("form")}}

> [!WARNING]
> Bạn nên cẩn thận khi thay đổi tạo kiểu của các phần tử biểu mẫu để đảm bảo người dùng vẫn rõ ràng rằng chúng là các phần tử biểu mẫu. Bạn có thể tạo một ô nhập biểu mẫu không có đường viền và nền gần như không thể phân biệt với nội dung xung quanh, nhưng điều này sẽ làm cho nó rất khó để nhận ra và tương tác.

Nhiều kiểu nhập phức tạp hơn được hiển thị bởi hệ điều hành và không thể truy cập để tạo kiểu. Do đó, bạn nên luôn giả sử rằng các biểu mẫu sẽ trông khá khác nhau đối với những khách truy cập khác nhau và kiểm tra các biểu mẫu phức tạp trong nhiều trình duyệt.

## Chuẩn hóa hành vi biểu mẫu

Các phần tử biểu mẫu hoạt động khác nhau trên các trình duyệt và hệ điều hành khác nhau. Phần này xem xét một số vấn đề phổ biến nhất và cung cấp các chiến lược để xử lý chúng.

### Kế thừa và phần tử biểu mẫu

Trong một số trình duyệt, các phần tử biểu mẫu không kế thừa tạo kiểu phông chữ theo mặc định. Do đó, nếu bạn muốn chắc chắn rằng các trường biểu mẫu của bạn sử dụng phông chữ được xác định trên phần tử body, hoặc trên phần tử cha, bạn nên thêm quy tắc này vào CSS của mình.

```css
button,
input,
select,
textarea {
  font-family: inherit;
  font-size: 100%;
}
```

### Phần tử biểu mẫu và box-sizing

Trên các trình duyệt, các phần tử biểu mẫu sử dụng các quy tắc kích thước hộp khác nhau cho các tiện ích khác nhau. Bạn đã học về thuộc tính `box-sizing` trong [bài học mô hình hộp của chúng ta](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model) và bạn có thể sử dụng kiến thức này khi tạo kiểu biểu mẫu để đảm bảo trải nghiệm nhất quán khi đặt chiều rộng và chiều cao trên các phần tử biểu mẫu.

Để nhất quán, tốt nhất là đặt lề và khoảng đệm thành `0` trên tất cả các phần tử, sau đó thêm lại khi tạo kiểu cho các điều khiển cụ thể:

```css
button,
input,
select,
textarea {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}
```

### Các cài đặt hữu ích khác

Ngoài các quy tắc được đề cập ở trên, bạn cũng nên đặt `overflow: auto` trên các phần tử `<textarea>` để ngăn một số trình duyệt cũ hiển thị thanh cuộn khi không cần thiết:

```css
textarea {
  overflow: auto;
}
```

### Kết hợp tất cả lại thành "reset"

Như bước cuối cùng, chúng ta có thể gói lại các thuộc tính khác nhau được thảo luận ở trên thành "form reset" sau đây để cung cấp cơ sở nhất quán để làm việc. Điều này bao gồm tất cả các mục được đề cập trong ba phần trước:

```css
button,
input,
select,
textarea {
  font-family: inherit;
  font-size: 100%;
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}

textarea {
  overflow: auto;
}
```

> [!NOTE]
> Các stylesheet chuẩn hóa được sử dụng bởi nhiều nhà phát triển để tạo một tập hợp các kiểu cơ sở để sử dụng trên tất cả các dự án. Thường thì những thứ này làm những điều tương tự như những gì được mô tả ở trên, đảm bảo rằng bất cứ điều gì khác nhau trên các trình duyệt được đặt thành mặc định nhất quán trước khi bạn thực hiện công việc của riêng mình trên CSS. Chúng không còn quan trọng như trước đây, vì các trình duyệt thường nhất quán hơn trong quá khứ. Tuy nhiên, nếu bạn muốn xem một ví dụ, hãy xem [Normalize.css](https://necolas.github.io/normalize.css/), đây là một stylesheet rất phổ biến được sử dụng làm cơ sở bởi nhiều dự án.

## Tóm tắt

Bài học này đã làm nổi bật một số điểm khác biệt bạn sẽ gặp khi làm việc với hình ảnh, phương tiện và các phần tử bất thường khác trong CSS.

Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ hiểu và ghi nhớ thông tin chúng ta đã cung cấp về xử lý hình ảnh và phần tử biểu mẫu trong CSS.

## Xem thêm

- [Tạo kiểu web forms](/en-US/docs/Learn_web_development/Extensions/Forms/Styling_web_forms)
- [Tạo kiểu biểu mẫu nâng cao](/en-US/docs/Learn_web_development/Extensions/Forms/Advanced_form_styling)

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Size_decorate_content_panel", "Learn_web_development/Core/Styling_basics/Test_your_skills/Images", "Learn_web_development/Core/Styling_basics")}}
