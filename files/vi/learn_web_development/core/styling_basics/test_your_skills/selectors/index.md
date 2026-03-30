---
title: "Kiểm tra kỹ năng: Bộ chọn"
short-title: "Kiểm tra: Bộ chọn"
slug: Learn_web_development/Core/Styling_basics/Test_your_skills/Selectors
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Combinators", "Learn_web_development/Core/Styling_basics/Box_model", "Learn_web_development/Core/Styling_basics")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu [bộ chọn CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors) không.

Để hoàn thành các nhiệm vụ này, bạn chỉ nên chỉnh sửa CSS, không phải HTML.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Bộ chọn 1

Để hoàn thành nhiệm vụ:

1. Làm cho các tiêu đề `<h1>` có màu xanh lam.
2. Đặt cho các tiêu đề `<h2>` nền màu xanh lam và chữ trắng.
3. Làm cho văn bản được bọc trong `<span>` có cỡ chữ `200%`.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("selectors1-start", "", "370px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___selectors1-start live-sample___selectors1-finish
<div class="container">
  <h1>This is a heading</h1>
  <p>
    Veggies es <span>bonus vobis</span>, proinde vos postulo essum magis
    kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean
    garlic.
  </p>
  <h2>A level 2 heading</h2>
  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
</div>
```

```css live-sample___selectors1-start live-sample___selectors1-finish
body {
  font: 1.2em / 1.5 sans-serif;
}
/* Add styles here */
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("selectors1-finish", "", "400px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Bạn cần nhắm đến các bộ chọn `h1`, `h2` và `span` để thay đổi màu hoặc kích thước của chúng.

```css live-sample___selectors1-finish
h1 {
  color: blue;
}

h2 {
  background-color: blue;
  color: white;
}

span {
  font-size: 200%;
}
```

</details>

## Bộ chọn 2

Để hoàn thành nhiệm vụ:

1. Đặt cho phần tử có id là `special` nền màu vàng.
2. Đặt cho phần tử có class là `alert` đường viền đặc màu xám `2px`.
3. Nếu phần tử có class `alert` cũng có class `stop`, làm cho nền màu đỏ.
4. Nếu phần tử có class `alert` cũng có class `go`, làm cho nền màu xanh lá.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("selectors2-start", "", "480px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___selectors2-start live-sample___selectors2-finish
<div class="container">
  <h1>This is a heading</h1>
  <p>
    Veggies es <span class="alert">bonus vobis</span>, proinde vos postulo
    <span class="alert stop">essum magis</span> kohlrabi welsh onion daikon
    amaranth tatsoi tomatillo melon azuki bean garlic.
  </p>
  <h2 id="special">A level 2 heading</h2>
  <p>Gumbo beet greens corn soko endive gumbo gourd.</p>
  <h2>Another level 2 heading</h2>
  <p>
    <span class="alert go">Parsley shallot</span> courgette tatsoi pea sprouts
    fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber
    earthnut pea peanut soko zucchini.
  </p>
</div>
```

```css live-sample___selectors2-start live-sample___selectors2-finish
body {
  font: 1.2em / 1.5 sans-serif;
}
/* Add styles here */
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("selectors2-finish", "", "480px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Bài này kiểm tra bạn hiểu sự khác biệt giữa bộ chọn class và id và cách nhắm đến nhiều class trên một phần tử.

```css live-sample___selectors2-finish
#special {
  background-color: yellow;
}

.alert {
  border: 2px solid grey;
}

.alert.stop {
  background-color: red;
}

.alert.go {
  background-color: green;
}
```

</details>

## Bộ chọn 3

Để hoàn thành nhiệm vụ:

1. Tạo kiểu cho các liên kết, làm cho trạng thái liên kết có màu cam, liên kết đã truy cập màu xanh lá, và xóa gạch chân khi rê chuột.
2. Làm cho phần tử đầu tiên bên trong container có `font-size: 150%` và dòng đầu tiên của phần tử đó màu đỏ.
3. Tạo sọc cho mỗi hàng khác trong bảng bằng cách chọn các hàng này và đặt cho chúng màu nền `#333333` và màu chữ trắng.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("selectors3-start", "", "440px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___selectors3-start live-sample___selectors3-finish
<div class="container">
  <p>
    Veggies es <a href="http://example.com">bonus vobis</a>, proinde vos postulo
    essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon
    azuki bean garlic.
  </p>
  <p>
    Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
    tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
    Dandelion cucumber earthnut pea peanut soko zucchini.
  </p>
  <table>
    <tbody>
      <tr>
        <th>Fruits</th>
        <th>Vegetables</th>
      </tr>
      <tr>
        <td>Apple</td>
        <td>Potato</td>
      </tr>
      <tr>
        <td>Orange</td>
        <td>Carrot</td>
      </tr>
      <tr>
        <td>Tomato</td>
        <td>Parsnip</td>
      </tr>
      <tr>
        <td>Kiwi</td>
        <td>Onion</td>
      </tr>
      <tr>
        <td>Banana</td>
        <td>Beet</td>
      </tr>
    </tbody>
  </table>
</div>
```

```css live-sample___selectors3-start live-sample___selectors3-finish
body {
  font: 1.2em / 1.5 sans-serif;
}
* {
  box-sizing: border-box;
}

table {
  border-collapse: collapse;
  width: 300px;
}

td,
th {
  padding: 0.2em;
  text-align: left;
}

/* Add styles here */
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("selectors3-finish", "", "540px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Áp dụng lớp giả (`:first-child`) và phần tử giả (`::first-line`) lên nội dung.
Tạo kiểu các trạng thái `:link`, `:visited` và `:hover` của phần tử `a`, và tạo các hàng bảng sọc ngựa vằn bằng lớp giả `:nth-child`.

```css live-sample___selectors3-finish
.container p:first-child {
  font-size: 150%;
}

.container p:first-child::first-line {
  color: red;
}

a:link {
  color: orange;
}

a:visited {
  color: green;
}

a:hover {
  text-decoration: none;
}

tr:nth-child(even) {
  background-color: #333333;
  color: white;
}
```

</details>

## Bộ chọn 4

Để hoàn thành nhiệm vụ:

1. Làm cho bất kỳ đoạn văn nào ngay sau một phần tử `<h2>` có màu đỏ.
2. Tạo kiểu các mục danh sách là con trực tiếp của `<ul>` có class `list` như sau:
   - Xóa dấu đầu dòng của chúng.
   - Đặt cho chúng đường viền dưới màu xám `1px`.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("selectors4-start", "", "500px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___selectors4-start live-sample___selectors4-finish
<div class="container">
  <h2>This is a heading</h2>
  <p>This paragraph comes after the heading.</p>
  <p>This is the second paragraph.</p>

  <h2>Another heading</h2>
  <p>This paragraph comes after the heading.</p>
  <ul class="list">
    <li>One</li>
    <li>
      Two
      <ul>
        <li>2.1</li>
        <li>2.2</li>
      </ul>
    </li>
    <li>Three</li>
  </ul>
</div>
```

```css live-sample___selectors4-start live-sample___selectors4-finish
body {
  font: 1.2em / 1.5 sans-serif;
}

/* Add styles here */
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("selectors4-finish", "", "500px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Nhiệm vụ này kiểm tra bạn hiểu cách dùng các bộ kết hợp khác nhau.
Đây là giải pháp phù hợp:

```css live-sample___selectors4-finish
h2 + p {
  color: red;
}

.list > li {
  list-style: none;
  border-bottom: 1px solid #cccccc;
}
```

</details>

## Bộ chọn 5

Để hoàn thành nhiệm vụ, hãy cung cấp giải pháp cho các thử thách sau bằng bộ chọn thuộc tính:

1. Nhắm đến phần tử `<a>` có thuộc tính `title` và đặt đường viền màu hồng (`border-color: pink`).
2. Nhắm đến phần tử `<a>` có thuộc tính `href` chứa từ `contact` ở đâu đó trong giá trị của nó và đặt đường viền màu cam (`border-color: orange`).
3. Nhắm đến phần tử `<a>` có giá trị `href` bắt đầu bằng `https` và đặt cho nó đường viền màu xanh lá (`border-color: green`).

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("selectors5-start", "", "300px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___selectors5-start live-sample___selectors5-finish
<ul>
  <li><a href="https://example.com">Link 1</a></li>
  <li><a href="http://example.com" title="Visit example.com">Link 2</a></li>
  <li><a href="/contact">Link 3</a></li>
  <li><a href="../contact/index.html">Link 4</a></li>
</ul>
```

```css live-sample___selectors5-start live-sample___selectors5-finish
body {
  font: 1.2em / 1.5 sans-serif;
}

ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

li {
  margin-bottom: 0.5em;
}

a {
  display: block;
  padding: 0.5em;
}

a {
  border: 5px solid grey;
}

/* Add styles here */
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("selectors5-finish", "", "300px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

- Để chọn các phần tử có thuộc tính title, chúng ta có thể thêm title vào bên trong dấu ngoặc vuông (`a[title]`), điều này sẽ chọn liên kết thứ hai là liên kết duy nhất có thuộc tính title.

- Nhắm đến phần tử `<a>` có thuộc tính `href` chứa từ "contact" ở bất kỳ đâu trong giá trị của nó và đặt đường viền màu cam (`border-color: orange`).
  Có hai thứ chúng ta muốn khớp ở đây, giá trị href `/contact` và cũng `/contact`. Vì vậy chúng ta cần khớp chuỗi "contact" ở bất kỳ đâu trong giá trị bằng cách dùng `*=`. Điều này sẽ chọn liên kết thứ ba và thứ tư.

- Nhắm đến phần tử `<a>` có giá trị href bắt đầu bằng `https` và đặt cho nó đường viền màu xanh lá (`border-color: green`).
  Tìm giá trị `href` bắt đầu bằng "https", vì vậy dùng `^=` để chỉ chọn liên kết đầu tiên.

```css live-sample___selectors5-finish
a[title] {
  border-color: pink;
}
a[href*="contact"] {
  border-color: orange;
}
a[href^="https"] {
  border-color: green;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Combinators", "Learn_web_development/Core/Styling_basics/Box_model", "Learn_web_development/Core/Styling_basics")}}
