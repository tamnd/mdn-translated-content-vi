---
title: Hiệu ứng tạo kiểu nâng cao
slug: Learn_web_development/Core/Styling_basics/Advanced_styling_effects
page-type: guide
sidebar: learnsidebar
---

Bài viết này hoạt động như một hộp thủ thuật, cung cấp giới thiệu về một số tính năng tạo kiểu nâng cao thú vị như bóng hộp, chế độ pha trộn và bộ lọc.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về HTML (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Giới thiệu về HTML</a
        >) và ý tưởng về cách CSS hoạt động (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>.)
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Có ý tưởng về cách sử dụng một số hiệu ứng tạo kiểu nâng cao
        có sẵn trong các trình duyệt hiện đại.
      </td>
    </tr>
  </tbody>
</table>

## Bóng hộp

{{cssxref("box-shadow")}} cho phép bạn áp dụng một hoặc nhiều bóng đổ cho hộp của một phần tử. Giống như bóng văn bản, bóng hộp được hỗ trợ khá tốt trên các trình duyệt, bao gồm IE9+ và Edge. Người dùng các phiên bản IE cũ hơn có thể chỉ phải chịu đựng việc không có bóng, vì vậy hãy kiểm tra thiết kế của bạn để đảm bảo nội dung của bạn dễ đọc mà không có chúng.

### Bóng hộp đơn giản

Hãy xem một ví dụ đơn giản để bắt đầu. Đầu tiên, một số HTML:

```html
<article class="simple">
  <p>
    <strong>Warning</strong>: The thermostat on the cosmic transcender has
    reached a critical level.
  </p>
</article>
```

Bây giờ là CSS:

```css
p {
  margin: 0;
}

article {
  max-width: 500px;
  padding: 10px;
  background-color: red;
  background-image: linear-gradient(to bottom, transparent, rgb(0 0 0 / 25%));
}

.simple {
  box-shadow: 5px 5px 5px rgb(0 0 0 / 70%);
}
```

Điều này cho chúng ta kết quả sau:

{{EmbedLiveSample("A_simple_box_shadow", "", "100px")}}

Bạn sẽ thấy rằng chúng ta có bốn mục trong giá trị thuộc tính `box-shadow`:

1. Giá trị độ dài đầu tiên là **offset ngang** — khoảng cách sang phải mà bóng được offset so với hộp gốc (hoặc sang trái, nếu giá trị là âm).
2. Giá trị độ dài thứ hai là **offset dọc** — khoảng cách xuống dưới mà bóng được offset so với hộp gốc (hoặc lên trên, nếu giá trị là âm).
3. Giá trị độ dài thứ ba là **bán kính làm mờ** — lượng làm mờ được áp dụng cho bóng.
4. Giá trị màu là **màu cơ sở** của bóng.

Bạn có thể sử dụng bất kỳ đơn vị độ dài và màu nào hợp lý để xác định các giá trị này.

### Nhiều bóng hộp

Bạn cũng có thể chỉ định nhiều bóng hộp trong một khai báo `box-shadow` duy nhất, bằng cách tách chúng bằng dấu phẩy:

```html hidden
<article class="multiple">
  <p>
    <strong>Warning</strong>: The thermostat on the cosmic transcender has
    reached a critical level.
  </p>
</article>
```

```css
p {
  margin: 0;
}

article {
  max-width: 500px;
  padding: 10px;
  background-color: red;
  background-image: linear-gradient(to bottom, transparent, rgb(0 0 0 / 25%));
}

.multiple {
  box-shadow:
    1px 1px 1px black,
    2px 2px 1px black,
    3px 3px 1px red,
    4px 4px 1px red,
    5px 5px 1px black,
    6px 6px 1px black;
}
```

Bây giờ chúng ta có kết quả này:

{{EmbedLiveSample("Multiple_box_shadows", "", "100px")}}

Chúng ta đã làm điều thú vị ở đây bằng cách tạo hộp nổi với nhiều lớp màu, nhưng bạn có thể sử dụng nó theo bất kỳ cách nào bạn muốn, ví dụ để tạo giao diện thực tế hơn với bóng dựa trên nhiều nguồn sáng.

