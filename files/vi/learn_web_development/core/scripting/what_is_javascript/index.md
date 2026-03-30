---
title: JavaScript là gì?
slug: Learn_web_development/Core/Scripting/What_is_JavaScript
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Scripting/A_first_splash", "Learn_web_development/Core/Scripting")}}

Chào mừng bạn đến với khóa học JavaScript dành cho người mới bắt đầu của MDN!
Trong bài này, chúng ta sẽ xem xét JavaScript ở mức độ tổng quan, trả lời các câu hỏi như "Nó là gì?" và "Bạn có thể làm gì với nó?", đồng thời đảm bảo rằng bạn đã nắm được mục đích của JavaScript.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">các nguyên tắc cơ bản của CSS</a>.</td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu học tập:</th>
      <td>
        <ul>
          <li>JavaScript là gì và nó phù hợp với một trang web như thế nào.</li>
          <li>Bạn có thể làm gì với JavaScript.</li>
          <li>Thêm JavaScript vào trang web.</li>
          <li>Viết chú thích bên trong JavaScript.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Định nghĩa ở mức độ tổng quan

JavaScript là một ngôn ngữ lập trình hoặc kịch bản cho phép bạn triển khai các tính năng phức tạp trên các trang web — mỗi khi một trang web làm nhiều hơn là chỉ ngồi đó và hiển thị thông tin tĩnh cho bạn xem — hiển thị cập nhật nội dung kịp thời, bản đồ tương tác, đồ họa 2D/3D hoạt hình, hộp nhạc video cuộn, v.v. — bạn có thể đặt cược rằng JavaScript có lẽ đang liên quan.
Đó là lớp thứ ba của tầng bánh của các công nghệ web tiêu chuẩn, hai trong số đó ([HTML](/en-US/docs/Learn_web_development/Core/Structuring_content) và [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics)) chúng ta đã đề cập chi tiết hơn nhiều ở các phần khác của Khu vực học tập.

![Ba lớp của công nghệ web tiêu chuẩn; HTML, CSS và JavaScript](cake.png)

- {{glossary("HTML")}} là ngôn ngữ đánh dấu mà chúng ta sử dụng để cấu trúc và tạo ý nghĩa cho nội dung web của mình, ví dụ như xác định các đoạn văn, tiêu đề và bảng dữ liệu, hoặc nhúng hình ảnh và video vào trang.
- {{glossary("CSS")}} là ngôn ngữ các quy tắc kiểu dáng mà chúng ta sử dụng để áp dụng kiểu cho nội dung HTML của mình, ví dụ như thiết lập màu nền và phông chữ, và bố trí nội dung của chúng ta trong nhiều cột.
- {{glossary("JavaScript")}} là ngôn ngữ kịch bản giúp bạn tạo nội dung cập nhật động, điều khiển đa phương tiện, tạo hiệu ứng hình ảnh và hầu hết mọi thứ khác. (Được rồi, không phải tất cả mọi thứ, nhưng thật đáng kinh ngạc những gì bạn có thể đạt được chỉ với vài dòng mã JavaScript.)

Ba lớp xây dựng lên nhau một cách tốt đẹp. Hãy lấy một nút như ví dụ. Chúng ta có thể đánh dấu nó bằng HTML để cung cấp cấu trúc và mục đích:

```css hidden live-sample___string-concat-name-html live-sample___string-concat-name-css live-sample___string-concat-name-js
html {
  height: 100%;
}

body {
  height: inherit;
  display: flex;
  align-items: center;
  justify-content: center;
}

button {
  font-size: 1.4em;
}
```

```html live-sample___string-concat-name-html live-sample___string-concat-name-css live-sample___string-concat-name-js
<button>Player 1: Chris</button>
```

{{EmbedLiveSample('string-concat-name-html', , '80')}}

Sau đó chúng ta có thể thêm một số CSS vào để làm nó trông đẹp:

```css live-sample___string-concat-name-css live-sample___string-concat-name-js
button {
  font-family: "Helvetica Neue", "Helvetica", sans-serif;
  letter-spacing: 1px;
  text-transform: uppercase;
  border: 2px solid rgb(200 200 0 / 60%);
  background-color: rgb(0 217 217 / 60%);
  color: rgb(100 0 0 / 100%);
  box-shadow: 1px 1px 2px rgb(0 0 200 / 40%);
  border-radius: 10px;
  padding: 3px 10px;
  cursor: pointer;
}
```

