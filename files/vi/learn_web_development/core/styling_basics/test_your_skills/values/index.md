---
title: "Kiểm tra kỹ năng: Giá trị và đơn vị"
short-title: "Kiểm tra: Giá trị và đơn vị"
slug: Learn_web_development/Core/Styling_basics/Test_your_skills/Values
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Values_and_units", "Learn_web_development/Core/Styling_basics/Sizing", "Learn_web_development/Core/Styling_basics")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu các loại [giá trị và đơn vị khác nhau được dùng trong các thuộc tính CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units) không.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Giá trị và đơn vị 1

Trong nhiệm vụ này, mục danh sách đầu tiên đã được đặt màu nền bằng mã màu hex. Hoàn thành CSS bằng cách dùng cùng màu đó ở các định dạng khác nhau, cộng thêm mục danh sách cuối cùng nơi bạn nên làm cho nền bán trong suốt.

- Mục danh sách thứ hai nên dùng màu RGB.
- Mục thứ ba nên dùng màu HSL.
- Mục thứ tư nên dùng màu RGB nhưng với kênh alpha được đặt là `0.6`.

Bạn có thể chuyển đổi màu hex bằng [convertingcolors.com](https://convertingcolors.com/hex-color-86DEFA.html). Bạn cần tìm hiểu cách dùng các giá trị trong CSS.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("values1-start", "", "300px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___values1-start live-sample___values1-finish
<ul>
  <li class="hex">hex color</li>
  <li class="rgb">RGB color</li>
  <li class="hsl">HSL color</li>
  <li class="transparency">Alpha value 0.6</li>
</ul>
```

```css live-sample___values1-start live-sample___values1-finish
body {
  font: 1.2em / 1.5 sans-serif;
}
ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

li {
  margin: 1em;
  padding: 0.5em;
}

.hex {
  background-color: #86defa;
}

/* Add styles here */
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("values1-finish", "", "300px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Bằng cách dùng [công cụ chuyển đổi màu](https://convertingcolors.com/hex-color-86DEFA.html), bạn sẽ có thể dùng các [hàm màu](/en-US/docs/Web/CSS/Reference/Values/color_value#syntax) khác nhau để định nghĩa cùng màu theo các cách khác nhau:

```css live-sample___values1-finish
.rgb {
  background-color: rgb(134 222 250);
}

.hsl {
  background-color: hsl(194 92% 75%);
}

.transparency {
  background-color: rgb(134 222 250 / 60%);
}
```

</details>

## Giá trị và đơn vị 2

Trong nhiệm vụ này, chúng tôi muốn bạn đặt cỡ chữ cho các mục văn bản khác nhau:

- Phần tử `<h1>` nên có cỡ `50px`.
- Phần tử `<h2>` nên có cỡ `2em`.
- Tất cả các phần tử `<p>` nên có cỡ `16px`.
- Phần tử `<p>` ngay sau `<h1>` nên có cỡ `120%`.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("values2-start", "", "420px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___values2-start live-sample___values2-finish
<h1>Level 1 heading</h1>
<p>
  Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
  daikon amaranth tatsoi tomatillo melon azuki bean garlic.
</p>
<h2>Level 2 heading</h2>
<p>
  Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette
  tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato.
  Dandelion cucumber earthnut pea peanut soko zucchini.
</p>
```

```css live-sample___values2-start live-sample___values2-finish
body {
  font: 1.2em / 1.5 sans-serif;
}

h1 {
  /* Add styles here */
}

h2 {
  /* Add styles here */
}

p {
  /* Add styles here */
}

h1 + p {
  /* Add styles here */
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("values2-finish", "", "430px")}}

Đây là code bên dưới của điểm bắt đầu này:

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Bạn có thể dùng các giá trị độ dài sau:

```css live-sample___values2-finish
h1 {
  font-size: 50px;
}

h2 {
  font-size: 2em;
}

p {
  font-size: 16px;
}

h1 + p {
  font-size: 120%;
}
```

</details>

## Giá trị và đơn vị 3

Để hoàn thành nhiệm vụ, hãy cập nhật CSS để di chuyển hình ảnh nền sao cho nó được căn giữa theo chiều ngang và cách `20%` từ trên cùng của hộp.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("values3-start", "", "400px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___values3-start live-sample___values3-finish
<div class="box"></div>
```

```css live-sample___values3-start live-sample___values3-finish
.box {
  border: 5px solid black;
  height: 350px;
}

.box {
  background-image: url("https://mdn.github.io/shared-assets/images/examples/purple-star.png");
  background-repeat: no-repeat;
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("values3-finish", "", "400px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Dùng `background-position` với từ khóa `center` và một tỉ lệ phần trăm:

```css live-sample___values3-finish
.box {
  background-image: url("https://mdn.github.io/shared-assets/images/examples/purple-star.png");
  background-repeat: no-repeat;
  background-position: center 20%;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Values_and_units", "Learn_web_development/Core/Styling_basics/Sizing", "Learn_web_development/Core/Styling_basics")}}
