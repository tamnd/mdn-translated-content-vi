---
title: Nền và đường viền
slug: Learn_web_development/Core/Styling_basics/Backgrounds_and_borders
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Sizing", "Learn_web_development/Core/Styling_basics/Test_your_skills/Backgrounds_and_borders", "Learn_web_development/Core/Styling_basics")}}

Trong bài học này, chúng ta sẽ xem xét một số điều sáng tạo mà bạn có thể làm với nền và đường viền CSS. Từ việc thêm gradient, hình ảnh nền và góc bo tròn, nền và đường viền là câu trả lời cho nhiều câu hỏi tạo kiểu trong CSS.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về HTML (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >), <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units">Giá trị và đơn vị CSS</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Sizing">Kích thước CSS</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Tạo kiểu nền cơ bản — màu sắc và hình ảnh.</li>
          <li>Kích thước, lặp lại, vị trí và đính kèm hình ảnh nền.</li>
          <li>Gradient nền — khái niệm chung và gradient tuyến tính (gradient hướng tâm, hình nón và lặp lại là nâng cao hơn; không cần kiến thức chuyên sâu ở giai đoạn này.)</li>
          <li>Các cân nhắc về khả năng tiếp cận của nền — đảm bảo độ tương phản tốt.</li>
          <li>Kiến thức cơ bản về đường viền — chiều rộng, kiểu, màu và thuộc tính viết tắt đường viền. Bán kính đường viền cho góc bo tròn.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Màu nền

Thuộc tính {{cssxref("background-color")}} xác định màu nền trên bất kỳ phần tử nào trong CSS. Thuộc tính chấp nhận bất kỳ {{cssxref("&lt;color&gt;")}} hợp lệ nào. `background-color` mở rộng xuống bên dưới hộp nội dung và hộp phần đệm của phần tử.

Trong ví dụ bên dưới, chúng ta đã sử dụng các giá trị màu khác nhau để thêm màu nền cho hộp, tiêu đề và phần tử {{htmlelement("span")}}.

Hãy thử chỉnh sửa ví dụ và hoán đổi các màu được chỉ định với bất kỳ giá trị {{cssxref("&lt;color&gt;")}} nào có sẵn.

```html live-sample___color
<div class="box">
  <h2>Background Colors</h2>
  <p>Try changing the background <span>colors</span>.</p>
</div>
```

```css live-sample___color
.box {
  padding: 0.3em;
  background-color: #567895;
}

h2 {
  background-color: black;
  color: white;
}
span {
  background-color: rgb(255 255 255 / 50%);
}
```

{{EmbedLiveSample("color")}}

## Hình ảnh nền

