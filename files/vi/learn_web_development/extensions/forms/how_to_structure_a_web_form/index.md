---
title: How to structure a web form
slug: Learn_web_development/Extensions/Forms/How_to_structure_a_web_form
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Your_first_form", "Learn_web_development/Extensions/Forms/Basic_native_form_controls", "Learn_web_development/Extensions/Forms")}}

Sau khi nắm vững những kiến thức cơ bản, chúng ta sẽ xem xét chi tiết hơn các phần tử được sử dụng để cung cấp cấu trúc và ý nghĩa cho các phần khác nhau của biểu mẫu.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết cơ bản về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu cách cấu trúc biểu mẫu HTML và cung cấp ngữ nghĩa cho chúng để chúng có thể sử dụng được và có thể tiếp cận.
      </td>
    </tr>
  </tbody>
</table>

Sự linh hoạt của biểu mẫu khiến chúng là một trong những cấu trúc phức tạp nhất trong [HTML](/en-US/docs/Learn_web_development/Core/Structuring_content); bạn có thể xây dựng bất kỳ loại biểu mẫu cơ bản nào bằng cách sử dụng các phần tử và thuộc tính biểu mẫu chuyên dụng. Sử dụng cấu trúc đúng khi xây dựng biểu mẫu HTML sẽ giúp đảm bảo biểu mẫu vừa có thể sử dụng vừa [có thể tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility).

## Phần tử \<form>

Phần tử {{HTMLElement("form")}} định nghĩa chính thức một biểu mẫu và các thuộc tính xác định hành vi của biểu mẫu. Mỗi khi bạn muốn tạo một biểu mẫu HTML, bạn phải bắt đầu bằng cách sử dụng phần tử này, lồng tất cả nội dung bên trong. Nhiều công nghệ hỗ trợ và plugin trình duyệt có thể phát hiện các phần tử {{HTMLElement("form")}} và triển khai các móc nối đặc biệt để giúp chúng dễ sử dụng hơn.

Chúng ta đã gặp phần tử này trong bài viết trước.

> [!WARNING]
> Việc lồng biểu mẫu bên trong một biểu mẫu khác bị nghiêm cấm. Việc lồng có thể khiến biểu mẫu hoạt động không thể đoán trước, đó là ý tưởng tồi.

Luôn có thể sử dụng điều khiển biểu mẫu bên ngoài phần tử {{HTMLElement("form")}}. Nếu bạn làm như vậy, theo mặc định điều khiển đó không liên quan gì đến bất kỳ biểu mẫu nào trừ khi bạn liên kết nó với một biểu mẫu bằng thuộc tính [`form`](/en-US/docs/Web/HTML/Reference/Attributes/form). Điều này được giới thiệu để cho phép bạn liên kết rõ ràng một điều khiển với một biểu mẫu ngay cả khi nó không được lồng bên trong.

Hãy tiếp tục và tìm hiểu các phần tử cấu trúc bạn sẽ tìm thấy được lồng trong biểu mẫu.

## Các phần tử \<fieldset> và \<legend>

Phần tử {{HTMLElement("fieldset")}} là cách thuận tiện để tạo nhóm các widget có cùng mục đích, cho mục đích tạo kiểu và ngữ nghĩa. Bạn có thể gắn nhãn một {{HTMLElement("fieldset")}} bằng cách thêm phần tử {{HTMLElement("legend")}} ngay bên dưới thẻ mở {{HTMLElement("fieldset")}}. Nội dung văn bản của {{HTMLElement("legend")}} mô tả chính thức mục đích của {{HTMLElement("fieldset")}} mà nó nằm trong.

