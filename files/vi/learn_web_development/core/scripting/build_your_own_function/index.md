---
title: Xây dựng hàm của riêng bạn
slug: Learn_web_development/Core/Scripting/Build_your_own_function
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Functions","Learn_web_development/Core/Scripting/Return_values", "Learn_web_development/Core/Scripting")}}

Với hầu hết lý thuyết thiết yếu đã được đề cập trong bài trước, bài viết này cung cấp kinh nghiệm thực hành. Ở đây bạn sẽ được thực hành xây dựng hàm tùy chỉnh của riêng mình. Trong quá trình đó, chúng ta cũng sẽ giải thích một số chi tiết hữu ích về việc xử lý hàm.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">nền tảng CSS</a>, quen thuộc với kiến thức cơ bản về hàm JavaScript như đã học trong bài trước.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Kinh nghiệm xây dựng hàm tùy chỉnh của riêng bạn.</li>
          <li>Thêm tham số vào hàm của bạn.</li>
          <li>Gọi hàm của bạn.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Hãy xây dựng một hàm

Hàm tùy chỉnh mà chúng ta sẽ xây dựng sẽ được gọi là `displayMessage()`. Nó sẽ hiển thị một hộp thông báo tùy chỉnh trên trang web và sẽ hoạt động như một thay thế tùy chỉnh cho hàm [`alert()`](/en-US/docs/Web/API/Window/alert) tích hợp của trình duyệt. Chúng ta đã thấy điều này trước đây, nhưng hãy làm mới bộ nhớ. Gõ thứ sau vào bảng điều khiển JavaScript của trình duyệt, trên bất kỳ trang nào bạn muốn:

```js
alert("This is a message");
```

Hàm `alert()` nhận một đối số duy nhất — chuỗi được hiển thị trong hộp cảnh báo. Thử thay đổi chuỗi để thay đổi thông báo.

Hàm `alert()` bị hạn chế: bạn có thể thay đổi thông báo, nhưng bạn không thể dễ dàng thay đổi bất cứ điều gì khác, chẳng hạn như màu sắc, biểu tượng, hoặc bất cứ điều gì khác. Chúng ta sẽ xây dựng một cái sẽ thú vị hơn.

> [!NOTE]
> Ví dụ này sẽ hoạt động tốt trong tất cả các trình duyệt hiện đại, nhưng kiểu dáng có thể trông hơi lạ trong các trình duyệt cũ hơn một chút. Chúng ta khuyến nghị bạn thực hiện bài tập này trong một trình duyệt hiện đại như Firefox, Opera, hoặc Chrome.

## Hàm cơ bản

Để bắt đầu, hãy kết hợp một hàm cơ bản.