### Các tính năng bóng hộp khác

Không giống như {{cssxref("text-shadow")}}, {{cssxref("box-shadow")}} có từ khóa `inset` — đặt từ khóa này ở đầu khai báo bóng làm cho nó trở thành bóng trong, thay vì bóng ngoài. Hãy xem và hiểu điều chúng ta muốn nói.

Đầu tiên, chúng ta sẽ dùng HTML khác cho ví dụ này:

```html
<button>Press me!</button>
```

```css
button {
  width: 150px;
  font-size: 1.1rem;
  line-height: 2;
  border-radius: 10px;
  border: none;
  background-image: linear-gradient(to bottom right, #777777, #dddddd);
  box-shadow:
    1px 1px 1px black,
    inset 2px 3px 5px rgb(0 0 0 / 30%),
    inset -2px -3px 5px rgb(255 255 255 / 50%);
}

button:focus,
button:hover {
  background-image: linear-gradient(to bottom right, #888888, #eeeeee);
}

button:active {
  box-shadow:
    inset 2px 2px 1px black,
    inset 2px 3px 5px rgb(0 0 0 / 30%),
    inset -2px -3px 5px rgb(255 255 255 / 50%);
}
```

Điều này cho chúng ta kết quả sau:

{{EmbedLiveSample("Other_box_shadow_features", "100%", "70px")}}

Ở đây chúng ta đã thiết lập một số kiểu nút cùng với các trạng thái focus/hover/active. Nút có một bóng hộp đen đơn giản được đặt trên nó theo mặc định, cộng với một vài bóng trong, một sáng và một tối, được đặt trên các góc đối diện của nút để tạo ra hiệu ứng đổ bóng đẹp.

Khi nút được nhấn, trạng thái active khiến bóng hộp đầu tiên bị hoán đổi cho bóng trong tối rất sẫm, tạo ra cảm giác nút đang được nhấn vào.

> [!NOTE]
> Có một mục khác có thể được đặt trong giá trị `box-shadow` — một giá trị độ dài khác có thể được đặt tùy chọn ngay trước giá trị màu, đó là **spread radius** (bán kính lan rộng). Nếu được đặt, điều này làm cho bóng trở nên lớn hơn hộp gốc. Nó không được sử dụng phổ biến lắm, nhưng đáng đề cập.

## Bộ lọc

Mặc dù bạn không thể thay đổi thành phần của hình ảnh bằng CSS, nhưng có một số điều sáng tạo bạn có thể làm. Một thuộc tính rất hay, có thể giúp bạn mang lại sự thú vị cho thiết kế của mình, là thuộc tính {{cssxref("filter")}}. Thuộc tính này cho phép các bộ lọc kiểu Photoshop ngay từ CSS.

Trong ví dụ bên dưới, chúng ta đã sử dụng hai giá trị khác nhau cho bộ lọc. `first` là `blur()` — hàm này có thể được truyền một giá trị để chỉ ra hình ảnh nên bị làm mờ bao nhiêu.

Cái thứ hai là `grayscale()`; bằng cách sử dụng phần trăm, chúng ta đang đặt lượng màu chúng ta muốn được loại bỏ.

Hãy thử nghiệm với các tham số phần trăm và pixel trong ví dụ bên dưới để xem hình ảnh thay đổi như thế nào. Bạn cũng có thể hoán đổi các giá trị cho một số giá trị khác. Hãy thử `contrast(200%)`, `invert(100%)` hoặc `hue-rotate(20deg)` trên ví dụ trực tiếp ở trên. Hãy xem trang MDN cho {{cssxref("filter")}} để biết nhiều tùy chọn khác bạn có thể thử.

```html live-sample___filter
<div class="wrapper">
  <div class="box">
    <img
      alt="balloons"
      class="blur"
      src="https://mdn.github.io/shared-assets/images/examples/balloons.jpg" />
  </div>
  <div class="box">
    <img
      alt="balloons"
      class="grayscale"
      src="https://mdn.github.io/shared-assets/images/examples/balloons.jpg" />
  </div>
</div>
```