Nhiều công nghệ hỗ trợ sẽ sử dụng phần tử {{HTMLElement("legend")}} như thể nó là một phần của nhãn của mỗi điều khiển bên trong phần tử {{HTMLElement("fieldset")}} tương ứng. Ví dụ, một số trình đọc màn hình như [Jaws](https://vispero.com/jaws-screen-reader-software/) và [NVDA](https://www.nvaccess.org/) sẽ đọc nội dung của legend trước khi đọc nhãn của mỗi điều khiển.

Dưới đây là một ví dụ nhỏ:

```html
<form>
  <fieldset>
    <legend>Fruit juice size</legend>
    <p>
      <input type="radio" name="size" id="size_1" value="small" />
      <label for="size_1">Small</label>
    </p>
    <p>
      <input type="radio" name="size" id="size_2" value="medium" />
      <label for="size_2">Medium</label>
    </p>
    <p>
      <input type="radio" name="size" id="size_3" value="large" />
      <label for="size_3">Large</label>
    </p>
  </fieldset>
</form>
```

> [!NOTE]
> Bạn có thể tìm ví dụ này trong [fieldset-legend.html](https://github.com/mdn/learning-area/blob/main/html/forms/html-form-structure/fieldset-legend.html) ([xem trực tiếp cũng được](https://mdn.github.io/learning-area/html/forms/html-form-structure/fieldset-legend.html)).

Khi đọc biểu mẫu trên, trình đọc màn hình sẽ đọc "Fruit juice size small" cho widget đầu tiên, "Fruit juice size medium" cho cái thứ hai, và "Fruit juice size large" cho cái thứ ba.

Trường hợp sử dụng trong ví dụ này là một trong những trường hợp quan trọng nhất. Mỗi khi bạn có một tập hợp nút chọn, bạn nên lồng chúng bên trong phần tử {{HTMLElement("fieldset")}}. Có các trường hợp sử dụng khác, và nhìn chung phần tử {{HTMLElement("fieldset")}} cũng có thể được dùng để phân đoạn biểu mẫu. Lý tưởng nhất, các biểu mẫu dài nên được trải rộng trên nhiều trang, nhưng nếu biểu mẫu quá dài và phải đặt trên một trang, việc đặt các phần liên quan khác nhau vào trong các fieldset khác nhau sẽ cải thiện khả năng sử dụng.

Do ảnh hưởng của nó đến công nghệ hỗ trợ, phần tử {{HTMLElement("fieldset")}} là một trong những phần tử chính để xây dựng biểu mẫu có thể tiếp cận; tuy nhiên, trách nhiệm của bạn là không lạm dụng nó. Nếu có thể, mỗi khi bạn xây dựng biểu mẫu, hãy thử [lắng nghe cách trình đọc màn hình](/en-US/docs/Learn_web_development/Core/Accessibility/Tooling#screen_readers) diễn giải nó. Nếu nghe có vẻ kỳ lạ, hãy cố gắng cải thiện cấu trúc biểu mẫu.

## Phần tử \<label>

Như chúng ta đã thấy trong bài viết trước, phần tử {{HTMLElement("label")}} là cách chính thức để xác định nhãn cho widget biểu mẫu HTML. Đây là phần tử quan trọng nhất nếu bạn muốn xây dựng biểu mẫu có thể tiếp cận — khi được triển khai đúng cách, trình đọc màn hình sẽ đọc nhãn của phần tử biểu mẫu cùng với bất kỳ hướng dẫn liên quan nào, cũng như hữu ích cho người dùng nhìn thấy. Lấy ví dụ này, mà chúng ta đã thấy trong bài viết trước:

```html
<label for="name">Name:</label> <input type="text" id="name" name="user_name" />
```

Với `<label>` được liên kết đúng cách với `<input>` thông qua thuộc tính `for` của nó (chứa giá trị thuộc tính `id` của phần tử `<input>`), trình đọc màn hình sẽ đọc ra nội dung như "Name, edit text".

Có một cách khác để liên kết điều khiển biểu mẫu với nhãn — lồng điều khiển biểu mẫu bên trong `<label>`, liên kết ngầm định nó.

```html
<label for="name">
  Name: <input type="text" id="name" name="user_name" />
</label>
```

Tuy nhiên ngay cả trong những trường hợp đó, việc đặt thuộc tính `for` vẫn được coi là thực hành tốt nhất để đảm bảo tất cả công nghệ hỗ trợ hiểu được mối quan hệ giữa nhãn và widget.

Nếu không có nhãn, hoặc nếu điều khiển biểu mẫu không được liên kết ngầm định hay rõ ràng với nhãn, trình đọc màn hình sẽ đọc ra nội dung như "Edit text blank", điều này không hữu ích chút nào.

### Nhãn cũng có thể nhấp vào!

Một ưu điểm khác của việc thiết lập nhãn đúng cách là bạn có thể nhấp hoặc chạm vào nhãn để kích hoạt widget tương ứng. Điều này hữu ích cho các điều khiển như trường nhập văn bản, nơi bạn có thể nhấp vào nhãn cũng như vào trường nhập liệu để lấy focus, nhưng nó đặc biệt hữu ích cho nút chọn và hộp kiểm — vùng nhấp của điều khiển như vậy có thể rất nhỏ, vì vậy việc làm cho nó dễ kích hoạt nhất có thể rất hữu ích.

Ví dụ, nhấp vào văn bản nhãn "I like cherry" trong ví dụ bên dưới sẽ chuyển đổi trạng thái được chọn của hộp kiểm _taste_cherry_:

```html
<form>
  <p>
    <input type="checkbox" id="taste_1" name="taste_cherry" value="cherry" />
    <label for="taste_1">I like cherry</label>
  </p>
  <p>
    <input type="checkbox" id="taste_2" name="taste_banana" value="banana" />
    <label for="taste_2">I like banana</label>
  </p>
</form>
```

> [!NOTE]
> Bạn có thể tìm ví dụ này trong [checkbox-label.html](https://github.com/mdn/learning-area/blob/main/html/forms/html-form-structure/checkbox-label.html) ([xem trực tiếp cũng được](https://mdn.github.io/learning-area/html/forms/html-form-structure/checkbox-label.html)).

### Nhiều nhãn

Nói một cách chính xác, bạn có thể đặt nhiều nhãn trên một widget duy nhất, nhưng đây không phải ý tưởng hay vì một số công nghệ hỗ trợ có thể gặp khó khăn trong việc xử lý chúng. Trong trường hợp nhiều nhãn, bạn nên lồng widget và các nhãn của nó bên trong một phần tử {{htmlelement("label")}} duy nhất.

Hãy xem xét ví dụ này:

```html
<p>Please complete all required (*) fields.</p>

<!-- So this: -->
<!--<div>
  <label for="username">Name:</label>
  <input id="username" type="text" name="username" required />
  <label for="username">*</label>
</div>-->

<!-- would be better done like this: -->
<!--<div>
  <label for="username">
    <span>Name:</span>
    <input id="username" type="text" name="username" required />
    <span>*</span>
  </label>
</div>-->

<!-- But this is probably best: -->
<div>
  <label for="username">Name *:</label>
  <input id="username" type="text" name="username" required />
</div>
```

{{EmbedLiveSample("Multiple_labels", 120, 120)}}

Đoạn văn ở đầu nêu một quy tắc cho các phần tử bắt buộc. Quy tắc phải được đặt _trước_ khi nó được sử dụng để người dùng nhìn thấy và người dùng sử dụng công nghệ hỗ trợ (AT) như trình đọc màn hình có thể học được ý nghĩa của nó trước khi họ gặp phần tử bắt buộc.

## Các cấu trúc HTML phổ biến được sử dụng với biểu mẫu

Ngoài các cấu trúc đặc trưng cho biểu mẫu web, hãy ghi nhớ rằng đánh dấu biểu mẫu chỉ là HTML. Điều này có nghĩa là bạn có thể sử dụng toàn bộ sức mạnh của HTML để cấu trúc biểu mẫu web.

Như bạn có thể thấy trong các ví dụ, thực hành phổ biến là bọc nhãn và widget của nó với phần tử {{HTMLElement("li")}} trong danh sách {{HTMLElement("ul")}} hoặc {{HTMLElement("ol")}}. Các phần tử {{HTMLElement("p")}} và {{HTMLElement("div")}} cũng được sử dụng phổ biến. Danh sách được khuyến nghị để cấu trúc nhiều hộp kiểm hoặc nút chọn.

Ngoài phần tử {{HTMLElement("fieldset")}}, thực hành phổ biến cũng là sử dụng tiêu đề HTML (ví dụ, {{htmlelement("Heading_Elements", "h1")}}, {{htmlelement("Heading_Elements", "h2")}}) và phân đoạn (ví dụ, {{htmlelement("section")}}) để cấu trúc các biểu mẫu phức tạp.

Trên hết, việc tìm kiếm phong cách lập trình thoải mái cho kết quả là biểu mẫu có thể tiếp cận và có thể sử dụng là tùy thuộc vào bạn. Mỗi phần chức năng riêng biệt nên được chứa trong phần tử {{htmlelement("section")}} riêng biệt, với các phần tử {{htmlelement("fieldset")}} để chứa nút chọn.

### Xây dựng cấu trúc biểu mẫu

Hãy áp dụng những ý tưởng này vào thực tế và xây dựng một biểu mẫu phức tạp hơn một chút — biểu mẫu thanh toán. Biểu mẫu này sẽ chứa nhiều loại điều khiển mà bạn có thể chưa hiểu. Đừng lo lắng về điều này; bạn sẽ tìm hiểu cách chúng hoạt động trong bài viết tiếp theo ([Điều khiển biểu mẫu gốc cơ bản](/en-US/docs/Learn_web_development/Extensions/Forms/Basic_native_form_controls)). Hiện tại, hãy đọc kỹ các mô tả khi bạn làm theo các hướng dẫn bên dưới, và bắt đầu hiểu các phần tử bao bọc nào chúng ta đang sử dụng để cấu trúc biểu mẫu, và tại sao.

1. Để bắt đầu, hãy tạo một bản sao cục bộ của [tệp mẫu trống](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/getting-started/index.html) trong một thư mục mới trên máy tính của bạn.

2. Tiếp theo, tạo biểu mẫu bằng cách thêm phần tử {{htmlelement("form")}}:

   ```html-nolint
   <form>
   ```

3. Bên trong phần tử `<form>`, hãy thêm tiêu đề và đoạn văn để thông báo cho người dùng biết cách đánh dấu các trường bắt buộc:

   ```html-nolint
   <h1>Payment form</h1>
   <p>Please complete all required (*) fields.</p>
   ```

4. Tiếp theo, chúng ta sẽ thêm một phần mã lớn hơn vào biểu mẫu, bên dưới mục nhập trước đó. Ở đây bạn sẽ thấy rằng chúng ta đang bọc các trường thông tin liên hệ bên trong phần tử {{htmlelement("section")}} riêng biệt. Hơn nữa, chúng ta có một tập hợp ba nút chọn, mỗi cái được đặt trong phần tử danh sách ({{htmlelement("li")}}) riêng. Chúng ta cũng có hai {{htmlelement("input")}} văn bản tiêu chuẩn và các phần tử {{htmlelement("label")}} liên quan, mỗi cái được chứa trong {{htmlelement("p")}}, và một trường nhập mật khẩu để nhập mật khẩu. Thêm mã này vào biểu mẫu của bạn:

   ```html
   <section>
     <h2>Contact information</h2>
     <fieldset>
       <legend>Title</legend>
       <ul>
         <li>
           <label for="title_1">
             <input type="radio" id="title_1" name="title" value="A" />
             Ace
           </label>
         </li>
         <li>
           <label for="title_2">
             <input type="radio" id="title_2" name="title" value="K" />
             King
           </label>
         </li>
         <li>
           <label for="title_3">
             <input type="radio" id="title_3" name="title" value="Q" />
             Queen
           </label>
         </li>
       </ul>
     </fieldset>
     <p>
       <label for="name">Name *:</label>
       <input type="text" id="name" name="username" required />
     </p>
     <p>
       <label for="mail">Email *:</label>
       <input type="email" id="mail" name="user-mail" required />
     </p>
     <p>
       <label for="pwd">Password *:</label>
       <input type="password" id="pwd" name="password" required />
     </p>
   </section>
   ```

5. Phần `<section>` thứ hai của biểu mẫu là thông tin thanh toán.
   Chúng ta có ba điều khiển riêng biệt cùng với nhãn của chúng, mỗi cái được chứa trong `<p>`.
   Cái đầu tiên là menu thả xuống ({{htmlelement("select")}}) để chọn loại thẻ tín dụng.
   Cái thứ hai là phần tử `<input>` kiểu `tel`, để nhập số thẻ tín dụng; mặc dù chúng ta có thể đã dùng loại `number`, nhưng chúng ta không muốn có giao diện con quay số.
   Cái cuối cùng là phần tử `<input>` kiểu `text`, để nhập ngày hết hạn của thẻ; bao gồm thuộc tính _placeholder_ chỉ định định dạng đúng và _pattern_ kiểm tra ngày đã nhập có định dạng đúng không.
   Các loại trường nhập liệu mới hơn này được giới thiệu lại trong [Các loại đầu vào HTML5](/en-US/docs/Learn_web_development/Extensions/Forms/HTML5_input_types).

   Nhập đoạn sau bên dưới phần trước:

   ```html
   <section>
     <h2>Payment information</h2>
     <p>
       <label for="card">
         <span>Card type:</span>
       </label>
       <select id="card" name="user-card">
         <option value="visa">Visa</option>
         <option value="mc">Mastercard</option>
         <option value="amex">American Express</option>
       </select>
     </p>
     <p>
       <label for="number">Card number *:</label>
       <input type="tel" id="number" name="card-number" required />
     </p>
     <p>
       <label for="expiration">Expiration date *:</label>
       <input
         type="text"
         id="expiration"
         name="expiration"
         required
         placeholder="MM/YY"
         pattern="^(0[1-9]|1[0-2])\/([0-9]{2})$" />
     </p>
   </section>
   ```

6. Phần cuối cùng chúng ta sẽ thêm đơn giản hơn nhiều, chỉ chứa một {{htmlelement("button")}} kiểu `submit`, để gửi dữ liệu biểu mẫu. Thêm vào cuối biểu mẫu của bạn bây giờ:

   ```html
   <section>
     <p>
       <button type="submit">Validate the payment</button>
     </p>
   </section>
   ```

7. Cuối cùng, hoàn thành biểu mẫu của bạn bằng cách thêm thẻ đóng {{htmlelement("form")}} bên ngoài:

   ```html
   </form>
   ```

   ```css hidden
   h1 {
     margin-top: 0;
   }

   ul {
     margin: 0;
     padding: 0;
     list-style: none;
   }

   form {
     margin: 0 auto;
     width: 400px;
     padding: 1em;
     border: 1px solid #cccccc;
     border-radius: 1em;
   }

   div + div {
     margin-top: 1em;
   }

   label span {
     display: inline-block;
     text-align: right;
   }

   input,
   textarea {
     font: 1em sans-serif;
     width: 250px;
     box-sizing: border-box;
     border: 1px solid #999999;
   }

   input[type="checkbox"],
   input[type="radio"] {
     width: auto;
     border: none;
   }

   input:focus,
   textarea:focus {
     border-color: black;
   }

   textarea {
     vertical-align: top;
     height: 5em;
     resize: vertical;
   }

   fieldset {
     width: 250px;
     box-sizing: border-box;
     border: 1px solid #999999;
   }

   button {
     margin-top: 20px;
   }

   label {
     display: inline-block;
   }

   p label {
     width: 100%;
   }
   ```

Chúng ta đã áp dụng một số CSS bổ sung cho biểu mẫu hoàn thiện bên dưới. Nếu bạn muốn thay đổi giao diện của biểu mẫu, bạn có thể sao chép các kiểu từ [ví dụ](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_structure_a_web_form/Example) hoặc truy cập [Tạo kiểu biểu mẫu web](/en-US/docs/Learn_web_development/Extensions/Forms/Styling_web_forms).

{{EmbedLiveSample("building_a_form_structure","100%",620)}}

## Tóm tắt

Bây giờ bạn đã có tất cả kiến thức cần thiết để cấu trúc đúng biểu mẫu web của mình. Chúng ta sẽ đề cập đến nhiều tính năng được giới thiệu ở đây trong các bài viết tiếp theo, với bài tiếp theo xem xét chi tiết hơn việc sử dụng tất cả các loại widget biểu mẫu khác nhau mà bạn muốn sử dụng để thu thập thông tin từ người dùng.

## Xem thêm

- [A List Apart: _Sensible Forms: A Form Usability Checklist_](https://alistapart.com/article/sensibleforms/)

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Your_first_form", "Learn_web_development/Extensions/Forms/Basic_native_form_controls", "Learn_web_development/Extensions/Forms")}}
