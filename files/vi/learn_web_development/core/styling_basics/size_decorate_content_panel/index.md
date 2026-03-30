---
title: "Thử thách: Định kích thước và trang trí bảng điều khiển nội dung"
short-title: "Thử thách: Định kích thước và trang trí"
slug: Learn_web_development/Core/Styling_basics/Size_decorate_content_panel
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Overflow", "Learn_web_development/Core/Styling_basics/Images_media_forms", "Learn_web_development/Core/Styling_basics")}}

Trong thử thách này bạn được cung cấp một cấu trúc trang được tạo kiểu nhẹ để hiển thị một bảng điều khiển nội dung chứa văn bản và hình ảnh, với tiêu đề ở trên cùng và thanh nút ở dưới cùng. Chúng tôi muốn bạn làm theo các hướng dẫn để định kích thước và trang trí nó, tạo ra một bố cục thú vị. Trong quá trình đó, chúng tôi sẽ kiểm tra kiến thức của bạn về các giá trị và đơn vị CSS, kích thước, tràn nội dung và nền và đường viền.

## Điểm khởi đầu

Chúng tôi sẽ nhờ bạn giải quyết thử thách này trên môi trường phát triển cục bộ; lý tưởng là bạn muốn xem ví dụ trong cửa sổ trình duyệt đầy đủ để đảm bảo bạn đang đi đúng hướng.

1. Tạo một thư mục mới trên máy tính của bạn có tên `size-decorate-content-panel`.
2. Bên trong thư mục, tạo một tệp `index.html` và dán nội dung sau vào đó:

   ```html-nolint live-sample___content-pane-start live-sample___content-pane-finish
   <!doctype html>
   <html lang="en">
     <head>
       <meta charset="utf-8" />
       <title>Challenge: Content pane with button bar</title>
       <link href="style.css" rel="stylesheet" />
     </head>
     <body>
       <section class="pane">
         <h1>Content pane</h1>
         <div class="content">
           <h2>Some exciting content</h2>

           <p>
             Lorem ipsum dolor sit amet, consectetur adipiscing elit,
             sed do eiusmod tempor incididunt ut labore et dolore magna
             aliqua. Proin tortor purus <a href="#">platea sit eu id</a>
             nisi litora libero. Neque vulputate consequat ac amet augue
             blandit maximus aliquet congue. Pharetra vestibulum posuere
             ornare <a href="#">faucibus fusce dictumst</a> orci aenean eu
             facilisis ut volutpat commodo senectus purus himenaeos fames
             primis convallis nisi.
           </p>
           <img
             src="https://mdn.github.io/shared-assets/images/examples/leopard.jpg"
             alt="Closeup of a large wild cat's eyes and nose" />
           <p>
             Phasellus fermentum malesuada phasellus netus dictum aenean
             placerat egestas amet. <a href="#">Ornare taciti semper dolor
             tristique</a> morbi. Sem leo tincidunt aliquet semper eu lectus
             scelerisque quis. Sagittis vivamus mollis nisi mollis enim
             fermentum laoreet.
           </p>

           <h2>More exciting content</h2>

           <p>
             Curabitur semper venenatis lectus viverra ex dictumst nulla
             maximus. Primis iaculis elementum conubia feugiat venenatis
             dolor augue ac blandit nullam ac <a href="#">phasellus turpis</a>
             feugiat mollis. Duis lectus porta mattis imperdiet vivamus augue
             litora lectus arcu. Justo torquent pharetra volutpat ad blandit
             bibendum <a href="#">accumsan nec elit cras</a> luctus primis
             ipsum gravida class congue.
           </p>
           <img
             src="https://mdn.github.io/shared-assets/images/examples/balloons-landscape.jpg"
             alt="Three colorful hot air balloons floating across a blue, nearly cloudless sky" />
           <p>
             Vehicula etiam elementum finibus enim duis feugiat commodo
             adipiscing tortor <a href="#">tempor elit</a>. Et mollis
             consectetur habitant turpis tortor consectetur adipiscing
             vulputate dolor lectus iaculis convallis adipiscing. Nam
             hendrerit <a href="#">dignissim condimentum ullamcorper diam</a>
             morbi eget consectetur odio in sagittis.
           </p>
         </div>
         <div class="controls">
           <button>One</button>
           <button>Two</button>
           <button>Three</button>
           <button>Four</button>
         </div>
       </section>
     </body>
   </html>
   ```