> [!NOTE]
> Đối với quy ước đặt tên hàm, bạn nên tuân theo các quy tắc tương tự như [quy ước đặt tên biến](/en-US/docs/Learn_web_development/Core/Scripting/Variables#an_aside_on_variable_naming_rules). Điều này ổn thôi, vì bạn có thể phân biệt chúng — tên hàm xuất hiện với dấu ngoặc đơn sau chúng, và các biến thì không.

1. Bắt đầu bằng cách truy cập tệp [function-start.html](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/functions/function-start.html) và tạo một bản sao local. Bạn sẽ thấy rằng HTML đơn giản — phần thân chỉ chứa một nút duy nhất. Chúng ta cũng đã cung cấp một số CSS cơ bản để tạo kiểu cho hộp thông báo tùy chỉnh, và một phần tử {{htmlelement("script")}} trống để đặt JavaScript của chúng ta vào.
2. Tiếp theo, thêm những thứ sau vào bên trong phần tử `<script>`:

   ```js
   function displayMessage() {
     // …
   }
   ```

   Chúng ta bắt đầu với từ khóa `function`, có nghĩa là chúng ta đang định nghĩa một hàm. Điều này được theo sau bởi tên chúng ta muốn đặt cho hàm, một cặp dấu ngoặc đơn, và một cặp dấu ngoặc nhọn. Bất kỳ tham số nào chúng ta muốn đặt cho hàm đều vào bên trong dấu ngoặc đơn, và mã chạy khi chúng ta gọi hàm vào bên trong dấu ngoặc nhọn.

3. Cuối cùng, thêm mã sau vào bên trong dấu ngoặc nhọn:

   ```js
   const body = document.body;

   const panel = document.createElement("div");
   panel.setAttribute("class", "msgBox");
   body.appendChild(panel);

   const msg = document.createElement("p");
   msg.textContent = "This is a message box";
   panel.appendChild(msg);

   const closeBtn = document.createElement("button");
   closeBtn.textContent = "x";
   panel.appendChild(closeBtn);

   closeBtn.addEventListener("click", () => body.removeChild(panel));
   ```

Đây là khá nhiều mã để xem qua, vì vậy chúng ta sẽ hướng dẫn bạn từng phần.

Dòng đầu tiên chọn phần tử {{htmlelement("body")}} bằng cách sử dụng [DOM API](/en-US/docs/Web/API/Document_Object_Model) để lấy thuộc tính [`body`](/en-US/docs/Web/API/Document/body) của đối tượng [`document`](/en-US/docs/Web/API/Document/body) toàn cục, và gán nó cho hằng số `body`, để chúng ta có thể làm những thứ với nó sau này:

```js
const body = document.body;
```

Phần tiếp theo sử dụng hàm DOM API gọi là {{domxref("document.createElement()")}} để tạo phần tử {{htmlelement("div")}} và lưu trữ tham chiếu đến nó trong hằng số `panel`. Phần tử này sẽ là container bên ngoài của hộp thông báo.

Sau đó chúng ta sử dụng một hàm DOM API khác gọi là {{domxref("Element.setAttribute()")}} để đặt thuộc tính `class` trên panel của chúng ta với giá trị `msgBox`. Điều này để dễ dàng tạo kiểu cho phần tử — nếu bạn nhìn vào CSS trên trang, bạn sẽ thấy rằng chúng ta đang sử dụng bộ chọn lớp `.msgBox` để tạo kiểu cho hộp thông báo và nội dung của nó.

Cuối cùng, chúng ta gọi hàm DOM gọi là {{domxref("Node.appendChild()")}} trên hằng số `body` mà chúng ta đã lưu trước đó, lồng một phần tử bên trong phần tử khác như là con của nó. Chúng ta chỉ định panel `<div>` là con mà chúng ta muốn thêm vào bên trong phần tử `<body>`. Chúng ta cần làm điều này vì phần tử chúng ta tạo ra sẽ không chỉ xuất hiện trên trang của riêng nó — chúng ta cần chỉ định vị trí đặt nó.

```js
const panel = document.createElement("div");
panel.setAttribute("class", "msgBox");
body.appendChild(panel);
```

Hai phần tiếp theo sử dụng cùng các hàm `createElement()` và `appendChild()` mà chúng ta đã thấy để tạo hai phần tử mới — một {{htmlelement("p")}} và một {{htmlelement("button")}} — và chèn chúng vào trang như các con của panel `<div>`. Chúng ta sử dụng thuộc tính {{domxref("Node.textContent")}} của chúng — đại diện cho nội dung văn bản của phần tử — để chèn thông báo bên trong đoạn văn, và một "x" bên trong nút. Nút này sẽ là thứ cần được nhấp/kích hoạt khi người dùng muốn đóng hộp thông báo.

```js
const msg = document.createElement("p");
msg.textContent = "This is a message box";
panel.appendChild(msg);

const closeBtn = document.createElement("button");
closeBtn.textContent = "x";
panel.appendChild(closeBtn);
```

Cuối cùng, chúng ta gọi {{domxref("EventTarget/addEventListener", "addEventListener()")}} để thêm một hàm sẽ được gọi khi người dùng nhấp vào nút "đóng". Mã sẽ xóa toàn bộ panel khỏi trang — để đóng hộp thông báo.

Tóm tắt, phương thức `addEventListener()` có thể được gọi trên bất kỳ phần tử nào trên trang, và thường được truyền hai đối số: tên của một sự kiện và một hàm chạy khi sự kiện xảy ra. Trong trường hợp này, tên sự kiện là `click`, có nghĩa là khi người dùng nhấp vào nút, hàm sẽ chạy. Bạn sẽ tìm hiểu nhiều hơn về sự kiện trong [bài viết về sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Events). Dòng bên trong hàm sử dụng phương thức {{domxref("Node.removeChild()", "removeChild()")}} để chỉ định rằng chúng ta muốn xóa một phần tử con cụ thể của phần tử `<body>`: trong trường hợp này là panel `<div>`.

```js
closeBtn.addEventListener("click", () => body.removeChild(panel));
```

Về cơ bản, toàn bộ khối mã này đang tạo ra một khối HTML trông như thế này và chèn nó vào trang:

```html
<div class="msgBox">
  <p>This is a message box</p>
  <button>x</button>
</div>
```

Đó là rất nhiều mã để xem qua — đừng lo lắng quá nhiều nếu bạn không nhớ chính xác mỗi phần hoạt động như thế nào ngay bây giờ! Phần chính chúng ta muốn tập trung vào ở đây là cấu trúc và cách sử dụng hàm, nhưng chúng ta muốn hiển thị điều gì đó thú vị cho ví dụ này.

## Gọi hàm

Bây giờ bạn đã có định nghĩa hàm được viết vào phần tử `<script>` của mình, nhưng nó sẽ không làm gì cả như hiện tại.

1. Hãy thử bao gồm dòng sau bên dưới hàm để gọi nó:

   ```js
   displayMessage();
   ```

   Dòng này gọi hàm, làm cho nó chạy ngay lập tức. Khi bạn lưu mã và tải lại nó trong trình duyệt, bạn sẽ thấy hộp thông báo nhỏ xuất hiện ngay lập tức, chỉ một lần. Xét cho cùng, chúng ta chỉ gọi nó một lần.

2. Bây giờ mở công cụ nhà phát triển trình duyệt của bạn trên trang ví dụ, đi đến bảng điều khiển JavaScript và gõ lại dòng đó ở đó, bạn sẽ thấy nó xuất hiện lại! Thật thú vị — bây giờ chúng ta có một hàm có thể tái sử dụng mà chúng ta có thể gọi bất cứ lúc nào chúng ta muốn.

Tuy nhiên, chúng ta có thể muốn hộp thông báo xuất hiện để phản hồi với các hành động của người dùng và hệ thống. Trong một ứng dụng thực tế, hộp thông báo như vậy có thể được gọi để phản hồi với dữ liệu mới có sẵn, hoặc một lỗi đã xảy ra, hoặc người dùng cố gắng xóa hồ sơ của họ ("bạn có chắc về điều này không?"), hoặc người dùng thêm một liên hệ mới và thao tác hoàn thành thành công, v.v.

Trong bản demo này, chúng ta sẽ làm cho hộp thông báo xuất hiện khi người dùng nhấp vào nút.
Đây là các bước bạn nên thực hiện để làm điều này hoạt động:

1. Xóa dòng trước bạn đã thêm (`displayMessage();`).
2. Chọn phần tử `<button>` và lưu trữ tham chiếu đến nó trong một hằng số. Thêm dòng sau vào mã của bạn, phía trên định nghĩa hàm:

   ```js
   const btn = document.querySelector("button");
   ```

3. Tạo một trình nghe sự kiện cho các lần nhấp nút gọi hàm của chúng ta. Thêm dòng sau sau dòng `const btn =`:

   ```js
   btn.addEventListener("click", displayMessage);
   ```

   Tương tự như trình xử lý sự kiện nhấp của `closeBtn`, ở đây chúng ta đang gọi một số mã để phản hồi với một nút được nhấp. Nhưng trong trường hợp này, thay vì gọi một hàm vô danh chứa một số mã, chúng ta đang gọi hàm `displayMessage()` theo tên.

4. Cuối cùng, hãy thử lưu và làm mới trang — bây giờ bạn sẽ thấy hộp thông báo xuất hiện khi bạn nhấp vào nút.

Bạn có thể tự hỏi tại sao chúng ta không đưa dấu ngoặc đơn vào sau tên hàm. Điều này là vì chúng ta không muốn gọi hàm ngay lập tức — chỉ sau khi nút đã được nhấp. Nếu bạn thử thay đổi dòng thành

```js example-bad
btn.addEventListener("click", displayMessage());
```

và lưu và tải lại, bạn sẽ thấy hộp thông báo xuất hiện mà không cần nhấp vào nút! Dấu ngoặc đơn trong ngữ cảnh này đôi khi được gọi là "toán tử gọi hàm". Bạn chỉ sử dụng chúng khi bạn muốn chạy hàm ngay lập tức trong phạm vi hiện tại. Tương tự, mã bên trong hàm vô danh không chạy ngay lập tức, vì nó nằm bên trong phạm vi hàm.

Nếu bạn đã thử thí nghiệm cuối, hãy đảm bảo hoàn tác thay đổi cuối trước khi tiếp tục.

> [!NOTE]
> Để thực hành thêm với hàm, hãy thử thách Scrimba<sup>[_Đối tác học MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> [Write your first function](https://scrimba.com/fullstack-path-c0fullstack/~04h?via=mdn).

## Cải thiện hàm với tham số

Như hiện tại, hàm vẫn không hữu ích lắm — chúng ta không muốn chỉ hiển thị cùng một thông báo mặc định mỗi lần. Hãy cải thiện hàm bằng cách thêm một số tham số, cho phép chúng ta gọi nó với một số tùy chọn khác nhau.

1. Đầu tiên, hãy cập nhật dòng đầu tiên của hàm:

   ```js
   function displayMessage() {
   ```

   thành:

   ```js
   function displayMessage(msgText, msgType) {
   ```

   Bây giờ khi chúng ta gọi hàm, chúng ta có thể cung cấp hai giá trị biến bên trong dấu ngoặc đơn để chỉ định thông báo cần hiển thị trong hộp thông báo, và loại thông báo đó là gì.

2. Để sử dụng tham số đầu tiên, hãy cập nhật dòng sau bên trong hàm:

   ```js
   msg.textContent = "This is a message box";
   ```

   thành

   ```js
   msg.textContent = msgText;
   ```

3. Cuối cùng nhưng không kém phần quan trọng, bây giờ bạn cần cập nhật lệnh gọi hàm để bao gồm một số văn bản thông báo được cập nhật. Thay đổi dòng sau:

   ```js
   btn.addEventListener("click", displayMessage);
   ```

   thành khối này:

   ```js
   btn.addEventListener("click", () =>
     displayMessage("Woo, this is a different message!"),
   );
   ```

   Nếu chúng ta muốn chỉ định tham số bên trong dấu ngoặc đơn cho hàm chúng ta đang gọi, thì chúng ta không thể gọi nó trực tiếp — chúng ta cần đặt nó bên trong một hàm vô danh để nó không ở trong phạm vi tức thì và do đó không được gọi ngay lập tức. Bây giờ nó sẽ không được gọi cho đến khi nút được nhấp.

4. Tải lại và thử mã một lần nữa và bạn sẽ thấy nó vẫn hoạt động tốt, ngoại trừ bây giờ bạn cũng có thể thay đổi thông báo bên trong tham số để nhận được các thông báo khác nhau hiển thị trong hộp!

### Tham số phức tạp hơn

Đến tham số tiếp theo. Cái này sẽ liên quan đến nhiều công việc hơn một chút — chúng ta sẽ đặt nó sao cho tùy thuộc vào tham số `msgType` được đặt thành gì, hàm sẽ hiển thị một biểu tượng khác và màu nền khác.

1. Trước tiên, tải xuống các biểu tượng cần thiết cho bài tập này ([cảnh báo](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/functions/icons/warning.png) và [trò chuyện](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/functions/icons/chat.png)) từ GitHub. Lưu chúng vào một thư mục mới gọi là `icons` ở cùng vị trí với tệp HTML của bạn.

   > [!NOTE]
   > Các biểu tượng cảnh báo và trò chuyện ban đầu được tìm thấy trên iconfinder.com và được thiết kế bởi Nazarrudin Ansyari — Cảm ơn! (Các trang biểu tượng thực tế đã được di chuyển hoặc xóa kể từ đó.)

2. Tiếp theo, tìm CSS bên trong tệp HTML của bạn. Chúng ta sẽ thực hiện một vài thay đổi để nhường chỗ cho các biểu tượng. Đầu tiên, cập nhật `.msgBox` width từ:

   ```css
   width: 200px;
   ```

   thành

   ```css
   width: 242px;
   ```

3. Tiếp theo, thêm các dòng sau vào trong quy tắc `.msgBox p { }`:

   ```css
   padding-left: 82px;
   background-position: 25px center;
   background-repeat: no-repeat;
   ```

4. Bây giờ chúng ta cần thêm mã vào hàm `displayMessage()` để xử lý việc hiển thị các biểu tượng. Thêm khối sau ngay phía trên dấu ngoặc nhọn đóng (`}`) của hàm:

   ```js
   if (msgType === "warning") {
     msg.style.backgroundImage = 'url("icons/warning.png")';
     panel.style.backgroundColor = "red";
   } else if (msgType === "chat") {
     msg.style.backgroundImage = 'url("icons/chat.png")';
     panel.style.backgroundColor = "aqua";
   } else {
     msg.style.paddingLeft = "20px";
   }
   ```

   Ở đây, nếu tham số `msgType` được đặt là `"warning"`, biểu tượng cảnh báo được hiển thị và màu nền của panel được đặt thành đỏ. Nếu nó được đặt thành `"chat"`, biểu tượng trò chuyện được hiển thị và màu nền của panel được đặt thành xanh aqua. Nếu tham số `msgType` không được đặt chút nào (hoặc thành điều gì đó khác), thì phần `else { }` của mã đến, và đoạn văn được đặt padding mặc định và không có biểu tượng, không có màu nền panel nào được đặt cũng. Điều này cung cấp trạng thái mặc định nếu không có tham số `msgType` nào được cung cấp, có nghĩa là nó là tham số tùy chọn!

5. Hãy kiểm tra hàm đã cập nhật của chúng ta, thử cập nhật lệnh gọi `displayMessage()` từ:

   ```js
   displayMessage("Woo, this is a different message!");
   ```

   thành một trong những điều này:

   ```js
   displayMessage("Your inbox is almost full — delete some mails", "warning");
   displayMessage("Brian: Hi there, how are you today?", "chat");
   ```

   Bạn có thể thấy hàm nhỏ (giờ không còn nhỏ) của chúng ta đang trở nên hữu ích đến mức nào.

> [!NOTE]
> Nếu bạn gặp khó khăn khi làm cho ví dụ hoạt động, hãy tự do kiểm tra mã của bạn so với [phiên bản hoàn thành trên GitHub](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/functions/function-stage-4.html) ([xem nó chạy trực tiếp](https://mdn.github.io/learning-area/javascript/building-blocks/functions/function-stage-4.html) cũng), hoặc nhờ chúng ta giúp đỡ.

## Tóm tắt

Chúc mừng bạn đã đến cuối! Bài viết này đã hướng dẫn bạn qua toàn bộ quá trình xây dựng một hàm tùy chỉnh thực tế, với một chút công việc nữa có thể được chuyển sang một dự án thực tế. Trong bài tiếp theo, chúng ta sẽ kết thúc hàm bằng cách giải thích một khái niệm liên quan thiết yếu khác — giá trị trả về.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Functions","Learn_web_development/Core/Scripting/Return_values", "Learn_web_development/Core/Scripting")}}
