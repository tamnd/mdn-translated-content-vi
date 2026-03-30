---
title: "Kiểm tra kỹ năng: Lưới CSS"
short-title: "Kiểm tra: Lưới CSS"
slug: Learn_web_development/Core/CSS_layout/Test_your_skills/Grid
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Grids", "Learn_web_development/Core/CSS_layout/Fundamental_Layout_Comprehension", "Learn_web_development/Core/CSS_layout")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu cách [lưới và các mục lưới](/en-US/docs/Learn_web_development/Core/CSS_layout/Grids) hoạt động không. Bạn sẽ làm qua một số tác vụ nhỏ sử dụng các phần tử khác nhau của tài liệu bạn vừa học.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills). Bạn cũng có thể liên hệ với chúng tôi bằng một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## Lưới CSS 1

Trong tác vụ này, chúng ta muốn bạn tạo một lưới trong đó bốn phần tử con sẽ được tự động đặt. Lưới nên có ba cột chia đều không gian có sẵn, với khoảng cách `20px` giữa các track cột và hàng. Sau đó, hãy thử thêm nhiều phần tử con hơn bên trong vùng chứa cha với class `grid` và xem cách chúng hoạt động theo mặc định.

Điểm bắt đầu của tác vụ trông như thế này:

{{EmbedLiveSample("grid1-start", "", "220px")}}

Đây là mã cơ bản cho điểm bắt đầu này:

```html live-sample___grid1-start live-sample___grid1-finish
<div class="grid">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
</div>
```

```css live-sample___grid1-start live-sample___grid1-finish
body {
  font: 1.2em / 1.5 sans-serif;
}

.grid > * {
  background-color: #4d7298;
  border: 2px solid #77a6b6;
  border-radius: 0.5em;
  color: white;
  padding: 0.5em;
}

.grid {
  /* Add styles here */
}
```

Bố cục hoàn chỉnh sẽ trông như thế này:

