---
title: "Kiểm tra kỹ năng: Kích thước"
short-title: "Kiểm tra: Kích thước"
slug: Learn_web_development/Core/Styling_basics/Test_your_skills/Sizing
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Sizing", "Learn_web_development/Core/Styling_basics/Backgrounds_and_borders", "Learn_web_development/Core/Styling_basics")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu các cách khác nhau để [định kích thước các mục trong CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Sizing) không.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Kích thước 1

Trong nhiệm vụ này, bạn có hai hộp.

Để hoàn thành nhiệm vụ:

1. Định kích thước hộp đầu tiên sao cho chiều cao của nó ít nhất là `100px`, ngay cả khi có ít nội dung hơn sẽ làm nó cao hơn đó. Nội dung không nên tràn ra ngoài nếu không vừa vào hộp.
2. Để kiểm tra điều này, hãy xóa nội dung trong HTML để đảm bảo bạn vẫn nhận được hộp cao `100px` ngay cả khi không có nội dung.
3. Định kích thước hộp thứ hai sao cho nó có chiều cao cố định `100px`. Trong trường hợp này, nội dung nên tràn ra ngoài.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("sizing1-start", "", "480px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___sizing1-start live-sample___sizing1-finish
<div class="box box1">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic. Gumbo beet greens
    corn soko endive gumbo gourd.
  </p>
</div>

<div class="box box2">
  <p>
    Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
    daikon amaranth tatsoi tomatillo melon azuki bean garlic. Gumbo beet greens
    corn soko endive gumbo gourd.
  </p>
</div>
```

```css live-sample___sizing1-start live-sample___sizing1-finish
body {
  font: 1.2em / 1.5 sans-serif;
  padding: 1em;
}

.box {
  border: 5px solid black;
  width: 400px;
  margin-bottom: 1em;
}

.box1 {
  /* Add styles here */
}

.box2 {
  /* Add styles here */
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("sizing1-finish", "", "460px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Có hai hộp. Hộp đầu tiên nên được đặt `min-height` để nó mở rộng chứa nội dung thêm, nhưng sẽ không thu nhỏ xuống dưới `100px` nếu nội dung bị xóa. Hộp thứ hai được đặt chiều cao cố định, điều này sẽ làm nội dung tràn ra ngoài.

```css live-sample___sizing1-finish
.box1 {
  min-height: 100px;
}

.box2 {
  height: 100px;
}
```

</details>

## Kích thước 2

Trong nhiệm vụ này, bạn có một hộp chứa một hộp khác.

Để hoàn thành nhiệm vụ:

1. Đặt chiều rộng của hộp bên trong bằng `60%` chiều rộng hộp bên ngoài. Thuộc tính {{cssxref("box-sizing")}} được đặt là `border-box`, nghĩa là tổng chiều rộng bao gồm bất kỳ `padding` và `border` nào.
2. Đặt cho hộp bên trong `10%` khoảng đệm ở tất cả các cạnh.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("sizing2-start", "", "100px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___sizing2-start live-sample___sizing2-finish
<div class="box">
  <div class="inner">Make me 60% of my parent's width.</div>
</div>
```

```css live-sample___sizing2-start live-sample___sizing2-finish
body {
  font: 1.2em / 1.5 sans-serif;
  padding: 1em;
}

.box {
  border: 5px solid black;
  width: 400px;
  margin-bottom: 1em;
}

.inner {
  background-color: rebeccapurple;
  color: white;
  border-radius: 5px;
}

* {
  box-sizing: border-box;
}
.inner {
  /* Add styles here */
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("sizing2-finish", "", "220px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Đặt `width` của hộp là `60%` và đặt giá trị `padding` là `10%`.
Tất cả các phần tử đã có `box-sizing: border-box` để bạn không phải lo lắng về việc tính toán giá trị chiều rộng `60%`:

```css live-sample___sizing2-finish
.inner {
  width: 60%;
  padding: 10%;
}
```

</details>

## Kích thước 3

Trong nhiệm vụ này, bạn có hai hình ảnh trong các hộp. Một hình ảnh nhỏ hơn hộp, trong khi hình kia lớn hơn, khiến nó bị vỡ ra ngoài hộp.

Để hoàn thành nhiệm vụ, hãy tưởng tượng rằng hộp có tính đáp ứng và do đó có thể phóng to và thu nhỏ. Áp dụng một khai báo cho các hình ảnh sao cho hình ảnh lớn thu nhỏ vào hộp, nhưng hình ảnh nhỏ không bị kéo giãn.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("sizing3-start", "", "700px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___sizing3-start live-sample___sizing3-finish
<div class="box">
  <img
    alt="A pink star"
    src="https://mdn.github.io/shared-assets/images/examples/star-pink_256x256.png" />
</div>

<div class="box">
  <img
    alt="Hot air balloons flying in clear sky, and a crowd of people in the foreground"
    src="https://mdn.github.io/shared-assets/images/examples/balloons.jpg" />
</div>
```

```css live-sample___sizing3-start live-sample___sizing3-finish
body {
  font: 1.2em / 1.5 sans-serif;
  padding: 1em;
}
.box {
  border: 5px solid black;
  margin-bottom: 1em;
  width: 500px;
}

img {
  /* Add styles here */
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("sizing3-finish", "", "720px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Đặt thuộc tính `max-width` của hình ảnh là `100%` để chứa hình ảnh lớn bên trong hộp của nó. Nếu bạn dùng `width: 100%`, hình ảnh nhỏ sẽ bị kéo giãn.

```css live-sample___sizing3-finish
img {
  max-width: 100%;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Sizing", "Learn_web_development/Core/Styling_basics/Backgrounds_and_borders", "Learn_web_development/Core/Styling_basics")}}
