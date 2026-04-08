---
title: Typical use cases of flexbox
short-title: Typical use cases
slug: Web/CSS/Guides/Flexible_box_layout/Use_cases
page-type: guide
sidebar: cssref
---

Trong hướng dẫn này, chúng ta sẽ xem xét một số trường hợp sử dụng phổ biến của flexbox — những tình huống mà flexbox phù hợp hơn so với các phương pháp layout khác.

## Tại sao chọn flexbox?

Flexbox thường là giải pháp CSS layout phù hợp khi bạn muốn sắp xếp một tập hợp các phần tử theo một chiều hoặc kiểm soát khoảng cách giữa chúng. Trong hướng dẫn này, chúng ta sẽ xem xét một số trường hợp sử dụng điển hình của flexbox.

## Navigation

Một pattern phổ biến cho navigation là hiển thị danh sách các mục dưới dạng thanh ngang. Đây có lẽ là ví dụ flexbox phổ biến nhất, và có thể được coi là trường hợp sử dụng lý tưởng cho flexbox.

Khi chúng ta có một tập hợp các mục muốn hiển thị theo chiều ngang, có thể sẽ có thêm khoảng trống. Chúng ta cần quyết định phải làm gì với khoảng trống đó, và có một số lựa chọn. Chúng ta có thể hiển thị khoảng trống bên ngoài các mục — do đó tạo khoảng cách giữa hoặc xung quanh chúng — hoặc hấp thụ khoảng trống bên trong các mục và do đó cần một phương pháp cho phép các mục tăng trưởng và chiếm dụng khoảng trống này.

### Khoảng trống phân phối bên ngoài các mục

Để phân phối khoảng trống giữa hoặc xung quanh các mục, chúng ta sử dụng các thuộc tính căn chỉnh trong flexbox, và thuộc tính {{cssxref("justify-content")}}. Bạn có thể đọc thêm về thuộc tính này trong [Căn chỉnh các mục trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items), phần này đề cập đến việc căn chỉnh các mục trên trục chính.

Trong ví dụ này, chúng ta hiển thị các mục ở kích thước tự nhiên và sử dụng `justify-content: space-between` để phân bổ đều khoảng cách giữa các mục. Bạn có thể thay đổi cách phân phối khoảng trống bằng cách sử dụng các giá trị `space-around` hoặc `space-evenly`. Bạn cũng có thể sử dụng `start` để đặt khoảng trống ở cuối các mục, `end` để đặt trước chúng, hoặc `center` để căn giữa các mục navigation.

```html live-sample___navigation
<nav>
  <ul>
    <li><a href="#">Page 1</a></li>
    <li><a href="#">Page 2</a></li>
    <li><a href="#">Page 3 is longer</a></li>
    <li><a href="#">Page 4</a></li>
  </ul>
</nav>
```

```css live-sample___navigation
nav {
  border: 2px solid #eeeeee;
}

nav a {
  text-decoration: none;
  color: black;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
  display: block;
}

nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: space-between;
}
```

{{EmbedLiveSample("navigation")}}

### Khoảng trống phân phối bên trong các mục

Một pattern khác cho navigation là phân phối khoảng trống có sẵn bên trong chính các mục, thay vì tạo khoảng cách giữa chúng. Các thuộc tính {{cssxref("flex")}} cho phép các mục tăng trưởng và thu nhỏ theo tỷ lệ với nhau như được mô tả trong [Kiểm soát tỷ lệ các flex item dọc theo trục chính](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios).

Nếu bạn muốn tôn trọng thuộc tính kích thước của các mục navigation nhưng chia đều khoảng trống có sẵn cho chúng, bạn có thể sử dụng `flex: auto`, là dạng viết tắt của `flex: 1 1 auto` — tất cả các mục tăng trưởng và thu nhỏ từ flex-basis là `auto`. Điều này có nghĩa là mục dài hơn sẽ có nhiều không gian hơn vì nó bắt đầu từ kích thước lớn hơn, mặc dù cùng một lượng khoảng trống có sẵn được gán cho nó như các mục khác.

Trong ví dụ trực tiếp bên dưới, hãy thử đổi `flex: auto` thành `flex: 1`. Dạng viết tắt này cho `flex: 1 1 0` khiến tất cả các mục có cùng chiều rộng, vì chúng hoạt động từ `flex-basis` là `0`, cho phép tất cả khoảng trống được phân phối đều.