3. Bên trong thư mục, tạo một tệp `style.css` và dán nội dung sau vào đó:

   ```css live-sample___content-pane-start
   /* Type and text */

   * {
     box-sizing: border-box;
   }

   html {
     height: 100%;
   }

   body {
     height: inherit;
     font: 1.2em / 1.5 system-ui;
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

   a:hover,
   a:focus {
     text-decoration: none;
   }

   /* Styling the pane */

   .pane {
     height: 100%;
   }

   h1,
   .controls {
     margin: 0;
     display: flex;
     justify-content: center;
     align-items: center;
   }

   .content {
   }

   .controls {
     justify-content: space-around;
     gap: 20px;
     padding: 20px;
   }

   button {
     flex: 1;
   }
   ```

4. Lưu các tệp và tải `index.html` trong trình duyệt để kiểm tra.

## Mô tả dự án

Hãy làm theo các bước dưới đây để hoàn thiện dự án, định kích thước bảng điều khiển nội dung phù hợp và thêm các trang trí cần thiết.

### Tiêu đề

1. Dùng nội dung được tạo để hiển thị emoji sách (📖) ở đầu tiêu đề cấp cao nhất. Thêm `20px` khoảng cách giữa emoji và văn bản tiêu đề.
2. Hiện tại, các tiêu đề được định kích thước bằng `em`. Chúng tôi muốn bạn thay đổi kích thước để nó có tính đáp ứng, thay đổi dựa trên chiều rộng khung nhìn nhưng vẫn có thể phóng to được. Để đạt được điều này, hãy đặt kích thước của mỗi cấp tiêu đề bằng một tỉ lệ phần trăm phù hợp của chiều rộng khung nhìn cộng với một giá trị `em` nhỏ hơn.

### Định kích thước container

1. Đặt chiều rộng của phần tử `<section>` bọc ngoài có class `pane` bằng `60%`, nhưng đặt chiều rộng tối đa là `1000px` và chiều rộng tối thiểu là `480px`. Xem bạn có thể tìm một hàm CSS cho phép bạn đặt điều này bằng một khai báo duy nhất không.
2. Căn giữa `<section>` `pane` theo chiều ngang trên trang bằng lề `auto`.
3. Đặt `<h1>` và `<div>` có class `controls` đều cao `100px`. Đặt `<div>` có class `content` cao `100%` chiều cao của `<body>`, trừ đi chiều cao của `<h1>` và `<div class="controls">`. Điều này sẽ cho bạn một giao diện luôn kéo dài bằng chiều cao khung nhìn, với một container nội dung linh hoạt và thanh tiêu đề và nút có chiều cao cố định.
4. Các nút trông khá mỏng và khó đọc. Đặt chiều cao của chúng bằng `100%` container của chúng và cỡ chữ `1.2em`.
5. Đặt cho `<section>` `pane` và `<div>` `content` khoảng đệm trên/dưới `0` ở cả hai phía và khoảng đệm trái/phải `20px` ở cả hai phía.

### Vị trí hình ảnh

1. Hiện tại các hình ảnh tràn ra ngoài container nội dung. Đặt chiều rộng tối đa `90%` cho chúng để ngăn điều này xảy ra.
2. Căn giữa các hình ảnh theo chiều ngang bằng lề `auto`.

### Trang trí

1. Áp dụng gradient tuyến tính cho `<section>` `pane`, chuyển dần từ `#9fb4c7` ở trên cùng sang `#7f7caf` ở dưới cùng.
2. Đặt cho các hình ảnh đường viền `1px solid` và `<div>` `content` đường viền `2px solid`. Đặt màu đường viền là `#28587b`.
3. Đặt cho `<div>` `content` màu nền `#eeeeff` và hình ảnh nền `https://mdn.github.io/shared-assets/images/examples/big-star.png`. Hình ảnh nền không nên lặp lại, được định kích thước `40px` x `40px`, và được đặt `5px` từ trên cùng của container và `15px` từ bên phải.
4. Đặt cho các nút màu chữ `white` và màu nền `rgb(40 88 123 / 0.8)`. Khi rê chuột hoặc được truy cập bằng bàn phím, các nút nên thay đổi để có phiên bản hoàn toàn đục của cùng màu nền.
5. Đặt bán kính viền `10px` trên `<div>` `content` và các nút.

### Tràn nội dung