{{EmbedLiveSample("grid1-finish", "", "160px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Tạo lưới bằng `display: grid` với ba cột sử dụng `grid-template-columns` và `gap` giữa các mục:

```css live-sample___grid1-finish
.grid {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 20px;
}
```

</details>

## Lưới CSS 2

Trong tác vụ này, chúng ta đã có lưới được định nghĩa. Chúng ta muốn bạn chỉnh sửa các quy tắc CSS cho hai phần tử con để mỗi cái mở rộng qua một số track lưới. Mục thứ hai nên phủ lên mục đầu tiên.

**Câu hỏi bonus:** Bây giờ bạn có thể khiến mục đầu tiên hiển thị ở trên cùng mà không thay đổi thứ tự các mục trong nguồn không?

Điểm bắt đầu của tác vụ trông như thế này:

{{EmbedLiveSample("grid2-start", "", "340px")}}

Đây là mã cơ bản cho điểm bắt đầu này:

```html live-sample___grid2-start live-sample___grid2-finish
<div class="grid">
  <div class="item1">One</div>
  <div class="item2">Two</div>
</div>
```

```css live-sample___grid2-start live-sample___grid2-finish
body {
  font: 1.2em / 1.5 sans-serif;
}
.grid > * {
  border-radius: 0.5em;
  color: white;
  padding: 0.5em;
}

.item1 {
  background-color: rgb(74 102 112 / 70%);
  border: 5px solid rgb(74 102 112 / 100%);
}

.item2 {
  background-color: rgb(214 162 173 / 70%);
  border: 5px solid rgb(214 162 173 / 100%);
}

.grid {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-template-rows: 100px 100px 100px;
  gap: 10px;
}

.item1 {
  /* Add styles here */
}

.item2 {
  /* Add styles here */
}
```

Bố cục sẽ trông như thế này sau khi bạn hoàn thành tác vụ:

{{EmbedLiveSample("grid2-finish", "", "340px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Có thể xếp các mục bằng cách chúng chiếm cùng ô lưới.
Một lựa chọn là sử dụng các viết tắt bên dưới, tuy nhiên sẽ đúng khi sử dụng dạng dài `grid-row-start` ví dụ.

```css live-sample___grid2-finish
.item1 {
  grid-column: 1 / 4;
  grid-row: 1 / 3;
}

.item2 {
  grid-column: 2 / 5;
  grid-row: 2 / 4;
}
```

Đối với câu hỏi bonus, một cách để đạt được điều này là sử dụng `order`, mà chúng ta đã gặp trong hướng dẫn flexbox.

```css live-sample___grid2-finish
.item1 {
  order: 1;
}
```

Một giải pháp hợp lệ khác là sử dụng `z-index`:

```css
.item1 {
  z-index: 1;
}
```

</details>

## Lưới CSS 3

Trong tác vụ này, lưới có bốn phần tử con trực tiếp. Chúng hiện được tự động đặt trong lưới.

Điểm bắt đầu của tác vụ trông như thế này:

{{EmbedLiveSample("grid3-start", "", "200px")}}

Đây là mã cơ bản cho điểm bắt đầu này:

```html live-sample___grid3-start live-sample___grid3-finish
<div class="grid">
  <div class="one">One</div>
  <div class="two">Two</div>
  <div class="three">Three</div>
  <div class="four">Four</div>
</div>
```

```css live-sample___grid3-start live-sample___grid3-finish
body {
  font: 1.2em / 1.5 sans-serif;
}
.grid > * {
  background-color: #4d7298;
  border: 2px solid #77a6b6;
  border-radius: 0.5em;
  color: white;
  padding: 0.5em;
}

.grid {
  display: grid;
  grid-template-columns: 1fr 2fr;
  gap: 10px;
}
```

Để hoàn thành tác vụ này, hãy sử dụng các thuộc tính `grid-area` và `grid-template-areas` để bố cục các mục như được hiển thị ở đây:

{{EmbedLiveSample("grid3-finish", "", "200px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Mỗi phần của bố cục cần một tên sử dụng thuộc tính `grid-area` và `grid-template-areas` để bố cục chúng. Các vùng nhầm lẫn có thể là không nhận ra bạn nên đặt `.` để để trống một ô, hoặc bạn nên lặp lại tên để làm cho một phần tử mở rộng qua nhiều hơn một track:

```css live-sample___grid3-finish
.grid {
  display: grid;
  gap: 20px;
  grid-template-columns: 1fr 2fr;
  grid-template-areas:
    "aa aa"
    "bb cc"
    ". dd";
}

.one {
  grid-area: aa;
}

.two {
  grid-area: bb;
}

.three {
  grid-area: cc;
}

.four {
  grid-area: dd;
}
```

</details>

## Lưới CSS 4

Trong tác vụ này, bạn sẽ cần sử dụng cả bố cục lưới và flexbox để tái tạo bố cục hoàn chỉnh. Khoảng cách giữa các track cột và hàng nên là `10px`. Bạn không cần thực hiện bất kỳ thay đổi nào cho HTML để đạt được điều này.

Điểm bắt đầu của tác vụ trông như thế này:

{{EmbedLiveSample("grid4-start", "", "400px")}}

Đây là mã cơ bản cho điểm bắt đầu này:

```html live-sample___grid4-start live-sample___grid4-finish
<div class="container">
  <div class="card">
    <img
      alt="a single red balloon"
      src="https://mdn.github.io/shared-assets/images/examples/balloons1.jpg" />
    <ul class="tags">
      <li>balloon</li>
      <li>red</li>
      <li>sky</li>
      <li>blue</li>
      <li>Hot air balloon</li>
    </ul>
  </div>
  <div class="card">
    <img
      alt="balloons over some houses"
      src="https://mdn.github.io/shared-assets/images/examples/balloons2.jpg" />
    <ul class="tags">
      <li>balloons</li>
      <li>houses</li>
      <li>train</li>
      <li>harborside</li>
    </ul>
  </div>
  <div class="card">
    <img
      alt="close-up of balloons inflating"
      src="https://mdn.github.io/shared-assets/images/examples/balloons3.jpg" />
    <ul class="tags">
      <li>balloons</li>
      <li>inflating</li>
      <li>green</li>
      <li>blue</li>
    </ul>
  </div>
  <div class="card">
    <img
      alt="a balloon in the sun"
      src="https://mdn.github.io/shared-assets/images/examples/balloons4.jpg" />
    <ul class="tags">
      <li>balloon</li>
      <li>sun</li>
      <li>sky</li>
      <li>summer</li>
      <li>bright</li>
    </ul>
  </div>
</div>
```

```css live-sample___grid4-start live-sample___grid4-finish
body {
  font: 1.2em / 1.5 sans-serif;
}

.card {
  display: grid;
  grid-template-rows: 200px min-content;
}

.card > img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.tags {
  margin: 0;
  padding: 0;
  list-style: none;
}

.tags > * {
  background-color: #999999;
  color: white;
  padding: 0.2em 0.8em;
  border-radius: 0.2em;
  font-size: 80%;
  margin: 5px;
}

.container {
  /* Add styles here */
}

.tags {
  /* Add styles here */
}
```

Bố cục sẽ trông như thế này sau khi bạn hoàn thành tác vụ:

{{EmbedLiveSample("grid4-finish", "", "400px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Vùng chứa sẽ cần là bố cục lưới, vì chúng ta có căn lề trong hàng và cột - hai chiều.
`<ul>` cần là vùng chứa flex vì các thẻ (phần tử `<li>`) không được xếp hàng trong các cột, chỉ trong các hàng và chúng được căn giữa trong không gian với thuộc tính căn lề `justify-content` được đặt thành `center`.

Bạn có thể thử sử dụng flexbox trên vùng chứa và hạn chế các thẻ bằng giá trị phần trăm. Bạn cũng có thể thử làm cho các mục thành bố cục lưới trong trường hợp đó, lưu ý rằng các mục không được căn thẳng theo hai chiều nên flexbox không phải lựa chọn tốt nhất.

```css live-sample___grid4-finish
.container {
  display: grid;
  gap: 10px;
  grid-template-columns: 1fr 1fr 1fr;
}

.tags {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Grids", "Learn_web_development/Core/CSS_layout/Fundamental_Layout_Comprehension", "Learn_web_development/Core/CSS_layout")}}
