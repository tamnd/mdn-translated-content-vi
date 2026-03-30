---
title: Giới thiệu về DOM scripting
short-title: DOM scripting
slug: Learn_web_development/Core/Scripting/DOM_scripting
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Object_basics","Learn_web_development/Core/Scripting/Image_gallery", "Learn_web_development/Core/Scripting")}}

Khi viết các trang web và ứng dụng, một trong những việc phổ biến nhất bạn muốn làm là thay đổi cấu trúc tài liệu theo một cách nào đó. Điều này thường được thực hiện bằng cách thao tác với Mô hình đối tượng tài liệu (DOM) thông qua một tập hợp các API trình duyệt tích hợp sẵn để kiểm soát HTML và thông tin định dạng. Trong bài viết này, chúng tôi sẽ giới thiệu cho bạn về **DOM scripting**.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">kiến thức cơ bản về CSS</a>, quen thuộc với kiến thức cơ bản về JavaScript như đã trình bày trong các bài học trước.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>DOM là gì — biểu diễn nội bộ của trình duyệt về cấu trúc HTML của tài liệu dưới dạng phân cấp đối tượng.</li>
          <li>Các phần quan trọng của một trình duyệt web được biểu diễn trong JavaScript — <code>Navigator</code>, <code>Window</code>, và <code>Document</code>.</li>
          <li>Cách các nút DOM tồn tại tương đối với nhau trong cây DOM — gốc, cha, con, anh chị em và hậu duệ.</li>
          <li>Lấy tham chiếu đến các nút DOM, tạo nút mới, thêm và xóa nút và thuộc tính.</li>
          <li>Thao tác các kiểu CSS bằng JavaScript.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Các phần quan trọng của trình duyệt web

Trình duyệt web là phần mềm rất phức tạp với nhiều bộ phận chuyển động, nhiều trong số đó không thể được kiểm soát hoặc thao tác bởi nhà phát triển web sử dụng JavaScript. Bạn có thể nghĩ rằng những hạn chế như vậy là điều xấu, nhưng trình duyệt bị hạn chế vì những lý do chính đáng, chủ yếu liên quan đến bảo mật. Hãy tưởng tượng nếu một trang web có thể truy cập vào mật khẩu đã lưu trữ hoặc thông tin nhạy cảm khác của bạn, và đăng nhập vào các trang web như thể đó là bạn?

Mặc dù có những hạn chế, Web API vẫn cung cấp cho chúng ta quyền truy cập vào rất nhiều chức năng cho phép chúng ta làm được rất nhiều việc với các trang web. Có một vài phần thực sự rõ ràng mà bạn sẽ tham chiếu thường xuyên trong mã của mình — hãy xem sơ đồ sau, đại diện cho các phần chính của trình duyệt trực tiếp liên quan đến việc xem trang web:

![Các phần quan trọng của trình duyệt web; tài liệu là trang web. Cửa sổ bao gồm toàn bộ tài liệu và cả tab. Navigator là trình duyệt, bao gồm cửa sổ (bao gồm tài liệu) và tất cả các cửa sổ khác.](document-window-navigator.png)

- **Window** đại diện cho tab trình duyệt nơi trang web được tải vào; điều này được biểu diễn trong JavaScript bởi đối tượng {{domxref("Window")}}. Sử dụng các phương thức có sẵn trên đối tượng này, bạn có thể làm những việc như trả về kích thước của cửa sổ (xem {{domxref("Window.innerWidth")}} và {{domxref("Window.innerHeight")}}), thao tác tài liệu được tải vào cửa sổ đó, lưu dữ liệu cụ thể cho tài liệu đó phía máy khách (ví dụ sử dụng cơ sở dữ liệu cục bộ hoặc cơ chế lưu trữ khác), đính kèm [trình xử lý sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Events) vào cửa sổ hiện tại, và nhiều hơn nữa.
- **Navigator** đại diện cho trạng thái và danh tính của trình duyệt khi nó tồn tại trên web. Trong JavaScript, điều này được biểu diễn bởi đối tượng {{domxref("Navigator")}}. Bạn có thể sử dụng đối tượng này để lấy những thứ như ngôn ngữ ưa thích của người dùng, luồng phương tiện từ webcam của người dùng, v.v.
- **Document** (được biểu diễn bởi DOM trong các trình duyệt) là trang thực tế được tải vào cửa sổ, và được biểu diễn trong JavaScript bởi đối tượng {{domxref("Document")}}. Bạn có thể sử dụng đối tượng này để trả về và thao tác thông tin trên HTML và CSS tạo nên tài liệu, ví dụ lấy tham chiếu đến một phần tử trong DOM, thay đổi nội dung văn bản của nó, áp dụng các kiểu mới cho nó, tạo các phần tử mới và thêm chúng vào phần tử hiện tại dưới dạng con, hoặc thậm chí xóa nó hoàn toàn.

