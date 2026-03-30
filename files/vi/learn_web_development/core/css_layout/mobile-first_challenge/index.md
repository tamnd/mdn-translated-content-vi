---
title: "Thử thách: Bố cục mobile-first"
short-title: "Thử thách: mobile-first"
slug: Learn_web_development/Core/CSS_layout/Mobile-first_challenge
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Test_your_skills/Responsive_design", "Learn_web_development/Core/Scripting", "Learn_web_development/Core/CSS_layout")}}

Thử thách này kết thúc mô-đun [bố cục CSS](/en-US/docs/Learn_web_development/Core/CSS_layout) bằng cách yêu cầu bạn cập nhật bố cục di động hiện có để nó cũng hoạt động tốt trên trình duyệt máy tính để bàn. Trong quá trình này, bạn cũng sẽ được kiểm tra về các tính năng bố cục responsive như truy vấn phương tiện, lưới CSS, flexbox và hình ảnh responsive.

## Điểm bắt đầu

Chúng ta sẽ để bạn giải quyết thử thách này trong môi trường phát triển cục bộ; lý tưởng nhất là bạn sẽ muốn xem ví dụ trong cửa sổ trình duyệt đầy đủ để đảm bảo các tính năng bố cục hoạt động như mong đợi.

1. Tạo một thư mục mới trên máy tính của bạn có tên `mobile-first-challenge`.
2. Bên trong thư mục, tạo một tệp `index.html` và dán nội dung sau vào đó:

   ```html
   <!doctype html>
   <html lang="en-US">
     <head>
       <meta charset="utf-8" />
       <title>RWD Task</title>
       <link href="style.css" rel="stylesheet" type="text/css" />
       <script defer src="script.js"></script>
     </head>

     <body>
       <header>
         <div class="logo">My exciting website!</div>
         <button aria-label="Open menu">☰</button>
       </header>

       <main class="grid">
         <nav>
           <ul>
             <li><a href="#">Home</a></li>
             <li><a href="#">Blog</a></li>
             <li><a href="#">About us</a></li>
             <li><a href="#">Our history</a></li>
             <li><a href="#">Contacts</a></li>
           </ul>
         </nav>
         <article>
           <h1>An Exciting Blog Post</h1>
           <img src="images/square6.jpg" alt="placeholder" class="feature" />
           <p>
             Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi
             welsh onion daikon amaranth tatsoi tomatillo melon azuki bean
             garlic.
           </p>

           <p>
             Turnip greens yarrow ricebean rutabaga endive cauliflower sea
             lettuce kohlrabi amaranth water spinach avocado daikon napa
             asparagus winter purslane kale. Celery potato scallion desert
             raisin horseradish spinach carrot soko. Lotus root water spinach
             fennel kombu maize bamboo shoot green bean swiss chard seakale
             pumpkin onion chickpea gram corn pea. Brussels sprout coriander
             water chestnut gourd swiss chard wakame kohlrabi beetroot carrot
             watercress. Corn amaranth salsify bunya nuts nori azuki bean
             chickweed potato bell pepper artichoke.
           </p>

           <p>
             Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot
             courgette tatsoi pea sprouts fava bean collard greens dandelion
             okra wakame tomato. Dandelion cucumber earthnut pea peanut soko
             zucchini.
           </p>

           <p>
             Nori grape silver beet broccoli kombu beet greens fava bean potato
             quandong celery. Bunya nuts black-eyed pea prairie turnip leek
             lentil turnip greens parsnip. Sea lettuce lettuce water chestnut
             eggplant winter purslane fennel azuki bean earthnut pea sierra
             leone bologi leek soko chicory celtuce parsley jícama salsify.
           </p>

           <p>
             Celery quandong swiss chard chicory earthnut pea potato. Salsify
             taro garlic gram celery wattle seed collard greens nori. Grape
             wattle seed kombu beetroot horseradish carrot squash brussels
             sprout chard.
           </p>

           <p>
             Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi
             welsh onion daikon amaranth tatsoi tomatillo melon azuki bean
             garlic.
           </p>

           <p>
             Turnip greens yarrow ricebean rutabaga endive cauliflower sea
             lettuce kohlrabi amaranth water spinach avocado daikon napa
             asparagus winter purslane kale. Celery potato scallion desert
             raisin horseradish spinach carrot soko. Lotus root water spinach
             fennel kombu maize bamboo shoot green bean swiss chard seakale
             pumpkin onion chickpea gram corn pea. Brussels sprout coriander
             water chestnut gourd swiss chard wakame kohlrabi beetroot carrot
             watercress. Corn amaranth salsify bunya nuts nori azuki bean
             chickweed potato bell pepper artichoke.
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
   /* General styles */

   * {
     box-sizing: border-box;
   }

   body {
     background-color: white;
     color: #333333;
     margin: 0;
     font: 1.2em / 1.6 sans-serif;
     padding: 0 20px 20px 20px;
   }

   img {
     display: block;
     border: 1px solid black;
   }

   /* Mobile layout */

   header {
     padding: 50px 0;
     display: flex;
     gap: 20px;
     justify-content: space-between;
     align-items: center;
   }

   .logo {
     font-size: 200%;
   }

   button {
     font-size: 250%;
     border: 0;
     background: none;
     cursor: pointer;
   }

   button:hover,
   button:focus {
     text-shadow: 0 0 2px black;
   }

   nav {
     position: fixed;
     inset: 10%;
     background-color: white;
     display: none;
   }

   nav ul {
     margin: 0;
     padding: 0;
     list-style: none;
     text-align: center;
     height: 100%;
     display: flex;
     gap: 10px;
     flex-direction: column;
   }

   nav li {
     flex: 1;
   }

   nav a {
     display: flex;
     justify-content: center;
     align-items: center;
     font-size: 150%;
     width: 100%;
     height: 100%;
     background-color: black;
     color: white;
     text-decoration: none;
   }

   nav a:hover,
   nav a:focus {
     font-weight: bold;
   }

   .photos {
     list-style: none;
     margin: 0;
     padding: 0;
     display: grid;
     gap: 5px;
     grid-template-columns: 1fr 1fr;
   }

   .feature {
     width: 200px;
     float: left;
     margin: 8px 30px 20px 0;
   }
   ```