Tại thời điểm này, bạn vẫn nên nhận thấy một vấn đề với giao diện — nội dung trong `<div>` `content` tràn ra ngoài container và toàn bộ trang cuộn để cho phép bạn truy cập tất cả nội dung. Chúng tôi muốn `<div>` `content` cuộn thay thế. Bạn có thể làm điều này như thế nào?

## Gợi ý và mẹo

- Dùng [W3C CSS Validator](https://jigsaw.w3.org/css-validator/) để phát hiện các lỗi không mong muốn trong CSS — những lỗi mà bạn có thể đã bỏ qua — để bạn có thể sửa chúng.
- Bạn không cần thay đổi HTML theo bất kỳ cách nào.

## Ví dụ

Trạng thái bắt đầu của dự án sẽ hiển thị như thế này:

{{EmbedLiveSample("content-pane-start", "100%", 500)}}

Dự án hoàn chỉnh sẽ trông như thế này (chúng tôi đã hiển thị điều này ở chiều rộng `90%`, không phải `60%`, vì vậy nó trông đẹp hơn trong khung đầu ra hẹp):

{{EmbedLiveSample("content-pane-finish", "100%", 500)}}

<details>
<summary>Nhấp vào đây để xem một giải pháp có thể</summary>

CSS hoàn chỉnh trông như sau:

```css live-sample___content-pane-finish
/* Type and text */

* {
  box-sizing: border-box;
}

html {
  height: 100%;
}

body {
  height: inherit;
  font: 1.2em / 1.5 system-ui;
  margin: 0 auto;
}

h1 {
  /* Solution: Responsive heading sizing, equal to vw value plus em value */
  font-size: calc(2vw + 1em);
}

/* Solution: Add book emoji as generated content, with 20px spacing between
it and the heading content */
h1::before {
  content: "📖";
  margin-right: 20px;
}

h2 {
  /* Solution: Responsive heading sizing, equal to vw value plus em value */
  font-size: calc(1.5vw + 0.75em);
}

a {
  color: red;
}

a:hover,
a:focus {
  text-decoration: none;
}

.pane {
  height: 100%;
  /* Solution: Set container width percentage and min
  and max width with one declaration, using the clamp()
  function  */
  width: clamp(480px, 60%, 1000px);
  /* Solution: Center container using auto margins */
  margin: 0 auto;
  /* Solution: Set container top/bottom padding of 0 on both sides
  and left/right padding of 20px on both sides */
  padding: 0 20px;
  /* Solution: Apply linear gradient from top to bottom */
  background: linear-gradient(to bottom, #9fb4c7, #7f7caf);
}

h1,
.controls {
  margin: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  /* Solution: Set the h1 and controls div to each be 100px high */
  height: 100px;
}

.content {
  /* Solution: Set background color and image on the content div,
  and size the image */
  background: url("https://mdn.github.io/shared-assets/images/examples/big-star.png")
    no-repeat top 5px right 15px / 40px #eeeeff;
  /* Solution: Set content top/bottom padding of 0 on both sides and
  left/right padding of 20px on both sides */
  padding: 0 20px;
  /* Solution: Set the content div to be 100% high minus the h1 and
  controls div combined height (200px) */
  height: calc(100% - 200px);
  /* Solution: Set border on the content div */
  border: 2px solid #28587b;
  /* Solution: Stop the content from overflowing its container;
  make it scroll instead */
  overflow: auto;
}

img {
  /* Solution: Set 90% maximum width on the images */
  max-width: 90%;
  /* Solution: Center using auto margins */
  margin: 0 auto;
  display: block;
  /* Solution: Set border on the images */
  border: 1px solid #28587b;
}

.controls {
  justify-content: space-around;
  gap: 20px;
  padding: 20px;
}

button {
  flex: 1;
  /* Solution: Set button height to 100% and font size to 1.2em */
  height: 100%;
  font-size: 1.2em;
  /* Solution: Set white text color on the buttons */
  color: white;
  /* Solution: Set background color on the buttons */
  background-color: rgb(40 88 123 / 0.8);
}

/* Solution: Set fully-opaque background color on the
buttons on hover and focus */
button:hover,
button:focus {
  background-color: rgb(40 88 123 / 1);
}

/* Solution: Set border radius on content div and buttons */
.content,
button {
  border-radius: 10px;
}
```

```css hidden live-sample___content-pane-finish
.pane {
  width: clamp(480px, 90%, 1000px);
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Test_your_skills/Overflow", "Learn_web_development/Core/Styling_basics/Images_media_forms", "Learn_web_development/Core/Styling_basics")}}