Trong bài viết này, chúng ta sẽ tập trung chủ yếu vào việc thao tác tài liệu, nhưng chúng ta sẽ hiển thị thêm một số phần hữu ích khác.

## Mô hình đối tượng tài liệu

Hãy cung cấp một bản tóm tắt ngắn gọn về Mô hình đối tượng tài liệu (DOM), mà chúng ta cũng đã xem xét trước đó trong khóa học. Tài liệu hiện được tải trong mỗi tab trình duyệt của bạn được biểu diễn bởi một DOM. Đây là biểu diễn "cấu trúc cây" được tạo bởi trình duyệt cho phép cấu trúc HTML được truy cập dễ dàng bởi các ngôn ngữ lập trình — ví dụ, bản thân trình duyệt sử dụng nó để áp dụng định dạng và các thông tin khác cho các phần tử đúng khi nó hiển thị một trang, và các nhà phát triển như bạn có thể thao tác DOM với JavaScript sau khi trang đã được hiển thị.

> [!NOTE]
> [The Document Object Model](https://scrimba.com/learn-javascript-c0v/~0g?via=mdn) của Scrimba <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp hướng dẫn hữu ích về thuật ngữ "DOM" và ý nghĩa của nó.

Chúng ta đã tạo một trang ví dụ tại [dom-example.html](https://github.com/mdn/learning-area/blob/main/javascript/apis/document-manipulation/dom-example.html) ([xem trực tiếp](https://mdn.github.io/learning-area/javascript/apis/document-manipulation/dom-example.html)). Hãy thử mở trang này trong trình duyệt của bạn — đây là một trang rất đơn giản chứa phần tử {{htmlelement("section")}} bên trong bạn có thể tìm thấy một hình ảnh và một đoạn văn với một liên kết bên trong. Mã nguồn HTML trông như thế này:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Simple DOM example</title>
  </head>
  <body>
    <section>
      <img
        src="dinosaur.png"
        alt="A red Tyrannosaurus Rex: A two legged dinosaur
        standing upright like a human, with small arms, and a
        large head with lots of sharp teeth." />
      <p>
        Here we will add a link to the
        <a href="https://www.mozilla.org/">Mozilla homepage</a>
      </p>
    </section>
  </body>
</html>
```

Mặt khác, DOM trông như thế này:

![Biểu diễn cấu trúc cây của Mô hình đối tượng tài liệu: Nút trên cùng là doctype và phần tử HTML. Các nút con của HTML bao gồm head và body. Mỗi phần tử con là một nhánh. Tất cả văn bản, kể cả khoảng trắng, cũng được hiển thị.](dom-screenshot.png)

> [!NOTE]
> Sơ đồ cây DOM này được tạo bằng [Live DOM viewer](https://software.hixie.ch/utilities/js/live-dom-viewer/) của Ian Hickson.

Mỗi mục nhập trong cây được gọi là một **nút**. Bạn có thể thấy trong sơ đồ trên rằng một số nút đại diện cho các phần tử (được xác định là `HTML`, `HEAD`, `META` và các phần tử khác) và những nút khác đại diện cho văn bản (được xác định là `#text`). Có [các loại nút khác cũng vậy](/en-US/docs/Web/API/Node/nodeType), nhưng đây là những loại chính bạn sẽ gặp.

Các nút cũng được tham chiếu theo vị trí của chúng trong cây tương đối với các nút khác:

- **Nút gốc**: Nút trên cùng trong cây, trong trường hợp HTML luôn là nút `HTML` (các từ vựng đánh dấu khác như SVG và XML tùy chỉnh sẽ có các phần tử gốc khác nhau).
- **Nút con**: Một nút _trực tiếp_ bên trong nút khác. Ví dụ, `IMG` là con của `SECTION` trong ví dụ trên.
- **Nút hậu duệ**: Một nút _bất kỳ nơi nào_ bên trong nút khác. Ví dụ, `IMG` là con của `SECTION` trong ví dụ trên, và nó cũng là hậu duệ. `IMG` không phải là con của `BODY`, vì nó ở hai cấp bên dưới trong cây, nhưng nó là hậu duệ của `BODY`.
- **Nút cha**: Một nút có nút khác bên trong. Ví dụ, `BODY` là nút cha của `SECTION` trong ví dụ trên.
- **Nút anh chị em**: Các nút nằm cùng cấp dưới cùng một nút cha trong cây DOM. Ví dụ, `IMG` và `P` là anh chị em trong ví dụ trên.

Việc quen thuộc với thuật ngữ này trước khi làm việc với DOM rất hữu ích, vì một số thuật ngữ mã bạn sẽ gặp sử dụng chúng. Bạn cũng sẽ gặp chúng trong CSS (ví dụ, bộ chọn hậu duệ, bộ chọn con).

## Thực hiện một số thao tác DOM cơ bản

Để bắt đầu tìm hiểu về thao tác DOM, hãy bắt đầu với một ví dụ thực tế.

1. Lấy bản sao cục bộ của [trang dom-example.html](https://github.com/mdn/learning-area/blob/main/javascript/apis/document-manipulation/dom-example.html) và [hình ảnh](https://github.com/mdn/learning-area/blob/main/javascript/apis/document-manipulation/dinosaur.png) đi kèm với nó.
2. Thêm phần tử `<script></script>` ngay phía trên thẻ đóng `</body>`.
3. Để thao tác một phần tử bên trong DOM, trước tiên bạn cần chọn nó và lưu tham chiếu vào bên trong một biến. Bên trong phần tử script của bạn, thêm dòng sau:

   ```js
   const link = document.querySelector("a");
   ```

4. Bây giờ chúng ta có tham chiếu phần tử được lưu trong một biến, chúng ta có thể bắt đầu thao tác với nó bằng các thuộc tính và phương thức có sẵn cho nó (những điều này được định nghĩa trên các giao diện như {{domxref("HTMLAnchorElement")}} trong trường hợp phần tử {{htmlelement("a")}}, giao diện cha chung hơn {{domxref("HTMLElement")}}, và {{domxref("Node")}} — đại diện cho tất cả các nút trong DOM). Trước tiên, hãy thay đổi văn bản bên trong liên kết bằng cách cập nhật giá trị của thuộc tính {{domxref("Node.textContent")}}. Thêm dòng sau bên dưới dòng trước:

   ```js
   link.textContent = "Mozilla Developer Network";
   ```

5. Chúng ta cũng nên thay đổi URL mà liên kết đang trỏ đến, để nó không đi đến nơi sai khi được nhấp. Thêm dòng sau, một lần nữa ở dưới cùng:

   ```js
   link.href = "https://developer.mozilla.org";
   ```

Lưu ý rằng, như với nhiều thứ trong JavaScript, có nhiều cách để chọn một phần tử và lưu tham chiếu đến nó trong một biến. {{domxref("Document.querySelector()")}} là cách tiếp cận hiện đại được khuyến nghị. Nó thuận tiện vì cho phép bạn chọn các phần tử bằng bộ chọn CSS. Lời gọi `querySelector()` ở trên sẽ khớp với phần tử {{htmlelement("a")}} đầu tiên xuất hiện trong tài liệu. Nếu bạn muốn khớp và làm việc với nhiều phần tử, bạn có thể sử dụng {{domxref("Document.querySelectorAll()")}}, khớp với mọi phần tử trong tài liệu khớp với bộ chọn, và lưu tham chiếu đến chúng trong một đối tượng giống như [mảng](/en-US/docs/Learn_web_development/Core/Scripting/Arrays) được gọi là {{domxref("NodeList")}}.

Có các phương thức cũ hơn để lấy tham chiếu phần tử, chẳng hạn:

- {{domxref("Document.getElementById()")}}, chọn một phần tử có giá trị thuộc tính `id` nhất định, ví dụ `<p id="myId">My paragraph</p>`. ID được truyền cho hàm dưới dạng tham số, tức là `const elementRef = document.getElementById('myId')`.
- {{domxref("Document.getElementsByTagName()")}}, trả về một đối tượng giống mảng chứa tất cả các phần tử trên trang thuộc một loại nhất định, ví dụ `<p>`, `<a>`, v.v. Loại phần tử được truyền cho hàm dưới dạng tham số, tức là `const elementRefArray = document.getElementsByTagName('p')`.

Hai phương thức này hoạt động tốt hơn trong các trình duyệt cũ hơn so với các phương thức hiện đại như `querySelector()`, nhưng không thuận tiện bằng. Hãy nhìn và xem bạn có thể tìm thấy những phương thức nào khác!

### Tạo và đặt các nút mới

Phần trên đã cho bạn một cái nhìn nhỏ về những gì bạn có thể làm, nhưng hãy đi xa hơn và xem cách chúng ta có thể tạo các phần tử mới.

1. Quay lại ví dụ hiện tại, hãy bắt đầu bằng cách lấy tham chiếu đến phần tử {{htmlelement("section")}} của chúng ta — thêm mã sau ở dưới cùng của script hiện tại của bạn (làm tương tự với các dòng khác cũng vậy):

   ```js
   const sect = document.querySelector("section");
   ```

2. Bây giờ hãy tạo một đoạn văn mới bằng cách sử dụng {{domxref("Document.createElement()")}} và cung cấp cho nó một số nội dung văn bản theo cách tương tự như trước:

   ```js
   const para = document.createElement("p");
   para.textContent = "We hope you enjoyed the ride.";
   ```

3. Bây giờ bạn có thể thêm đoạn văn mới vào cuối phần bằng cách sử dụng {{domxref("Node.appendChild()")}}:

   ```js
   sect.appendChild(para);
   ```

4. Cuối cùng cho phần này, hãy thêm một nút văn bản vào đoạn văn mà liên kết nằm bên trong, để kết thúc câu một cách gọn gàng. Đầu tiên, chúng ta sẽ tạo nút văn bản bằng cách sử dụng {{domxref("Document.createTextNode()")}}:

   ```js
   const text = document.createTextNode(
     " — the premier source for web development knowledge.",
   );
   ```

5. Bây giờ chúng ta sẽ lấy tham chiếu đến đoạn văn mà liên kết nằm bên trong, và thêm nút văn bản vào đó:

   ```js
   const linkPara = document.querySelector("p");
   linkPara.appendChild(text);
   ```

Đó là hầu hết những gì bạn cần để thêm các nút vào DOM — bạn sẽ sử dụng nhiều các phương thức này khi xây dựng giao diện động (chúng ta sẽ xem một số ví dụ sau).

### Di chuyển và xóa phần tử

Có thể có những lúc bạn muốn di chuyển các nút, hoặc xóa chúng khỏi DOM hoàn toàn. Điều này hoàn toàn có thể thực hiện được.

Nếu chúng ta muốn di chuyển đoạn văn có liên kết bên trong xuống cuối phần, chúng ta có thể làm điều này:

```js
sect.appendChild(linkPara);
```

Điều này di chuyển đoạn văn xuống cuối phần. Bạn có thể đã nghĩ rằng nó sẽ tạo ra bản sao thứ hai, nhưng đây không phải là trường hợp — `linkPara` là tham chiếu đến bản sao duy nhất của đoạn văn đó. Nếu bạn muốn tạo bản sao và thêm nó vào, bạn sẽ cần sử dụng {{domxref("Node.cloneNode()")}} thay thế.

Xóa một nút cũng khá đơn giản, ít nhất là khi bạn có tham chiếu đến nút cần xóa và nút cha của nó. Trong trường hợp hiện tại của chúng ta, chúng ta chỉ cần sử dụng {{domxref("Node.removeChild()")}}, như thế này:

```js
sect.removeChild(linkPara);
```

Khi bạn muốn xóa một nút chỉ dựa trên tham chiếu đến chính nó, điều này khá phổ biến, bạn có thể sử dụng {{domxref("Element.remove()")}}:

```js
linkPara.remove();
```

Phương thức này không được hỗ trợ trong các trình duyệt cũ hơn. Chúng không có phương thức để yêu cầu một nút tự xóa, vì vậy bạn sẽ phải làm như sau:

```js
linkPara.parentNode.removeChild(linkPara);
```

Hãy thử thêm các dòng trên vào mã của bạn.

### Thao tác các kiểu

Có thể thao tác các kiểu CSS thông qua JavaScript theo nhiều cách khác nhau.

Để bắt đầu, bạn có thể lấy danh sách tất cả các stylesheets được đính kèm vào một tài liệu bằng cách sử dụng {{domxref("Document.styleSheets")}}, trả về một đối tượng giống mảng với các đối tượng {{domxref("CSSStyleSheet")}}. Bạn có thể thêm/xóa các kiểu theo ý muốn. Tuy nhiên, chúng ta sẽ không mở rộng về các tính năng đó vì chúng là cách thao tác kiểu hơi lỗi thời và khó. Có những cách dễ hơn nhiều.

Cách đầu tiên là thêm các kiểu inline trực tiếp vào các phần tử bạn muốn tạo kiểu động. Điều này được thực hiện bằng thuộc tính {{domxref("HTMLElement.style")}}, chứa thông tin tạo kiểu inline cho mỗi phần tử trong tài liệu. Bạn có thể đặt các thuộc tính của đối tượng này để cập nhật trực tiếp các kiểu phần tử.

1. Như một ví dụ, hãy thử thêm các dòng này vào ví dụ đang thực hiện của chúng ta:

   ```js
   para.style.color = "white";
   para.style.backgroundColor = "black";
   para.style.padding = "10px";
   para.style.width = "250px";
   para.style.textAlign = "center";
   ```

2. Tải lại trang và bạn sẽ thấy các kiểu đã được áp dụng cho đoạn văn. Nếu bạn xem đoạn văn đó trong [Trình kiểm tra trang/Trình kiểm tra DOM](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/index.html) của trình duyệt, bạn sẽ thấy rằng các dòng này thực sự đang thêm kiểu inline vào tài liệu:

   ```html
   <p
     style="color: white; background-color: black; padding: 10px; width: 250px; text-align: center;">
     We hope you enjoyed the ride.
   </p>
   ```

> [!NOTE]
> Lưu ý cách các phiên bản thuộc tính JavaScript của các kiểu CSS được viết theo {{Glossary("camel_case", "chữ thường camelCase")}} trong khi các phiên bản CSS được gạch nối ({{Glossary("kebab_case", "kebab-case")}}) (ví dụ, `backgroundColor` so với `background-color`). Hãy chắc chắn rằng bạn không nhầm lẫn chúng, nếu không nó sẽ không hoạt động.

Có một cách phổ biến khác để thao tác động các kiểu trên tài liệu của bạn, đó là viết các kiểu trong một stylesheet riêng biệt, và tham chiếu đến các kiểu đó bằng cách thêm/xóa tên lớp.

1. Xóa năm dòng trước đó bạn đã thêm vào JavaScript.
2. Thêm nội dung sau vào trong {{htmlelement("head")}} HTML của bạn:

   ```html
   <style>
     .highlight {
       color: white;
       background-color: black;
       padding: 10px;
       width: 250px;
       text-align: center;
     }
   </style>
   ```

3. Để thêm tên lớp này vào phần tử của bạn, hãy sử dụng phương thức `add()` của {{domxref("Element/classList", "classList")}} của phần tử:

   ```js
   para.classList.add("highlight");
   ```

4. Làm mới trang của bạn, và bạn sẽ không thấy sự thay đổi — CSS vẫn được áp dụng cho đoạn văn, nhưng lần này bằng cách cung cấp cho nó một lớp được chọn bởi quy tắc CSS của chúng ta, không phải là kiểu CSS inline.

Phương thức bạn chọn tùy thuộc vào bạn; cả hai đều có ưu điểm và nhược điểm của chúng. Phương thức đầu tiên ít cài đặt hơn và tốt cho các trường hợp sử dụng đơn giản, trong khi phương thức thứ hai thuần túy hơn (không pha trộn CSS và JavaScript, không có kiểu inline, được xem là thực hành xấu). Khi bạn bắt đầu xây dựng các ứng dụng lớn hơn và phức tạp hơn, bạn có thể sẽ bắt đầu sử dụng phương thức thứ hai nhiều hơn, nhưng thực sự tùy thuộc vào bạn.

Tại thời điểm này, chúng ta thực sự chưa làm được gì hữu ích! Không có ý nghĩa gì khi sử dụng JavaScript để tạo nội dung tĩnh — bạn cũng có thể chỉ viết nó vào HTML và không sử dụng JavaScript. Nó phức tạp hơn HTML, và việc tạo nội dung bằng JavaScript cũng có những vấn đề khác đi kèm (chẳng hạn như không thể đọc được bởi các công cụ tìm kiếm).

Trong phần tiếp theo, chúng ta sẽ xem xét một trường hợp sử dụng thực tế hơn của DOM API.

> [!NOTE]
> Bạn có thể tìm thấy [phiên bản hoàn chỉnh của dom-example.html](https://github.com/mdn/learning-area/blob/main/javascript/apis/document-manipulation/dom-example-manipulated.html) demo trên GitHub ([xem trực tiếp cũng vậy](https://mdn.github.io/learning-area/javascript/apis/document-manipulation/dom-example-manipulated.html)).

## Tạo danh sách mua sắm động

Trong bài tập này, chúng ta muốn bạn xây dựng một danh sách mua sắm động cho phép bạn thêm các mục bằng cách sử dụng biểu mẫu nhập và nút. Sau khi bạn nhập một mục vào trường nhập và nhấp nút hoặc nhấn phím <kbd>Enter</kbd>, những điều sau sẽ xảy ra:

- Mục sẽ xuất hiện trong danh sách.
- Mỗi mục nên có một nút cạnh nó để xóa mục khỏi danh sách khi được nhấp.
- Các trường nhập sẽ được xóa và lấy tiêu điểm, sẵn sàng cho mục nhập tiếp theo.

Demo hoàn chỉnh sẽ trông giống như sau — hãy thử nó trước khi bạn xây dựng!

```html hidden live-sample___dynamic-shopping-list
<h1>My shopping list</h1>

<form>
  <label for="item">Enter a new item:</label>
  <input type="text" name="item" id="item" />
  <button>Add item</button>
</form>

<ul></ul>
```

```css hidden live-sample___dynamic-shopping-list
li {
  margin-bottom: 10px;
}

li button {
  font-size: 12px;
  margin-left: 20px;
}
```

```js hidden live-sample___dynamic-shopping-list
const list = document.querySelector("ul");
const input = document.querySelector("input");
const button = document.querySelector("button");

button.addEventListener("click", (event) => {
  event.preventDefault();

  const myItem = input.value;
  input.value = "";

  const listItem = document.createElement("li");
  const listText = document.createElement("span");
  const listBtn = document.createElement("button");

  listItem.appendChild(listText);
  listText.textContent = myItem;
  listItem.appendChild(listBtn);
  listBtn.textContent = "Delete";
  list.appendChild(listItem);

  listBtn.addEventListener("click", () => {
    list.removeChild(listItem);
  });

  input.focus();
});
```

{{EmbedLiveSample("dynamic-shopping-list", "100%", 300)}}

Để hoàn thành bài tập, hãy làm theo các bước dưới đây, và đảm bảo rằng danh sách hoạt động như mô tả ở trên.

1. Để bắt đầu, tải xuống bản sao của tệp khởi đầu [shopping-list.html](https://github.com/mdn/learning-area/blob/main/javascript/apis/document-manipulation/shopping-list.html) và tạo bản sao của nó ở đâu đó. Bạn sẽ thấy rằng nó có một số CSS tối thiểu, một biểu mẫu với nhãn, nhập và nút, một danh sách trống và phần tử {{htmlelement("script")}}. Bạn sẽ thực hiện tất cả các bổ sung bên trong script.
2. Tạo ba biến giữ tham chiếu đến các phần tử danh sách ({{htmlelement("ul")}}), {{htmlelement("input")}} và {{htmlelement("button")}}.
3. Tạo một [hàm](/en-US/docs/Learn_web_development/Core/Scripting/Functions) sẽ chạy để phản hồi khi nút được nhấp.
4. Bên trong thân hàm, bắt đầu bằng cách gọi [`preventDefault()`](/en-US/docs/Web/API/Event/preventDefault). Vì trường nhập được bọc trong phần tử biểu mẫu, việc nhấn phím <kbd>Enter</kbd> sẽ kích hoạt biểu mẫu gửi. Lời gọi `preventDefault()` sẽ ngăn biểu mẫu làm mới trang để một mục mới có thể được thêm vào danh sách thay thế.
5. Tiếp tục bằng cách lưu trữ [giá trị](/en-US/docs/Web/API/HTMLInputElement/value) hiện tại của trường nhập trong một biến.
6. Tiếp theo, xóa phần tử nhập bằng cách đặt giá trị của nó thành chuỗi rỗng (`""`).
7. Tạo ba phần tử mới — một mục danh sách ({{htmlelement('li')}}), một {{htmlelement('span')}} và một {{htmlelement('button')}} — và lưu chúng trong các biến.
8. Thêm span và button dưới dạng con của mục danh sách.
9. Đặt nội dung văn bản của span thành giá trị nhập bạn đã lưu trước đó, và đặt nội dung văn bản của button thành `Delete`.
10. Thêm mục danh sách vào danh sách.
11. Đính kèm trình xử lý sự kiện vào nút **Delete** sao cho khi được nhấp, nó xóa toàn bộ mục danh sách (`<li>...</li>`).
12. Cuối cùng, sử dụng phương thức [`focus()`](/en-US/docs/Web/API/HTMLElement/focus) để lấy tiêu điểm phần tử nhập, để nó sẵn sàng nhập mục danh sách mua sắm tiếp theo.

## Tóm tắt

Chúng ta đã đến cuối phần nghiên cứu về thao tác tài liệu và DOM. Tại thời điểm này, bạn nên hiểu các phần quan trọng của trình duyệt web liên quan đến việc kiểm soát tài liệu và các khía cạnh khác của trải nghiệm web của người dùng. Quan trọng nhất, bạn nên hiểu Mô hình đối tượng tài liệu là gì, và cách thao tác với nó để tạo ra chức năng hữu ích.

## Xem thêm

- Có nhiều tính năng hơn bạn có thể sử dụng để thao tác tài liệu của mình. Kiểm tra một số tham chiếu của chúng ta và xem bạn có thể khám phá được gì:
  - {{domxref("Document")}}
  - {{domxref("Window")}}
  - {{domxref("Node")}}
  - {{domxref("HTMLElement")}}, {{domxref("HTMLInputElement")}}, {{domxref("HTMLImageElement")}}, v.v.
- [DOM Scripting](https://explainers.dev/dom-scripting/), explainers.dev

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Object_basics","Learn_web_development/Core/Scripting/Image_gallery", "Learn_web_development/Core/Scripting")}}