4. Bên trong thư mục, tạo một tệp `script.js` và dán nội dung sau vào đó:

   ```js
   const btn = document.querySelector("button");
   const nav = document.querySelector("nav");

   function showNav() {
     nav.style.display = "block";
   }

   function hideNav() {
     nav.style.display = "none";
   }

   function hideNavEsc(e) {
     if (e.key === "Escape") {
       nav.style.display = "none";
     }
   }

   function handleEventListeners() {
     if (matchMedia("(width > 800px)").matches) {
       btn.removeEventListener("click", showNav);
       nav.removeEventListener("click", hideNav);
       document.body.removeEventListener("keydown", hideNavEsc);
       if (nav.style.display === "none") {
         nav.style.display = "block";
       }
     } else {
       btn.addEventListener("click", showNav);
       nav.addEventListener("click", hideNav);
       document.body.addEventListener("keydown", hideNavEsc);
       if (nav.style.display === "block") {
         nav.style.display = "none";
       }
     }
   }

   handleEventListeners();

   window.addEventListener("resize", handleEventListeners);
   ```

5. Bên trong thư mục, tạo một thư mục con có tên `images` và lưu các tệp hình ảnh sau vào đó:
   - [`square1.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/balloons/square1.jpg)
   - [`square2.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/balloons/square2.jpg)
   - [`square3.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/balloons/square3.jpg)
   - [`square4.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/balloons/square4.jpg)
   - [`square5.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/balloons/square5.jpg)
   - [`square6.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/balloons/square6.jpg)