```css hidden live-sample___filter
.wrapper {
  display: flex;
  align-items: flex-start;
}

.wrapper > * {
  margin: 20px;
  flex: 1;
}

.box {
  border: 5px solid darkblue;
}
```

```css live-sample___filter
img {
  height: 100%;
  width: 100%;
  display: block;
  object-fit: cover;
}

.blur {
  filter: blur(10px);
}

.grayscale {
  filter: grayscale(60%);
}
```

{{EmbedLiveSample("filter", "", "260px")}}

Bạn có thể áp dụng bộ lọc cho bất kỳ phần tử nào chứ không chỉ hình ảnh. Một số tùy chọn bộ lọc có sẵn làm những việc rất tương tự như các tính năng CSS khác, ví dụ `drop-shadow()` hoạt động theo cách rất tương tự và cho hiệu ứng tương tự như {{cssxref("box-shadow")}} hoặc {{cssxref("text-shadow")}}. Tuy nhiên, điều thực sự hay về các bộ lọc là chúng hoạt động trên chính xác hình dạng của nội dung bên trong hộp, không chỉ hộp chính nó như một khối lớn, vì vậy đáng biết sự khác biệt.

Trong ví dụ tiếp theo này, chúng ta đang áp dụng bộ lọc cho hộp, và so sánh nó với bóng hộp. Như bạn có thể thấy, bộ lọc drop-shadow theo dõi chính xác hình dạng của văn bản và các nét đứt đường viền. Bóng hộp chỉ theo dõi hình vuông của hộp.

```html live-sample___filter-text
<p class="filter">Filter</p>
<p class="box-shadow">Box shadow</p>
```

```css live-sample___filter-text
body {
  font-family: sans-serif;
}
p {
  margin: 1em 2em;
  padding: 20px;
  width: 100px;
  display: inline-block;
  border: 5px dashed red;
}

.filter {
  filter: drop-shadow(5px 5px 1px rgb(0 0 0 / 70%));
}

.box-shadow {
  box-shadow: 5px 5px 1px rgb(0 0 0 / 70%);
}
```

{{EmbedLiveSample("filter-text")}}

## Chế độ pha trộn

Chế độ pha trộn CSS cho phép chúng ta thêm chế độ pha trộn cho các phần tử chỉ định hiệu ứng pha trộn khi hai phần tử chồng lên nhau — màu cuối cùng được hiển thị cho mỗi pixel sẽ là kết quả của sự kết hợp của màu pixel gốc và màu pixel trong lớp bên dưới nó. Các chế độ pha trộn một lần nữa rất quen thuộc với người dùng các ứng dụng đồ họa như Photoshop.

Có hai thuộc tính sử dụng chế độ pha trộn trong CSS:

- {{cssxref("background-blend-mode")}}, pha trộn nhiều hình nền và màu sắc được đặt trên một phần tử duy nhất.
- {{cssxref("mix-blend-mode")}}, pha trộn phần tử được đặt trên với các phần tử nó đang chồng lên — cả nền và nội dung.

