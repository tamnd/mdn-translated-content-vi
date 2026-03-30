---
title: "Thử thách: Sửa kiểu trang blog"
short-title: "Thử thách: Sửa kiểu blog"
slug: Learn_web_development/Core/Styling_basics/Fixing_blog_styles
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Cascade", "Learn_web_development/Core/Styling_basics/Values_and_units", "Learn_web_development/Core/Styling_basics")}}

Trong thử thách này chúng tôi cung cấp cho bạn một ví dụ trang blog cơ bản đã được tạo kiểu một phần. Chúng tôi cần bạn sửa một số vấn đề với CSS hiện có và thêm một số kiểu để hoàn thiện. Trong quá trình đó, chúng tôi sẽ kiểm tra kiến thức của bạn về bộ chọn, mô hình hộp và xung đột/tầng tầng.

## Điểm khởi đầu

Để bắt đầu, hãy nhấp vào nút **Play** ở một trong các bảng code bên dưới để mở ví dụ trong MDN Playground. Sau đó bạn sẽ theo dõi các hướng dẫn trong phần [Mô tả dự án](#project_brief) để tạo kiểu trang phù hợp.

```html live-sample___blog-start live-sample___blog-finish
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Sizing a blog page challenge</title>
    <link href="style.css" rel="stylesheet" />
  </head>
  <body>
    <header>
      <h1>A most excellent blog</h1>
      <nav>
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="#">Blog</a></li>
          <li><a href="#">About</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
      </nav>
    </header>
    <main>
      <section id="introduction" class="highlight">
        <h2>Our newest post</h2>
        <p>
          Laoreet lorem curae lectus blandit conubia vel semper laoreet congue
          at taciti.
          <a href="#">Phasellus hac consectetur iaculis dui</a> sapien iaculis
          hac ultricies per luctus. Suscipit mattis lacus semper in porta
          phasellus sollicitudin ipsum fermentum phasellus sapien. Inceptos
          etiam placerat porttitor finibus auctor at platea hendrerit aenean
          laoreet elit lorem odio.
        </p>
      </section>
      <section>
        <h2>Exciting content</h2>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin
          tortor purus <a href="#">platea sit eu id</a> nisi litora libero.
          Neque vulputate consequat ac amet augue blandit maximus aliquet
          congue. Pharetra vestibulum posuere ornare
          <a href="#">faucibus fusce dictumst</a> orci aenean eu facilisis ut
          volutpat commodo senectus purus himenaeos fames primis convallis nisi.
        </p>
        <ul>
          <li>Lorem ipsum dolor</li>
          <li>Neque vulputate consequat</li>
          <li>Phasellus fermentum malesuada</li>
          <li>Curabitur semper venenatis</li>
          <li>Duis lectus porta mattis</li>
        </ul>
        <p>
          Phasellus fermentum malesuada phasellus netus dictum aenean placerat
          egestas amet.
          <a href="#">Ornare taciti semper dolor tristique</a> morbi. Sem leo
          tincidunt aliquet semper eu lectus scelerisque quis. Sagittis vivamus
          mollis nisi mollis enim fermentum laoreet.
        </p>
        <h2>More exciting content</h2>
        <p>
          Curabitur semper venenatis lectus viverra ex dictumst nulla maximus.
          Primis iaculis elementum conubia feugiat venenatis dolor augue ac
          blandit nullam ac <a href="#">phasellus turpis</a> feugiat mollis.
          Duis lectus porta mattis imperdiet vivamus augue litora lectus arcu.
          Justo torquent pharetra volutpat ad blandit bibendum
          <a href="#">accumsan nec elit cras</a> luctus primis ipsum gravida
          class congue.
        </p>
        <p>
          Vehicula etiam elementum finibus enim duis feugiat commodo adipiscing
          tortor <a href="#">tempor elit</a>. Et mollis consectetur habitant
          turpis tortor consectetur adipiscing vulputate dolor lectus iaculis
          convallis adipiscing. Nam hendrerit
          <a href="#">dignissim condimentum ullamcorper diam</a> morbi eget
          consectetur odio in sagittis.
        </p>
      </section>
      <section id="summary" class="highlight">
        <h2>Summary</h2>
        <p>
          Et arcu tortor lorem ac primis ac suspendisse lectus nulla. Habitant
          fermentum <a href="#">leo facilisis lobortis</a> risus lobortis
          maximus gravida. Euismod fames maecenas imperdiet senectus
          <a href="#">nec nisi amet pellentesque felis</a> vitae vestibulum
          integer nec tellus. Eros posuere lacinia et tellus quis fames mattis
          quisque mauris placerat rhoncus pretium sed consectetur
          <a href="#">convallis</a>.
        </p>
      </section>
    </main>
    <footer class="highlight">
      <p>©️ 2025 Nobody</p>
    </footer>
  </body>
</html>
```

```css live-sample___blog-start
/* Basic type and text */

body {
  font: 1.2em / 1.5 system-ui;
  width: clamp(480px, 70%, 1000px);
  margin: 0 auto;
}

h1 {
  font-size: 2em;
}

h2 {
  font-size: 1.5em;
}

a {
  color: red;
}

a:hover {
  text-decoration: none;
}

/* Nav menu */

ul {
  display: flex;
  padding: 0;
  list-style-type: none;
  justify-content: space-between;
  gap: 10px;
}

li {
  flex: 1;
}

a {
  text-decoration: none;
  color: black;
  background-color: yellowgreen;
  text-align: center;
  padding: 10px;
}

a:hover {
  background-color: goldenrod;
}

/* Intro and summary */

.highlight {
  margin-top: 0;
  background-color: darkslategray;
  color: cornsilk;
}

.highlight a {
  color: purple;
}

/* Footer */

footer {
  margin-top: 20px;
  background-color: goldenrod;
  text-shadow: 1px 1px 1px black;
}
```

{{embedlivesample("blog-start", "100%", 500)}}

## Mô tả dự án

Ví dụ blog cơ bản bạn nhận được chưa hoàn chỉnh và code hiện có có một số vấn đề. Hãy làm theo các bước dưới đây để hoàn thiện dự án.

1. Chúng tôi muốn mọi phần tử trên trang này sử dụng mô hình hộp thay thế. Thêm một quy tắc vào stylesheet thực hiện điều này.

2. Có một vấn đề với các quy tắc cho menu điều hướng — các kiểu hầu hết ổn, nhưng chúng đang ảnh hưởng đến danh sách không có thứ tự khác và các liên kết nội dung, làm chúng trông không đẹp! Bạn có thể điều chỉnh các bộ chọn cho các quy tắc này để chúng chỉ nhắm đến menu điều hướng không?

3. Thực ra, có một vấn đề khác với menu điều hướng — các phần tử `<a>` không trải dài hết chiều rộng của phần tử cha `<li>` như dự kiến. Bạn có thể điều chỉnh cách hiển thị của chúng để chúng trải dài hết chiều rộng không?

4. Đối với cả liên kết trong menu điều hướng và các liên kết nội dung thông thường, chúng tôi đang đặt một kiểu khác khi di chuột để người dùng chuột có thể thấy liên kết nào họ đang di chuột qua. Điều này gây ra vấn đề khả năng tiếp cận cho người dùng bàn phím, những người sẽ không thể thấy các kiểu đó. Bạn có thể thay đổi các bộ chọn trong các quy tắc liên quan để các kiểu này cũng được áp dụng khi người dùng bàn phím dùng phím Tab đến các liên kết không?

5. Chúng tôi muốn phần giới thiệu, tóm tắt và footer có `20px` khoảng đệm ở tất cả các cạnh. Thực hiện điều này bằng cách thêm một khai báo duy nhất ở đâu đó trong stylesheet.

6. Thêm một quy tắc chọn dòng đầu tiên của mỗi đoạn văn xuất hiện ngay sau tiêu đề cấp hai, và làm cho nó in đậm.

7. Tiếp nối từ câu hỏi trước, bạn có thể nghĩ ra cách in đậm dòng đầu tiên trong mỗi đoạn văn theo sau tiêu đề cấp hai, nhưng chỉ khi phần tử cha không phải là phần giới thiệu, tóm tắt hoặc footer? Bạn có thể thực hiện điều này theo một vài cách khác nhau, một số ngắn gọn hơn cách khác.

8. Tiếp theo, bạn sẽ thấy rằng chúng tôi đang dùng `.highlight a` để chọn các phần tử `<a>` bên trong phần giới thiệu và tóm tắt, và tô màu chúng `purple` trong quy tắc liên quan. Nhưng điều này không ổn — độ tương phản màu rất kém. Giả sử bạn không được phép thay đổi hoặc xóa quy tắc đó, bạn có thể thêm một quy tắc khác phía trên nó theo thứ tự nguồn để tô màu các phần tử `<a>` thành `yellow` không? Vì nằm phía trên theo thứ tự nguồn, nó sẽ phải có độ đặc hiệu cao hơn.

9. Bạn sẽ thấy rằng chúng tôi đang cố gắng chọn `<footer>` ở cuối stylesheet và đặt cho nó bóng văn bản, một số lề để di chuyển nó ra xa phần tóm tắt, và một màu nền khác để làm nó nổi bật. Tuy nhiên, nó không nhận được các kiểu lề và màu nền mong muốn vì quy tắc `.highlight` có độ đặc hiệu cao hơn, nên các khai báo của nó thắng. Bạn có thể thay đổi bộ chọn để đảm bảo các kiểu đó được áp dụng không?

## Gợi ý và mẹo

- Dùng [W3C CSS Validator](https://jigsaw.w3.org/css-validator/) để phát hiện các lỗi không mong muốn trong CSS — những lỗi mà bạn có thể đã bỏ qua — để bạn có thể sửa chúng.
- Bạn không cần thay đổi HTML theo bất kỳ cách nào.

## Ví dụ

Dự án hoàn chỉnh sẽ trông như thế này:

{{embedlivesample("blog-finish", "100%", 500)}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

CSS hoàn chỉnh trông như sau:

```css live-sample___blog-finish
/* Basic type and text */

/* Solution: Set alternative box model on all elements */
* {
  box-sizing: border-box;
}

body {
  font: 1.2em / 1.5 system-ui;
  width: clamp(480px, 70%, 1000px);
  margin: 0 auto;
}

h1 {
  font-size: 2em;
}

h2 {
  font-size: 1.5em;
}

a {
  color: red;
}

/* Solution: Update :hover styles to also apply on :focus
so that keyboard users can see the updated styles when
they tab to links */
a:hover,
a:focus {
  text-decoration: none;
}

/* Solution: bold ::first-line of each paragraph that appears
right after a second-level heading, but only when the parent
element is not the introduction, summary, or footer
(use :not(.highlight) to specify this second bit) */
section:not(.highlight) h2 + p::first-line {
  font-weight: bold;
}

/*

Alternative to the above solution: bold all instances first,
then remove it from those inside an element with the highlight
class afterwards

section h2 + p::first-line {
  font-weight: bold;
}

.highlight h2 + p::first-line {
  font-weight: normal;
}

*/

/* Nav menu */

/* Solution: Adjust nav rule selectors to only
target the <nav> menu */

nav ul {
  display: flex;
  padding: 0;
  list-style-type: none;
  justify-content: space-between;
  gap: 10px;
}

nav li {
  flex: 1;
}

nav a {
  text-decoration: none;
  color: black;
  background-color: yellowgreen;
  /* Solution: Set nav <a> elements to display: block so they span
  the full width of their <li> element parents */
  display: block;
  text-align: center;
  padding: 10px;
}

/* Solution: Update :hover styles to also apply on :focus
so that keyboard users can see the updated styles when
they tab to links */
nav a:hover,
nav a:focus {
  background-color: goldenrod;
}

/* Intro and summary */

.highlight {
  margin-top: 0;
  background-color: darkslategray;
  color: cornsilk;
  /* Solution: Set 20px of padding on all sides of the
  introduction, summary, and footer. They all have the
  highlight class set on them */
  padding: 20px;
}

/* Solution: Add higher specificity rule above ".highlight a"
rule to override color setting (ID selectors have a higher
specificity than class selectors) */
#introduction a,
#summary a {
  color: yellow;
}

.highlight a {
  color: purple;
}

/* Footer */

/* Solution: Increase footer rule specificity by adding ".highlight"
so that its margin-top and background-color styles are applied */
footer.highlight {
  margin-top: 20px;
  background-color: goldenrod;
  text-shadow: 1px 1px 1px black;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Cascade", "Learn_web_development/Core/Styling_basics/Values_and_units", "Learn_web_development/Core/Styling_basics")}}
