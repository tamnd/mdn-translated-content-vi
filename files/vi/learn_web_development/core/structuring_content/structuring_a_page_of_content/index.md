---
title: "Thách thức: Cấu trúc một trang nội dung"
short-title: "Thách thức: Trang web quan sát chim"
slug: Learn_web_development/Core/Structuring_content/Structuring_a_page_of_content
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Test_your_skills/Links", "Learn_web_development/Core/Structuring_content/HTML_images", "Learn_web_development/Core/Structuring_content")}}

Cấu trúc một trang nội dung để sẵn sàng bố trí bằng CSS là một kỹ năng rất quan trọng cần thành thạo, vì vậy trong thách thức này, bạn sẽ được kiểm tra khả năng suy nghĩ về cách một trang có thể trông như thế nào, và lựa chọn ngữ nghĩa cấu trúc phù hợp để xây dựng bố cục trên đó.

## Điểm xuất phát

Để giải quyết thách thức này, chúng tôi kỳ vọng bạn tạo một dự án trang web đơn giản, hoặc trong một thư mục trên ổ cứng máy tính của bạn, hoặc sử dụng trình soạn thảo trực tuyến như [CodePen](https://codepen.io/) hoặc [JSFiddle](https://jsfiddle.net/). Phần lớn mã bạn cần đã được cung cấp sẵn.

1. Tạo một thư mục mới ở vị trí phù hợp trên máy tính của bạn, đặt tên là `structuring-html-challenge` (hoặc mở một trình soạn thảo trực tuyến và thực hiện các bước cần thiết để tạo dự án mới).
2. Lưu danh sách HTML sau vào một tệp trong thư mục của bạn có tên `index.html` (hoặc dán nó vào khung HTML của trình soạn thảo trực tuyến).

   ```html
   <!doctype html>
   <html lang="en">
     <head>
       <meta charset="utf-8" />
       <title>Birdwatching</title>
       <link
         href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300%7CCinzel+Decorative:700"
         rel="stylesheet" />
     </head>

     <body>
       <h1>Birdwatching</h1>

       Home Get started Photos Gear Forum

       <h2>Welcome</h2>

       <p>
         Welcome to our fake birdwatching site. If this were a real site, it
         would be the ideal place to come to learn more about birdwatching,
         whether you are a beginner looking to learn how to get into birding, or
         an expert wanting to share ideas, tips, and photos with other
         like-minded people.
       </p>

       <p>
         So don't waste time! Get what you need, then turn off that computer and
         get out into the great outdoors!
       </p>

       <h2>Favorite photos</h2>

       <!-- Link images here. -->

       <p>
         This fake website example is CC0 — any part of this code may be reused
         in any way you wish. Original example written by Chris Mills, 2016.
       </p>

       <p>
         <a href="http://game-icons.net/lorc/originals/dove.html">Dove icon</a>
         by Lorc.
       </p>
     </body>
   </html>
   ```

3. Lưu danh sách CSS sau vào một tệp trong thư mục của bạn có tên `style.css` (hoặc dán nó vào khung CSS của trình soạn thảo trực tuyến).

   ```css
   /* || General setup */

   body {
     margin: 0;
   }

   html {
     font-size: 10px;
     background-color: darkgrey;
   }

   body {
     width: 70%;
     min-width: 800px;
     margin: 0 auto;
   }

   /* || typography */

   h1,
   h2 {
     font-family: "Cinzel Decorative", cursive;
     color: #2a2a2a;
   }

   p,
   li {
     font-family: "Roboto Condensed", sans-serif;
     color: #2a2a2a;
   }

   h1 {
     font-size: 4rem;
     text-align: center;
     text-shadow: 2px 2px 10px black;
   }

   h2 {
     font-size: 3rem;
     text-align: center;
   }

   p,
   li {
     font-size: 1.6rem;
     line-height: 1.5;
   }

   /* || header layout */

   header {
     margin-bottom: 10px;
   }

   main,
   header,
   nav,
   article,
   aside,
   footer,
   section {
     background-color: #00ff0080;
     padding: 1%;
   }

   h1 {
     text-transform: uppercase;
     display: flex;
     align-items: center;
     justify-content: center;
     gap: 20px;
   }

   header img {
     height: 60px;
   }

   nav ul {
     padding: 0;
     list-style-type: none;
     display: flex;
   }

   nav li {
     text-align: center;
     flex: 1;
   }

   nav a {
     font-size: 2rem;
     text-transform: uppercase;
     text-decoration: none;
     color: black;
   }

   nav a:hover,
   nav a:focus {
     color: red;
   }

   /* || main layout */

   main {
     display: flex;
     gap: 10px;
   }

   article {
     flex: 4;
   }

   aside {
     flex: 1;
   }

   aside a {
     display: block;
     float: left;
     width: 50%;
   }

   aside img {
     max-width: 100%;
   }

   footer {
     margin-top: 10px;
   }
   ```

Sau đó, bạn sẽ cần bao gồm các URL sau trong trang của mình.

- `dove.png`: [Logo trang web](https://mdn.github.io/shared-assets/images/examples/learn/birds/dove.png)
- `favorite-bird-1.jpg`: [Phiên bản đầy đủ của hình ảnh thanh bên thứ nhất](https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-1.jpg)
- `favorite-bird-1_th.jpg`: [Hình thu nhỏ của hình ảnh thanh bên thứ nhất](https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-1_th.jpg)
- `favorite-bird-2.jpg`: [Phiên bản đầy đủ của hình ảnh thanh bên thứ hai](https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-2.jpg)
- `favorite-bird-2_th.jpg`: [Hình thu nhỏ của hình ảnh thanh bên thứ hai](https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-2_th.jpg)
- `favorite-bird-3.jpg`: [Phiên bản đầy đủ của hình ảnh thanh bên thứ ba](https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-3.jpg)
- `favorite-bird-3_th.jpg`: [Hình thu nhỏ của hình ảnh thanh bên thứ ba](https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-3_th.jpg)
- `favorite-bird-4.jpg`: [Phiên bản đầy đủ của hình ảnh thanh bên thứ tư](https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-4.jpg)
- `favorite-bird-4_th.jpg`: [Hình thu nhỏ của hình ảnh thanh bên thứ tư](https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-4_th.jpg)

## Tóm tắt dự án

Đối với dự án này, nhiệm vụ của bạn là lấy nội dung cho trang chủ của một trang web quan sát chim và thêm các phần tử cấu trúc vào nó để có thể áp dụng bố cục trang cho nó. Bạn cũng cần thực hiện một vài bổ sung cho nội dung.

### Bổ sung nội dung

1. Bên trong phần tử `<h1>`, thêm một phần tử `<img>` bao gồm logo chim bồ câu trên trang. Cung cấp cho nó văn bản thay thế trống ("").
2. Các mục văn bản "Home", "Get started", "Photos", "Gear", và "Forum" nên được chuyển thành menu điều hướng.
   1. Đánh dấu chúng như một danh sách không có thứ tự.
   2. Bên trong mỗi mục danh sách, bọc văn bản bên trong phần tử `<a>` trỏ đến URL là `#` (tạo liên kết giả).
3. Xóa chú thích `<!-- Link images here. -->`. Thay thế nó bằng một tập hợp bốn hình thu nhỏ của "ảnh chim yêu thích". Mỗi ảnh nên bao gồm một số văn bản thay thế phù hợp để mô tả hình ảnh, và được bọc trong một phần tử `<a>` liên kết đến phiên bản kích thước đầy đủ tương ứng.

### Yêu cầu cấu trúc

Cấu trúc trang web cần bao gồm các thành phần sau:

1. Tiêu đề bao gồm tiêu đề trang cấp cao nhất và danh sách menu điều hướng.
2. Một vùng bọc bổ sung xung quanh danh sách menu điều hướng.
3. Khu vực nội dung chính chứa hai cột — một bài viết chính để chứa văn bản chào mừng, và một thanh bên (aside) để chứa hình thu nhỏ của ảnh.
4. Chân trang chứa thông tin bản quyền và ghi công.

Nói cách khác, bạn cần thêm một vùng bọc phù hợp cho:

- Tiêu đề
- Menu điều hướng
- Nội dung chính
- Bài viết chào mừng
- Phần aside hình ảnh
- Chân trang

### Tạo kiểu cho trang

Nếu cần, áp dụng CSS được cung cấp cho trang bằng cách thêm phần tử {{htmlelement("link")}} khác ngay bên dưới phần tử hiện có được cung cấp trong HTML ban đầu (một số trình soạn thảo mã trực tuyến sẽ tự động áp dụng CSS).

## Gợi ý và mẹo

- Sử dụng [trình xác thực HTML W3C](https://validator.w3.org/) để phát hiện các lỗi không mong muốn trong HTML của bạn — để bạn có thể sửa chúng.
- Bạn không cần biết bất kỳ CSS nào để thực hiện thách thức này; bạn chỉ cần áp dụng CSS được cung cấp vào HTML của mình.
- Nếu bạn bị kẹt và không thể hình dung phần tử nào nên đặt ở đâu, hãy vẽ một sơ đồ khối đơn giản của bố cục trang và ghi các phần tử bạn nghĩ nên bọc từng khối. Điều này cực kỳ hữu ích.

## Ví dụ

Ảnh chụp màn hình sau đây cho thấy một ví dụ về trang chủ trông như thế nào sau khi được đánh dấu. Nếu bạn bị kẹt về cách đạt được một số điều này, hãy xem giải pháp bên dưới ví dụ trực tiếp.

![Ví dụ hoàn chỉnh cho thách thức; một trang web đơn giản về quan sát chim, bao gồm tiêu đề "Birdwatching", ảnh chim, và thông điệp chào mừng](example-page.png)

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Birdwatching</title>
    <link
      href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300%7CCinzel+Decorative:700"
      rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />
  </head>

  <body>
    <header>
      <h1>
        Birdwatching
        <img
          src="https://mdn.github.io/shared-assets/images/examples/learn/birds/dove.png"
          alt="a simple dove logo" />
      </h1>

      <nav>
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="#">Get started</a></li>
          <li><a href="#">Photos</a></li>
          <li><a href="#">Gear</a></li>
          <li><a href="#">Forum</a></li>
        </ul>
      </nav>
    </header>

    <main>
      <article>
        <h2>Welcome</h2>

        <p>
          Welcome to our fake birdwatching site. If this were a real site, it
          would be the ideal place to come to learn more about birdwatching,
          whether you are a beginner looking to learn how to get into birding,
          or an expert wanting to share ideas, tips, and photos with other
          like-minded people.
        </p>

        <p>
          So don't waste time! Get what you need, then turn off that computer
          and get out into the great outdoors!
        </p>
      </article>

      <aside>
        <h2>Favorite photos</h2>

        <a
          href="https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-1.jpg">
          <img
            src="https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-1_th.jpg"
            alt="Small black bird, black claws, long black slender beak" />
        </a>
        <a
          href="https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-2.jpg">
          <img
            src="https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-2_th.jpg"
            alt="Top half of a pretty bird with bright blue plumage on neck, light colored beak, blue headdress" />
        </a>
        <a
          href="https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-3.jpg">
          <img
            src="https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-3_th.jpg"
            alt="Top half of a large bird with white plumage, very long curved narrow light colored break" />
        </a>
        <a
          href="https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-4.jpg">
          <img
            src="https://mdn.github.io/shared-assets/images/examples/learn/birds/favorite-bird-4_th.jpg"
            alt="Large bird, mostly white plumage with black plumage on back and rear, long straight white beak" />
        </a>
      </aside>
    </main>

    <footer>
      <p>
        This fake website example is CC0 — any part of this code may be reused
        in any way you wish. Original example written by Chris Mills, 2016.
      </p>

      <p>
        <a href="http://game-icons.net/lorc/originals/dove.html">Dove icon</a>
        by Lorc.
      </p>
    </footer>
  </body>
</html>
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Test_your_skills/Links", "Learn_web_development/Core/Structuring_content/HTML_images", "Learn_web_development/Core/Structuring_content")}}