Bạn có thể tìm thấy nhiều ví dụ hơn so với những gì có sẵn ở đây trong trang ví dụ [blend-modes.html](https://mdn.github.io/learning-area/css/styling-boxes/advanced_box_effects/blend-modes.html) của chúng ta (xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/css/styling-boxes/advanced_box_effects/blend-modes.html)), và trên trang tham khảo {{cssxref("&lt;blend-mode&gt;")}}.

> [!NOTE]
> Các chế độ pha trộn cũng rất mới, và được hỗ trợ hơi ít hơn so với các bộ lọc. Chưa có hỗ trợ trong Edge, và Safari chỉ hỗ trợ một số tùy chọn chế độ pha trộn.

### background-blend-mode

Một lần nữa, hãy xem một số ví dụ để chúng ta có thể hiểu điều này tốt hơn. Đầu tiên, {{cssxref("background-blend-mode")}} — ở đây chúng ta sẽ hiển thị một vài {{htmlelement("div")}} đơn giản, để bạn có thể so sánh bản gốc với phiên bản pha trộn:

```html
<div></div>
<div class="multiply"></div>
```

Bây giờ một số CSS — chúng ta đang thêm vào `<div>` một hình nền và màu nền xanh lá:

```css
div {
  width: 250px;
  height: 130px;
  padding: 10px;
  margin: 10px;
  display: inline-block;
  background: url("colorful-heart.png") no-repeat center 20px;
  background-color: green;
}

.multiply {
  background-blend-mode: multiply;
}
```

Kết quả chúng ta có là — bạn có thể thấy bản gốc bên trái, và chế độ pha trộn multiply bên phải:

{{EmbedLiveSample("background-blend-mode", "", "220px")}}

### mix-blend-mode

Bây giờ hãy xem {{cssxref("mix-blend-mode")}}. Ở đây chúng ta sẽ trình bày cùng hai `<div>`, nhưng mỗi cái bây giờ được đặt trên một `<div>` đơn giản với nền tím, để hiển thị cách các phần tử sẽ pha trộn cùng nhau:

```html
<article>
  No mix blend mode
  <div></div>
  <div></div>
</article>

<article>
  Multiply mix
  <div class="multiply-mix"></div>
  <div></div>
</article>
```

Đây là CSS chúng ta sẽ tạo kiểu với:

```css
article {
  width: 280px;
  height: 180px;
  margin: 10px;
  position: relative;
  display: inline-block;
}

div {
  width: 250px;
  height: 130px;
  padding: 10px;
  margin: 10px;
}

article div:first-child {
  position: absolute;
  top: 10px;
  left: 0;
  background: url("colorful-heart.png") no-repeat center 20px;
  background-color: green;
}

article div:last-child {
  background-color: purple;
  position: absolute;
  bottom: -10px;
  right: 0;
  z-index: -1;
}

.multiply-mix {
  mix-blend-mode: multiply;
}
```

Điều này cho chúng ta kết quả sau:

{{EmbedLiveSample("mix-blend-mode", "", "220px")}}

Bạn có thể thấy ở đây rằng pha trộn multiply đã pha trộn không chỉ hai hình nền, mà còn màu từ `<div>` bên dưới nó.

> [!NOTE]
> Đừng lo lắng nếu bạn không hiểu một số thuộc tính bố cục ở trên, như {{cssxref("position")}}, {{cssxref("top")}}, {{cssxref("bottom")}}, {{cssxref("z-index")}}, v.v. Chúng ta sẽ đề cập chi tiết trong mô-đun [CSS Layout](/en-US/docs/Learn_web_development/Core/CSS_layout) của chúng ta.

## Hình dạng CSS

Mặc dù đúng là mọi thứ trong CSS là hộp chữ nhật, và hình ảnh là hộp chữ nhật vật lý, chúng ta có thể làm cho nội dung của chúng ta trông như chảy quanh các vật không chữ nhật bằng cách sử dụng [CSS Shapes](/en-US/docs/Web/CSS/Guides/Shapes).

Đặc tả CSS Shapes cho phép bao bọc văn bản quanh hình dạng không chữ nhật. Nó đặc biệt hữu ích khi làm việc với hình ảnh có một số khoảng trắng mà bạn có thể muốn float văn bản quanh.

Trong hình ảnh bên dưới, chúng ta có một quả bóng tròn đẹp. Tệp thực tế là hình chữ nhật, nhưng bằng cách float hình ảnh (hình dạng chỉ áp dụng cho các phần tử được float) và sử dụng thuộc tính {{cssxref("shape-outside")}} với giá trị là `circle(50%)`, chúng ta có thể tạo ra hiệu ứng văn bản theo đường viền của quả bóng.

```html live-sample___shapes
<div class="wrapper">
  <img
    alt="balloon"
    src="https://mdn.github.io/shared-assets/images/examples/round-balloon.png" />
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___shapes
body {
  font-family: sans-serif;
}
img {
  float: left;
  shape-outside: circle(50%);
}
```

{{EmbedLiveSample("shapes", "", "200px")}}

Hình dạng trong ví dụ này không phản ứng với nội dung của tệp hình ảnh. Thay vào đó, hàm circle lấy điểm trung tâm của nó từ trung tâm của tệp hình ảnh, như thể chúng ta đã đặt la bàn ở giữa tệp và vẽ một vòng tròn vừa khít bên trong tệp. Đó là vòng tròn mà văn bản chảy quanh.

> [!NOTE]
> Trong Firefox, bạn có thể sử dụng [Shapes Inspector](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/edit_css_shapes/index.html) của DevTools để kiểm tra Shapes.

Hàm `circle()` chỉ là một trong một vài hình dạng cơ bản được định nghĩa, tuy nhiên có một số cách khác nhau để tạo hình dạng. Để biết thêm thông tin và mã ví dụ cho CSS Shapes, xem [Hướng dẫn về CSS Shapes](/en-US/docs/Web/CSS/Guides/Shapes/Overview) trên MDN.

## -webkit-background-clip: text

Một tính năng khác chúng ta nghĩ sẽ đề cập ngắn gọn là giá trị `text` cho {{cssxref("background-clip")}}. Khi được sử dụng cùng với tính năng độc quyền `-webkit-text-fill-color: transparent;`, điều này cho phép bạn cắt hình ảnh nền thành hình dạng văn bản của phần tử, tạo ra một số hiệu ứng đẹp. Đây không phải là tiêu chuẩn chính thức, nhưng đã được triển khai trên nhiều trình duyệt, vì nó phổ biến, và được các nhà phát triển sử dụng khá rộng rãi. Khi được sử dụng trong ngữ cảnh này, cả hai thuộc tính sẽ yêu cầu tiền tố vendor `-webkit-`, ngay cả đối với các trình duyệt không dựa trên WebKit/Chrome.
Bạn có thể thấy điều này trong hành động trong ví dụ trực tiếp bên dưới:

```html live-sample___webkit-background-clip
<h2>WOW</h2>
<h2 class="text-clip">WOW</h2>
```

```css hidden live-sample___webkit-background-clip
body {
  font-family: "impact", sans-serif;
}

h2 {
  width: 250px;
  height: 250px;
  text-align: center;
  line-height: 250px;
  font-size: 50px;
}
```

```css live-sample___webkit-background-clip
h2 {
  color: white;
  display: inline-block;
  background: url("colorful-heart.png") no-repeat center;
}

.text-clip {
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
```

{{EmbedLiveSample("webkit-background-clip", "", "340px")}}

Vậy tại sao các trình duyệt khác triển khai tiền tố `-webkit-`? Chủ yếu là để tương thích trình duyệt — rất nhiều nhà phát triển web đã bắt đầu triển khai các trang web với tiền tố `-webkit-` đến mức các trình duyệt khác bắt đầu trông như bị hỏng, trong khi thực tế chúng đang tuân theo các tiêu chuẩn. Vì vậy, họ bị buộc phải triển khai một vài tính năng như vậy. Điều này làm nổi bật sự nguy hiểm của việc sử dụng các tính năng CSS không chuẩn và/hoặc có tiền tố trong công việc của bạn — không chỉ chúng gây ra vấn đề tương thích trình duyệt, mà chúng cũng có thể thay đổi, vì vậy mã của bạn có thể bị hỏng bất cứ lúc nào. Tốt hơn nhiều là tuân theo các tiêu chuẩn.

Nếu bạn muốn sử dụng các tính năng như vậy trong công việc sản xuất của mình, hãy đảm bảo kiểm tra kỹ lưỡng trên các trình duyệt và kiểm tra rằng, nơi các tính năng này không hoạt động, trang web vẫn có thể sử dụng được.

## Tóm tắt

Chúng tôi hy vọng bài viết này thú vị — chơi với các đồ chơi bóng bẩy thường vậy, và luôn thú vị khi xem các loại công cụ tạo kiểu nâng cao nào đang trở nên có sẵn trong các trình duyệt hiện đại.
