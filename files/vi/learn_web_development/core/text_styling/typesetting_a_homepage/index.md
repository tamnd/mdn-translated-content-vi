---
title: "Thử thách: Dàn chữ trang chủ trường cộng đồng"
short-title: "Thử thách: Trang chủ trường cộng đồng"
slug: Learn_web_development/Core/Text_styling/Typesetting_a_homepage
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Text_styling/Web_fonts", "Learn_web_development/Core/CSS_layout", "Learn_web_development/Core/Text_styling")}}

Trong thử thách này, chúng ta sẽ kiểm tra sự hiểu biết của bạn về các kỹ thuật tạo kiểu văn bản mà chúng ta đã đề cập xuyên suốt mô-đun này — bằng cách yêu cầu bạn dàn chữ trang chủ của một trường cộng đồng. Bạn có thể sẽ vui vẻ trong quá trình đó.

## Điểm xuất phát

Bạn sẽ giải quyết thử thách này trên môi trường phát triển cục bộ; lý tưởng là bạn sẽ muốn xem ví dụ trong cửa sổ trình duyệt đầy đủ để đảm bảo bạn đang đi đúng hướng.

1. Tạo một thư mục mới trên máy tính của bạn có tên `typesetting-challenge`.
2. Bên trong thư mục, tạo tệp `index.html` và dán nội dung sau vào đó:

   ```html
   <!doctype html>
   <html lang="en-US">
     <head>
       <meta charset="utf-8" />
       <meta name="viewport" content="width=device-width" />
       <title>St Huxley's Community College</title>
       <link href="style.css" type="text/css" rel="stylesheet" />
     </head>
     <body>
       <header>
         <h1>St Huxley's Community College</h1>
       </header>

       <main>
         <section>
           <h2>Brave new world</h2>

           <p>
             It's a brave new world out there. Our children are being put in
             increasingly more competitive situations as they move through the
             different stages of their life with
             <a href="https://en.wikipedia.org/wiki/Examination">examinations</a
             >, <a href="https://en.wikipedia.org/wiki/Jobs">jobs</a>,
             <a href="https://en.wikipedia.org/wiki/Career">careers</a>, and
             other life choices. Having the wrong mindset or making the wrong
             choices can lead to problems at all stages.
           </p>

           <p>
             As concerned parents, guardians, or carers, you will no doubt want
             to give your children the best possible start in life — and you've
             come to the right place.
           </p>

           <h2>The best start in life</h2>

           <p>
             At St. Huxley's, we pride ourselves in not only giving our students
             a top-quality education, but also giving them the
             <a href="https://en.wikipedia.org/wiki/Society">societal</a> and
             <a href="https://en.wikipedia.org/wiki/Emotion">emotional</a>
             intelligence they need to win big in the future. We not only excel
             at subjects such as genetics, data mining, and chemistry, but we
             also include compulsory lessons in:
           </p>

           <ul>
             <li>Emotional resilience</li>
             <li>Critical thinking</li>
             <li>Judgement</li>
             <li>Assertion</li>
             <li>Focus and resolve</li>
           </ul>

           <p>
             If you are interested, then don't hesitate to get in touch; we'd
             love to hear from you:
           </p>

           <ol>
             <li>
               <a href="#">Call</a> or <a href="#">Email</a> us for more
               information.
             </li>
             <li>
               <a href="#">Ask for a brochure</a>, which includes a signup form.
             </li>
             <li><a href="#">Book a visit</a>!</li>
           </ol>
         </section>

         <aside>
           <h2>Top courses</h2>

           <ul>
             <li><a href="#">Genetic engineering</a></li>
             <li><a href="#">Organic Chemistry</a></li>
             <li><a href="#">Pharmaceuticals</a></li>
             <li><a href="#">Behavioral science</a></li>
             <li><a href="#">Biochemistry</a></li>
             <li><a href="#">Data mining</a></li>
             <li><a href="#">Computer security</a></li>
             <li><a href="#">Bioinformatics</a></li>
             <li><a href="#">Cybernetics</a></li>
           </ul>

           <p><a href="#">See all...</a></p>
         </aside>

         <nav>
           <ul>
             <li><a href="#">Home</a></li>
             <li><a href="#">Finding us</a></li>
             <li><a href="#">Courses</a></li>
             <li><a href="#">Staff</a></li>
             <li><a href="#">Media</a></li>
             <li><a href="#">Prospectus</a></li>
           </ul>
         </nav>
       </main>

       <footer>
         <p>&copy; 2025 St Huxley's Community College</p>
       </footer>
     </body>
   </html>
   ```

