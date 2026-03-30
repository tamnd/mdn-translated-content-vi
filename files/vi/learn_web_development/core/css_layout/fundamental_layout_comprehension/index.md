---
title: "Thử thách: Hiểu bố cục cơ bản"
short-title: "Thử thách: Bố cục cơ bản"
slug: Learn_web_development/Core/CSS_layout/Fundamental_Layout_Comprehension
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Test_your_skills/Grid", "Learn_web_development/Core/CSS_layout/Responsive_Design", "Learn_web_development/Core/CSS_layout")}}

Thử thách này sẽ kiểm tra kiến thức của bạn về các tính năng bố cục chúng ta đã đề cập cho đến nay trong mô-đun, cụ thể là flexbox, floats, lưới và định vị. Khi hoàn thành, bạn sẽ đã phát triển một bố cục trang web sử dụng tất cả các công cụ cơ bản này.

## Điểm bắt đầu

Chúng ta sẽ để bạn giải quyết thử thách này trong môi trường phát triển cục bộ; lý tưởng nhất là bạn sẽ muốn xem ví dụ trong cửa sổ trình duyệt đầy đủ để đảm bảo các tính năng bố cục hoạt động như mong đợi.

1. Tạo một thư mục mới trên máy tính của bạn có tên `layout-challenge`.
2. Bên trong thư mục, tạo một tệp `index.html` và dán nội dung sau vào đó:

   ```html
   <!doctype html>
   <html lang="en-US">
     <head>
       <meta charset="utf-8" />
       <meta name="viewport" content="width=device-width, initial-scale=1" />
       <title>Layout Task</title>
       <link href="style.css" rel="stylesheet" type="text/css" />
     </head>

     <body>
       <div class="logo">My exciting website!</div>

       <nav>
         <ul>
           <li><a href="">Home</a></li>
           <li><a href="">Blog</a></li>
           <li><a href="">About us</a></li>
           <li><a href="">Our history</a></li>
           <li><a href="">Contacts</a></li>
         </ul>
       </nav>

       <main class="grid">
         <article>
           <h1>An Exciting Blog Post</h1>
           <img src="images/square6.jpg" alt="placeholder" class="feature" />
           <p>
             Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non
             justo at erat egestas porttitor vel nec tortor. Mauris in molestie
             ipsum. Vivamus diam elit, ornare ornare nisi vitae, ullamcorper
             pharetra ligula. In vel lacus quis nulla sollicitudin pellentesque.
           </p>

           <p>
             Nunc vitae eleifend odio, eget tincidunt sem. Cras et varius justo.
             Nulla sollicitudin quis urna vitae efficitur. Pellentesque
             hendrerit molestie arcu sit amet lacinia. Vivamus vulputate sed
             purus at eleifend. Phasellus malesuada sem vel libero hendrerit,
             sed finibus massa porta. Vestibulum luctus scelerisque libero, sit
             amet sagittis eros sollicitudin ac. Class aptent taciti sociosqu ad
             litora torquent per conubia nostra, per inceptos himenaeos.
           </p>

           <p>
             Phasellus tincidunt eros iaculis, feugiat mi at, eleifend mauris.
             Quisque porttitor lacus eu massa condimentum, eu tincidunt nisl
             consequat. Nunc egestas lacus dolor, id scelerisque ante tincidunt
             ac. In risus massa, sodales ac enim eu, iaculis eleifend lorem.
           </p>

           <p>
             Maecenas euismod condimentum enim, non rhoncus neque tempor ut.
             Vestibulum eget nisi ornare, vehicula felis id, aliquet nibh. Donec
             in mauris in diam aliquam commodo nec ac nunc. Aliquam nisl risus,
             eleifend a iaculis id, tempor vel tortor. Nam ullamcorper dictum
             tellus id rhoncus. Sed quis nulla in mi aliquam euismod nec eu
             metus.
           </p>

           <p>
             Nam orci nulla, convallis aliquet ante ut, lobortis hendrerit
             risus. Nulla malesuada porta turpis in consequat. Duis suscipit
             nulla a mauris pellentesque vehicula. Fusce euismod, mi malesuada
             venenatis vestibulum, metus erat faucibus dui, vel rutrum turpis
             nibh ut diam.
           </p>

           <p>
             Nam ornare et mauris eget tincidunt. Nam ornare et mauris eget
             tincidunt. Donec et ipsum a orci elementum commodo et ut ex.
             Vivamus porttitor sem in purus maximus, eu imperdiet felis
             lobortis.
           </p>

           <p>
             Pellentesque ullamcorper dolor ut ullamcorper convallis. Duis a
             orci aliquet, pretium neque ut, auctor purus. Proin viverra
             tincidunt nisi id fringilla. Maecenas interdum risus in ultricies
             finibus. Vestibulum volutpat tincidunt libero, a feugiat leo
             suscipit in. Sed eget lacus rutrum, semper ligula a, vestibulum
             ipsum. Mauris in odio fringilla, accumsan eros blandit, mattis
             odio. Ut viverra mollis augue, vitae ullamcorper velit hendrerit
             eu. Curabitur mi lacus, condimentum in auctor sed, ornare sed leo.
           </p>
         </article>

         <aside>
           <h2>Photography</h2>
           <ul class="photos">
             <li><img src="images/square1.jpg" alt="placeholder" /></li>
             <li><img src="images/square2.jpg" alt="placeholder" /></li>
             <li><img src="images/square3.jpg" alt="placeholder" /></li>
             <li><img src="images/square4.jpg" alt="placeholder" /></li>
             <li><img src="images/square5.jpg" alt="placeholder" /></li>
           </ul>
         </aside>
       </main>
     </body>
   </html>
   ```

