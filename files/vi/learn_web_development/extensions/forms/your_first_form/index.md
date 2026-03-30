---
title: Your first form
slug: Learn_web_development/Extensions/Forms/Your_first_form
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Forms/How_to_structure_a_web_form", "Learn_web_development/Extensions/Forms")}}

Bài viết đầu tiên trong loạt bài của chúng tôi cung cấp cho bạn trải nghiệm đầu tiên về việc tạo biểu mẫu web, bao gồm thiết kế biểu mẫu đơn giản, triển khai nó bằng các điều khiển biểu mẫu HTML và các phần tử HTML khác phù hợp, thêm một số kiểu dáng rất đơn giản thông qua CSS, và mô tả cách dữ liệu được gửi lên máy chủ.
Chúng ta sẽ mở rộng từng chủ đề con này chi tiết hơn ở phần sau trong mô-đun.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết cơ bản về
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >HTML</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Làm quen với biểu mẫu web là gì, chúng được dùng để làm gì, cách
        suy nghĩ về thiết kế chúng, và các phần tử HTML cơ bản bạn sẽ cần
        cho các trường hợp đơn giản.
      </td>
    </tr>
  </tbody>
</table>

## Biểu mẫu web là gì?

**Biểu mẫu web** là một trong những điểm tương tác chính giữa người dùng và trang web hoặc ứng dụng.
Biểu mẫu cho phép người dùng nhập dữ liệu, thường được gửi lên máy chủ web để xử lý và lưu trữ (xem [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data) ở phần sau trong mô-đun), hoặc được sử dụng phía máy khách để cập nhật giao diện ngay lập tức theo một cách nào đó (ví dụ, thêm mục khác vào danh sách, hoặc hiện/ẩn một tính năng giao diện người dùng).

HTML của biểu mẫu web được tạo thành từ một hoặc nhiều **điều khiển biểu mẫu** (đôi khi được gọi là **widget**), cộng thêm một số phần tử bổ sung giúp cấu trúc tổng thể biểu mẫu — chúng thường được gọi là **biểu mẫu HTML**.
Các điều khiển có thể là trường văn bản một dòng hoặc nhiều dòng, danh sách thả xuống, nút, hộp kiểm hoặc nút chọn, và chủ yếu được tạo bằng phần tử {{htmlelement("input")}}, mặc dù còn một số phần tử khác cần học.

Các điều khiển biểu mẫu cũng có thể được lập trình để áp đặt các định dạng hoặc giá trị cụ thể cần nhập (**kiểm tra hợp lệ biểu mẫu**), và được ghép với nhãn văn bản mô tả mục đích của chúng cho cả người dùng nhìn thấy và người dùng khiếm thị.

## Thiết kế biểu mẫu của bạn

Trước khi bắt đầu lập trình, luôn tốt hơn khi dừng lại và dành thời gian suy nghĩ về biểu mẫu của bạn. Thiết kế một bản phác thảo nhanh sẽ giúp bạn xác định tập dữ liệu đúng mà bạn muốn yêu cầu người dùng nhập. Từ góc độ trải nghiệm người dùng (UX), điều quan trọng cần nhớ là biểu mẫu càng lớn thì bạn càng có nguy cơ gây thất vọng cho người dùng và mất người dùng. Hãy giữ đơn giản và tập trung: chỉ hỏi về dữ liệu bạn thực sự cần.

Thiết kế biểu mẫu là một bước quan trọng khi bạn đang xây dựng trang web hoặc ứng dụng.
Việc tìm hiểu về trải nghiệm người dùng của biểu mẫu nằm ngoài phạm vi của bài viết này, nhưng nếu bạn muốn tìm hiểu sâu hơn về chủ đề đó, bạn nên đọc các bài viết sau:

- Smashing Magazine có một số [bài viết hay về UX của biểu mẫu](https://www.smashingmagazine.com/2018/08/ux-html5-mobile-form-part-1/), bao gồm một bài cũ hơn nhưng vẫn còn phù hợp là [Hướng dẫn toàn diện về khả năng sử dụng biểu mẫu web](https://www.smashingmagazine.com/2011/11/extensive-guide-web-form-usability/).
- UXMatters cũng là nguồn tài nguyên rất có giá trị với lời khuyên tốt từ [các thực hành tốt nhất cơ bản](https://www.uxmatters.com/mt/archives/2012/05/7-basic-best-practices-for-buttons.php) đến những vấn đề phức tạp như [biểu mẫu nhiều trang](https://www.uxmatters.com/mt/archives/2010/03/pagination-in-web-forms-evaluating-the-effectiveness-of-web-forms.php).

Trong bài viết này, chúng ta sẽ xây dựng một biểu mẫu liên hệ đơn giản. Hãy phác thảo sơ bộ.

![Biểu mẫu cần xây dựng, phác thảo sơ bộ](form-sketch-low.jpg)

Biểu mẫu của chúng ta sẽ chứa ba trường văn bản và một nút. Chúng ta yêu cầu người dùng cung cấp tên, địa chỉ email và tin nhắn họ muốn gửi. Nhấn nút sẽ gửi dữ liệu của họ lên máy chủ web.

## Triển khai HTML của biểu mẫu

Được rồi, hãy thử tạo HTML cho biểu mẫu của chúng ta. Chúng ta sẽ sử dụng các phần tử HTML sau: {{HTMLelement("form")}}, {{HTMLelement("label")}}, {{HTMLelement("input")}}, {{HTMLelement("textarea")}}, và {{HTMLelement("button")}}.

Trước khi tiếp tục, hãy tạo một bản sao cục bộ của [mẫu HTML đơn giản](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/getting-started/index.html) — bạn sẽ nhập HTML biểu mẫu vào đây.

### Phần tử `<form>`

Tất cả các biểu mẫu đều bắt đầu với một phần tử {{HTMLelement("form")}}, như sau:

```html
<form action="/my-handling-form-page" method="post">…</form>
```

Phần tử này định nghĩa chính thức một biểu mẫu. Nó là phần tử chứa như phần tử {{HTMLelement("section")}} hoặc {{HTMLelement("footer")}}, nhưng chuyên dùng cho việc chứa biểu mẫu; nó cũng hỗ trợ một số thuộc tính cụ thể để cấu hình cách biểu mẫu hoạt động. Tất cả các thuộc tính đều tùy chọn, nhưng thực hành tiêu chuẩn là luôn đặt ít nhất các thuộc tính [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) và [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method):

- Thuộc tính `action` xác định vị trí (URL) nơi dữ liệu đã thu thập của biểu mẫu sẽ được gửi khi biểu mẫu được gửi.
- Thuộc tính `method` xác định phương thức HTTP nào để gửi dữ liệu (thường là `get` hoặc `post`).

> [!NOTE]
> Chúng ta sẽ xem xét cách các thuộc tính đó hoạt động trong bài viết [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data) sau.

Bây giờ, hãy thêm phần tử {{htmlelement("form")}} ở trên vào trong {{htmlelement("body")}} HTML của bạn.

### Các phần tử `<label>`, `<input>`, và `<textarea>`

Biểu mẫu liên hệ của chúng ta không phức tạp: phần nhập dữ liệu chứa ba trường văn bản, mỗi trường có một {{HTMLelement("label")}} tương ứng:

- Trường nhập liệu cho tên là một {{HTMLelement("input/text", "trường văn bản một dòng")}}.
- Trường nhập liệu cho email là một {{HTMLelement("input/email", "đầu vào kiểu email")}}: một trường văn bản một dòng chỉ chấp nhận địa chỉ email.
- Trường nhập liệu cho tin nhắn là một {{HTMLelement("textarea")}}; một trường văn bản nhiều dòng.

Về mặt mã HTML, chúng ta cần một cái gì đó như sau để triển khai các widget biểu mẫu này:

```html
<form action="/my-handling-form-page" method="post">
  <p>
    <label for="name">Name:</label>
    <input type="text" id="name" name="user_name" />
  </p>
  <p>
    <label for="mail">Email:</label>
    <input type="email" id="mail" name="user_email" />
  </p>
  <p>
    <label for="msg">Message:</label>
    <textarea id="msg" name="user_message"></textarea>
  </p>
</form>
```

Cập nhật mã biểu mẫu của bạn để trông giống như trên.

Các phần tử {{HTMLelement("p")}} ở đây để cấu trúc mã thuận tiện và giúp tạo kiểu dễ hơn (xem phần sau trong bài viết).
Để đảm bảo khả năng sử dụng và tiếp cận, chúng ta thêm nhãn rõ ràng cho mỗi điều khiển biểu mẫu.
Lưu ý việc sử dụng thuộc tính [`for`](/en-US/docs/Web/HTML/Reference/Attributes/for) trên tất cả các phần tử {{HTMLelement("label")}}, nhận giá trị là [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của điều khiển biểu mẫu liên kết — đây là cách bạn liên kết điều khiển biểu mẫu với nhãn của nó.

Điều này có lợi ích tuyệt vời — nó liên kết nhãn với điều khiển biểu mẫu, cho phép người dùng chuột, bàn di chuột và thiết bị cảm ứng nhấp vào nhãn để kích hoạt điều khiển tương ứng, và nó cũng cung cấp tên có thể truy cập để trình đọc màn hình đọc cho người dùng của họ.
Bạn sẽ tìm thấy thêm chi tiết về nhãn biểu mẫu trong [Cách cấu trúc biểu mẫu web](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_structure_a_web_form).

Trên phần tử {{HTMLelement("input")}}, thuộc tính quan trọng nhất là thuộc tính `type`.
Thuộc tính này cực kỳ quan trọng vì nó xác định cách phần tử {{HTMLelement("input")}} hiển thị và hoạt động.
Bạn sẽ tìm thấy thêm về điều này trong bài viết [Điều khiển biểu mẫu gốc cơ bản](/en-US/docs/Learn_web_development/Extensions/Forms/Basic_native_form_controls) sau.

- Trong ví dụ đơn giản của chúng ta, chúng ta sử dụng giá trị {{HTMLelement("input/text", "text")}} cho trường nhập liệu đầu tiên — giá trị mặc định cho thuộc tính này.
  Nó đại diện cho trường văn bản một dòng cơ bản chấp nhận bất kỳ loại văn bản nào.
- Cho trường nhập liệu thứ hai, chúng ta sử dụng giá trị {{HTMLelement("input/email", "email")}}, định nghĩa một trường văn bản một dòng chỉ chấp nhận địa chỉ email được định dạng đúng.
  Điều này biến một trường văn bản cơ bản thành một loại trường "thông minh" sẽ thực hiện một số kiểm tra xác nhận trên dữ liệu được nhập bởi người dùng.
  Nó cũng khiến bố cục bàn phím phù hợp hơn để nhập địa chỉ email (ví dụ, với ký hiệu @ theo mặc định) xuất hiện trên các thiết bị có bàn phím động, như điện thoại thông minh.
  Bạn sẽ tìm hiểu thêm về kiểm tra hợp lệ biểu mẫu trong bài viết [kiểm tra hợp lệ biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation) sau.

Cuối cùng nhưng không kém phần quan trọng, hãy lưu ý cú pháp của `<input>` so với `<textarea></textarea>`.
Đây là một trong những điểm kỳ lạ của HTML.
Thẻ `<input>` là một {{glossary("void element")}}, nghĩa là nó không cần thẻ đóng.
{{HTMLElement("textarea")}} không phải là phần tử rỗng, nghĩa là nó phải được đóng bằng thẻ kết thúc đúng.
Điều này ảnh hưởng đến một tính năng cụ thể của biểu mẫu: cách bạn xác định giá trị mặc định.
Để xác định giá trị mặc định của phần tử {{HTMLElement("input")}} bạn phải sử dụng thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) như sau:

```html
<input type="text" value="by default this element is filled with this text" />
```

Mặt khác, nếu bạn muốn xác định giá trị mặc định cho {{HTMLElement("textarea")}}, bạn đặt nó giữa thẻ mở và thẻ đóng của phần tử {{HTMLElement("textarea")}}, như sau:

```html
<textarea>
by default this element is filled with this text
</textarea>
```

### Phần tử `<button>`

Đánh dấu cho biểu mẫu của chúng ta gần hoàn thành; chúng ta chỉ cần thêm một nút để cho phép người dùng gửi, hay "submit", dữ liệu của họ sau khi đã điền vào biểu mẫu.
Điều này được thực hiện bằng cách sử dụng phần tử {{HTMLelement("button")}}; hãy thêm đoạn sau ngay trên thẻ `</form>` đóng:

```html
<p class="button">
  <button type="submit">Send your message</button>
</p>
```

Phần tử {{htmlelement("button")}} cũng chấp nhận thuộc tính `type` — nhận một trong ba giá trị: `submit`, `reset`, hoặc `button`.

- Nhấp vào nút `submit` (giá trị mặc định) sẽ gửi dữ liệu của biểu mẫu đến trang web được xác định bởi thuộc tính `action` của phần tử {{HTMLelement("form")}}.
- Nhấp vào nút `reset` sẽ đặt lại tất cả các widget biểu mẫu về giá trị mặc định của chúng ngay lập tức. Từ góc độ UX, điều này được coi là thực hành xấu, vì vậy bạn nên tránh sử dụng loại nút này trừ khi bạn thực sự có lý do chính đáng.
- Nhấp vào nút `button` _không làm gì cả_! Điều đó nghe có vẻ buồn cười, nhưng nó cực kỳ hữu ích để xây dựng các nút tùy chỉnh — bạn có thể xác định chức năng đã chọn của chúng bằng JavaScript.

> [!NOTE]
> Bạn cũng có thể sử dụng phần tử {{HTMLElement("input")}} với `type` tương ứng để tạo nút, ví dụ `<input type="submit">`. Ưu điểm chính của phần tử {{HTMLelement("button")}} là phần tử {{HTMLelement("input")}} chỉ cho phép văn bản thuần trong nhãn của nó trong khi phần tử {{HTMLelement("button")}} cho phép nội dung HTML đầy đủ, cho phép nội dung nút phức tạp và sáng tạo hơn.

## Tạo kiểu biểu mẫu cơ bản

Bây giờ bạn đã viết xong mã HTML của biểu mẫu, hãy thử lưu và xem nó trong trình duyệt. Hiện tại, bạn sẽ thấy nó trông khá xấu.

> [!NOTE]
> Nếu bạn nghĩ mã HTML của mình không đúng, hãy thử so sánh với ví dụ hoàn chỉnh của chúng tôi — xem [first-form.html](https://github.com/mdn/learning-area/blob/main/html/forms/your-first-HTML-form/first-form.html) ([cũng xem trực tiếp](https://mdn.github.io/learning-area/html/forms/your-first-HTML-form/first-form.html)).

Biểu mẫu nổi tiếng khó tạo kiểu đẹp. Việc dạy bạn tạo kiểu biểu mẫu chi tiết nằm ngoài phạm vi của bài viết này, vì vậy hiện tại chúng ta chỉ cần thêm một số CSS để trông ổn.

Trước tiên, hãy thêm một phần tử {{htmlelement("style")}} vào trang của bạn, bên trong head HTML. Nó trông như sau:

```html
<style>
  /* CSS goes here */
</style>
```

Bên trong các thẻ `style`, hãy thêm CSS sau:

```css
body {
  /* Center the form on the page */
  text-align: center;
}

form {
  display: inline-block;
  /* Form outline */
  padding: 1em;
  border: 1px solid #cccccc;
  border-radius: 1em;
}

p + p {
  margin-top: 1em;
}

label {
  /* Uniform size & alignment */
  display: inline-block;
  min-width: 90px;
  text-align: right;
}

input,
textarea {
  /* To make sure that all text fields have the same font settings
     By default, text areas have a monospace font */
  font: 1em sans-serif;
  /* Uniform text field size */
  width: 300px;
  box-sizing: border-box;
  /* Match form field borders */
  border: 1px solid #999999;
}

input:focus,
textarea:focus {
  /* Set the outline width and style */
  outline-style: solid;
  /* To give a little highlight on active elements */
  outline-color: black;
}

textarea {
  /* Align multiline text fields with their labels */
  vertical-align: top;
  /* Provide space to type some text */
  height: 5em;
}

.button {
  /* Align buttons with the text fields */
  padding-left: 90px; /* same size as the label elements */
}

button {
  /* This extra margin represent roughly the same space as the space
     between the labels and their text fields */
  margin-left: 0.5em;
}
```

Lưu và tải lại, bạn sẽ thấy biểu mẫu của bạn trông đẹp hơn nhiều.

> [!NOTE]
> Bạn có thể tìm phiên bản của chúng tôi trên GitHub tại [first-form-styled.html](https://github.com/mdn/learning-area/blob/main/html/forms/your-first-HTML-form/first-form-styled.html) ([cũng xem trực tiếp](https://mdn.github.io/learning-area/html/forms/your-first-HTML-form/first-form-styled.html)).

## Gửi dữ liệu biểu mẫu lên máy chủ web của bạn

Phần cuối cùng, và có lẽ là khó nhất, là xử lý dữ liệu biểu mẫu ở phía máy chủ.
Phần tử {{HTMLelement("form")}} xác định nơi và cách gửi dữ liệu nhờ vào các thuộc tính [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) và [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method).

Chúng ta cung cấp thuộc tính `name` cho mỗi điều khiển biểu mẫu.
Các tên quan trọng ở cả phía máy khách và phía máy chủ; chúng cho trình duyệt biết tên nào để gán cho từng phần dữ liệu, và ở phía máy chủ, chúng cho phép máy chủ xử lý từng phần dữ liệu theo tên.
Dữ liệu biểu mẫu được gửi lên máy chủ dưới dạng các cặp tên/giá trị.

Để đặt tên cho dữ liệu trong biểu mẫu, bạn cần sử dụng thuộc tính `name` trên mỗi widget biểu mẫu sẽ thu thập một phần dữ liệu cụ thể.
Hãy xem lại một phần mã biểu mẫu của chúng ta:

```html
<form action="/my-handling-form-page" method="post">
  <p>
    <label for="name">Name:</label>
    <input type="text" id="name" name="user_name" />
  </p>
  <p>
    <label for="mail">Email:</label>
    <input type="email" id="mail" name="user_email" />
  </p>
  <p>
    <label for="msg">Message:</label>
    <textarea id="msg" name="user_message"></textarea>
  </p>

  …
</form>
```

Trong ví dụ của chúng ta, biểu mẫu sẽ gửi 3 phần dữ liệu có tên là `user_name`, `user_email`, và `user_message`.
Dữ liệu đó sẽ được gửi đến URL `/my-handling-form-page` bằng phương thức [HTTP `POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST).

Ở phía máy chủ, tập lệnh tại URL `/my-handling-form-page` sẽ nhận dữ liệu dưới dạng danh sách 3 mục khóa/giá trị chứa trong yêu cầu HTTP.
Cách tập lệnh này xử lý dữ liệu đó tùy thuộc vào bạn.
Mỗi ngôn ngữ phía máy chủ (PHP, Python, Ruby, Java, C#, v.v.) có cơ chế riêng để xử lý dữ liệu biểu mẫu.
Việc tìm hiểu sâu về chủ đề đó nằm ngoài phạm vi của hướng dẫn này, nhưng nếu bạn muốn biết thêm, chúng tôi đã cung cấp một số ví dụ trong bài viết [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data) sau.

## Tóm tắt

Chúc mừng, bạn đã xây dựng biểu mẫu web đầu tiên của mình. Nó trông như này khi chạy trực tiếp:

```html hidden
<form action="/my-handling-form-page" method="post">
  <div>
    <label for="name">Name:</label>
    <input type="text" id="name" name="user_name" />
  </div>

  <div>
    <label for="mail">Email:</label>
    <input type="email" id="mail" name="user_email" />
  </div>

  <div>
    <label for="msg">Message:</label>
    <textarea id="msg" name="user_message"></textarea>
  </div>

  <div class="button">
    <button type="submit">Send your message</button>
  </div>
</form>
```

```css hidden
form {
  /* Just to center the form on the page */
  margin: 0 auto;
  width: 400px;

  /* To see the limits of the form */
  padding: 1em;
  border: 1px solid #cccccc;
  border-radius: 1em;
}

div + div {
  margin-top: 1em;
}

label {
  /* To make sure that all label have the same size and are properly align */
  display: inline-block;
  width: 90px;
  text-align: right;
}

input,
textarea {
  /* To make sure that all text field have the same font settings
     By default, textarea are set with a monospace font */
  font: 1em sans-serif;

  /* To give the same size to all text field */
  width: 300px;

  -moz-box-sizing: border-box;
  box-sizing: border-box;

  /* To harmonize the look & feel of text field border */
  border: 1px solid #999999;
}

input:focus,
textarea:focus {
  /* To give a little highlight on active elements */
  border-color: black;
}

textarea {
  /* To properly align multiline text field with their label */
  vertical-align: top;

  /* To give enough room to type some text */
  height: 5em;

  /* To allow users to resize any textarea vertically
     It works only on Chrome, Firefox and Safari */
  resize: vertical;
}

.button {
  /* To position the buttons to the same position of the text fields */
  padding-left: 90px; /* same size as the label elements */
}

button {
  /* This extra margin represent the same space as the space between
     the labels and their text fields */
  margin-left: 0.5em;
}
```

{{ EmbedLiveSample('Summary', '', '300') }}

Đây mới chỉ là bước khởi đầu — bây giờ là lúc nhìn sâu hơn. Biểu mẫu có nhiều sức mạnh hơn những gì chúng ta đã thấy ở đây và các bài viết khác trong mô-đun này sẽ giúp bạn nắm vững phần còn lại.

{{NextMenu("Learn_web_development/Extensions/Forms/How_to_structure_a_web_form", "Learn_web_development/Extensions/Forms")}}
