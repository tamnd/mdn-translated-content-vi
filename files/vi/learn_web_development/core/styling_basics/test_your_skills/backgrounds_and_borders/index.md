---
title: "Kiểm tra kỹ năng: Nền và đường viền"
short-title: "Kiểm tra: Nền và đường viền"
slug: Learn_web_development/Core/Styling_basics/Test_your_skills/Backgrounds_and_borders
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Backgrounds_and_borders", "Learn_web_development/Core/Styling_basics/Overflow", "Learn_web_development/Core/Styling_basics")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu [nền và đường viền của các hộp trong CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders) không.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Nền và đường viền 1

Trong nhiệm vụ này, chúng tôi muốn bạn thêm nền, đường viền và một số kiểu cơ bản vào tiêu đề trang.

Để hoàn thành nhiệm vụ:

1. Đặt cho hộp đường viền đặc đen 5px, với góc bo tròn 10px.
2. Đặt cho `<h2>` màu nền đen bán trong suốt, và làm cho chữ màu trắng.
3. Thêm hình ảnh nền và định kích thước để nó phủ toàn bộ hộp. Bạn có thể dùng hình ảnh sau:

   ```plain
   https://mdn.github.io/shared-assets/images/examples/balloons.jpg
   ```

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("backgrounds1-start", "", "160px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___backgrounds1-start live-sample___backgrounds1-finish
<div class="box">
  <h2>Backgrounds & Borders</h2>
</div>
```

```css live-sample___backgrounds1-start live-sample___backgrounds1-finish
body {
  padding: 1em;
  font: 1.2em / 1.5 sans-serif;
}

* {
  box-sizing: border-box;
}

.box {
  padding: 0.5em;
}

.box {
  /* Add styles here */
}

h2 {
  /* Add styles here */
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("backgrounds1-finish", "", "160px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Bạn nên dùng `border`, `border-radius`, `background-image` và `background-size` và hiểu cách dùng màu RGB để làm cho màu nền có phần trong suốt:

```css live-sample___backgrounds1-finish
.box {
  border: 5px solid black;
  border-radius: 10px;
  background-image: url("https://mdn.github.io/shared-assets/images/examples/balloons.jpg");
  background-size: cover;
}

h2 {
  background-color: rgb(0 0 0 / 50%);
  color: white;
}
```

</details>

## Nền và đường viền 2

Trong nhiệm vụ này, chúng tôi muốn bạn thêm hình ảnh nền, đường viền và một số kiểu khác vào hộp trang trí.

Để hoàn thành nhiệm vụ:

1. Đặt cho hộp đường viền màu xanh nhạt 5px và bo tròn góc trên bên trái 20px và góc dưới bên phải 40px.
2. Tiêu đề dùng hình ảnh `star.png` làm hình ảnh nền, với một ngôi sao đơn căn giữa ở bên trái và một mẫu ngôi sao lặp lại ở bên phải.
   Bạn có thể dùng hình ảnh sau:

   ```plain
   https://mdn.github.io/shared-assets/images/examples/star.png
   ```

3. Đảm bảo rằng văn bản tiêu đề không chồng lên hình ảnh, và rằng nó được căn giữa — bạn sẽ cần dùng các kỹ thuật đã học trong các bài học trước để đạt điều này.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("backgrounds2-start", "", "200px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___backgrounds2-start live-sample___backgrounds2-finish
<div class="box">
  <h2>Backgrounds & Borders</h2>
</div>
```

```css live-sample___backgrounds2-start live-sample___backgrounds2-finish
body {
  padding: 1em;
  font: 1.2em / 1.5 sans-serif;
}
* {
  box-sizing: border-box;
}
.box {
  width: 300px;
  padding: 0.5em;
}

.box {
  /* Add styles here */
}

h2 {
  /* Add styles here */
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("backgrounds2-finish", "", "220px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Bạn cần thêm khoảng đệm vào tiêu đề để nó không chồng lên hình ảnh ngôi sao - điều này liên quan đến kiến thức học từ [bài học Mô hình hộp](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model) trước đó.
Văn bản nên được căn chỉnh bằng thuộc tính `text-align`:

```css live-sample___backgrounds2-finish
.box {
  border: 5px solid lightblue;
  border-top-left-radius: 20px;
  border-bottom-right-radius: 40px;
}

h2 {
  padding: 0 40px;
  text-align: center;
  background:
    url("https://mdn.github.io/shared-assets/images/examples/star.png")
      no-repeat left center,
    url("https://mdn.github.io/shared-assets/images/examples/star.png") repeat-y
      right center;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Backgrounds_and_borders", "Learn_web_development/Core/Styling_basics/Overflow", "Learn_web_development/Core/Styling_basics")}}