3. Bên trong thư mục, tạo tệp `style.css` và dán nội dung sau vào đó:

   ```css
   /* General setup */

   * {
     box-sizing: border-box;
   }

   body {
     margin: 0 auto;
     padding: 0 20px;
     min-width: 980px;
     max-width: 1400px;
   }

   /* Layout */

   main {
     display: grid;
     grid-template-columns: 5fr 2fr 2fr;
     gap: 40px;
     padding: 20px 0;
   }

   /* header and footer */

   header {
     border-bottom: 5px solid #aa6666;
   }

   footer {
     border-top: 5px solid #aa6666;
   }

   footer p {
     text-align: center;
   }
   ```

4. Tải xuống biểu tượng [`external-link-52.png`](https://mdn.github.io/shared-assets/images/examples/external-link-52.png) và lưu nó trong thư mục ở cùng cấp với các tệp mã.

5. Lưu các tệp và tải `index.html` trong trình duyệt để kiểm tra.

## Tóm tắt thiết kế

Bạn đã được cung cấp một số HTML cho trang chủ của một trường cao đẳng cộng đồng tưởng tượng, cộng với một số CSS bố trí nội dung thành ba cột và cung cấp một số tạo kiểu sơ bộ khác. Bạn cần thêm các quy tắc vào cuối tệp CSS để giải quyết các thử thách được mô tả trong các phần sau.

### Áp dụng phông chữ cho trang

1. Chọn phông chữ cho tiêu đề và văn bản nội dung để áp dụng cho trang:
   - Vì đây là một trường cao đẳng, các phông chữ nên cho trang web một cảm giác khá nghiêm túc, đáng tin cậy. Phông chữ serif toàn trang cho văn bản nội dung chung kết hợp với phông chữ nặng/slab cho các tiêu đề sẽ phù hợp.
   - Bạn có thể chọn sử dụng dịch vụ phông chữ trực tuyến như Google Fonts để truy cập các phông chữ, hoặc tải xuống các tệp phông chữ cục bộ vào dự án của bạn. Dù bạn chọn gì, hãy làm cho phông chữ của bạn có sẵn trên trang. Nếu bạn chọn sử dụng các tệp phông chữ cục bộ, hãy sử dụng dịch vụ phù hợp để tạo mã `@font-face` bulletproof cho chúng.
2. Áp dụng phông chữ nội dung của bạn cho toàn bộ trang, và phông chữ tiêu đề của bạn cho các tiêu đề.

### Tạo kiểu văn bản chung

1. Cung cấp cho tiêu đề và các loại phần tử khác các kích thước phông phù hợp được xác định bằng đơn vị tương đối phù hợp.
2. Cung cấp cho văn bản nội dung của bạn một `line-height` phù hợp.
3. Căn giữa tiêu đề cấp cao nhất trên trang.
4. Xóa margin dưới từ các tiêu đề cấp hai của bạn.
5. Cung cấp cho tiêu đề và văn bản nội dung của bạn một số `letter-spacing` để chúng không quá chật, và cho phép các chữ cái thở một chút.
6. Cung cấp cho đoạn văn đầu tiên sau mỗi tiêu đề trong `<section>` một chút thụt đầu dòng văn bản, ví dụ `2rem`.

### Tạo kiểu liên kết

1. Cung cấp cho trạng thái link, visited, focus và hover một số màu sắc phù hợp với màu của các thanh ngang ở đầu và cuối trang.
2. Đặt liên kết được gạch chân theo mặc định, nhưng khi bạn di chuột hoặc focus vào chúng thì đường gạch chân biến mất.
3. Xóa viền focus mặc định khỏi TẤT CẢ các liên kết trên trang.
4. Đặt để các liên kết _bên ngoài_ có biểu tượng liên kết bên ngoài được chèn vào bên phải của chúng, ở kích thước phù hợp.

### Tạo kiểu danh sách

1. Đảm bảo khoảng cách của danh sách và các mục danh sách hoạt động tốt với tạo kiểu của toàn bộ trang. Mỗi danh sách nên có cùng `line-height` và margin trên và dưới như các đoạn văn.
2. Cung cấp cho các mục danh sách các kiểu dấu đầu dòng phù hợp với thiết kế của trang. Bạn có thể chọn hình ảnh dấu đầu dòng tùy chỉnh hay một thứ gì đó khác.

### Tạo kiểu menu điều hướng

Tạo kiểu menu điều hướng của bạn sao cho nó hài hòa với trang. Chúng ta sẽ để điều này phần lớn cho bạn quyết định, nhưng đây là một số gợi ý/đề xuất:

1. Làm cho các liên kết trông như nút, rộng bằng cột mà chúng nằm trong đó, và đủ cao để các mục nav lấp đầy một lượng không gian tốt.
2. Áp dụng cùng phông chữ cho văn bản liên kết nav của bạn như bạn đã áp dụng cho tiêu đề.
3. Đảm bảo vùng nhấp của mỗi liên kết được mở rộng để lấp đầy toàn bộ mục danh sách cha của nó.
4. Căn giữa văn bản bên trong mỗi liên kết.
5. Viết hoa văn bản (sử dụng CSS, không phải bằng cách chỉnh sửa HTML!)

## Gợi ý và mẹo

- Bạn không cần chỉnh sửa HTML cho bài tập này, trừ khi cần thiết để áp dụng phông chữ cho trang.

## Ví dụ

Ảnh chụp màn hình sau đây cho thấy trang trông như thế nào khi bắt đầu:

![A screenshot of the starting state of the page. The top heading reads 'St Huxley's Community College' and the footer provides a copyright notice. There are red lines separating the header and footer from the content. The main content has three columns, one containing body text and two containing lists of links. The text is rendered with browser default styles](example-start.png)

Ảnh chụp màn hình sau đây, mặt khác, cho thấy một ví dụ về thiết kế đã hoàn thành có thể trông như thế nào:

![A screenshot of the finished challenge design. The top heading reads 'St Huxley's Community College'. There is a red line separating the header from the content. The main content has three columns, one containing body text, one containing a list of links, and a vertical navigation bar in the third column. The text is rendered with some suitable styles](example-finished.png)

<details>
<summary>Nhấp vào đây để xem một lời giải khả thi</summary>

CSS đã hoàn thành của chúng tôi trông như sau:

```css
/* Solution: Apply fonts to the page */

@import "https://fonts.googleapis.com/css2?family=Bevan:ital@0;1&family=IBM+Plex+Serif:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap";

html {
  font-family: "IBM Plex Serif", serif;
}

h1,
h2 {
  font-family: "Bevan", serif;
}

/* General setup */

* {
  box-sizing: border-box;
}

body {
  margin: 0 auto;
  padding: 0 20px;
  min-width: 980px;
  max-width: 1400px;
}

/* Layout */

main {
  display: grid;
  grid-template-columns: 5fr 2fr 2fr;
  gap: 40px;
  padding: 20px 0;
}

/* Header and footer */

header {
  border-bottom: 5px solid #aa6666;
}

footer {
  border-top: 5px solid #aa6666;
}

footer p {
  text-align: center;
}

/* Solution: General text styling */

h1 {
  font-size: 3rem;
  text-align: center;
  letter-spacing: 3px;
}

h2 {
  font-size: 2rem;
  margin-bottom: 0;
  letter-spacing: 1px;
}

section h2 + p {
  text-indent: 2rem;
}

p,
li {
  line-height: 1.6;
  letter-spacing: 0.5px;
}

/* Solution: Link styling */

a {
  outline: none;
}

a[href*="http"] {
  padding-right: 16px;
  background: url("external-link-52.png") no-repeat right center;
  background-size: 14px 14px;
}

a:link,
a:visited {
  color: #aa6666;
}

a:focus,
a:hover {
  text-decoration: none;
  color: #773333;
}

/* Solution: List styling */

ul,
ol {
  margin: 1rem 0;
}

ul {
  list-style-type: square;
}

ol {
  list-style-type: lower-roman;
}

/* Solution: Navigation menu styling */

nav ul {
  padding-left: 0;
}

nav li {
  list-style-type: none;
  margin-bottom: 1rem;
}

nav li a {
  font-family: "Bevan", serif;
  text-decoration: none;
  display: inline-block;
  width: 100%;
  line-height: 3.5;
  text-transform: uppercase;
  text-align: center;
  letter-spacing: 1px;
  font-size: 1.3rem;
  font-weight: bold;
  border: 1px solid #aa6666;
}

nav li a:focus,
nav li a:hover {
  color: white;
  background: #aa6666;
}

nav li a:active {
  color: white;
  background: black;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Text_styling/Web_fonts", "Learn_web_development/Core/CSS_layout", "Learn_web_development/Core/Text_styling")}}
