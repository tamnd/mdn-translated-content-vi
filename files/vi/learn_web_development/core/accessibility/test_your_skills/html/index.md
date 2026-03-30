---
title: "Kiểm tra kỹ năng: Khả năng tiếp cận HTML"
short-title: "Kiểm tra: Khả năng tiếp cận HTML"
slug: Learn_web_development/Core/Accessibility/Test_your_skills/HTML
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/HTML","Learn_web_development/Core/Accessibility/CSS_and_JavaScript", "Learn_web_development/Core/Accessibility")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá liệu bạn đã hiểu bài viết [HTML: Nền tảng tốt cho khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility/HTML) của chúng ta chưa.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng ta. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Khả năng tiếp cận HTML 1

Trong nhiệm vụ này, chúng ta sẽ kiểm tra sự hiểu biết của bạn về HTML ngữ nghĩa và tại sao nó tốt cho khả năng tiếp cận. Văn bản đã cho là một bảng thông tin với các nút hành động, nhưng HTML thực sự rất tệ.

Để hoàn thành nhiệm vụ, hãy cập nhật đánh dấu để sử dụng HTML ngữ nghĩa phù hợp. Bạn không cần lo lắng quá nhiều về việc tái tạo chính xác cùng giao diện và kích thước văn bản, miễn là ngữ nghĩa tốt.

<!-- Code shared across examples -->

```css hidden live-sample___html-ally-1 live-sample___html-ally-2 live-sample___html-ally-3 live-sample___html-ally-4 live-sample___html-ally-2-finish
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

* {
  box-sizing: border-box;
}
```

<!-- Example-specific code -->

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("html-ally-1", "100%", 630) }}

Đây là code cơ bản cho điểm bắt đầu này:

```html live-sample___html-ally-1
<font size="7">Need help?</font> <br /><br />
If you have any problems with our products, our support center can offer you all
the help you need, whether you want:
<br /><br />
1. Advice choosing a new product
<br />
2. Tech support on an existing product
<br />
3. Refund and cancellation assistance
<br /><br />
<font size="5">Contact us now</font>
<br /><br />
Our help center contains live chat, email addresses, and phone numbers.
<br /><br />
<div class="button">Find Contact Details</div>
<br />
<font size="5">Find out answers</font>
<br /><br />
Our Forums section contains a large knowledge base of searchable previously
asked questions, and you can always ask a new question if you can't find the
answer you're looking for.
<br /><br />
<div class="button">Access Forums</div>
```

```css live-sample___html-ally-1
.button {
  color: white;
  background-color: blue;
  border-radius: 10px;
  width: 170px;
  padding: 10px;
  text-align: center;
}
```

Chúng ta không cung cấp nội dung hoàn chỉnh cho nhiệm vụ này, vì nó trông không khác biệt đáng kể so với trạng thái bắt đầu.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html
<h2>Need help?</h2>

<p>
  If you have any problems with our products, our support center can offer you
  all the help you need, whether you want:
</p>

<ul>
  <li>Advice choosing a new product</li>
  <li>Tech support on an existing product</li>
  <li>Refund and cancellation assistance</li>
</ul>

<h3>Contact us now</h3>

<p>Our help center contains live chat, email addresses, and phone numbers.</p>

<button>Find Contact Details</button>

<h3>Find out answers</h3>

<p>
  Our Forums section contains a large knowledge base of searchable previously
  asked questions, and you can always ask a new question if you can't find the
  answer you're looking for.
</p>

<button>Access forums</button>
```

Điểm thưởng cho:

- Chỉ sử dụng `<button>`, không phải `<button class="button">` (lặp lại ngữ nghĩa là không cần thiết), và cập nhật bộ chọn CSS để đảm bảo nút vẫn nhận các kiểu.
- Sử dụng danh sách không có thứ tự, không phải danh sách có thứ tự — danh sách các mục không thực sự cần theo thứ tự nào.

</details>

## Khả năng tiếp cận HTML 2

Trong nhiệm vụ thứ hai, bạn có một form chứa ba trường đầu vào.

Để hoàn thành nhiệm vụ:

1. Liên kết ngữ nghĩa các đầu vào với nhãn của chúng.
2. Giả sử rằng các đầu vào này sẽ là một phần của form lớn hơn, và bao bọc chúng trong một phần tử liên kết tất cả chúng lại với nhau như một nhóm liên quan duy nhất.
3. Đặt cho nhóm một mô tả/tiêu đề tóm tắt tất cả thông tin dưới dạng dữ liệu cá nhân.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("html-ally-2", "100%", 200) }}

Đây là code cơ bản cho điểm bắt đầu này:

```html live-sample___html-ally-2
<form>
  <ul>
    <li>
      Name
      <input type="text" name="name" />
    </li>
    <li>
      Age
      <input type="number" name="age" />
    </li>
    <li>
      Email address
      <input type="email" name="email" />
    </li>
  </ul>
</form>
```

```css live-sample___html-ally-2 live-sample___html-ally-2-finish
form {
  width: 400px;
}

li {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}
```

Form đã cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("html-ally-2-finish", "100%", 220) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___html-ally-2-finish
<form>
  <fieldset>
    <legend>Personal data</legend>
    <ul>
      <li>
        <label for="name">Name</label>
        <input type="text" name="name" id="name" />
      </li>
      <li>
        <label for="age">Age</label>
        <input type="number" name="age" id="age" />
      </li>
      <li>
        <label for="email">Email address</label>
        <input type="email" name="email" id="email" />
      </li>
    </ul>
  </fieldset>
</form>
```

</details>

## Khả năng tiếp cận HTML 3