6. Lưu các tệp và tải `index.html` trong trình duyệt, sẵn sàng để kiểm tra. Điểm bắt đầu của trang sẽ trông giống như thế này khi được xem trong khung nhìn hẹp:

   ![Điểm bắt đầu của tác vụ mobile-first. Bố cục một cột với logo ở đầu và biểu tượng menu hamburger, theo sau là tiêu đề cấp đầu, theo sau là nội dung văn bản với hình ảnh float.](rwd-task-start.png)

## Mô tả dự án

Nội dung được cung cấp cho ví dụ này giống như nội dung từ thử thách trước, [Hiểu bố cục cơ bản](/en-US/docs/Learn_web_development/Core/CSS_layout/Fundamental_Layout_Comprehension), với một số khác biệt cấu trúc nhỏ. Nó cũng có bố cục hầu như hoàn chỉnh từ đầu, mặc dù như bạn có thể đã nhận thấy khi kiểm tra, nó trông khủng khiếp trong khung nhìn màn hình rộng!

Đây là vì chúng ta đã cung cấp cho bạn bố cục di động để bắt đầu. Lưu ý cách menu điều hướng được truy cập bằng cách nhấn biểu tượng "menu hamburger", và có thể bị loại bỏ bằng cách nhấp vào một mục menu hoặc nhấn phím <kbd>Esc</kbd>. Chức năng này được xử lý bằng JavaScript và chỉ hoạt động khi khung nhìn nhỏ hơn `800px` rộng để nó không can thiệp vào các bố cục màn hình rộng hơn bạn sẽ triển khai.

Cụ thể, chúng ta muốn bạn triển khai hai bố cục: bố cục đầu tiên kích hoạt khi chiều rộng lớn hơn `800px`, và bố cục thứ hai kích hoạt ở trên `1300px`. Chúng ta cũng sẽ yêu cầu bạn sửa một vài vấn đề với mã hiện có và triển khai một số tính năng bổ sung.

### Sửa một số vấn đề hiển thị

Trước tiên, bạn sẽ cần giải quyết một vài vấn đề chúng ta đã để lại trong template bắt đầu.

1. Hiện tại, các bố cục sẽ không hiển thị đúng trong trình duyệt di động. Thêm một thẻ vào `<head>` của tài liệu `<html>` của bạn để sửa điều này.
2. Với cửa sổ trình duyệt được đặt ở chiều rộng hẹp, nhìn vào cuối trang — bạn sẽ thấy rằng thư viện ảnh không hiển thị đúng vì các ảnh đang vỡ ra khỏi vùng chứa. Thêm một khai báo vào tệp CSS của bạn để sửa điều này.

### Tạo bố cục trung gian

Bố cục trung gian cần được áp dụng cho trang ở chiều rộng khung nhìn trên `800px`. Làm theo các bước sau để hoàn thành bố cục:

1. Ẩn `<button>` menu và hiển thị `<nav>`. Chúng ta chỉ muốn sử dụng menu ẩn/hiện trong bố cục di động.
2. Thay đổi định vị của `<nav>` để thay vì ngồi lên trên hầu hết nội dung, nó ngồi ở đầu trang web, ngay dưới logo "My exciting website!". Chúng ta cũng muốn nó dính vào đầu khung nhìn khi nội dung đã cuộn lên đến đó.
3. Các mục danh sách điều hướng hiện đang hiển thị trong một cột. Đối với bố cục này, bạn thay vào đó muốn chúng hiển thị như một hàng qua toàn màn hình.
4. Điều chỉnh các phần tử `<a>` bên trong các mục danh sách để cung cấp cho chúng `10px` đệm trên và dưới, và kích thước phông chữ nhỏ hơn (khoảng `100%`).
5. Các phần tử `<nav>`, `<article>` và `<aside>` đều là con của phần tử `<main>`. Chúng ta muốn bạn bố cục chúng như một lưới, sử dụng các vùng mẫu lưới được đặt tên, trong cấu trúc sau:
   ```plain
   ┌----------------------------------------┐
   |                  <nav>                 |
   ├------------------------------┬---------┤
   |           <article>          | <aside> |
   |                              |         |
   ```
   Phần tử `<article>` nên có chiều rộng gấp ba lần phần tử `<aside>`; cả hai phần tử nên ngồi trên cùng một hàng. Phần tử `<nav>` nên trên hàng riêng biệt phía trên hai phần tử còn lại và trải dài qua toàn bộ chiều rộng có sẵn. Chúng ta cũng muốn bạn bao gồm khoảng cách `20px` giữa các mục lưới khác nhau.

