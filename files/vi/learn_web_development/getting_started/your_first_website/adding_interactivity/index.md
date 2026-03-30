---
title: "JavaScript: Thêm tính tương tác"
short-title: Thêm tính tương tác
slug: Learn_web_development/Getting_started/Your_first_website/Adding_interactivity
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Getting_started/Your_first_website/Styling_the_content", "Learn_web_development/Getting_started/Your_first_website/Publishing_your_website", "Learn_web_development/Getting_started/Your_first_website")}}

JavaScript là ngôn ngữ lập trình thêm tính tương tác vào trang web. Bạn có thể dùng nó để kiểm soát hầu hết mọi thứ — xác thực dữ liệu biểu mẫu, chức năng nút, logic trò chơi, kiểu dáng động, cập nhật hoạt ảnh, và nhiều hơn nữa. Bài viết này giúp bạn bắt đầu với JavaScript và hướng dẫn bạn thêm một số tính năng thú vị vào trang web đầu tiên của bạn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với hệ điều hành máy tính của bạn, phần mềm cơ bản bạn sẽ dùng để xây dựng trang web và hệ thống tệp.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Mục đích và chức năng của JavaScript.</li>
          <li>Hiểu biết cơ bản về các nguyên tắc cơ bản của ngôn ngữ JavaScript như biến, toán tử, câu điều kiện, hàm và sự kiện.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## JavaScript là gì?

{{Glossary("JavaScript")}} là một ngôn ngữ lập trình đầy đủ — nó chứa tất cả các tính năng lập trình cổ điển mà bạn có thể đã thấy trong các ngôn ngữ lập trình khác (hoặc ít nhất là nghe nói đến), chẳng hạn như **biến** (variable), **vòng lặp** (loop) và **hàm** (function).

JavaScript, khi được dùng trên các trang web (mặc dù nó cũng có thể được dùng ở những nơi khác), thường hoạt động bằng cách:

- Lấy tham chiếu đến một hoặc nhiều giá trị như số hoặc các phần tử trên trang.
- Làm gì đó với những giá trị đó, chẳng hạn như cộng các số lại với nhau.
- Trả về kết quả có thể được dùng để làm gì đó khác sau này. Ví dụ: bạn có thể muốn hiển thị tổng của các số đó trên trang.

Hãy xem một ví dụ. Chúng ta sẽ dùng cùng danh sách cơ bản đã thấy trong vài bài viết trước:

```html live-sample___basic-js
<p>Instructions for life:</p>

<ul>
  <li>Eat</li>
  <li>Sleep</li>
  <li>Repeat</li>
</ul>
```

Chúng ta cũng sẽ định nghĩa một lớp CSS gọi là `.done` sẽ tạo kiểu cho bất kỳ phần tử nào được áp dụng nó, làm cho nó trông như một nhiệm vụ đã hoàn thành với màu văn bản xanh lá và gạch ngang. Chúng ta sẽ áp dụng nó cho các phần tử `<li>` bằng JavaScript ở bước tiếp theo.

```css live-sample___basic-js
.done {
  color: darkseagreen;
  text-decoration: line-through solid black 2px;
}
```

Bây giờ đến JavaScript. Ở đây, trước tiên chúng ta lưu trữ tham chiếu đến các phần tử `<li>` bên trong một biến gọi là `listItems`. Sau đó chúng ta định nghĩa một hàm gọi là `toggleDone()` thêm lớp `done` vào một mục danh sách nếu nó chưa có, và xóa lớp nếu nó đã có. Cuối cùng, chúng ta lặp qua các mục danh sách (sử dụng `forEach()`) và thêm trình lắng nghe sự kiện (event listener) (sử dụng `addEventListener()`) cho mỗi mục danh sách để khi được nhấp, lớp `done` được chuyển đổi, áp dụng CSS chúng ta đã định nghĩa trước đó.

```js live-sample___basic-js
const listItems = document.querySelectorAll("li");

function toggleDone(e) {
  if (!e.target.className) {
    e.target.className = "done";
  } else {
    e.target.className = "";
  }
}

listItems.forEach((item) => {
  item.addEventListener("click", toggleDone);
});
```