Thuộc tính {{cssxref("background-image")}} cho phép hiển thị hình ảnh ở nền của phần tử. Trong ví dụ bên dưới, chúng ta có hai hộp — một hộp có hình ảnh nền lớn hơn hộp ([balloons.jpg](https://mdn.github.io/shared-assets/images/examples/balloons.jpg)). Hộp kia có hình ảnh nhỏ của một ngôi sao duy nhất ([star.png](https://mdn.github.io/shared-assets/images/examples/star.png)).

Ví dụ này minh họa hai điều về hình ảnh nền. Theo mặc định, hình ảnh lớn không được thu nhỏ để vừa với hộp, vì vậy chúng ta chỉ thấy một góc nhỏ của nó, trong khi hình ảnh nhỏ được lát để lấp đầy hộp.

```html live-sample___background-image
<div class="wrapper">
  <div class="box a"></div>
  <div class="box b"></div>
</div>
```

```css live-sample___background-image
.wrapper {
  display: flex;
}

.box {
  width: 200px;
  height: 80px;
  padding: 0.5em;
  border: 1px solid #cccccc;
  margin: 20px;
}

.a {
  background-image: url("https://mdn.github.io/shared-assets/images/examples/balloons.jpg");
}

.b {
  background-image: url("https://mdn.github.io/shared-assets/images/examples/star.png");
}
```

{{EmbedLiveSample("background-image")}}

Nếu bạn chỉ định màu nền ngoài hình ảnh nền thì hình ảnh sẽ hiển thị trên màu.
Hãy thử thêm thuộc tính `background-color` vào ví dụ trên để xem điều đó hoạt động như thế nào.

### Kiểm soát background-repeat

Thuộc tính {{cssxref("background-repeat")}} được sử dụng để kiểm soát hành vi lát của hình ảnh. Các giá trị có sẵn là:

- `no-repeat` — ngừng lặp lại nền hoàn toàn.
- `repeat-x` — lặp lại theo chiều ngang.
- `repeat-y` — lặp lại theo chiều dọc.
- `repeat` — mặc định; lặp lại theo cả hai hướng.
- `space` — lặp lại nhiều lần nhất có thể, thêm khoảng cách giữa các hình ảnh nếu có thêm khoảng cách.
- `round` — tương tự như `space`, nhưng kéo giãn hình ảnh để lấp đầy bất kỳ khoảng cách thêm nào

Hãy thử các giá trị này trong ví dụ bên dưới. Chúng ta đã đặt giá trị thành `no-repeat` vì vậy bạn chỉ thấy một ngôi sao. Hãy thử các giá trị khác nhau để xem hiệu ứng của chúng là gì.

```html live-sample___repeat
<div class="box"></div>
```

```css hidden live-sample___repeat
.box {
  width: 200px;
  height: 80px;
  padding: 0.5em;
  border: 1px solid #cccccc;
  margin: 20px;
}
```

```css live-sample___repeat
.box {
  background-image: url("https://mdn.github.io/shared-assets/images/examples/star.png");
  background-repeat: no-repeat;
}
```

{{EmbedLiveSample("repeat")}}

### Kích thước hình ảnh nền

Hình ảnh _balloons.jpg_ được sử dụng trong ví dụ hình ảnh nền ban đầu là hình ảnh lớn đã bị cắt do lớn hơn phần tử mà nó làm nền. Trong trường hợp này, chúng ta có thể sử dụng thuộc tính {{cssxref("background-size")}} để kích thước hình ảnh vừa với nền.

`background-size` có thể nhận hai giá trị {{cssxref("length")}} hoặc {{cssxref("percentage")}} để chỉ định kích thước hình ảnh theo hướng ngang và dọc, hoặc các từ khóa sau:

- `cover` — trình duyệt sẽ làm cho hình ảnh đủ lớn để nó hoàn toàn bao phủ khu vực hộp trong khi vẫn giữ nguyên {{glossary("aspect ratio")}} của nó. Trong trường hợp này, một phần của hình ảnh có thể nằm bên ngoài hộp.
- `contain` — trình duyệt sẽ làm cho hình ảnh có kích thước phù hợp để vừa với hộp. Trong trường hợp này, bạn có thể có khoảng trống ở hai bên hoặc trên và dưới hình ảnh, nếu tỷ lệ khung hình của hình ảnh khác với tỷ lệ khung hình của hộp.

#### Thử nghiệm với `background-size`

Trong ví dụ bên dưới, hình ảnh _balloons.jpg_ có các đơn vị độ dài được đặt để vừa với hộp. Bạn có thể thấy điều này đã làm biến dạng hình ảnh.

Hãy thử những điều sau:

- Thay đổi các đơn vị độ dài được sử dụng để sửa đổi kích thước nền.
- Xóa các đơn vị độ dài và xem điều gì xảy ra khi bạn sử dụng `background-size: cover` hoặc `background-size: contain`.
- Kích thước hình ảnh nhỏ hơn hộp, sau đó thay đổi giá trị của `background-repeat` để lặp lại hình ảnh.

```html live-sample___size
<div class="box"></div>
```

```css hidden live-sample___size
.box {
  width: 500px;
  height: 100px;
  padding: 0.5em;
  border: 1px solid #cccccc;
  margin: 10px;
}
```

```css live-sample___size
.box {
  background-image: url("https://mdn.github.io/shared-assets/images/examples/balloons.jpg");
  background-repeat: no-repeat;
  background-size: 80px 10em;
}
```

{{EmbedLiveSample("size")}}

### Định vị hình ảnh nền

Thuộc tính {{cssxref("background-position")}} cho phép bạn chọn vị trí hình ảnh nền xuất hiện trên hộp mà nó được áp dụng. Điều này sử dụng hệ tọa độ trong đó góc trên bên trái của hộp là `(0,0)`, và hộp được định vị dọc theo trục ngang (`x`) và dọc (`y`).

> [!NOTE]
> Giá trị `background-position` mặc định là `(0,0)`.

Các giá trị `background-position` phổ biến nhất nhận hai giá trị riêng lẻ — giá trị ngang theo sau là giá trị dọc. Bạn có thể sử dụng các từ khóa như `top` và `right` (tra cứu các từ khóa khác trên trang {{cssxref("background-position")}}):

```css
.box {
  background-image: url("image.png");
  background-repeat: no-repeat;
  background-position: top center;
}
```

Bạn cũng có thể sử dụng {{cssxref("length", "độ dài")}} và {{cssxref("percentage", "phần trăm")}}:

```css
.box {
  background-image: url("image.png");
  background-repeat: no-repeat;
  background-position: 20px 10%;
}
```

Bạn cũng có thể kết hợp các giá trị từ khóa với độ dài hoặc phần trăm, trong trường hợp đó giá trị đầu tiên đề cập đến vị trí ngang và giá trị thứ hai đề cập đến vị trí dọc. Ví dụ:

```css
.box {
  background-image: url("image.png");
  background-repeat: no-repeat;
  background-position: 20px top;
}
```

Cuối cùng, bạn cũng có thể sử dụng cú pháp 4 giá trị để chỉ ra khoảng cách từ các cạnh nhất định của hộp. Mỗi cặp giá trị đại diện cho cạnh của hộp để bù từ, và kích thước của khoảng bù từ cạnh đó. Trong đoạn mã bên dưới, chúng ta đang định vị nền `20px` từ `top` và `10px` từ `right`:

```css
.box {
  background-image: url("image.png");
  background-repeat: no-repeat;
  background-position: top 20px right 10px;
}
```

#### Thử nghiệm với `background-position`

Sử dụng ví dụ bên dưới để thử nghiệm với các giá trị này và di chuyển ngôi sao bên trong hộp:

```html live-sample___position
<div class="box"></div>
```

```css hidden live-sample___position
.box {
  width: 500px;
  height: 80px;
  padding: 0.5em;
  border: 1px solid #cccccc;
  margin: 20px;
}
```

```css live-sample___position
.box {
  background-image: url("https://mdn.github.io/shared-assets/images/examples/star.png");
  background-repeat: no-repeat;
  background-position: 120px 1em;
}
```

{{EmbedLiveSample("position")}}

> [!NOTE]
> Viết tắt `background-position` được sử dụng thay vì {{cssxref("background-position-x")}} và {{cssxref("background-position-y")}}, cho phép bạn đặt các giá trị vị trí trục khác nhau riêng lẻ.

## Nền gradient

Một gradient — khi được sử dụng cho nền — hoạt động giống như hình ảnh và cũng được đặt bằng thuộc tính {{cssxref("background-image")}}.

Bạn có thể tìm hiểu về các loại giá trị gradient khác nhau và những gì bạn có thể làm với chúng trên trang MDN cho kiểu dữ liệu {{cssxref("gradient")}}.

Hãy thử một số giá trị gradient khác nhau trong ví dụ bên dưới. Ban đầu, chúng ta có một gradient tuyến tính được kéo dài trên toàn bộ hộp đầu tiên, và một gradient hướng tâm với kích thước được đặt, lặp lại trên hộp thứ hai.

```html live-sample___gradients
<div class="wrapper">
  <div class="box a"></div>
  <div class="box b"></div>
</div>
```

```css live-sample___gradients
.wrapper {
  display: flex;
}

.box {
  width: 400px;
  height: 80px;
  padding: 0.5em;
  border: 1px solid #cccccc;
  margin: 20px;
}

.a {
  background-image: linear-gradient(
    105deg,
    rgb(0 249 255 / 100%) 39%,
    rgb(51 56 57 / 100%) 96%
  );
}

.b {
  background-image: radial-gradient(
    circle,
    rgb(0 249 255 / 100%) 39%,
    rgb(51 56 57 / 100%) 96%
  );
  background-size: 100px 50px;
}
```

{{EmbedLiveSample("gradients")}}

> [!NOTE]
> Một cách thú vị để thử nghiệm với gradient là sử dụng một trong nhiều trình tạo gradient CSS có sẵn trên web, chẳng hạn như [CSSGradient.io](https://cssgradient.io/). Bạn có thể tạo gradient và sao chép và dán mã nguồn tạo ra nó.

## Nhiều hình ảnh nền

Cũng có thể chỉ định nhiều hình ảnh nền trong một khai báo duy nhất. Bạn làm điều này bằng cách chỉ định nhiều giá trị `background-image` được phân tách bằng dấu phẩy.

Khi bạn làm điều này, bạn có thể có các hình ảnh nền chồng lên nhau. Các nền sẽ xếp chồng với hình ảnh nền được liệt kê cuối cùng ở dưới cùng của ngăn xếp, và mỗi hình ảnh trước đó xếp chồng lên cái theo sau nó trong mã.

> [!NOTE]
> Gradient có thể được trộn lẫn vui vẻ với hình ảnh nền thông thường.

Các thuộc tính `background-*` khác cũng có thể có các giá trị được phân tách bằng dấu phẩy theo cách giống như `background-image`:

```css
background-image:
  url("image1.png"), url("image2.png"), url("image3.png"), url("image4.png");
background-repeat: no-repeat, repeat-x, repeat;
background-position:
  10px 20px,
  top right;
```

Mỗi giá trị của các thuộc tính khác nhau sẽ khớp với các giá trị ở cùng vị trí trong các thuộc tính khác. Ví dụ, giá trị `background-repeat` của `image1` sẽ là `no-repeat`. Tuy nhiên, điều gì xảy ra khi các thuộc tính khác nhau có số lượng giá trị khác nhau? Câu trả lời là số lượng giá trị nhỏ hơn sẽ xoay vòng — trong ví dụ trên có bốn hình ảnh nền nhưng chỉ có hai giá trị `background-position`. Hai giá trị vị trí đầu tiên sẽ được áp dụng cho hai hình ảnh đầu tiên, sau đó chúng sẽ xoay vòng lại — `image3` sẽ được cho giá trị vị trí đầu tiên, và `image4` sẽ được cho giá trị vị trí thứ hai.

### Thử nghiệm với nhiều hình ảnh nền

Hãy chơi thử. Ví dụ bên dưới bao gồm hai hình ảnh nền. Hãy thử chỉnh sửa ví dụ như sau:

- Để minh họa thứ tự xếp chồng, hãy thử chuyển đổi hình ảnh nền nào đứng đầu tiên trong danh sách.
- Thêm một số thuộc tính `background-*` khác để thay đổi vị trí, kích thước hoặc giá trị lặp lại của hình ảnh.
- Hãy thử thêm một gradient làm `background-image` thứ ba.

```html live-sample___multiple-background-image
<div class="wrapper">
  <div class="box"></div>
</div>
```

```css live-sample___multiple-background-image
.wrapper {
  display: flex;
}

.box {
  width: 500px;
  height: 80px;
  padding: 0.5em;
  border: 1px solid #cccccc;
  margin: 20px;
}

.box {
  background-image:
    url("https://mdn.github.io/shared-assets/images/examples/star.png"),
    url("https://mdn.github.io/shared-assets/images/examples/big-star.png");
}
```

{{EmbedLiveSample("multiple-background-image")}}

## Đính kèm nền

Một tùy chọn khác chúng ta có sẵn cho nền là chỉ định cách chúng cuộn khi nội dung cuộn. Điều này được kiểm soát bằng thuộc tính {{cssxref("background-attachment")}}, có thể nhận các giá trị sau:

- `scroll`: làm cho nền của phần tử cuộn khi trang được cuộn. Nếu nội dung phần tử được cuộn, nền không di chuyển. Trên thực tế, nền được cố định ở cùng vị trí trên trang, vì vậy nó cuộn khi trang cuộn.
- `fixed`: làm cho nền của phần tử được cố định vào viewport để nó không cuộn khi trang hoặc nội dung phần tử được cuộn. Nó sẽ luôn ở cùng vị trí trên màn hình.
- `local`: cố định nền vào phần tử mà nó được đặt trên, vì vậy khi bạn cuộn phần tử, nền cuộn cùng với nó.

Thuộc tính {{cssxref("background-attachment")}} chỉ có hiệu lực khi có nội dung để cuộn, vì vậy chúng tôi đã tạo demo để minh họa sự khác biệt giữa ba giá trị — xem [background-attachment.html](https://mdn.github.io/learning-area/css/styling-boxes/backgrounds/background-attachment.html) (cũng [xem mã nguồn](https://github.com/mdn/learning-area/tree/main/css/styling-boxes/backgrounds) tại đây).

## Sử dụng thuộc tính viết tắt background

Bạn sẽ thường thấy nền được chỉ định bằng thuộc tính viết tắt {{cssxref("background")}}, cho phép bạn đặt tất cả các thuộc tính khác nhau cùng một lúc.

Nếu sử dụng nhiều nền, bạn cần chỉ định tất cả các thuộc tính cho nền đầu tiên, sau đó thêm nền tiếp theo của bạn sau dấu phẩy. Trong ví dụ bên dưới, chúng ta có gradient với kích thước và vị trí, sau đó là nền hình ảnh với `no-repeat` và vị trí, rồi màu.

Có một số quy tắc cần tuân theo khi viết các giá trị viết tắt hình ảnh nền, ví dụ:

- `background-color` chỉ có thể được chỉ định sau dấu phẩy cuối cùng.
- Giá trị của `background-size` chỉ có thể được bao gồm ngay sau `background-position`, được phân tách bằng ký tự `/`, như sau: `center/80%`.

Hãy xem trang MDN cho {{cssxref("background")}} để tìm hiểu thêm về cú pháp.

```html live-sample___background
<div class="box"></div>
```

```css live-sample___background
.box {
  width: 500px;
  height: 300px;
  padding: 0.5em;
  background:
    linear-gradient(
        105deg,
        rgb(255 255 255 / 20%) 39%,
        rgb(51 56 57 / 100%) 96%
      )
      center center / 400px 200px no-repeat,
    url("https://mdn.github.io/shared-assets/images/examples/big-star.png")
      center no-repeat,
    rebeccapurple;
}
```

{{EmbedLiveSample("background", "", "320px")}}

## Các cân nhắc về khả năng tiếp cận với nền

Khi đặt văn bản trên hình ảnh nền hoặc màu, bạn cần đảm bảo rằng bạn có đủ [độ tương phản](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast) để văn bản có thể đọc được bởi khách truy cập của bạn. Khi chỉ định hình ảnh với nội dung văn bản trên đó, bạn cũng nên chỉ định `background-color` cho phép văn bản có thể đọc được nếu hình ảnh không tải.

Trình đọc màn hình không thể phân tích hình ảnh nền; do đó, chúng chỉ nên là trang trí thuần túy. Bất kỳ nội dung quan trọng nào phải là một phần của trang HTML và không được chứa trong nền.

## Đường viền

Khi tìm hiểu về [mô hình hộp](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model), chúng ta đã khám phá cách đường viền ảnh hưởng đến kích thước hộp. Trong bài học này, chúng ta sẽ xem xét cách sử dụng đường viền sáng tạo.

Thông thường, khi chúng ta thêm đường viền cho phần tử với CSS, chúng ta sử dụng thuộc tính viết tắt {{cssxref("border")}} để đặt màu, chiều rộng và [kiểu](/en-US/docs/Web/CSS/Reference/Values/line-style) của đường viền trên cả bốn cạnh của hộp trong một khai báo:

```css
.box {
  border: 1px solid black;
}
```

Hoặc chúng ta có thể nhắm mục tiêu một cạnh của hộp, ví dụ:

```css
.box {
  border-top: 1px solid black;
}
```

Các thuộc tính riêng lẻ bao gồm các thuộc tính viết tắt {{cssxref("border-width")}}, {{cssxref("border-style")}} và {{cssxref("border-color")}}:

```css
.box {
  border-width: 1px;
  border-style: solid;
  border-color: black;
}
```

Cũng có các thuộc tính dạng dài cho chiều rộng, kiểu và màu cho từng bốn cạnh:

```css
.box {
  border-top-width: 1px;
  border-top-style: solid;
  border-top-color: black;
}
```

> [!NOTE]
> Các thuộc tính đường viền trên, phải, dưới và trái này cũng có các [thuộc tính đường viền _logic_](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values#properties) được ánh xạ liên quan đến chế độ viết của tài liệu (ví dụ, văn bản trái-sang-phải hoặc phải-sang-trái, hoặc trên-xuống-dưới). Bạn có thể đọc về chúng trong [xử lý các hướng văn bản khác nhau](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_different_text_directions).

### Thử nghiệm với đường viền

Có nhiều kiểu khác nhau mà bạn có thể sử dụng cho đường viền. Trong ví dụ bên dưới, chúng ta đã sử dụng hai kiểu đường viền khác nhau cho hộp và hai kiểu đường viền khác nhau cho tiêu đề. Hãy thử nghiệm với kiểu, chiều rộng và màu đường viền để xem cách đường viền hoạt động.

```html live-sample___borders
<div class="box">
  <h2>Borders</h2>
  <p>Try changing the borders.</p>
</div>
```

```css live-sample___borders
* {
  padding: 0.2em;
}
.box {
  width: 500px;
  background-color: #567895;
  border: 5px solid #0b385f;
  border-bottom-style: dashed;
  color: white;
}

h2 {
  border-top: 2px dotted rebeccapurple;
  border-bottom: 1em double rgb(24 163 78);
}
```

{{EmbedLiveSample("borders", "", "200px")}}

## Góc bo tròn

Bạn có thể thêm các góc bo tròn vào hộp bằng thuộc tính {{cssxref("border-radius")}} và các thuộc tính dạng dài liên quan đến từng góc của hộp. Hai độ dài hoặc phần trăm có thể được sử dụng làm giá trị, giá trị đầu tiên xác định bán kính ngang và giá trị thứ hai là bán kính dọc. Trong nhiều trường hợp, bạn sẽ chỉ truyền vào một giá trị, giá trị đó sẽ được sử dụng cho cả hai.

Ví dụ, để cho tất cả bốn góc của hộp bán kính `10px`:

```css
.box {
  border-radius: 10px;
}
```

Hoặc để làm cho góc trên bên phải có bán kính ngang là `1em`, và bán kính dọc là `10%`:

```css
.box {
  border-top-right-radius: 1em 10%;
}
```

> [!NOTE]
> Giống như các thuộc tính đường viền ở trên, các thuộc tính border-radius này cũng có các [thuộc tính border-radius _logic_](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values#properties) được ánh xạ.

### Thử nghiệm với bán kính đường viền

Chúng ta đã đặt cả bốn góc trong ví dụ bên dưới và sau đó thay đổi các giá trị cho góc trên bên phải để làm cho nó khác. Bạn có thể thử nghiệm với các giá trị để thay đổi các góc. Hãy xem trang thuộc tính cho {{cssxref("border-radius")}} để xem các tùy chọn cú pháp có sẵn. [Trình tạo border-radius](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Border-radius_generator) có thể được sử dụng để xuất ra các giá trị góc bo tròn cho bạn.

```html live-sample___corners
<div class="box">
  <h2>Borders</h2>
  <p>Try changing the borders.</p>
</div>
```

```css live-sample___corners
.box {
  width: 500px;
  height: 110px;
  padding: 0.5em;
  border: 10px solid rebeccapurple;
  border-radius: 1em;
  border-top-right-radius: 10% 30%;
}
```

{{EmbedLiveSample("corners")}}

## Tóm tắt

Bạn có thể thấy có khá nhiều điều khi thêm nền hoặc đường viền vào hộp. Hãy khám phá các trang thuộc tính khác nhau nếu bạn muốn tìm hiểu thêm về bất kỳ tính năng nào được thảo luận ở đây. Hầu hết mọi trang trên MDN đều có ví dụ để bạn thử nghiệm nhằm nâng cao kiến thức.

Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ hiểu và ghi nhớ thông tin chúng ta đã cung cấp về tạo kiểu nền và đường viền.

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Sizing", "Learn_web_development/Core/Styling_basics/Test_your_skills/Backgrounds_and_borders", "Learn_web_development/Core/Styling_basics")}}