### Tạo bố cục màn hình rộng

Bố cục màn hình rộng cần được áp dụng cho trang ở chiều rộng khung nhìn trên `1300px`. Làm theo các bước sau để hoàn thành bố cục:

1. Thay đổi bố cục lưới bạn đã triển khai cho bố cục trung gian sang bố cục khác, lần này sử dụng các vùng mẫu lưới được đặt tên. Lần này, cấu trúc nên như thế này:
   ```plain
   ┌--------┬------------------------------┬---------┐
   | <nav>  |           <article>          | <aside> |
   |        |                              |         |
   ```
   Lần này, tất cả ba phần tử trên cùng một hàng. Các phần tử `<nav>` và `<aside>` nên chiếm cùng chiều rộng; phần tử `<article>` nên rộng gấp ba lần hai phần tử kia.
2. Các mục danh sách điều hướng đang hiển thị trong một hàng do bố cục trung gian; đối với bố cục màn hình rộng để hoạt động, bạn sẽ cần điều chỉnh kiểu danh sách để các mục danh sách hiển thị trong một cột trở lại, như chúng đã làm trong bố cục di động.
3. Các mục danh sách hiện có giá trị `flex` là `1`, có nghĩa là chúng sẽ kéo dài để lấp đầy toàn bộ chiều cao của cột. Điều chỉnh giá trị thuộc tính này để các mục nav chỉ cao bằng nội dung và `padding` đặt.

### Triển khai typography responsive

Chúng ta muốn bạn điều chỉnh kiểu của các phần tử `<h1>` và `<h2>` để chúng:

1. Có `margin` trên và dưới bị xóa để chúng khớp gọn hơn với nội dung phía trên và phía dưới.
2. Thay đổi kích thước responsive khi khung nhìn được mở rộng hoặc thu hẹp, trong khi vẫn có thể phóng to. Bạn nên chọn các đơn vị thích hợp để các tiêu đề lấp đầy không gian có sẵn đẹp mà không ngắt thành nhiều dòng.

### Điều chỉnh bố cục để in

Thêm một khối kiểu loại bỏ các phần tử `<button>` và `<nav>` khỏi bố cục khi bạn đang in trang.

## Gợi ý và mẹo

1. Bạn không cần chỉnh sửa JavaScript để hoàn thành thử thách này.
2. Có một vài cách để thực hiện một số tác vụ trong mô tả dự án, và thường không có một cách đúng hay sai duy nhất để làm mọi thứ. Hãy thử một vài cách tiếp cận khác nhau và xem cái nào hoạt động tốt nhất. Ghi chú lại khi bạn thử nghiệm.
3. Đôi khi, giá trị thuộc tính được đặt cho bố cục trước có thể gây ra vấn đề với các bố cục tiếp theo. Một số kỹ năng với thiết kế responsive là biết khi nào cần bỏ đặt hoặc ghi đè các giá trị thuộc tính đã đặt trước đó.

## Ví dụ

Ảnh chụp màn hình sau đây cho thấy bố cục trung gian hoàn chỉnh sẽ trông như thế nào:

![Trang web tác vụ rwd đã hoàn thành với bố cục trung gian. Logo ở đầu, theo sau là menu nav ngang, theo sau là hai cột, nội dung văn bản ở bên trái và thư viện ảnh ở bên phải.](rwd-task-middle.png)