Đừng lo lắng nếu bạn chưa hiểu đoạn JavaScript trên. Làm quen với JavaScript khó hơn làm quen với HTML và CSS, nhưng mọi thứ sẽ trở nên rõ ràng hơn sau này trong khóa học.

Ví dụ này sẽ hiển thị như sau trong trình duyệt web:

{{EmbedLiveSample("basic-js", "100%", "140px")}}

Hãy thử nhấp vào các mục danh sách vài lần và lưu ý cách các kiểu "done" được bật và tắt kết quả. Không tệ chút nào với 11 dòng JavaScript.

## Hướng dẫn "Hello world!"

Để bắt đầu viết JavaScript, chúng ta sẽ hướng dẫn bạn thêm một ví dụ _Hello world!_ vào trang web mẫu của bạn. ([_Hello world!_](https://en.wikipedia.org/wiki/%22Hello,_World!%22_program) là ví dụ lập trình nhập môn tiêu chuẩn.)

> [!WARNING]
> Nếu bạn chưa theo dõi phần còn lại của khóa học, hãy [tải xuống mã ví dụ này](https://codeload.github.com/mdn/beginner-html-site-styled/zip/refs/heads/main) và dùng nó làm điểm bắt đầu.

1. Bên trong thư mục `first-website` hoặc thư mục ví dụ bạn vừa tải xuống, tạo một thư mục mới tên là `scripts`.
2. Trong thư mục `scripts`, tạo một tài liệu văn bản mới gọi là `main.js` và lưu nó.
3. Đến tệp `index.html` và nhập đoạn mã này trên một dòng mới, ngay trước thẻ đóng `</head>`:

   ```html
   <script async src="scripts/main.js"></script>
   ```

   Thao tác này thực hiện cùng công việc như phần tử {{htmlelement("link")}} cho CSS — nó áp dụng JavaScript vào trang để nó có thể ảnh hưởng đến HTML (cùng với CSS và mọi thứ khác trên trang).

4. Thêm đoạn mã này vào tệp `scripts/main.js`:

   ```js
   // Store a reference to the <h1> in a variable
   const myHeading = document.querySelector("h1");
   // Update the text content of the <h1>
   myHeading.textContent = "Hello world!";
   ```

5. Đảm bảo các tệp HTML và JavaScript đã được lưu, sau đó tải `index.html` trong trình duyệt. Bạn sẽ thấy gì đó như thế này:

![Tiêu đề "hello world" phía trên logo firefox](hello-world.png)

Hãy phân tích cách ví dụ này hoạt động.

Chúng ta đã dùng JavaScript để thay đổi văn bản tiêu đề thành `Hello world!`. Chúng ta đã lấy tham chiếu đến tiêu đề và lưu nó trong một biến gọi là `myHeading` (một vùng chứa lưu trữ một giá trị). Điều này tương tự như cách bạn áp dụng CSS cho các phần tử — bạn đầu tiên chọn các phần tử bạn muốn ảnh hưởng bằng bộ chọn CSS, sau đó định nghĩa các kiểu bạn muốn cho những phần tử đó. Trong cả hai trường hợp, khi bạn muốn làm gì đó với một phần tử, bạn cần chọn nó trước.

Sau đó, chúng ta đặt giá trị của thuộc tính `textContent` của biến `myHeading` (đại diện cho nội dung văn bản của phần tử `<h1>`) thành _Hello world!_.

Các dòng bắt đầu bằng `//` là chú thích JavaScript (JavaScript comment). Giống như chú thích HTML và CSS, trình duyệt bỏ qua chúng, cung cấp cách để bạn thêm ghi chú về mã của mình để giải thích cách nó hoạt động.

Hãy tiếp tục và thêm một số tính năng mới vào trang web ví dụ của chúng ta.

> [!WARNING]
> Trước khi tiếp tục, hãy xóa đoạn mã "Hello world!" khỏi tệp `main.js` của bạn. Nếu không, mã hiện có sẽ xung đột với mã mới bạn sắp thêm.

## Thêm bộ thay đổi hình ảnh

Trong phần này, bạn sẽ dùng JavaScript và các tính năng [DOM API](/en-US/docs/Web/API/HTML_DOM_API) để thay đổi hiển thị giữa hai hình ảnh. Sự thay đổi này sẽ xảy ra khi người dùng nhấp vào hình ảnh đang hiển thị.

1. Chọn thêm một hình ảnh khác để hiển thị trên trang web ví dụ của bạn. Lý tưởng nhất là hình ảnh nên có cùng kích thước với hình ảnh bạn đã thêm trước đó, hoặc gần bằng nhất có thể.
2. Lưu hình ảnh này vào thư mục `images` của bạn.
3. Thêm đoạn mã JavaScript sau vào tệp `main.js`, đảm bảo thay thế `firefox2.png` và cả hai trường hợp của `firefox-icon.png` bằng tên hình ảnh thứ hai và thứ nhất của bạn, tương ứng.

   ```js
   const myImage = document.querySelector("img");

   myImage.addEventListener("click", () => {
     const mySrc = myImage.getAttribute("src");
     if (mySrc === "images/firefox-icon.png") {
       myImage.setAttribute("src", "images/firefox2.png");
     } else {
       myImage.setAttribute("src", "images/firefox-icon.png");
     }
   });
   ```

4. Lưu tất cả các tệp và tải `index.html` trong trình duyệt. Bây giờ khi bạn nhấp vào hình ảnh, nó sẽ thay đổi sang hình ảnh kia.

Trong đoạn mã này, bạn đã lưu tham chiếu đến phần tử {{htmlelement("img")}} của mình trong biến `myImage`. Sau đó bạn đã gán cho nó một hàm xử lý sự kiện (event handler function) `click`. Mỗi khi `<img>` được nhấp, hàm sẽ thực hiện như sau:

- Lấy giá trị thuộc tính `src` của hình ảnh.
- Dùng một câu điều kiện (conditional) (cấu trúc `if...else`) để kiểm tra xem giá trị `src` có bằng đường dẫn của hình ảnh gốc không:
  - Nếu có, mã thay đổi giá trị `src` thành đường dẫn của hình ảnh thứ hai, buộc hình ảnh kia được tải vào phần tử `<img>`.
  - Nếu không (có nghĩa là hình ảnh đã được thay đổi), giá trị `src` đổi lại thành đường dẫn hình ảnh gốc.

> [!NOTE]
> Phần này giới thiệu một số thuật ngữ quan trọng. Các khái niệm chính bao gồm:
>
> - [API](/en-US/docs/Glossary/API): Một tập hợp các tính năng cho phép nhà phát triển tương tác với môi trường lập trình. Web API (như các tính năng DOM API chúng ta đã dùng ở trên) được xây dựng trên ngôn ngữ JavaScript và cho phép bạn thao tác với các phần khác nhau của trình duyệt và các trang web mà nó hiển thị.
> - [Sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Events) (Events): Những thứ xảy ra trong trình duyệt. Chúng là chìa khóa để làm cho trang web có tính tương tác. Bạn có thể chạy mã để phản hồi sự kiện bằng cách dùng **hàm xử lý sự kiện** (event handler function) — đây là các khối mã chạy khi một sự kiện xảy ra. Ví dụ phổ biến nhất là [sự kiện click](/en-US/docs/Web/API/Element/click_event), được kích hoạt bởi trình duyệt khi người dùng nhấp vào một thứ gì đó.
> - [Hàm](/en-US/docs/Learn_web_development/Core/Scripting/Functions) (Functions): Cách đóng gói mã mà bạn muốn tái sử dụng. Bạn có thể định nghĩa mã của mình bên trong một hàm một lần rồi chạy nó bao nhiêu lần tùy thích, giúp bạn tránh viết đi viết lại cùng một mã. Trong ví dụ của chúng ta ở đây, chúng ta đã định nghĩa một hàm xử lý sự kiện `click`, chạy mỗi khi người dùng nhấp vào hình ảnh.
> - [Câu điều kiện](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals) (Conditionals): Cấu trúc mã dùng để kiểm tra xem một biểu thức trả về `true` hay `false` và chạy mã khác nhau để phản hồi từng kết quả. Dạng rất phổ biến của câu điều kiện là câu lệnh `if...else`.

## Thêm thông điệp chào mừng cá nhân hóa

Tiếp theo, hãy thay đổi tiêu đề trang để hiển thị thông điệp chào mừng cá nhân hóa khi người dùng truy cập trang lần đầu tiên. Thông điệp chào mừng này sẽ được lưu trong trình duyệt bằng [Web Storage API](/en-US/docs/Web/API/Web_Storage_API), vì vậy nếu người dùng rời trang và quay lại sau, dữ liệu cá nhân hóa của họ vẫn ở đó. Chúng ta cũng sẽ thêm cách để người dùng thay đổi thông điệp.

1. Trong `index.html`, thêm dòng sau ngay trước thẻ đóng `</body>`:

   ```html
   <button>Change user</button>
   ```

2. Trong `main.js`, đặt đoạn mã sau ở cuối tệp, đúng như đã viết. Điều này tạo tham chiếu đến nút mới và tiêu đề, lưu mỗi cái vào các biến:

   ```js
   let myButton = document.querySelector("button");
   let myHeading = document.querySelector("h1");
   ```

3. Thêm hàm sau để đặt lời chào cá nhân hóa. Hàm này chưa làm gì cả; chúng ta sẽ gọi nó sau.

   ```js
   function setUserName() {
     const myName = prompt("Please enter your name.");
     localStorage.setItem("name", myName);
     myHeading.textContent = `Mozilla is cool, ${myName}`;
   }
   ```

   Hàm `setUserName()` chứa hàm [`prompt()`](/en-US/docs/Web/API/Window/prompt), yêu cầu người dùng nhập dữ liệu và lưu nó trong một biến sau khi họ nhấp vào _OK_. Trong ví dụ này, chúng ta yêu cầu người dùng nhập tên và lưu nó trong `myName`.<br /><br />

   Tiếp theo, mã dùng [Web Storage API](/en-US/docs/Web/API/Web_Storage_API), cho phép chúng ta lưu trữ dữ liệu trong trình duyệt và lấy lại sau. Chúng ta dùng hàm {{domxref("Storage.setItem", "localStorage.setItem()")}} để tạo và lưu trữ một mục dữ liệu có tên `"name"`, đặt giá trị của nó thành biến `myName`, chứa tên người dùng đã nhập.<br /><br />

   Cuối cùng, chúng ta đặt `textContent` của tiêu đề thành một chuỗi bao gồm tên đã lưu của người dùng.

4. Thêm khối điều kiện sau sau khai báo hàm. Đây là _mã khởi tạo_ — nó chạy khi trang tải lần đầu để khởi động chương trình:

   ```js
   if (!localStorage.getItem("name")) {
     setUserName();
   } else {
     const storedName = localStorage.getItem("name");
     myHeading.textContent = `Mozilla is cool, ${storedName}`;
   }
   ```

   Dòng đầu tiên của khối này dùng toán tử phủ định (logical NOT, được biểu diễn bằng ký tự `!`) để kiểm tra xem mục dữ liệu `name` có _chưa_ được lưu trong `localStorage` không. Nếu không, hàm `setUserName()` chạy để tạo nó. Nếu nó tồn tại (nghĩa là người dùng đã đặt tên người dùng trong lần truy cập trước), chúng ta lấy tên đã lưu bằng {{domxref("Storage.getItem", "localStorage.getItem()")}} và đặt `textContent` của tiêu đề thành một chuỗi, cộng tên người dùng — giống như những gì chúng ta đã làm bên trong `setUserName()`.

5. Thêm hàm xử lý sự kiện `click` vào nút. Khi được nhấp, `setUserName()` chạy. Điều này cho phép người dùng nhập tên khác nếu họ muốn.

   ```js
   myButton.addEventListener("click", () => {
     setUserName();
   });
   ```

6. Lưu tất cả các tệp và tải `index.html` trong trình duyệt. Bạn sẽ ngay lập tức được yêu cầu nhập tên. Sau khi thực hiện, nó sẽ xuất hiện bên trong `<h1>` như một phần của lời chào cá nhân hóa. Lưu ý rằng cá nhân hóa vẫn tồn tại ngay cả sau khi bạn tải lại trang. Bạn có thể nhấp nút "Change user" để nhập tên mới.

> [!NOTE]
> Thuật ngữ [toán tử](/en-US/docs/Learn_web_development/Core/Scripting/Math) (operator) đề cập đến một ký tự ngôn ngữ JavaScript thực hiện một phép toán trên một hoặc nhiều giá trị. Ví dụ bao gồm `+` (cộng các giá trị), `-` (trừ một giá trị từ giá trị khác) và `!` (phủ định một giá trị — như bạn đã thấy trước đó).

## Tên người dùng là null?

Khi bạn chạy ví dụ và nhận được hộp thoại nhắc bạn nhập tên, hãy thử nhấn nút _Cancel_. Bạn sẽ có tiêu đề đọc là _Mozilla is cool, null_. Điều này xảy ra vì giá trị được đặt thành [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) khi bạn hủy lời nhắc. Trong JavaScript, _null_ là một giá trị đặc biệt đại diện cho sự vắng mặt của một giá trị.

Ngoài ra, hãy thử nhấn _OK_ mà không nhập tên. Bạn sẽ có tiêu đề đọc là _Mozilla is cool,_ vì bạn đã đặt `myName` thành một chuỗi rỗng.

Để tránh những vấn đề này, bạn có thể thêm một câu điều kiện khác để kiểm tra rằng người dùng chưa nhập tên trống. Cập nhật hàm `setUserName()` của bạn thành như sau:

```js
function setUserName() {
  const myName = prompt("Please enter your name.");
  if (!myName) {
    setUserName();
  } else {
    localStorage.setItem("name", myName);
    myHeading.textContent = `Mozilla is cool, ${myName}`;
  }
}
```

Bằng ngôn ngữ của con người, điều này có nghĩa là: Nếu `myName` không có giá trị, hãy chạy lại `setUserName()` từ đầu. Nếu nó có giá trị (nếu câu lệnh trên không đúng), thì lưu giá trị vào `localStorage` và đặt nó làm văn bản của tiêu đề.

## Kết luận

Nếu bạn đã làm theo tất cả các hướng dẫn trong bài viết này, bạn sẽ có một trang trông giống như hình ảnh bên dưới. Bạn cũng có thể [xem phiên bản của chúng tôi](https://mdn.github.io/beginner-html-site-scripted/).

![Giao diện cuối cùng của trang HTML sau khi tạo các phần tử: một tiêu đề, logo lớn ở giữa, nội dung và một nút](website-screen-scripted.png)

Nếu bị mắc kẹt, bạn có thể so sánh công việc của mình với [mã ví dụ đã hoàn thành trên GitHub](https://github.com/mdn/beginner-html-site-scripted/blob/main/scripts/main.js).

Chúng ta mới chỉ tìm hiểu sơ lược về JavaScript trong bài viết này. Bạn sẽ học được nhiều hơn trong mô-đun Core [Lập trình động với JavaScript](/en-US/docs/Learn_web_development/Core/Scripting) sau này trong khóa học.

## Xem thêm

- [Scrimba: Learn JavaScript](https://scrimba.com/learn-javascript-c0v?via=mdn) <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>
  - : Khóa học _Learn JavaScript_ của [Scrimba](https://scrimba.com?via=mdn) dạy bạn JavaScript thông qua việc giải 140+ thử thách lập trình tương tác, xây dựng các dự án bao gồm trò chơi, tiện ích trình duyệt, và thậm chí cả ứng dụng di động. Scrimba có các bài học tương tác thú vị được giảng dạy bởi các giáo viên am hiểu.
- [Learn JavaScript](https://learnjavascript.online/)
  - : Đây là tài nguyên tuyệt vời cho các nhà phát triển web đang học! Học JavaScript trong môi trường tương tác, với các bài học ngắn và bài kiểm tra tương tác, được hướng dẫn bởi đánh giá tự động. 40 bài học đầu tiên miễn phí. Khóa học đầy đủ có sẵn với một khoản thanh toán một lần nhỏ.

{{PreviousMenuNext("Learn_web_development/Getting_started/Your_first_website/Styling_the_content", "Learn_web_development/Getting_started/Your_first_website/Publishing_your_website", "Learn_web_development/Getting_started/Your_first_website")}}