{{EmbedLiveSample('string-concat-name-css', , '80')}}

Và cuối cùng, chúng ta có thể thêm một số JavaScript để triển khai hành vi động:

```js live-sample___string-concat-name-js
function updateName() {
  const name = prompt("Enter a new name");
  button.textContent = `Player 1: ${name}`;
}

const button = document.querySelector("button");

button.addEventListener("click", updateName);
```

Hãy thử nhấp vào nhãn văn bản, nhập tên vào hộp thoại mở ra và nhấn nút OK.

{{EmbedLiveSample('string-concat-name-js', , '80', , , , , 'allow-modals')}}

JavaScript có thể làm nhiều hơn thế — hãy cùng khám phá chi tiết hơn.

> [!NOTE]
> Trước khi tiếp tục, tại sao không thử thực hành ngay và làm bẩn tay với một thử thách từ Scrimba ở giai đoạn đầu này? Hãy xem [Render a welcome message](https://scrimba.com/learn-javascript-c0v/~0n?via=mdn) <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>. Nếu bạn không biết cách viết mã này, đừng lo lắng chút nào; bạn có thể thử thực hiện một số tìm kiếm web để tìm câu trả lời, hoặc xem giải pháp ở cuối scrim.

## Vậy nó thực sự có thể làm gì?

Ngôn ngữ JavaScript phía máy khách lõi bao gồm một số tính năng lập trình phổ biến cho phép bạn làm những thứ như:

- Lưu trữ các giá trị hữu ích bên trong biến. Trong ví dụ trên chẳng hạn, chúng ta yêu cầu nhập tên mới rồi lưu tên đó trong một biến gọi là `name`.
- Các thao tác trên các đoạn văn bản (được gọi là "chuỗi" trong lập trình). Trong ví dụ trên, chúng ta lấy chuỗi "Player 1: " và nối nó với biến `name` để tạo nhãn văn bản hoàn chỉnh, ví dụ: "Player 1: Chris".
- Chạy mã để phản hồi các sự kiện nhất định xảy ra trên một trang web. Chúng ta đã sử dụng sự kiện {{domxref("Element/click_event", "click")}} trong ví dụ trên để phát hiện khi nhãn được nhấp và sau đó chạy mã cập nhật nhãn văn bản.
- Và nhiều hơn nữa!

Điều thú vị hơn thế nữa là chức năng được xây dựng trên nền tảng ngôn ngữ JavaScript phía máy khách. Cái gọi là **Giao diện lập trình ứng dụng** (**API**) cung cấp cho bạn những sức mạnh bổ sung để sử dụng trong mã JavaScript của mình.

API là các bộ khối xây dựng mã sẵn sàng cho phép nhà phát triển triển khai các chương trình mà nếu không sẽ khó hoặc không thể triển khai.
Chúng làm điều tương tự cho lập trình mà các bộ đồ nội thất sẵn sàng làm cho việc xây dựng nhà — việc lấy các tấm bảng đã cắt sẵn và vít chúng lại để làm giá sách dễ dàng hơn nhiều so với việc tự thiết kế, tìm gỗ đúng loại, cắt tất cả các tấm bảng theo đúng kích thước và hình dạng, tìm vít đúng kích thước, và _sau đó_ ghép chúng lại để làm giá sách.

Chúng thường rơi vào hai loại.

![Hai loại API; API của bên thứ ba được hiển thị ở phía cạnh trình duyệt và API trình duyệt ở trong trình duyệt](browser.png)

**API trình duyệt** được tích hợp vào trình duyệt web của bạn và có thể hiển thị dữ liệu từ môi trường máy tính xung quanh, hoặc thực hiện những điều phức tạp hữu ích. Ví dụ:

- [API DOM (Document Object Model)](/en-US/docs/Web/API/Document_Object_Model) cho phép bạn thao tác HTML và CSS, tạo, xóa và thay đổi HTML, áp dụng động các kiểu mới cho trang của bạn, v.v.
  Mỗi khi bạn thấy một cửa sổ popup xuất hiện trên trang, hoặc một số nội dung mới được hiển thị (như chúng ta đã thấy ở trên trong bản demo đơn giản của chúng ta) ví dụ, đó là DOM đang hoạt động.
- [API Geolocation](/en-US/docs/Web/API/Geolocation_API) truy xuất thông tin địa lý.
  Đây là cách [Google Maps](https://www.google.com/maps) có thể tìm vị trí của bạn và vẽ nó lên bản đồ.
- Các API [Canvas](/en-US/docs/Web/API/Canvas_API) và [WebGL](/en-US/docs/Web/API/WebGL_API) cho phép bạn tạo đồ họa 2D và 3D hoạt hình.
  Mọi người đang làm những điều tuyệt vời bằng cách sử dụng các công nghệ web này — xem [Chrome Experiments](https://experiments.withgoogle.com/collection/chrome) và [webglsamples](https://webglsamples.org/).
- [Các API Audio và Video](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery) như {{domxref("HTMLMediaElement")}} và [WebRTC](/en-US/docs/Web/API/WebRTC_API) cho phép bạn làm những điều thực sự thú vị với đa phương tiện, chẳng hạn như phát âm thanh và video ngay trong trang web, hoặc lấy video từ camera web của bạn và hiển thị nó trên máy tính của người khác (hãy thử [bản demo Snapshot](https://chrisdavidmills.github.io/snapshot/) đơn giản của chúng ta để có ý tưởng).

**API của bên thứ ba** không được tích hợp vào trình duyệt theo mặc định, và bạn thường phải lấy mã và thông tin của chúng từ đâu đó trên Web. Ví dụ:

- [API Bluesky](https://docs.bsky.app/) cho phép bạn làm những việc như hiển thị các bài đăng mới nhất của bạn trên trang web của bạn.
- [API Google Maps](https://developers.google.com/maps/) và [API OpenStreetMap](https://wiki.openstreetmap.org/wiki/API) cho phép bạn nhúng bản đồ tùy chỉnh vào trang web của bạn và các chức năng tương tự khác.

> [!NOTE]
> Những API này là nâng cao, và chúng ta sẽ không đề cập đến bất kỳ API nào trong số này trong mô-đun này. Bạn có thể tìm hiểu thêm nhiều về những điều này trong [mô-đun API web phía máy khách](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs) của chúng ta.

Còn nhiều thứ có sẵn nữa! Tuy nhiên, đừng quá hào hứng chỉ vì vậy. Bạn sẽ không thể xây dựng Facebook, Google Maps hay Instagram tiếp theo sau khi học JavaScript 24 giờ — còn rất nhiều điều cơ bản cần đề cập trước. Và đó là lý do bạn ở đây — hãy tiếp tục!

## JavaScript đang làm gì trên trang của bạn?

Ở đây chúng ta sẽ thực sự bắt đầu xem xét một số mã, và trong khi làm vậy, khám phá những gì thực sự xảy ra khi bạn chạy một số JavaScript trong trang của bạn.

Hãy tóm tắt lại câu chuyện về những gì xảy ra khi bạn tải một trang web trong trình duyệt (được đề cập lần đầu tiên trong bài viết [CSS là gì?](/en-US/docs/Learn_web_development/Core/Styling_basics/What_is_CSS#how_is_css_applied_to_html) của chúng ta). Khi bạn tải một trang web trong trình duyệt, bạn đang chạy mã của mình (HTML, CSS và JavaScript) bên trong môi trường thực thi (tab trình duyệt). Điều này giống như một nhà máy lấy nguyên liệu thô (mã) và xuất ra sản phẩm (trang web).

![HTML, CSS và mã JavaScript kết hợp với nhau để tạo ra nội dung trong tab trình duyệt khi trang được tải](execution.png)

Một cách sử dụng rất phổ biến của JavaScript là sửa đổi động HTML và CSS để cập nhật giao diện người dùng, thông qua API Document Object Model (như đã đề cập ở trên).

### Bảo mật trình duyệt

Mỗi tab trình duyệt có thùng chứa riêng để chạy mã trong đó (những thùng chứa này được gọi là "môi trường thực thi" theo thuật ngữ kỹ thuật) — điều này có nghĩa là trong hầu hết các trường hợp, mã trong mỗi tab chạy hoàn toàn riêng biệt và mã trong một tab không thể ảnh hưởng trực tiếp đến mã trong tab khác — hoặc trên một trang web khác.
Đây là một biện pháp bảo mật tốt — nếu không phải như vậy, các tên cướp biển có thể bắt đầu viết mã để đánh cắp thông tin từ các trang web khác và những điều xấu khác như vậy.

> [!NOTE]
> Có những cách để gửi mã và dữ liệu giữa các trang web/tab khác nhau một cách an toàn, nhưng đây là các kỹ thuật nâng cao mà chúng ta sẽ không đề cập trong khóa học này.

### Thứ tự chạy JavaScript

Khi trình duyệt gặp một khối JavaScript, nó thường chạy theo thứ tự, từ trên xuống dưới.
Điều này có nghĩa là bạn cần cẩn thận về thứ tự bạn đặt mọi thứ vào.
Ví dụ, hãy quay lại khối JavaScript chúng ta đã thấy trong ví dụ đầu tiên của mình:

```js
function updateName() {
  const name = prompt("Enter a new name");
  button.textContent = `Player 1: ${name}`;
}

const button = document.querySelector("button");

button.addEventListener("click", updateName);
```

Ở đây, đầu tiên chúng ta định nghĩa một khối mã có tên `updateName()` (những loại khối mã có thể tái sử dụng này được gọi là **hàm**), yêu cầu người dùng nhập tên mới và chèn tên đó vào văn bản của nút. Sau đó chúng ta lưu trữ tham chiếu đến nút bằng cách sử dụng `document.querySelector` và đính kèm trình lắng nghe sự kiện vào nó bằng cách sử dụng `addEventListener` để khi nút được nhấp, hàm `updateName()` được chạy.

Nếu bạn đổi thứ tự của dòng `const button = ...` và `button.addEventListener(...)`, mã sẽ không còn hoạt động nữa — thay vào đó, bạn sẽ nhận được lỗi được trả về trong [bảng điều khiển (console) nhà phát triển trình duyệt](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools) — `Uncaught ReferenceError: Cannot access 'button' before initialization`.
Điều này có nghĩa là đối tượng `button` chưa được khởi tạo, vì vậy chúng ta không thể thêm trình lắng nghe sự kiện vào nó.

> [!NOTE]
> Không phải lúc nào JavaScript cũng chạy chính xác theo thứ tự từ trên xuống dưới, do các hành vi như [hoisting](/en-US/docs/Glossary/Hoisting), nhưng hiện tại, hãy nhớ rằng nói chung các mục cần được định nghĩa trước khi bạn có thể sử dụng chúng. Đây là nguồn gốc lỗi phổ biến.

### Mã được thông dịch so với mã được biên dịch

Bạn có thể nghe các thuật ngữ **thông dịch** và **biên dịch** trong ngữ cảnh lập trình.
Trong các ngôn ngữ được thông dịch, mã được chạy từ trên xuống dưới và kết quả của việc chạy mã được trả về ngay lập tức.
Bạn không cần phải chuyển đổi mã sang dạng khác trước khi trình duyệt chạy nó.
Mã được nhận ở dạng văn bản thân thiện với lập trình viên và được xử lý trực tiếp từ đó.

Các ngôn ngữ biên dịch mặt khác được biến đổi (biên dịch) sang dạng khác trước khi chúng được máy tính chạy.
Ví dụ, C/C++ được biên dịch sang mã máy sau đó được chạy bởi máy tính.
Chương trình được thực thi từ định dạng nhị phân, được tạo ra từ mã nguồn chương trình gốc.

JavaScript là một ngôn ngữ lập trình được thông dịch nhẹ.
Trình duyệt web nhận mã JavaScript ở dạng văn bản gốc của nó và chạy tập lệnh từ đó.
Từ góc độ kỹ thuật, hầu hết các trình thông dịch JavaScript hiện đại thực sự sử dụng một kỹ thuật gọi là **biên dịch đúng lúc** để cải thiện hiệu suất; mã nguồn JavaScript được biên dịch sang định dạng nhị phân nhanh hơn trong khi tập lệnh đang được sử dụng, để nó có thể được chạy nhanh nhất có thể.
Tuy nhiên, JavaScript vẫn được coi là ngôn ngữ được thông dịch, vì việc biên dịch được xử lý tại thời gian chạy, chứ không phải trước đó.

Có những ưu điểm cho cả hai loại ngôn ngữ, nhưng chúng ta sẽ không thảo luận về chúng ngay bây giờ.

### Mã phía máy chủ so với mã phía máy khách

Bạn cũng có thể nghe các thuật ngữ **phía máy chủ** và **phía máy khách** trong mã, đặc biệt trong ngữ cảnh phát triển web.
Mã phía máy khách là mã được chạy trên máy tính của người dùng — khi một trang web được xem, mã phía máy khách của trang được tải xuống, sau đó được trình duyệt chạy và hiển thị.
Trong mô-đun này, chúng ta đang nói rõ ràng về **JavaScript phía máy khách**.

Mã phía máy chủ mặt khác được chạy trên máy chủ, sau đó kết quả của nó được tải xuống và hiển thị trong trình duyệt.
Ví dụ về các ngôn ngữ web phía máy chủ phổ biến bao gồm PHP, Python, Ruby, C# và thậm chí cả JavaScript!
JavaScript cũng có thể được sử dụng như một ngôn ngữ phía máy chủ, ví dụ như trong môi trường Node.js phổ biến — bạn có thể tìm hiểu thêm về JavaScript phía máy chủ trong chủ đề [Trang web động – Lập trình phía máy chủ](/en-US/docs/Learn_web_development/Extensions/Server-side) của chúng ta.

### Mã động so với mã tĩnh

Từ **động** được sử dụng để mô tả cả JavaScript phía máy khách và các ngôn ngữ phía máy chủ — nó đề cập đến khả năng cập nhật hiển thị của trang web/ứng dụng để hiển thị những thứ khác nhau trong các tình huống khác nhau, tạo nội dung mới khi cần thiết.
Mã phía máy chủ động tạo nội dung mới trên máy chủ, ví dụ như lấy dữ liệu từ cơ sở dữ liệu, trong khi JavaScript phía máy khách động tạo nội dung mới bên trong trình duyệt trên máy khách, ví dụ như tạo bảng HTML mới, điền dữ liệu được yêu cầu từ máy chủ vào đó, sau đó hiển thị bảng trong trang web được hiển thị cho người dùng.
Ý nghĩa có phần khác nhau trong hai ngữ cảnh, nhưng có liên quan, và cả hai cách tiếp cận (phía máy chủ và phía máy khách) thường hoạt động cùng nhau.

Một trang web không có nội dung cập nhật động được gọi là **tĩnh** — nó chỉ hiển thị cùng một nội dung mọi lúc.

## Làm thế nào để thêm JavaScript vào trang của bạn?

JavaScript được áp dụng cho trang HTML của bạn theo cách tương tự với CSS.
Trong khi CSS sử dụng các phần tử {{htmlelement("link")}} để áp dụng các bảng kiểu ngoài và các phần tử {{htmlelement("style")}} để áp dụng các bảng kiểu nội bộ cho HTML, JavaScript chỉ cần một người bạn trong thế giới HTML — phần tử {{htmlelement("script")}}. Hãy cùng tìm hiểu cách này hoạt động.

> [!NOTE]
> Hướng dẫn tương tác [Setting up our JavaScript file](https://scrimba.com/learn-javascript-c0v/~03?via=mdn) <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> của Scrimba trình bày qua một vài cách khác nhau để thêm JavaScript vào HTML của bạn.

### JavaScript nội bộ

1. Trước hết, hãy tạo một bản sao cục bộ của tệp ví dụ [apply-javascript.html](https://github.com/mdn/learning-area/blob/main/javascript/introduction-to-js-1/what-is-js/apply-javascript.html). Lưu nó vào một thư mục hợp lý ở đâu đó.
2. Mở tệp trong trình duyệt web và trong trình soạn thảo văn bản của bạn. Bạn sẽ thấy HTML tạo ra một trang web đơn giản chứa một nút có thể nhấp được.
3. Tiếp theo, hãy vào trình soạn thảo văn bản của bạn và thêm đoạn sau vào cuối thân — ngay trước thẻ đóng `</body>` của bạn:

   ```html
   <script>
     // JavaScript goes here
   </script>
   ```

   Lưu ý rằng mã trong các tài liệu web của bạn thường được tải và thực thi theo thứ tự nó xuất hiện trên trang. Bằng cách đặt JavaScript ở cuối, chúng ta đảm bảo rằng tất cả các phần tử HTML đều được tải. (Xem thêm [Chiến lược tải tập lệnh](#script_loading_strategies) bên dưới.)

4. Bây giờ chúng ta sẽ thêm một số JavaScript bên trong phần tử {{htmlelement("script")}} để làm cho trang thực hiện điều gì đó thú vị hơn — thêm mã sau ngay bên dưới dòng "// JavaScript goes here":

   ```js
   function createParagraph() {
     const para = document.createElement("p");
     para.textContent = "You clicked the button!";
     document.body.appendChild(para);
   }

   const buttons = document.querySelectorAll("button");

   for (const button of buttons) {
     button.addEventListener("click", createParagraph);
   }
   ```

5. Lưu tệp của bạn và làm mới trình duyệt — bây giờ bạn sẽ thấy rằng khi bạn nhấp vào nút, một đoạn văn mới được tạo ra và đặt bên dưới.

> [!NOTE]
> Nếu ví dụ của bạn dường như không hoạt động, hãy xem qua các bước một lần nữa và kiểm tra rằng bạn đã làm mọi thứ đúng.
> Bạn có lưu bản sao cục bộ của mã bắt đầu dưới dạng tệp `.html` không?
> Bạn có thêm phần tử {{htmlelement("script")}} ngay trước thẻ `</body>` không?
> Bạn có nhập JavaScript chính xác như hiển thị không? **JavaScript phân biệt chữ hoa chữ thường, và rất khó tính, vì vậy bạn cần nhập cú pháp chính xác như hiển thị, nếu không nó có thể không hoạt động.**

> [!NOTE]
> Bạn có thể xem phiên bản này trên GitHub như [apply-javascript-internal.html](https://github.com/mdn/learning-area/blob/main/javascript/introduction-to-js-1/what-is-js/apply-javascript-internal.html) ([xem trực tiếp ở đây](https://mdn.github.io/learning-area/javascript/introduction-to-js-1/what-is-js/apply-javascript-internal.html)).

### JavaScript bên ngoài

Điều này hoạt động tốt, nhưng nếu chúng ta muốn đặt JavaScript của mình vào tệp bên ngoài thì sao? Hãy khám phá điều này ngay bây giờ.

1. Đầu tiên, tạo một tệp mới trong cùng thư mục với tệp HTML mẫu của bạn. Đặt tên là `script.js` — hãy đảm bảo nó có phần mở rộng tệp .js, đó là cách nó được nhận dạng là JavaScript.
2. Xóa phần tử {{htmlelement("script")}} hiện tại của bạn ở cuối `</body>` và thêm đoạn sau ngay trước thẻ đóng `</head>` (theo cách đó, trình duyệt có thể bắt đầu tải tệp sớm hơn so với khi nó ở cuối):

   ```html
   <script type="module" src="script.js"></script>
   ```

3. Bên trong `script.js`, thêm tập lệnh sau:

   ```js
   function createParagraph() {
     const para = document.createElement("p");
     para.textContent = "You clicked the button!";
     document.body.appendChild(para);
   }

   const buttons = document.querySelectorAll("button");

   for (const button of buttons) {
     button.addEventListener("click", createParagraph);
   }
   ```

4. Lưu và làm mới trình duyệt của bạn. Bạn sẽ thấy rằng nhấp vào nút không có tác dụng, và nếu bạn kiểm tra bảng điều khiển (console) trình duyệt, bạn sẽ thấy một lỗi tương tự như `Cross-origin request blocked`. Đó là vì giống như nhiều tài nguyên bên ngoài, các mô-đun JavaScript cần được tải từ cùng [nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy) với HTML, và các URL `file://` không đủ điều kiện. Có hai giải pháp để khắc phục vấn đề này:
   - Giải pháp được đề xuất của chúng ta là [thiết lập một máy chủ kiểm thử cục bộ](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server). Với chương trình máy chủ đang chạy và phục vụ các tệp `apply-javascript-external.html` và `script.js` trên cổng `8000`, hãy mở trình duyệt của bạn và truy cập `http://localhost:8000`.
   - Nếu bạn không thể chạy máy chủ cục bộ, bạn cũng có thể sử dụng `<script defer src="script.js"></script>` thay vì `<script type="module" src="script.js"></script>`. Xem [Chiến lược tải tập lệnh](#script_loading_strategies) bên dưới để biết thêm thông tin. Nhưng lưu ý rằng các tính năng chúng ta sử dụng trong các phần khác của hướng dẫn có thể yêu cầu máy chủ HTTP cục bộ.
5. Bây giờ trang web hoạt động giống như trước, nhưng bây giờ chúng ta đã có JavaScript của mình trong tệp bên ngoài.
   Đây thường là điều tốt về mặt tổ chức mã của bạn và làm cho nó có thể tái sử dụng trên nhiều tệp HTML.
   Thêm vào đó, HTML dễ đọc hơn mà không có những đoạn lớn của tập lệnh được đổ vào nó.

> [!NOTE]
> Bạn có thể xem phiên bản này trên GitHub như [apply-javascript-external.html](https://github.com/mdn/learning-area/blob/main/javascript/introduction-to-js-1/what-is-js/apply-javascript-external.html) và [script.js](https://github.com/mdn/learning-area/blob/main/javascript/introduction-to-js-1/what-is-js/script.js) ([xem trực tiếp ở đây](https://mdn.github.io/learning-area/javascript/introduction-to-js-1/what-is-js/apply-javascript-external.html)).

### Trình xử lý JavaScript nội tuyến

Lưu ý rằng đôi khi bạn sẽ gặp các đoạn mã JavaScript thực tế sống bên trong HTML.
Nó có thể trông giống như thế này:

```js example-bad
function createParagraph() {
  const para = document.createElement("p");
  para.textContent = "You clicked the button!";
  document.body.appendChild(para);
}
```

```html example-bad
<button onclick="createParagraph()">Click me!</button>
```

Bạn có thể thử phiên bản này của bản demo bên dưới.

{{ EmbedLiveSample('Inline_JavaScript_handlers', '100%', 150) }}

Bản demo này có chính xác cùng chức năng với hai phần trước, ngoại trừ phần tử {{htmlelement("button")}} bao gồm trình xử lý `onclick` nội tuyến để làm cho hàm chạy khi nút được nhấn.

**Vui lòng đừng làm điều này, tuy nhiên.** Đó là thực hành xấu khi làm ô nhiễm HTML của bạn bằng JavaScript, và nó không hiệu quả — bạn sẽ phải bao gồm thuộc tính `onclick="createParagraph()"` trên mỗi nút bạn muốn JavaScript áp dụng.

### Sử dụng addEventListener thay thế

Thay vì bao gồm JavaScript trong HTML của bạn, hãy sử dụng một cấu trúc JavaScript thuần túy.
Hàm `querySelectorAll()` cho phép bạn chọn tất cả các nút trên trang.
Sau đó, bạn có thể lặp qua các nút, gán trình xử lý cho mỗi nút bằng cách sử dụng `addEventListener()`.
Mã cho điều này được hiển thị bên dưới:

```js
const buttons = document.querySelectorAll("button");

for (const button of buttons) {
  button.addEventListener("click", createParagraph);
}
```

Điều này có thể dài hơn một chút so với thuộc tính `onclick`, nhưng nó sẽ hoạt động cho tất cả các nút — bất kể có bao nhiêu nút trên trang, hay bao nhiêu nút được thêm hoặc xóa.
JavaScript không cần phải thay đổi.

> [!NOTE]
> Hãy thử chỉnh sửa phiên bản `apply-javascript.html` của bạn và thêm một vài nút nữa vào tệp.
> Khi bạn tải lại, bạn sẽ thấy rằng tất cả các nút khi nhấp sẽ tạo một đoạn văn.
> Gọn gàng, phải không?

### Chiến lược tải tập lệnh

Tất cả HTML trên một trang được tải theo thứ tự nó xuất hiện.
Nếu bạn đang sử dụng JavaScript để thao tác các phần tử trên trang (hay chính xác hơn, [Document Object Model](/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting#the_document_object_model)), mã của bạn sẽ không hoạt động nếu JavaScript được tải và phân tích trước HTML mà bạn đang cố gắng làm điều gì đó.

Có một vài chiến lược khác nhau để đảm bảo JavaScript của bạn chỉ chạy sau khi HTML được phân tích:

- Trong ví dụ JavaScript nội bộ trên, phần tử tập lệnh được đặt ở cuối thân của tài liệu, và do đó chỉ chạy sau khi phần còn lại của thân HTML được phân tích.
- Trong ví dụ JavaScript bên ngoài trên, phần tử tập lệnh được đặt trong phần head của tài liệu, trước khi thân HTML được phân tích. Nhưng vì chúng ta đang sử dụng `<script type="module">`, mã được coi như một [mô-đun](/en-US/docs/Web/JavaScript/Guide/Modules) và trình duyệt đợi tất cả HTML được xử lý trước khi thực thi các mô-đun JavaScript. (Bạn cũng có thể đặt tập lệnh bên ngoài ở cuối thân. Nhưng nếu có nhiều HTML và mạng chậm, có thể mất nhiều thời gian trước khi trình duyệt thậm chí có thể bắt đầu lấy và tải tập lệnh, vì vậy đặt tập lệnh bên ngoài trong head thường tốt hơn.)
- Nếu bạn vẫn muốn sử dụng các tập lệnh không phải mô-đun trong head tài liệu, có thể chặn toàn bộ trang hiển thị, và có thể gây lỗi vì nó thực thi trước khi HTML được phân tích:
  - Đối với các tập lệnh bên ngoài, bạn nên thêm thuộc tính `defer` (hoặc nếu bạn không cần HTML sẵn sàng, thuộc tính `async`) vào phần tử {{htmlelement("script")}}.
  - Đối với các tập lệnh nội bộ, bạn nên bọc mã trong [trình lắng nghe sự kiện `DOMContentLoaded`](/en-US/docs/Web/API/Document/DOMContentLoaded_event).

  Điều này vượt quá phạm vi của hướng dẫn tại thời điểm này, nhưng trừ khi bạn cần hỗ trợ trình duyệt rất cũ, bạn không phải làm điều này và chỉ cần sử dụng `<script type="module">` thay thế.

## Chú thích

Như với HTML và CSS, có thể viết các chú thích vào mã JavaScript của bạn mà sẽ bị trình duyệt bỏ qua, và tồn tại để cung cấp hướng dẫn cho các nhà phát triển đồng nghiệp của bạn về cách mã hoạt động (và cả bạn, nếu bạn quay lại mã sau sáu tháng và không thể nhớ bạn đã làm gì).
Chú thích rất hữu ích, và bạn nên sử dụng chúng thường xuyên, đặc biệt cho các ứng dụng lớn hơn.
Có hai loại:

- Một chú thích dòng đơn được viết sau dấu gạch chéo kép (`//`), ví dụ:

  ```js
  // I am a comment
  ```

- Một chú thích nhiều dòng được viết giữa các chuỗi `/*` và `*/`, ví dụ:

  ```js
  /*
    I am also
    a comment
  */
  ```

Vì vậy, ví dụ, chúng ta có thể chú thích JavaScript của bản demo cuối với các chú thích như thế này:

```js
// Function: creates a new paragraph and appends it to the bottom of the HTML body.

function createParagraph() {
  const para = document.createElement("p");
  para.textContent = "You clicked the button!";
  document.body.appendChild(para);
}

/*
  1. Get references to all the buttons on the page in an array format.
  2. Loop through all the buttons and add a click event listener to each one.

  When any button is pressed, the createParagraph() function will be run.
*/

const buttons = document.querySelectorAll("button");

for (const button of buttons) {
  button.addEventListener("click", createParagraph);
}
```

> [!NOTE]
> Nói chung, các chú thích nhiều hơn thường tốt hơn ít hơn, nhưng bạn nên cẩn thận nếu bạn thấy mình thêm nhiều chú thích để giải thích các biến là gì (tên biến của bạn có lẽ nên trực quan hơn), hoặc giải thích các thao tác rất đơn giản (có thể mã của bạn quá phức tạp).

## Tóm tắt

Vậy là bạn đã có rồi, bước đầu tiên của bạn vào thế giới JavaScript.
Chúng ta đã bắt đầu chỉ với lý thuyết, để bắt đầu làm quen với lý do tại sao bạn sử dụng JavaScript và những loại thứ bạn có thể làm với nó.
Trên đường đi, bạn đã thấy một vài ví dụ mã và học cách JavaScript phù hợp với phần còn lại của mã trên trang web của bạn, trong số những thứ khác.

JavaScript có thể có vẻ hơi đáng sợ ngay bây giờ, nhưng đừng lo lắng — trong khóa học này, chúng ta sẽ dẫn bạn qua nó theo các bước đơn giản sẽ có ý nghĩa khi tiến lên.
Trong bài tiếp theo, chúng ta sẽ đi thẳng vào thực tế, khiến bạn nhảy thẳng vào và xây dựng các ví dụ JavaScript của riêng bạn.

{{NextMenu("Learn_web_development/Core/Scripting/A_first_splash", "Learn_web_development/Core/Scripting")}}