3. Bên trong thư mục, tạo một tệp `style.css` và dán nội dung sau vào đó:

   ```css
   * {
     box-sizing: border-box;
   }

   body {
     background-color: white;
     color: #333333;
     margin: 0;
     font: 1.2em / 1.6 sans-serif;
   }

   img {
     max-width: 100%;
     display: block;
     border: 1px solid black;
   }

   .logo {
     font-size: 200%;
     padding: 50px 20px;
     margin: 0 auto;
     max-width: 980px;
   }

   .grid {
     margin: 0 auto;
     max-width: 980px;
   }

   nav {
     background-color: black;
     padding: 0.5em;
   }

   nav ul {
     margin: 0;
     padding: 0;
     list-style: none;
   }

   nav a {
     color: white;
     text-decoration: none;
     padding: 0.5em 1em;
   }

   .photos {
     list-style: none;
     margin: 0;
     padding: 0;
   }

   .feature {
     width: 200px;
   }
   ```

4. Bên trong thư mục, tạo một thư mục con có tên `images` và lưu các tệp hình ảnh sau vào đó:
   - [`square1.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/balloons/square1.jpg)
   - [`square2.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/balloons/square2.jpg)
   - [`square3.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/balloons/square3.jpg)
   - [`square4.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/balloons/square4.jpg)
   - [`square5.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/balloons/square5.jpg)
   - [`square6.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/balloons/square6.jpg)
5. Lưu các tệp và tải `index.html` trong trình duyệt, sẵn sàng để kiểm tra. Điểm bắt đầu của trang có kiểu dáng cơ bản nhưng không có bố cục, và sẽ trông giống như thế này:

   ![Điểm bắt đầu của tác vụ bố cục. Các phần tử không được sắp xếp gọn gàng. Có tiêu đề trang web, phía trên thanh điều hướng đen với 5 liên kết ở bên trái, tiếp theo là tiêu đề bài đăng blog và nội dung bài đăng. Giữa tiêu đề blog và nội dung blog có một ảnh ở bên trái.](layout-task-start.png)

## Mô tả dự án

Bạn được cung cấp một số HTML thô, CSS cơ bản và hình ảnh — bây giờ bạn cần tạo bố cục cho thiết kế.

Các tác vụ bạn cần thực hiện là:

1. Hiển thị các mục điều hướng theo hàng, với lượng không gian bằng nhau giữa các mục và ít không gian hơn ở mỗi đầu hàng.
2. Tạo kiểu cho thanh điều hướng để nó cuộn cùng với nội dung bình thường nhưng sau đó dính vào đầu khung nhìn khi đến đó.
3. Khiến hình ảnh "feature" bên trong bài viết có văn bản bao quanh nó ở bên phải và phía dưới, với lượng không gian phù hợp giữa hình ảnh và văn bản.
4. Hiển thị các phần tử {{htmlelement("article")}} và {{htmlelement("aside")}} dưới dạng bố cục hai cột, với phần tử trước rộng gấp ba lần phần sau. Các cột nên có kích thước linh hoạt để khi cửa sổ trình duyệt trở nên hẹp hơn, các cột trở nên hẹp hơn. Bao gồm khoảng cách 20 pixel giữa hai cột.
5. Các ảnh nên hiển thị dưới dạng lưới hai cột với các cột có kích thước bằng nhau và khoảng cách 5 pixel giữa các hình ảnh.

## Gợi ý và mẹo

- Bạn không cần chỉnh sửa HTML để hoàn thành thử thách này.
- Có một vài cách để thực hiện một số tác vụ trong mô tả dự án, và thường không có một cách đúng hay sai duy nhất để làm mọi thứ. Hãy thử một vài cách tiếp cận khác nhau và xem cái nào hoạt động tốt nhất. Ghi chú lại khi bạn thử nghiệm.

## Ví dụ

Ảnh chụp màn hình sau đây cho thấy ví dụ về bố cục hoàn chỉnh cho thiết kế sẽ trông như thế nào:

![Trang web tác vụ bố cục đã hoàn thành. Các phần tử được sắp xếp gọn gàng. Có tiêu đề trang web, phía trên thanh điều hướng đen chứa 5 liên kết được phân bố đều nhau. Bên dưới thanh điều hướng, có hai phần. Bên trái có một bài đăng blog: Tiêu đề bài đăng blog theo sau là nội dung bài đăng. Nội dung blog bao quanh một ảnh ở bên trái. Bên phải có tiêu đề 'photography' về một nhóm hình ảnh được sắp xếp thành lưới hai hình ảnh rộng.](layout-task-complete.png)

<details>
<summary>Nhấp vào đây để xem giải pháp tiềm năng</summary>

CSS hoàn chỉnh trông như sau:

```css
* {
  box-sizing: border-box;
}

body {
  background-color: white;
  color: #333333;
  margin: 0;
  font: 1.2em / 1.6 sans-serif;
}

img {
  max-width: 100%;
  display: block;
  border: 1px solid black;
}

.logo {
  font-size: 200%;
  padding: 50px 20px;
  margin: 0 auto;
  max-width: 980px;
}

.grid {
  margin: 0 auto;
  max-width: 980px;
  /* Solution: Display <article> and <aside> as two flexible
  columns, with <article> three times the width of <aside>,
  and a 20px gap */
  display: grid;
  grid-template-columns: 3fr 1fr;
  gap: 20px;
}

nav {
  background-color: black;
  padding: 0.5em;
  /* Solution: Make navigation bar scroll with content normally but
  then stick to top of viewport */
  top: 0;
  position: sticky;
}

nav ul {
  margin: 0;
  padding: 0;
  list-style: none;
  /* Solution: Display the navigation items in a row with equal space
  in between and less space at the ends  */
  display: flex;
  justify-content: space-around;
}

nav a {
  color: white;
  text-decoration: none;
  padding: 0.5em 1em;
}

.photos {
  list-style: none;
  margin: 0;
  padding: 0;
  /* Solution: Display photos in two-column grid with equal columns
  and a 5px gap */
  display: grid;
  gap: 5px;
  grid-template-columns: 1fr 1fr;
}

.feature {
  width: 200px;
  /* Solution: Wrap text around the "feature" image to the right and bottom,
  with suitable space between image and text */
  float: left;
  margin: 8px 30px 20px 0;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Test_your_skills/Grid", "Learn_web_development/Core/CSS_layout/Responsive_Design", "Learn_web_development/Core/CSS_layout")}}
