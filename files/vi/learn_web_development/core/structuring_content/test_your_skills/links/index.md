---
title: "Kiểm tra kỹ năng: Liên kết"
short-title: "Kiểm tra: Liên kết"
slug: Learn_web_development/Core/Structuring_content/Test_your_skills/Links
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Creating_links", "Learn_web_development/Core/Structuring_content/Structuring_a_page_of_content", "Learn_web_development/Core/Structuring_content")}}

Mục đích của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu cách [triển khai liên kết trong HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links) hay không.

> [!NOTE]
> Để được trợ giúp, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

> [!NOTE]
> Một số liên kết trong mã xuất phát cho các bài tập này có thuộc tính `target="_blank"` được đặt trên chúng, sao cho khi bạn nhấp vào chúng, chúng sẽ cố gắng mở trang được liên kết trong tab mới thay vì tab hiện tại. Đây không hẳn là thực hành tốt nhất, nhưng chúng tôi đã làm điều này để các trang không mở trong `<iframe>` đầu ra của MDN Playground, làm mất đi mã ví dụ của bạn trong quá trình đó!

## Liên kết 1

Trong bài tập này, chúng tôi muốn bạn giúp điền vào các liên kết trên trang thông tin về cá voi của chúng tôi.

Để hoàn thành bài tập, hãy cập nhật các liên kết như sau:

1. Liên kết đầu tiên nên được liên kết đến một trang có tên `whales.html`, nằm trong cùng thư mục với trang hiện tại.
2. Cung cấp tooltip khi di chuột qua nó để thông báo cho người dùng rằng trang bao gồm thông tin về Cá voi Xanh và Cá nhà táng.
3. Liên kết thứ hai nên được chuyển thành liên kết mà bạn có thể nhấp để mở email trong ứng dụng thư mặc định của người dùng, với địa chỉ nhận được đặt là "whales\@example.com".
4. Điểm thưởng nếu bạn cũng đặt nó sao cho dòng chủ đề của email được tự động điền là "Question about Whales".

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample('links-1', "100%", 170) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___links-1
<h1>Information on Whales</h1>

<p>
  For more information on our conservation activities and which Whales we study,
  see our <a target="_blank">Whales page</a>.
</p>

<p>
  If you want to ask our team more questions, feel free to
  <a target="_blank">email us</a>.
</p>
```

```css hidden live-sample___links-1 live-sample___links-1-finished
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
}

h1 {
  font-size: 2rem;
  margin: 0;
  color: purple;
}

p {
  color: gray;
  margin: 0.5em 0;
}

* {
  box-sizing: border-box;
}
```

Nội dung được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample('links-1-finished', "100%", 170) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html-nolint live-sample___links-1-finished
<h1>Information on Whales</h1>

<p>
  For more information on our conservation activities and which Whales we study,
  see our <a target="_blank" href="whales.html" title="Includes information on Blue Whales and Sperm Whales">
  Whales page</a>.
</p>

<p>
  If you want to ask our team more questions, feel free to
  <a target="_blank" href="mailto:whales@example.com?subject=Question%20about%20Whales">
  email us</a>.
</p>
```

</details>

## Liên kết 2

Trong bài tập này, chúng tôi muốn bạn điền vào bốn liên kết để chúng liên kết đến các vị trí phù hợp.

Để hoàn thành bài tập, hãy cập nhật các liên kết như sau:

1. Liên kết đầu tiên nên liên kết đến hình ảnh có tên `blue-whale.jpg`, nằm trong thư mục có tên `blue` bên trong thư mục hiện tại.
2. Liên kết thứ hai nên liên kết đến hình ảnh có tên `narwhal.jpg`, nằm trong thư mục có tên `narwhal`, nằm một cấp thư mục trên thư mục hiện tại.
3. Liên kết thứ ba nên liên kết đến tìm kiếm hình ảnh Google UK. URL cơ sở là `https://www.google.co.uk`, và tìm kiếm hình ảnh nằm trong thư mục con có tên `imghp`.
4. Liên kết thứ tư nên liên kết đến đoạn văn ở cuối trang hiện tại. Nó có ID là `bottom`.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample('links-2', "100%", 200) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___links-2
<h1>List path tests</h1>

<ul>
  <li><a target="_blank">Link me to the blue whale image</a></li>
  <li><a target="_blank">Link me to the narwhal image</a></li>
  <li><a target="_blank">Link me to Google image search</a></li>
  <li><a>Link me to the paragraph at the bottom of the page</a></li>
</ul>

<div></div>

<p id="bottom">The bottom of the page!</p>
```

```css hidden live-sample___links-2 live-sample___links-2-finished
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
}

h1 {
  font-size: 2rem;
  margin: 0;
  color: purple;
}

li {
  color: gray;
  margin: 0.5em 0;
}

div {
  height: 600px;
}
```

Nội dung được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample('links-2-finished', "100%", 200) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html-nolint live-sample___links-2-finished
<h1>List path tests</h1>

<ul>
  <li><a target="_blank" href="blue/blue-whale.jpg">
    Link me to the blue whale image
  </a></li>
  <li><a target="_blank" href="../narwhal/narwhal.jpg">
    Link me to the narwhal image
  </a></li>
  <li><a target="_blank" href="https://www.google.co.uk/imghp">
    Link me to Google image search
  </a></li>
  <li><a href="#bottom">
    Link me to the paragraph at the bottom of the page
  </a></li>
</ul>

<div></div>

<p id="bottom">The bottom of the page!</p>
```

</details>

## Liên kết 3

Các liên kết sau liên kết đến một trang thông tin về Cá kỳ lân, một địa chỉ email hỗ trợ, và một tệp PDF dữ liệu có kích thước 4MB.

Để hoàn thành bài tập:

1. Lấy các đoạn văn hiện có với văn bản liên kết được viết kém, và viết lại chúng để có văn bản liên kết tốt.
2. Thêm cảnh báo cho bất kỳ liên kết nào cần thêm cảnh báo.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample('links-3', "100%", 200) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___links-3
<p>
  We do lots of work with Narwhals. To find out more about this work,
  <a href="narwhals.html" target="_blank">click here</a>.
</p>

<p>
  You can email our support team if you have any more questions —
  <a href="mailto:whales@example.com">click here</a> to do so.
</p>

<p>
  You can also <a href="factfile.pdf" target="_blank">click here</a> to download
  our factfile, which contains lots more information, including an FAQ.
</p>
```

```css hidden live-sample___links-3
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
}

p {
  color: gray;
  margin: 0.5em 0;
}

* {
  box-sizing: border-box;
}
```

Chúng tôi không cung cấp nội dung hoàn chỉnh cho bài tập này, vì nó sẽ tiết lộ giải pháp.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html-nolint
<p>
  We do lots of work with Narwhals. <a href="narwhals.html" target="_blank">Find out more about this work</a>.
</p>

<p>
  You can <a href="mailto:whales@example.com">email our support team</a> if you have any more questions.
</p>

<p>
  You can also <a href="factfile.pdf" target="_blank">download
  our factfile</a> (PDF, 4MB), which contains lots more information, including an FAQ.
</p>
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Creating_links", "Learn_web_development/Core/Structuring_content/Structuring_a_page_of_content", "Learn_web_development/Core/Structuring_content")}}
