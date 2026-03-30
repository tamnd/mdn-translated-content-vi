---
title: "Thách thức: Cấu trúc biểu mẫu phản hồi"
short-title: "Thách thức: Biểu mẫu phản hồi"
slug: Learn_web_development/Core/Structuring_content/Forms_challenge
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Test_your_skills/Forms_and_buttons", "Learn_web_development/Core/Structuring_content/Debugging_HTML", "Learn_web_development/Core/Structuring_content")}}

Trong thách thức này, chúng tôi sẽ kiểm tra khả năng tạo và cấu trúc biểu mẫu của bạn, cũng như thêm một số tính năng HTML khác vào đó.

## Điểm xuất phát

Để giải quyết thách thức này, chúng tôi kỳ vọng bạn tạo một dự án trang web cơ bản, hoặc trong một thư mục trên ổ cứng máy tính của bạn, hoặc sử dụng trình soạn thảo trực tuyến như [CodePen](https://codepen.io/) hoặc [JSFiddle](https://jsfiddle.net/). Phần lớn mã bạn cần đã được cung cấp trên trang này.

1. Tạo một thư mục mới ở vị trí phù hợp trên máy tính của bạn, đặt tên là `forms-challenge` (hoặc mở một trình soạn thảo trực tuyến và thực hiện các bước cần thiết để tạo dự án mới).
2. Lưu danh sách HTML sau vào một tệp trong thư mục của bạn có tên `index.html` (hoặc dán nó vào khung HTML của trình soạn thảo trực tuyến).

   ```html-nolint
   <!doctype html>
   <html lang="en">
     <head>
       <meta charset="utf-8" />
       <title>Forms challenge</title>
       <link href="style.css" rel="stylesheet" />
       <script defer src="index.js"></script>
     </head>
     <body>
       We want your feedback!

       We're very excited that you visited the little house in the woods,
       and we want to hear what you thought of it! Please fill in the below
       sections. You don't need to provide your name or contact details, but
       if you do, we'll enter you into a prize draw where you'll have a chance
       to win prizes.

       --

       Facilities

       Was the porridge
       Too hot?
       Too cold?
       Just right?

       Were the beds
       Too hard?
       Too soft?
       Just right?

       Describe the chairs (select all you agree with)
       Comfy
       Luxurious
       Hi tec
       Pretty
       Majestic

       --

       About your hosts

       Who's your favorite bear?
       Papa bear
       Mama bear
       Junior
       Dozer

       Which greeting did you prefer?
       Wave
       Friendly greeting
       Growl
       Claw marks in the door

       --

       Any other feedback?

       Give us your comments

       --

       Your details

       Name
       Email
       Phone

       --

       Submit

       --
     </body>
   </html>
   ```

3. Lưu danh sách CSS sau vào một tệp trong thư mục của bạn có tên `style.css` (hoặc dán nó vào khung CSS của trình soạn thảo trực tuyến).

   ```css
   /* Basic font styles */

   body {
     background-color: white;
     color: #333333;
     font: 1em / 1.4 system-ui;
     padding: 1em;
     width: 800px;
     margin: 0 auto;
   }

   h1 {
     font-size: 2rem;
   }

   h2 {
     font-size: 1.6rem;
   }

   h1,
   h2 {
     margin: 0 0 20px;
     color: purple;
   }

   * {
     box-sizing: border-box;
   }

   p {
     color: gray;
     margin: 0.5em 0;
   }

   /* Form structure */

   fieldset {
     border: 0;
     padding: 0;
   }

   legend {
     padding-bottom: 10px;
     font-weight: bold;
   }

   fieldset,
   .separator {
     margin-bottom: 20px;
   }

   .form-section {
     margin-bottom: 20px;
     padding: 20px;
   }

   img {
     max-width: 100%;
     height: 50px;
     margin: 20px 0;
   }

   /* Individual form items */

   fieldset input {
     margin: 0 10px 0 0;
   }

   label {
     margin-right: 40px;
   }

   textarea {
     margin-top: 10px;
     padding: 5px;
     width: 100%;
     height: 200px;
   }

   .separator {
     display: flex;
   }

   .separator label {
     flex: 2;
   }

   .separator input,
   .separator select {
     flex: 3;
     padding: 5px;
   }

   button {
     padding: 10px 20px;
     border-radius: 10px;
     border: 1px solid grey;
     background-color: #dddddd;
     width: 50%;
     margin: 0 auto;
     display: block;
   }

   button:hover,
   button:focus {
     background-color: #eeeeee;
     cursor: pointer;
   }
   ```

## Tóm tắt dự án

Chúng tôi muốn bạn tưởng tượng rằng bạn vừa đến ở tại một khách sạn được gọi là ngôi nhà nhỏ trong rừng (ít nhất bạn đã nghĩ đó là một khách sạn). Chúng tôi muốn bạn giúp chúng tôi tạo một biểu mẫu phản hồi hư cấu cho khách sạn. Ngoài việc đánh dấu các tính năng cần thiết và cấu trúc biểu mẫu, còn có một số tính năng HTML bổ sung mà chúng tôi muốn bạn triển khai.

### Triển khai các điều khiển biểu mẫu

1. Trong phần "Facilities", chúng tôi muốn bạn chuyển hai tập hợp dòng đầu tiên thành các tập hợp nút radio cùng với nhãn mô tả từng nút và chú thích mô tả toàn bộ nhóm. Thêm thuộc tính để nút radio đầu tiên trong mỗi trường hợp được chọn theo mặc định.
2. Trong phần "Facilities", chuyển tập hợp dòng thứ ba thành tập hợp hộp kiểm, với nhãn mô tả từng hộp và chú thích mô tả toàn bộ nhóm.
3. Trong phần "About your hosts", chuyển cả hai tập hợp dòng thành menu thả xuống các tùy chọn, với nhãn mô tả từng menu.
4. Trong phần "Any other feedback?", thêm hộp nhập văn bản nhiều dòng và chuyển dòng hiện có thành nhãn mô tả của nó.
5. Trong phần "Your details", thêm loại nhập văn bản phù hợp để thu thập từng ba giá trị được liệt kê. Chuyển các dòng hiện có thành nhãn của chúng.
6. Chuyển "Submit" thành nút gửi cho biểu mẫu.

### Cấu trúc biểu mẫu

1. Bọc biểu mẫu trong phần tử bọc phù hợp để chỉ định toàn bộ nó là một biểu mẫu.
2. Thêm các phần tử cấu trúc lặp lại bên trong biểu mẫu, để bọc từng phần biểu mẫu. Cung cấp cho mỗi phần tử phần biểu mẫu một `class` là `form-section`. Để tiện hơn, mỗi phần biểu mẫu được bao quanh bởi hai tập hợp dấu gạch đôi (`--`). Bạn có thể xóa các dấu gạch đôi khi đã thêm các phần tử cấu trúc.
3. Bạn sẽ cần bao gồm các phần tử cấu trúc bổ sung xung quanh một số cặp điều khiển/nhãn để chúng nằm trên các dòng riêng biệt. Thêm chúng ngay bây giờ, cung cấp cho mỗi phần tử một `class` là `separator`.
4. Thêm phần tử ngắt dòng giữa hộp nhập văn bản nhiều dòng và nhãn của nó để làm cho hai phần nằm trên các dòng riêng biệt.

### Các tính năng HTML bổ sung

1. Có một số tiêu đề trong văn bản cần được đánh dấu bằng các phần tử phù hợp:
   1. Tiêu đề cấp cao nhất: "We want your feedback!".
   2. Tiêu đề cấp hai: "Facilities", "About your hosts", "Any other feedback?", và "Your details".
2. Đoạn văn mở đầu bên dưới tiêu đề cấp cao nhất cần được đánh dấu phù hợp.
3. Cũng trong đoạn văn mở đầu, chuyển văn bản "little house in the woods" và "prize draw" thành các liên kết. Chúng tôi chưa có các trang để liên kết, vì vậy hiện tại, chỉ cần đặt URL mục tiêu là `#` làm chỗ giữ chỗ.
4. Chúng tôi muốn bạn đặt một hình ảnh rộng, phẳng bên dưới đoạn văn mở đầu như một trang trí. Đường dẫn hình ảnh là `https://mdn.github.io/shared-assets/images/examples/learn/woodland-strip.jpg`, và chúng tôi muốn bạn đặt văn bản thay thế cho nó là giá trị trống, vì nó chỉ mang tính trang trí.
5. Tiếp theo điểm trước, như một mục tiêu mở rộng, hãy nghiên cứu cách tốt hơn để bao gồm hình ảnh trang trí trên trang, và thử thực hiện (điều này liên quan đến một công nghệ khác với HTML, mà chúng tôi chưa đề cập trong mô-đun này).

## Gợi ý và mẹo

- Sử dụng [trình xác thực HTML W3C](https://validator.w3.org/) để phát hiện các lỗi không mong muốn trong HTML của bạn — để bạn có thể sửa chúng.
- Nếu bạn bị kẹt và không thể hình dung phần tử nào nên đặt ở đâu, hãy vẽ một sơ đồ khối đơn giản của bố cục trang và ghi các phần tử bạn nghĩ nên bọc từng khối. Điều này cực kỳ hữu ích.

## Ví dụ

Ảnh chụp màn hình sau đây cho thấy một ví dụ về biểu mẫu trông như thế nào sau khi được đánh dấu. Nếu bạn bị kẹt về cách đạt được một số điều này, hãy xem giải pháp bên dưới ví dụ trực tiếp.

![Ví dụ hoàn chỉnh cho thách thức; biểu mẫu phản hồi hiển thị hai tập hợp nút radio, một tập hợp hộp kiểm, và hai menu chọn thả xuống](example-page.png)

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Forms challenge</title>
    <link href="style.css" rel="stylesheet" />
    <script defer src="index.js"></script>
  </head>
  <body>
    <h1>We want your feedback!</h1>

    <p>
      We're very excited that you visited the
      <a href="#">little house in the woods</a>, and we want to hear what you
      thought of it! Please fill in the below sections. You don't need to
      provide your name or contact details, but if you do, we'll enter you into
      a <a href="#">prize draw</a> where you'll have a chance to win prizes.
    </p>

    <img
      src="https://mdn.github.io/shared-assets/images/examples/learn/woodland-strip.jpg"
      alt="" />

    <form>
      <div class="form-section">
        <h2>Facilities</h2>

        <fieldset>
          <legend>Was the porridge</legend>
          <input
            type="radio"
            id="porridge-1"
            name="porridge"
            value="hot"
            checked /><label for="porridge-1">Too hot?</label>
          <input
            type="radio"
            id="porridge-2"
            name="porridge"
            value="cold" /><label for="porridge-2">Too cold?</label>
          <input
            type="radio"
            id="porridge-3"
            name="porridge"
            value="right" /><label for="porridge-3">Just right?</label>
        </fieldset>

        <fieldset>
          <legend>Were the beds</legend>
          <input
            type="radio"
            id="beds-1"
            name="beds"
            value="hard"
            checked /><label for="beds-1">Too hard?</label>
          <input type="radio" id="beds-2" name="beds" value="soft" /><label
            for="beds-2"
            >Too soft?</label
          >
          <input type="radio" id="beds-3" name="beds" value="right" /><label
            for="beds-3"
            >Just right?</label
          >
        </fieldset>

        <fieldset>
          <legend>Describe the chairs (select all you agree with)</legend>
          <input type="checkbox" id="comfy" name="comfy" /><label for="comfy"
            >Comfy</label
          >
          <input type="checkbox" id="luxurious" name="luxurious" /><label
            for="luxurious"
            >Luxurious</label
          >
          <input type="checkbox" id="hi-tech" name="hi-tech" /><label
            for="hi-tech"
            >Hi-tech</label
          >
          <input type="checkbox" id="pretty" name="pretty" /><label for="pretty"
            >Pretty</label
          >
          <input type="checkbox" id="majestic" name="majestic" /><label
            for="majestic"
            >Majestic</label
          >
        </fieldset>
      </div>

      <div class="form-section">
        <h2>About your hosts</h2>

        <div class="separator">
          <label for="favorite">Who's your favorite bear?</label>
          <select name="favorite" id="favorite">
            <option value="papa">Papa bear</option>
            <option value="mama">Mama bear</option>
            <option value="junior">Junior</option>
            <option value="randy">Cousin Randy</option>
          </select>
        </div>

        <div class="separator">
          <label for="greeting">Which greeting did you prefer?</label>
          <select name="greeting" id="greeting">
            <option value="papa">Wave</option>
            <option value="mama">Friendly greeting</option>
            <option value="junior">Growl</option>
            <option value="randy">Claw marks in the door</option>
          </select>
        </div>
      </div>

      <div class="form-section">
        <h2>Any other feedback?</h2>

        <label for="comments">Give us your comments</label>
        <br />
        <textarea id="comments" name="comments"></textarea>
      </div>

      <div class="form-section">
        <h2>Your details</h2>

        <div class="separator">
          <label for="name">Name</label>
          <input type="text" id="name" name="name" />
        </div>

        <div class="separator">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" />
        </div>

        <div class="separator">
          <label for="phone">Phone</label>
          <input type="tel" id="phone" name="phone" />
        </div>
      </div>

      <div class="form-section">
        <button>Submit</button>
      </div>
    </form>
  </body>
</html>
```

Đối với mục tiêu mở rộng, có thể nói rằng cách tốt hơn để thêm hình ảnh trang trí vào trang web là sử dụng [hình ảnh nền CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders#background_images). Xóa phần tử `<img>` và sử dụng thuộc tính CSS {{cssxref("background")}} để đặt hình ảnh trên trang thay thế. Một phần tử tốt để đặt hình ảnh nền là phần tử `<form>`, và bạn cần yêu cầu trình duyệt không lặp lại hình ảnh. Bạn cũng cần cung cấp một số {{cssxref("margin")}} và {{cssxref("padding")}} để giãn cách hình ảnh nền sao cho nó không đè lên văn bản.

```css
form {
  background: url("https://mdn.github.io/shared-assets/images/examples/learn/woodland-strip.jpg")
    no-repeat;
  margin-top: 20px;
  padding-top: 50px;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Test_your_skills/Forms_and_buttons", "Learn_web_development/Core/Structuring_content/Debugging_HTML", "Learn_web_development/Core/Structuring_content")}}
