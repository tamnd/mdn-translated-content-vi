---
title: "Kiểm tra kỹ năng: Hình ảnh và phần tử biểu mẫu"
short-title: "Kiểm tra: Hình ảnh và biểu mẫu"
slug: Learn_web_development/Core/Styling_basics/Test_your_skills/Images
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Images_media_forms", "Learn_web_development/Core/Styling_basics/Tables", "Learn_web_development/Core/Styling_basics")}}

Mục tiêu của bài kiểm tra kỹ năng này là đánh giá xem bạn có hiểu cách [các phần tử đặc biệt như hình ảnh, phương tiện và phần tử biểu mẫu được xử lý trong CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Images_media_forms) không.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Hình ảnh và biểu mẫu 1

Trong nhiệm vụ này, bạn có một hình ảnh đang tràn ra ngoài hộp. Chúng tôi muốn bạn thu nhỏ hình ảnh để nó vừa vào hộp mà không có khoảng trắng thêm; chúng tôi không phiền nếu một phần của hình ảnh bị cắt. Cập nhật CSS để đạt được điều này.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("images-forms1-start", "", "260px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___images-forms1-start live-sample___images-forms1-finish
<div class="box">
  <img
    alt="Hot air balloons flying in clear sky, and a crowd of people in the foreground"
    src="https://mdn.github.io/shared-assets/images/examples/balloons.jpg" />
</div>
```

```css live-sample___images-forms1-start live-sample___images-forms1-finish
.box {
  border: 5px solid black;
  width: 400px;
  height: 200px;
}

img {
  /* Add styles here */
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("images-forms1-finish", "", "260px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Không sao nếu một số phần của hình ảnh bị cắt.
Dùng `object-fit: cover` là lựa chọn tốt nhất, bạn cũng cần đặt chiều rộng và chiều cao là `100%`:

```css live-sample___images-forms1-finish
img {
  height: 100%;
  width: 100%;
  object-fit: cover;
}
```

</details>

## Hình ảnh và biểu mẫu 2

Trong nhiệm vụ này, bạn có một biểu mẫu cơ bản.

Để hoàn thành nhiệm vụ:

1. Dùng bộ chọn thuộc tính để nhắm đến trường tìm kiếm và nút bên trong `.my-form`.
2. Làm cho trường biểu mẫu và nút dùng cùng cỡ chữ với phần còn lại của biểu mẫu.
3. Đặt cho trường biểu mẫu và nút `10px` khoảng đệm.
4. Đặt cho nút nền màu `rebeccapurple`, chữ trắng, không có đường viền và góc bo tròn 5px.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{EmbedLiveSample("images-forms2-start", "", "80px")}}

Đây là code bên dưới của điểm bắt đầu này:

```html live-sample___images-forms2-start live-sample___images-forms2-finish
<form action="" class="my-form" method="post">
  <div>
    <label for="fldSearch">Keywords</label>
    <input id="fldSearch" name="keywords" type="search" />
    <input name="btnSubmit" type="submit" value="Search" />
  </div>
</form>
```

```css live-sample___images-forms2-start live-sample___images-forms2-finish
body {
  font: 1.2em / 1.5 sans-serif;
}
.my-form {
  border: 2px solid black;
  padding: 5px;
}
```

Kiểu đã cập nhật sẽ trông như thế này:

{{EmbedLiveSample("images-forms2-finish", "", "80px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Đây là một ví dụ giải pháp cho nhiệm vụ:

```css live-sample___images-forms2-finish
.my-form {
  border: 2px solid black;
  padding: 5px;
}

.my-form input[type="search"] {
  padding: 10px;
  font-size: inherit;
}

.my-form input[type="submit"] {
  padding: 10px;
  font-size: inherit;
  background-color: rebeccapurple;
  color: white;
  border: 0;
  border-radius: 5px;
}
```

</details>

## Hình ảnh và biểu mẫu 3

Giải pháp cho phần đánh giá này khá tự do, và bạn có nhiều sự linh hoạt trong những gì bạn có thể làm ở đây. Vì vậy chúng tôi không cung cấp một ví dụ hiển thị.

CSS của bạn cần bao gồm những điều sau:

1. Một "reset" nhẹ để làm cho phông chữ, khoảng đệm, lề và kích thước nhất quán hơn để bắt đầu, như được mô tả trong [Chuẩn hóa hành vi biểu mẫu](/en-US/docs/Learn_web_development/Core/Styling_basics/Images_media_forms#normalizing_form_behavior).
2. Một số kiểu đẹp và nhất quán cho các trường nhập và nút.
3. Một kỹ thuật bố cục để các trường nhập và nhãn được căn chỉnh gọn gàng.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("forms-2", "100%", 250) }}

Đây là code bên dưới của điểm bắt đầu này:

```html hidden live-sample___forms-2
<form>
  <h2>Edit your preferences</h2>
  <ul>
    <li>
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" />
    </li>
    <li>
      <label for="website">Website:</label>
      <input type="url" id="website" name="website" />
    </li>
    <li>
      <label for="phone">Phone number:</label>
      <input type="tel" id="phone" name="phone" />
    </li>
    <li>
      <label for="food">Favorite food:</label>
      <select name="food" id="food">
        <option>Salad</option>
        <option>Curry</option>
        <option>Pizza</option>
        <option>Fajitas</option>
      </select>
    </li>
    <li>
      <button>Update preferences</button>
    </li>
  </ul>
</form>
```

```css live-sample___forms-2
* {
  box-sizing: border-box;
}

body {
  background-color: white;
  color: #333333;
  font:
    1em / 1.4 "Helvetica Neue",
    "Helvetica",
    "Arial",
    sans-serif;
  padding: 1em;
  margin: 0;
  width: 500px;
}

/* Don't edit the code above here! */

/* Add your code here */
```

Chúng tôi không cung cấp nội dung hoàn chỉnh cho nhiệm vụ này, vì có nhiều giải pháp hợp lệ.

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

CSS hoàn chỉnh của bạn có thể trông như thế này:

```css
/* ... */
/* Don't edit the code above here! */

button,
input,
select {
  font-family: inherit;
  font-size: 100%;
  padding: 0;
  margin: 0;
}

li {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

li:last-of-type {
  margin-top: 30px;
}

label {
  flex: 0 40%;
  text-align: right;
  padding-right: 10px;
}

input,
select {
  flex: auto;
  height: 2em;
}

input,
select,
button {
  display: block;
  padding: 5px 10px;
  border: 1px solid #cccccc;
  border-radius: 3px;
}

select {
  padding: 5px;
}

button {
  margin: 0 auto;
  padding: 5px 20px;
  line-height: 1.5;
  background: #eeeeee;
}

button:hover,
button:focus {
  background: #dddddd;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Images_media_forms", "Learn_web_development/Core/Styling_basics/Tables", "Learn_web_development/Core/Styling_basics")}}
