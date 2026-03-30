---
title: "Thử thách: Tạo kiểu trang tiểu sử"
short-title: "Thử thách: Trang tiểu sử"
slug: Learn_web_development/Core/Styling_basics/Styling_a_bio_page
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Getting_started", "Learn_web_development/Core/Styling_basics/Basic_selectors", "Learn_web_development/Core/Styling_basics")}}

Trong thử thách này bạn sẽ tạo kiểu cho một trang tiểu sử đơn giản, kiểm tra một số kỹ năng bạn đã học trong vài bài học vừa qua, bao gồm viết bộ chọn, tô màu nền và tạo kiểu văn bản. Chúng tôi cũng sẽ mời bạn tra cứu một số tính năng CSS cơ bản mà chúng tôi chưa đề cập, để kiểm tra kỹ năng tìm kiếm của bạn.

## Điểm khởi đầu

Để bắt đầu, hãy nhấp vào nút **Play** ở một trong các bảng code bên dưới để mở ví dụ trong MDN Playground. Sau đó bạn sẽ theo dõi các hướng dẫn trong các phần tiếp theo để tạo kiểu trang phù hợp.

```html live-sample___style-bio-start live-sample___style-bio-finish
<h1>Jane Doe</h1>
<div class="job-title">Web Developer</div>
<p>
  Far far away, behind the word mountains, far from the countries Vokalia and
  Consonantia, there live the blind texts. Separated they live in Bookmarksgrove
  right at the coast of the Semantics, a large language ocean.
</p>

<p>
  A small river named Duden flows by their place and supplies it with the
  necessary regelialia. It is a paradisematic country, in which roasted parts of
  sentences fly into your mouth.
</p>

<h2>Contact information</h2>
<ul>
  <li>Email: <a href="mailto:jane@example.com">jane@example.com</a></li>
  <li>Web: <a href="http://example.com">http://example.com</a></li>
  <li>Tel: <a href="tel:12345678">123 45678</a></li>
</ul>
```

```css live-sample___style-bio-start
html {
  background-color: white;
}

body {
  font: 1.2em / 1.5 system-ui;
}
```

{{EmbedLiveSample("style-bio-start", "100%", "400px")}}

## Mô tả dự án

Hãy làm theo các hướng dẫn bên dưới để tạo kiểu cho trang tiểu sử. Hãy thử tra cứu các tính năng CSS bạn cần trong [tài liệu tham khảo CSS của MDN](/en-US/docs/Web/CSS/Reference).

### Kiểu hộp

1. Đặt cho phần tử `<body>` một khoảng đệm `20px` ở tất cả các cạnh và chiều rộng `500px`.
2. Đặt cho phần tử `<body>` màu nền `#efefef` (giá trị {{cssxref("&lt;hex-color>")}} màu xám nhạt).
3. Căn giữa phần tử `<body>` trong khung nhìn bằng cách đặt lề trên và dưới là `0`, lề trái và phải là `auto`.
4. Đặt cho `<ul>` dùng để hiển thị thông tin liên lạc màu nền trắng, đường viền màu tím đặc 5px ở tất cả các cạnh. Đặt khoảng đệm `30px` ở tất cả các cạnh của `<ul>` để đẩy nội dung ra xa đường viền.
5. Đặt cho `<ul>` bán kính viền là `20px`.

### Kiểu văn bản

1. Làm cho tiêu đề cấp một có màu xám tối, dùng từ khóa màu CSS `darkslategray`, và đặt cho tiêu đề đường viền dưới dạng chấm `10px`, dùng từ khóa màu CSS `purple`.
2. Làm cho tiêu đề cấp hai có chữ nghiêng.
3. Đặt cỡ chữ tiêu đề cấp một là `2rem` và cỡ chữ tiêu đề cấp hai là `1.5rem`.
4. Chọn `<div>` bằng bộ chọn lớp, đặt màu `darkslategray` và in đậm.
5. Làm cho các liên kết có màu `green`.
6. Làm cho các liên kết có màu `darkgreen` khi rê chuột qua hoặc khi được truy cập bằng bàn phím (bạn sẽ cần dùng một vài {{cssxref("pseudo-classes")}} cho điều này).
7. Làm cho các liên kết mất gạch chân khi rê chuột hoặc được truy cập bằng bàn phím.

## Gợi ý và mẹo

- Dùng [W3C CSS Validator](https://jigsaw.w3.org/css-validator/) để phát hiện các lỗi không mong muốn trong CSS — những lỗi mà bạn có thể đã bỏ qua — để bạn có thể sửa chúng.
- Hãy thử tra cứu một số tính năng CSS nâng cao hơn (một lần nữa, [tài liệu tham khảo CSS của MDN](/en-US/docs/Web/CSS/Reference) sẽ rất hữu ích ở đây) và thêm một số kiểu khác vào giải pháp của bạn. Hãy mạo hiểm!
- Hãy nhớ rằng không có câu trả lời sai ở đây — ở giai đoạn học tập này bạn có thể thoải mái sáng tạo.

## Ví dụ

Ví dụ hoàn chỉnh của bạn sẽ trông giống như thế này:

{{EmbedLiveSample("style-bio-finish", "100%", "400px")}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

CSS được áp dụng cho live sample hoàn chỉnh như sau:

```css live-sample___style-bio-finish
html {
  background-color: white;
}

body {
  font: 1.2em / 1.5 system-ui;
  padding: 20px;
  width: 500px;
  background-color: #efefef;
  margin: 0 auto;
}

h1 {
  color: darkslategray;
  border-bottom: 10px dotted purple;
  font-size: 2rem;
}

h2 {
  font-style: italic;
  font-size: 1.5rem;
}

.job-title {
  color: darkslategray;
  font-weight: bold;
}

ul {
  background-color: white;
  border: 5px solid purple;
  padding: 30px;
  border-radius: 20px;
}

a {
  color: green;
}

a:hover,
a:focus {
  color: darkgreen;
  text-decoration: none;
}
```

Các thuộc tính CSS chúng tôi đã dùng để giải quyết thử thách như sau — mỗi thuộc tính liên kết đến trang thuộc tính của nó trên MDN, nơi cung cấp thêm nhiều ví dụ về cách sử dụng.

- {{cssxref("background-color")}}
- {{cssxref("border")}} hoặc các thuộc tính viết tay liên quan.
- {{cssxref("color")}}
- {{cssxref("font-size")}}
- {{cssxref("font-style")}}
- {{cssxref("font-weight")}}
- {{cssxref("margin")}} hoặc các thuộc tính viết tay liên quan.
- {{cssxref("padding")}} hoặc các thuộc tính viết tay liên quan.
- {{cssxref("text-decoration")}}
- {{cssxref("width")}}

</details>

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Getting_started", "Learn_web_development/Core/Styling_basics/Basic_selectors", "Learn_web_development/Core/Styling_basics")}}