Ảnh chụp màn hình sau đây cho thấy bố cục màn hình rộng hoàn chỉnh sẽ trông như thế nào:

![Trang web tác vụ rwd đã hoàn thành với bố cục màn hình rộng. Logo ở đầu, theo sau là ba cột, menu nav dọc ở bên trái, nội dung văn bản ở giữa và thư viện ảnh ở bên phải.](rwd-task-widescreen.png)

<details>
<summary>Nhấp vào đây để xem giải pháp có thể</summary>

Để làm cho các bố cục hiển thị đúng trong trình duyệt di động, bạn cần thêm thẻ `<meta>` viewport bên trong `<head>` của tài liệu HTML:

```html
<meta name="viewport" content="width=device-width, initial-scale=1" />
```

CSS hoàn chỉnh sẽ trông giống như thế này:

```css
/* General styles */

* {
  box-sizing: border-box;
}

body {
  background-color: white;
  color: #333333;
  margin: 0;
  font: 1.2em / 1.6 sans-serif;
  padding: 0 20px 20px 20px;
}

img {
  display: block;
  border: 1px solid black;
  /* Solution: Stop the photographs from breaking out of
  their containers */
  max-width: 100%;
}

/* Mobile layout */

header {
  padding: 50px 0;
  display: flex;
  gap: 20px;
  justify-content: space-between;
  align-items: center;
}

.logo {
  font-size: 200%;
}

button {
  font-size: 250%;
  border: 0;
  background: none;
  cursor: pointer;
}

button:hover,
button:focus {
  text-shadow: 0 0 2px black;
}

nav {
  position: fixed;
  inset: 10%;
  background-color: white;
  display: none;
}

nav ul {
  margin: 0;
  padding: 0;
  list-style: none;
  text-align: center;
  height: 100%;
  display: flex;
  gap: 10px;
  flex-direction: column;
}

nav li {
  flex: 1;
}

nav a {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 150%;
  width: 100%;
  height: 100%;
  background-color: black;
  color: white;
  text-decoration: none;
}

nav a:hover,
nav a:focus {
  font-weight: bold;
}

.photos {
  list-style: none;
  margin: 0;
  padding: 0;
  display: grid;
  gap: 5px;
  grid-template-columns: 1fr 1fr;
}

.feature {
  width: 200px;
  float: left;
  margin: 8px 30px 20px 0;
}

/* Solution: Creating the middle layout (breakpoint: 800px) */

@media (width > 800px) {
  /* Sort out navigation styling for middle breakpoint */
  button {
    display: none;
  }

  nav {
    display: block;
    inset: unset;
    position: sticky;
    top: 0;
  }

  nav ul {
    flex-direction: row;
  }

  nav a {
    font-size: 100%;
    padding: 10px 0;
  }

  /* Create grid layout for middle breakpoint */

  nav {
    grid-area: nav;
  }

  article {
    grid-area: main;
  }

  aside {
    grid-area: photos;
  }

  .grid {
    display: grid;
    grid-template-columns: 3fr 1fr;
    grid-template-areas:
      "nav nav"
      "main photos";
    gap: 20px;
  }
}

/* Solution: Creating the widescreen layout (breakpoint: 1300px) */

@media (width > 1300px) {
  .grid {
    grid-template-columns: 1fr 3fr 1fr;
    grid-template-areas: "nav main photos";
  }

  nav ul {
    flex-direction: column;
  }

  nav li {
    flex: unset;
  }
}

/* 4. Solution: Implementing responsive typography */

h1 {
  font-size: calc(1.3rem + 3vw);
  margin: 0;
}

h2 {
  font-size: calc(1rem + 2vw);
  margin: 0;
}

/* 5. Solution: Adjusting the layout for print */

@media print {
  nav,
  button {
    display: none;
  }
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Test_your_skills/Responsive_design", "Learn_web_development/Core/Scripting", "Learn_web_development/Core/CSS_layout")}}