Trong nhiệm vụ này, bạn cần chuyển đổi tất cả các liên kết thông tin trong đoạn văn thành các liên kết tốt, dễ tiếp cận.

- Hai liên kết đầu tiên chỉ dẫn đến các trang web thông thường.
- Liên kết thứ ba dẫn đến một PDF, và kích thước lớn — 8MB.
- Liên kết thứ tư dẫn đến tài liệu Word, vì vậy người dùng sẽ cần một loại ứng dụng nào đó được cài đặt có thể xử lý điều đó.

Để hoàn thành nhiệm vụ, hãy cập nhật các liên kết phù hợp dựa trên các mô tả trên.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("html-ally-3", "100%", 140) }}

Đây là code cơ bản cho điểm bắt đầu này:

```html-nolint live-sample___html-ally-3
<p>
  For more information about our activities, check out our fundraising page
  (<a href="/fundraising" target="_blank">click here</a>), education page
  (<a href="/education" target="_blank">click here</a>), sponsorship pack
  (<a href="/resources/sponsorship.pdf" target="_blank">click here</a>),
   and assessment sheets
  (<a href="/resources/assessments.docx" target="_blank">click here</a>).
</p>
```

> [!NOTE]
> Các liên kết trong code bắt đầu có thuộc tính `target="_blank"` được đặt trên chúng, để khi bạn nhấp vào chúng, chúng cố gắng mở các trang được liên kết trong tab mới thay vì tab hiện tại. Đây không phải là thực hành tốt nhất nghiêm ngặt, nhưng chúng ta đã làm điều này ở đây để các trang không mở trong `<iframe>` đầu ra của MDN Playground, xóa code ví dụ của bạn trong quá trình!

Chúng ta không cung cấp nội dung hoàn chỉnh cho nhiệm vụ này, vì nó sẽ tiết lộ giải pháp.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html
<p>
  For more information about our activities, check out our
  <a href="/fundraising" target="_blank">fundraising page</a>,
  <a href="/education" target="_blank">education page</a>,
  <a href="/resources/sponsorship.pdf" target="_blank"
    >sponsorship pack (PDF, 8MB)</a
  >, and
  <a href="/resources/assessments.docx" target="_blank"
    >assessment sheets (Word document)</a
  >.
</p>
```

</details>

## Khả năng tiếp cận HTML 4

Trong nhiệm vụ HTML cuối cùng về khả năng tiếp cận, bạn được cho một thư viện hình ảnh có một số vấn đề về khả năng tiếp cận. Bạn có thể sửa chúng không?

- Hình ảnh tiêu đề có vấn đề về khả năng tiếp cận, cũng như các hình ảnh trong thư viện.
- Bạn có thể đi xa hơn với hình ảnh tiêu đề và triển khai nó bằng CSS để có khả năng tiếp cận tốt hơn. Bạn sẽ tạo giải pháp như vậy như thế nào?

Cập nhật code để sửa các vấn đề được mô tả ở trên.

Điểm bắt đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("html-ally-4", "100%", 400) }}

Đây là code cơ bản cho điểm bắt đầu này:

```html live-sample___html-ally-4
<header>
  <img
    src="https://mdn.github.io/shared-assets/images/examples/star-pink_32x32.png"
    alt="A star that I use to decorate my page" />
  <h1>Groovy images</h1>
</header>
<main>
  <img
    src="https://mdn.github.io/shared-assets/images/examples/ballon-portrait.jpg" />
  <img
    src="https://mdn.github.io/shared-assets/images/examples/grapefruit-slice.jpg" />
</main>
```

```css live-sample___html-ally-4
body {
  width: 400px;
  margin: 0 auto;
}

main img {
  display: block;
  width: 250px;
  margin: 20px auto;
  box-shadow: 5px 5px 0 black;
}

header {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 20px;
}
```

Chúng ta không cung cấp nội dung hoàn chỉnh cho nhiệm vụ này, vì nó trông giống như điểm bắt đầu.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

Các vấn đề về khả năng tiếp cận là:

1. Hình ảnh tiêu đề là trang trí, vì vậy không cần văn bản alt. Giải pháp tốt nhất nếu bạn sử dụng hình ảnh HTML trang trí là đặt `alt=""`, để trình đọc màn hình sẽ không đọc ra gì — thay vì mô tả, hoặc tên tệp hình ảnh. Nó không phải là một phần của nội dung.
2. Các hình ảnh trong thư viện cần văn bản alt, và chúng là một phần của nội dung.

HTML đã cập nhật có thể trông như thế này:

```html
<header>
  <img
    src="https://mdn.github.io/shared-assets/images/examples/star-pink_32x32.png"
    alt="" />
  <h1>Groovy images</h1>
</header>
<main>
  <img
    src="https://mdn.github.io/shared-assets/images/examples/ballon-portrait.jpg"
    alt="a hot air balloon covered in a blue and while checked pattern" />
  <img
    src="https://mdn.github.io/shared-assets/images/examples/grapefruit-slice.jpg"
    alt="A cross-section of the middle of a pink grapefruit" />
</main>
```

Sẽ tốt hơn nếu triển khai hình ảnh nền tiêu đề bằng hình ảnh nền CSS. Để làm vậy, bạn sẽ xóa phần tử `<img>` đầu tiên khỏi đánh dấu, và thêm quy tắc vào CSS như thế này:

```css
h1 {
  background: url("https://mdn.github.io/shared-assets/images/examples/star-pink_32x32.png")
    no-repeat left;
  padding-left: 50px;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/HTML","Learn_web_development/Core/Accessibility/CSS_and_JavaScript", "Learn_web_development/Core/Accessibility")}}