```html live-sample___navigation-flex
<nav>
  <ul>
    <li><a href="#">Page 1</a></li>
    <li><a href="#">Page 2</a></li>
    <li><a href="#">Page 3 is longer</a></li>
    <li><a href="#">Page 4</a></li>
  </ul>
</nav>
```

```css live-sample___navigation-flex
nav {
  border: 2px solid #eeeeee;
}
nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
}

nav a {
  text-decoration: none;
  color: black;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
  display: block;
}

nav li {
  flex: auto;
}
```

{{EmbedLiveSample("navigation-flex")}}

## Split navigation

Một cách khác để căn chỉnh các mục trên trục chính là sử dụng auto margins. Điều này cho phép pattern thiết kế navigation bar trong đó một nhóm mục được căn trái và nhóm khác căn phải. Ở đây chúng ta đang sử dụng kỹ thuật auto margins được mô tả trong [Sử dụng auto margins để căn chỉnh trục chính](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items#using_auto_margins_for_main_axis_alignment).

Các mục được căn chỉnh trên trục chính với `normal`, hoạt động như `start`, vì đây là hành vi khởi tạo của flexbox. Thuộc tính {{cssxref("gap")}} tạo khoảng cách giữa các mục. Và chúng ta đang căn chỉnh mục cuối sang phải bằng cách cho nó giá trị `margin-left` là `auto`. Bạn có thể di chuyển class từ mục này sang mục khác để thay đổi vị trí phân chia.

```html live-sample___split-navigation
<nav>
  <ul>
    <li><a href="#">Page 1</a></li>
    <li><a href="#">Page 2</a></li>
    <li><a href="#">Page 3 is longer</a></li>
    <li class="push-right"><a href="#">Page 4</a></li>
  </ul>
</nav>
```

```css live-sample___split-navigation
nav {
  border: 2px solid #eeeeee;
}

nav a {
  text-decoration: none;
  color: black;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
  display: block;
}

nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
  gap: 20px;
}

.push-right {
  margin-left: auto;
}
```

{{EmbedLiveSample("split-navigation")}}

## Căn giữa phần tử

Một câu đùa lâu đời trong giới lập trình viên là vấn đề khó nhất trong thiết kế web là căn giữa theo chiều dọc. Việc căn giữa nội dung theo chiều dọc rất đơn giản với các thuộc tính căn chỉnh của flexbox, như ví dụ trực tiếp dưới đây cho thấy.

Nhấn **"Play"** và thử thay đổi căn chỉnh, ví dụ căn mục về đầu với `start` hoặc cuối với `end`:

```html live-sample___center
<div class="box">
  <div></div>
</div>
```

```css live-sample___center
.box {
  height: 300px;
  border: 2px dotted rgb(96 139 168);
  display: flex;
  align-items: center;
  justify-content: center;
}

.box div {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  width: 100px;
  height: 100px;
}
```

{{EmbedLiveSample("center", "", "320px")}}

Với các thuộc tính [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment), bạn có thể căn giữa theo chiều dọc một phần tử bên trong phần tử khác mà không cần flexbox. Trong ví dụ trên, hãy thử xóa các thuộc tính flex khỏi box và thêm `align-content: center`. Sau đó thêm `margin: auto` vào phần tử bạn muốn căn giữa theo chiều ngang.

## Layout card đẩy footer xuống dưới

Dù bạn dùng flexbox hay grid để bố cục danh sách các thành phần card, các phương pháp layout này chỉ hoạt động trên các con trực tiếp của flex hoặc grid container. Điều này có nghĩa là nếu bạn có lượng nội dung thay đổi, card sẽ kéo dài đến chiều cao của grid area hoặc flex container. Bất kỳ nội dung nào bên trong sử dụng layout block thông thường, có nghĩa là trên card có ít nội dung hơn, footer sẽ nổi lên dưới nội dung thay vì dính ở đáy card.

![Hai thành phần card cho thấy phần bên trong thành phần không kéo dài theo wrapper.](flex-cards.png)

Flexbox giải quyết vấn đề này. Chúng ta biến card thành flex container, với {{cssxref("flex-direction", "flex-direction: column")}}. Sau đó chúng ta đặt vùng nội dung thành `flex: 1`, là dạng viết tắt của `flex: 1 1 0` — mục có thể tăng trưởng và thu nhỏ từ flex basis là `0`. Vì đây là mục duy nhất có thể tăng trưởng, nó chiếm tất cả khoảng trống có sẵn trong flex container và đẩy footer xuống dưới cùng. Nếu bạn xóa thuộc tính `flex` khỏi ví dụ trực tiếp, bạn sẽ thấy footer di chuyển lên ngay dưới nội dung.

```html live-sample___cards
<div class="cards">
  <div class="card">
    <div class="content">
      <p>This card doesn't have much content.</p>
    </div>
    <footer>Card footer</footer>
  </div>
  <div class="card">
    <div class="content">
      <p>
        This card has a lot more content which means that it defines the height
        of the container the cards are in. I've laid the cards out using grid
        layout, so the cards themselves will stretch to the same height.
      </p>
    </div>
    <footer>Card footer</footer>
  </div>
</div>
```

```css live-sample___cards
body {
  font-family: sans-serif;
}
.cards {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  grid-gap: 10px;
}

.card {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  display: flex;
  flex-direction: column;
}

.card .content {
  padding: 10px;
  flex: 1 1 auto;
}

.card footer {
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
}
```

{{EmbedLiveSample("cards", "", "280px")}}

## Media objects

Media object — một hình ảnh hoặc phần tử media khác kết hợp với văn bản mô tả đặt cạnh nhau — là một pattern phổ biến trong thiết kế web. Media objects cần có thể được lật — di chuyển hình ảnh từ bên này sang bên kia.

Pattern này được sử dụng cho comment và các nơi khác mà hình ảnh được đặt cạnh mô tả của chúng. Chúng ta có thể sử dụng flexbox để cho phép phần của media object chứa hình ảnh lấy thông tin kích thước từ hình ảnh với nội dung của media object flex để chiếm phần còn lại của không gian.

Trong ví dụ này, media object được căn chỉnh với `flex-start` và `.content` được đặt để tăng trưởng, với hệ số tăng trưởng được đặt thành `1`. Các thuộc tính này giống với các thuộc tính được sử dụng cho pattern card layout theo cột ở trên.

```html live-sample___media
<div class="media">
  <div class="image">
    <img
      alt="A colorful balloon against a blue sky"
      src="https://mdn.github.io/shared-assets/images/examples/balloon.jpg" />
  </div>
  <div class="content">
    This is the content of my media object. Items directly inside the flex
    container will be aligned to flex-start.
  </div>
</div>
```

```css live-sample___media
img {
  max-width: 100%;
  display: block;
}

.media {
  border: 2px dotted rgb(96 139 168);
  display: flex;
  align-items: flex-start;
}

.media .content {
  flex: 1;
  padding: 10px;
}
```

{{EmbedLiveSample("media", "", "320px")}}

Một số điều bạn có thể muốn thử trong ví dụ trực tiếp này liên quan đến các cách khác nhau bạn có thể muốn ràng buộc media object trong thiết kế của mình.

Để ngăn hình ảnh lớn quá mức, bạn nên thêm {{cssxref("max-width")}} vào hình ảnh. Vì phía đó của media object sử dụng các giá trị khởi tạo của flexbox, nó có thể thu nhỏ nhưng không tăng trưởng, và sử dụng `flex-basis` là auto. Bất kỳ {{cssxref("width")}} hoặc `max-width` nào được áp dụng cho hình ảnh sẽ trở thành `flex-basis`.

```css
.image img {
  max-width: 100px;
}
```

Bạn cũng có thể cho phép cả hai bên tăng trưởng và thu nhỏ theo tỷ lệ. Nếu bạn đặt cả hai bên thành `flex: 1`, chúng sẽ tăng trưởng và thu nhỏ từ {{cssxref("flex-basis")}} là `0`, vì vậy bạn sẽ kết thúc với hai cột có cùng kích thước. Bạn có thể lấy nội dung làm hướng dẫn và đặt cả hai thành `flex: auto`, trong trường hợp đó chúng sẽ tăng trưởng và thu nhỏ từ kích thước của nội dung hoặc bất kỳ kích thước nào được áp dụng trực tiếp cho các flex item như `width` trên hình ảnh.

```css
.media .content {
  flex: 1;
  padding: 10px;
}

.image {
  flex: 1;
}
```

Bạn cũng có thể cho mỗi bên các hệ số {{cssxref("flex-grow")}} khác nhau, ví dụ đặt bên có hình ảnh thành `flex: 1` và bên nội dung thành `flex: 3`. Điều này có nghĩa là chúng sử dụng `flex-basis` là `0` nhưng phân phối không gian đó với các tỷ lệ khác nhau theo hệ số `flex-grow` bạn đã gán. Các thuộc tính flex chúng ta sử dụng để làm điều này được mô tả chi tiết trong hướng dẫn [Kiểm soát tỷ lệ các flex item dọc theo trục chính](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios).

```css
.media .content {
  flex: 3;
  padding: 10px;
}

.image {
  flex: 1;
}
```

### Lật media object

Để chuyển đổi hiển thị của media object và đặt hình ảnh ở bên phải và nội dung ở bên trái, chúng ta đặt thuộc tính `flex-direction` thành `row-reverse`.

Trong ví dụ này, chúng ta đã thêm class `flipped` bên cạnh class `media`. Xóa class khỏi HTML để xem cách hiển thị thay đổi.

```html live-sample___media-flipped
<div class="media flipped">
  <div class="image">
    <img
      alt="A colorful balloon against a blue sky"
      src="https://mdn.github.io/shared-assets/images/examples/balloon.jpg" />
  </div>
  <div class="content">
    This is the content of my media object. Items directly inside the flex
    container will be aligned to flex-start.
  </div>
</div>
```

```css live-sample___media-flipped
img {
  max-width: 100%;
  display: block;
}

.media {
  border: 2px dotted rgb(96 139 168);
  display: flex;
  align-items: flex-start;
}

.flipped {
  flex-direction: row-reverse;
}

.media .content {
  flex: 1;
  padding: 10px;
}
```

{{EmbedLiveSample("media-flipped", "", "320px")}}

## Form controls

Flexbox đặc biệt hữu ích khi tạo kiểu cho các form control. Form có nhiều phần tử nhỏ mà chúng ta thường muốn căn chỉnh với nhau. Một pattern phổ biến là có cặp {{htmlelement("label")}} và {{htmlelement("input")}} kết hợp với {{htmlelement("button")}}, có thể cho form tìm kiếm hoặc form đăng ký nhận bản tin nơi bạn muốn người truy cập nhập địa chỉ email của họ.

Flexbox làm cho loại layout này có thể thực hiện được chỉ với một vài khai báo. `<label>`, `<input>` và `<button>` được chứa trong wrapper được đặt thành `display: flex`. Các thuộc tính flex cho phép trường `<input>` tăng trưởng, trong khi button và label không tăng trưởng. Trường nhập văn bản sẽ tăng trưởng và thu nhỏ tùy thuộc vào khoảng trống có sẵn.

```html live-sample___label-input-button
<form class="example">
  <div class="wrapper">
    <label for="text">Label</label>
    <input id="text" type="text" />
    <input type="submit" value="Send" />
  </div>
</form>
```

```css live-sample___label-input-button
* {
  font: 1.1em sans-serif;
}

.wrapper {
  display: flex;
  border: 1px solid rgb(96 139 168);
}
.wrapper > * {
  padding: 10px;
  border: none;
  color: white;
}
.wrapper > input[type="text"] {
  background-color: rgb(96 139 168 / 0.5);
  border-right: 1px solid rgb(96 139 168);
  flex: 1 1 auto;
}
.wrapper input[type="submit"] {
  background-color: rgb(96 139 168);
  color: white;
}
.wrapper label {
  background-color: #666666;
}
```

{{EmbedLiveSample("label-input-button")}}

Các pattern như thế này có thể giúp tạo thư viện các phần tử form cho thiết kế của bạn, dễ dàng chứa các phần tử bổ sung được thêm vào. Bạn đang tận dụng tính linh hoạt của flexbox bằng cách kết hợp các mục không tăng trưởng với những mục có thể tăng trưởng.

## Kết luận

Trong khi khám phá các pattern trên, bạn đã bắt đầu thấy cách bạn có thể nghĩ qua cách tốt nhất để sử dụng flexbox để đạt được kết quả mong muốn. Khá thường xuyên bạn có nhiều hơn một lựa chọn. Kết hợp các mục không thể kéo giãn với những mục có thể, sử dụng nội dung để thông báo kích thước, hoặc cho phép flexbox chia sẻ không gian theo tỷ lệ. Tùy thuộc vào bạn.

Hãy suy nghĩ về cách tốt nhất để trình bày nội dung bạn có, sau đó xem flexbox hoặc các phương pháp layout khác có thể giúp bạn đạt được điều đó như thế nào.
