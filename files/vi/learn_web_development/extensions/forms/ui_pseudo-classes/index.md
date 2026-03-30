---
title: Lớp giả giao diện người dùng
slug: Learn_web_development/Extensions/Forms/UI_pseudo-classes
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Customizable_select_listboxes", "Learn_web_development/Extensions/Forms/Form_validation", "Learn_web_development/Extensions/Forms")}}

Trong các bài viết trước, chúng ta đã đề cập đến việc tạo kiểu cho nhiều loại điều khiển biểu mẫu theo cách chung chung. Điều đó bao gồm một số cách sử dụng lớp giả, ví dụ, sử dụng `:checked` để nhắm mục tiêu một hộp kiểm chỉ khi nó được chọn. Trong bài viết này, chúng ta khám phá các lớp giả giao diện người dùng khác nhau có sẵn để tạo kiểu cho biểu mẫu ở các trạng thái khác nhau.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết cơ bản về
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, bao gồm kiến thức chung về
        <a
          href="/en-US/docs/Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements"
          >lớp giả và phần tử giả</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu những phần nào của biểu mẫu khó tạo kiểu và tại sao; học được
        những gì có thể làm để tùy chỉnh chúng.
      </td>
    </tr>
  </tbody>
</table>

## Những lớp giả nào có sẵn cho chúng ta?

Bạn có thể đã quen với các lớp giả sau:

- {{cssxref(":hover")}}: Chọn một phần tử chỉ khi nó đang được di chuột qua.
- {{cssxref(":focus")}}: Chọn một phần tử chỉ khi nó được lấy focus (tức là, bằng cách nhấn Tab từ bàn phím để di chuyển đến).
- {{cssxref(":active")}}: Chọn một phần tử chỉ khi nó đang được kích hoạt (tức là, trong khi nó đang được nhấp, hoặc khi phím <kbd>Return</kbd> / <kbd>Enter</kbd> đang được nhấn xuống trong trường hợp kích hoạt bằng bàn phím).

[Bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors) cung cấp một số lớp giả khác liên quan đến biểu mẫu HTML. Chúng cung cấp một số điều kiện nhắm mục tiêu hữu ích mà bạn có thể tận dụng. Chúng ta sẽ thảo luận về những điều này chi tiết hơn trong các phần bên dưới, nhưng tóm lại, các lớp giả chính mà chúng ta sẽ xem xét là:

- {{cssxref(':required')}} và {{cssxref(':optional')}}: Nhắm mục tiêu các phần tử có thể bắt buộc (ví dụ: các phần tử hỗ trợ thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required) HTML)), dựa trên việc chúng bắt buộc hay tùy chọn.
- {{cssxref(":valid")}} và {{cssxref(":invalid")}}, và {{cssxref(":in-range")}} và {{cssxref(":out-of-range")}}: Nhắm mục tiêu các điều khiển biểu mẫu hợp lệ/không hợp lệ theo các ràng buộc kiểm tra hợp lệ biểu mẫu được đặt trên chúng, hoặc trong phạm vi/ngoài phạm vi.
- {{cssxref(":enabled")}} và {{cssxref(":disabled")}}, và {{cssxref(":read-only")}} và {{cssxref(":read-write")}}: Nhắm mục tiêu các phần tử có thể bị vô hiệu hóa (ví dụ: các phần tử hỗ trợ thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled) HTML), dựa trên việc chúng hiện đang được bật hay tắt, và các điều khiển biểu mẫu chỉ đọc hoặc đọc-ghi (ví dụ: các phần tử có thuộc tính [`readonly`](/en-US/docs/Web/HTML/Reference/Attributes/readonly) HTML được đặt).
- {{cssxref(":checked")}}, {{cssxref(":indeterminate")}}, và {{cssxref(":default")}}: Lần lượt nhắm mục tiêu các hộp kiểm và nút chọn đã được chọn, ở trạng thái không xác định (không được chọn cũng không phải không được chọn), và tùy chọn được chọn mặc định khi trang tải (ví dụ: một [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox) với thuộc tính [`checked`](/en-US/docs/Web/HTML/Reference/Elements/input#checked) được đặt, hoặc phần tử [`<option>`](/en-US/docs/Web/HTML/Reference/Elements/option) với thuộc tính [`selected`](/en-US/docs/Web/HTML/Reference/Elements/option#selected) được đặt).

Có nhiều lớp giả khác, nhưng những lớp được liệt kê ở trên là những lớp hữu ích nhất. Một số trong số chúng nhằm giải quyết các vấn đề rất cụ thể. Các lớp giả giao diện người dùng được liệt kê ở trên có hỗ trợ trình duyệt tuyệt vời, nhưng tất nhiên, bạn nên kiểm tra kỹ các triển khai biểu mẫu của mình để đảm bảo chúng hoạt động cho đối tượng mục tiêu của bạn.

> [!NOTE]
> Một số lớp giả được thảo luận ở đây liên quan đến việc tạo kiểu cho điều khiển biểu mẫu dựa trên trạng thái kiểm tra hợp lệ của chúng (dữ liệu của chúng có hợp lệ không?). Bạn sẽ học nhiều hơn về việc thiết lập và kiểm soát các ràng buộc kiểm tra hợp lệ trong bài viết tiếp theo của chúng ta — [Kiểm tra hợp lệ biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation) — nhưng hiện tại chúng ta sẽ giữ mọi thứ đơn giản về kiểm tra hợp lệ biểu mẫu, để nó không gây nhầm lẫn.

## Tạo kiểu trường nhập liệu dựa trên việc chúng bắt buộc hay không

Một trong những khái niệm cơ bản nhất liên quan đến kiểm tra hợp lệ biểu mẫu phía máy khách là liệu trường nhập liệu biểu mẫu có bắt buộc (nó phải được điền vào trước khi biểu mẫu có thể được gửi) hay tùy chọn.

Các phần tử {{htmlelement('input')}}, {{htmlelement('select')}}, và {{htmlelement('textarea')}} có thuộc tính `required` có sẵn, khi được đặt, có nghĩa là bạn phải điền vào điều khiển đó trước khi biểu mẫu sẽ gửi thành công.
Ví dụ, họ và tên là bắt buộc trong biểu mẫu bên dưới, nhưng địa chỉ email là tùy chọn:

```html live-sample___optional-required-styles
<form>
  <fieldset>
    <legend>Feedback form</legend>
    <div>
      <label for="fname">First name: </label>
      <input id="fname" name="fname" type="text" required />
    </div>
    <div>
      <label for="lname">Last name: </label>
      <input id="lname" name="lname" type="text" required />
    </div>
    <div>
      <label for="email"> Email address (if you want a response): </label>
      <input id="email" name="email" type="email" />
    </div>
    <div><button>Submit</button></div>
  </fieldset>
</form>
```

Bạn có thể khớp hai trạng thái này bằng cách sử dụng lớp giả {{cssxref(':required')}} và {{cssxref(':optional')}}. Ví dụ, nếu chúng ta áp dụng CSS sau đây cho HTML ở trên:

```css hidden live-sample___optional-required-styles
body {
  font-family: sans-serif;
  margin: 20px auto;
  max-width: 70%;
}

fieldset {
  padding: 10px 30px 0;
}

legend {
  color: white;
  background: black;
  padding: 5px 10px;
}

fieldset > div {
  margin-bottom: 20px;
  display: flex;
  flex-flow: row wrap;
}

button,
label,
input {
  display: block;
  font-size: 100%;
  box-sizing: border-box;
  width: 100%;
  padding: 5px;
}

input {
  box-shadow: inset 1px 1px 3px #cccccc;
  border-radius: 5px;
}

input:hover,
input:focus {
  background-color: #eeeeee;
}

button {
  width: 60%;
  margin: 0 auto;
}
```

```css live-sample___optional-required-styles
input:required {
  border: 2px solid;
}

input:optional {
  border: 2px dashed;
}
```

Các điều khiển bắt buộc có đường viền liền, còn điều khiển tùy chọn có đường viền đứt đoạn.
Bạn cũng có thể thử gửi biểu mẫu mà không điền vào, để xem các thông báo lỗi kiểm tra hợp lệ phía máy khách mặc định mà trình duyệt cung cấp:

{{EmbedLiveSample("optional-required-styles", , "400px", , , , , "allow-forms")}}

Nhìn chung, bạn nên tránh tạo kiểu cho các phần tử 'bắt buộc' so với 'tùy chọn' trong biểu mẫu chỉ bằng màu sắc, vì điều này không tốt cho người bị mù màu:

```css example-bad
input:required {
  border: 2px solid red;
}

input:optional {
  border: 2px solid green;
}
```

Quy ước tiêu chuẩn trên web để chỉ trạng thái bắt buộc là dấu hoa thị (`*`), hoặc từ "required" được liên kết với các điều khiển tương ứng.
Trong phần tiếp theo, chúng ta sẽ xem xét một ví dụ tốt hơn về cách chỉ ra các trường bắt buộc bằng `:required` và nội dung được tạo ra.

> [!NOTE]
> Bạn có thể sẽ không thấy mình sử dụng lớp giả `:optional` thường xuyên. Các điều khiển biểu mẫu theo mặc định là tùy chọn, vì vậy bạn chỉ cần tạo kiểu tùy chọn theo mặc định, và thêm kiểu trên cùng cho các điều khiển bắt buộc.

> [!NOTE]
> Nếu một nút chọn trong một nhóm nút chọn cùng tên có thuộc tính `required` được đặt, tất cả các nút chọn sẽ không hợp lệ cho đến khi một nút được chọn, nhưng chỉ có nút có thuộc tính được gán thực sự khớp với {{cssxref(':required')}}.

## Sử dụng nội dung được tạo với lớp giả

Trong các bài viết trước, chúng ta đã thấy cách sử dụng [nội dung được tạo](/en-US/docs/Web/CSS/Guides/Generated_content), nhưng chúng ta nghĩ đây là thời điểm tốt để nói về nó chi tiết hơn một chút.

Ý tưởng là chúng ta có thể sử dụng các phần tử giả {{cssxref("::before")}} và {{cssxref("::after")}} cùng với thuộc tính {{cssxref("content")}} để tạo ra một đoạn nội dung xuất hiện trước hoặc sau phần tử bị ảnh hưởng. Đoạn nội dung không được thêm vào DOM, vì vậy nó có thể không nhìn thấy với một số trình đọc màn hình. Bởi vì nó là một phần tử giả, nó có thể được nhắm mục tiêu bằng kiểu theo cách tương tự như bất kỳ nút DOM thực nào.

Điều này thực sự hữu ích khi bạn muốn thêm chỉ báo trực quan vào một phần tử, chẳng hạn như nhãn hoặc biểu tượng, khi các chỉ báo thay thế cũng có sẵn để đảm bảo khả năng tiếp cận cho tất cả người dùng. Ví dụ, chúng ta có thể sử dụng nội dung được tạo để xử lý vị trí và hoạt ảnh của vòng tròn bên trong nút chọn tùy chỉnh khi một nút chọn được chọn:

```css
input[type="radio"]::before {
  display: block;
  content: " ";
  width: 10px;
  height: 10px;
  border-radius: 6px;
  background-color: red;
  font-size: 1.2em;
  transform: translate(3px, 3px) scale(0);
  transform-origin: center;
  transition: all 0.3s ease-in;
}

input[type="radio"]:checked::before {
  transform: translate(3px, 3px) scale(1);
  transition: all 0.3s cubic-bezier(0.25, 0.25, 0.56, 2);
}
```

Điều này thực sự hữu ích — trình đọc màn hình đã cho người dùng biết khi một nút chọn hoặc hộp kiểm mà họ gặp đã được chọn/đánh dấu, vì vậy bạn không muốn chúng đọc ra một phần tử DOM khác chỉ ra sự lựa chọn — điều đó có thể gây nhầm lẫn. Có một chỉ báo thuần túy về mặt hình ảnh giải quyết vấn đề này.

Không phải tất cả các loại `<input>` đều hỗ trợ việc có nội dung được tạo đặt trên chúng. Tất cả các loại trường nhập liệu hiển thị văn bản động trong đó, chẳng hạn như `text`, `password`, hoặc `button`, không hiển thị nội dung được tạo. Những loại khác, bao gồm `range`, `color`, `checkbox`, v.v., hiển thị nội dung được tạo.

Quay lại ví dụ bắt buộc/tùy chọn của chúng ta từ trước, lần này chúng ta sẽ không thay đổi giao diện của chính trường nhập liệu — chúng ta sẽ sử dụng nội dung được tạo để thêm nhãn chỉ báo.

Trước tiên, chúng ta sẽ thêm một đoạn văn vào đầu biểu mẫu để nói những gì bạn đang tìm kiếm:

```html
<p>Required fields are labeled with "required".</p>
```

Người dùng trình đọc màn hình sẽ được đọc "required" ra như một thông tin thêm khi họ đến mỗi trường bắt buộc, trong khi người dùng thị giác sẽ nhận được nhãn của chúng ta.

Như đã đề cập trước đây, trường nhập liệu văn bản không hỗ trợ nội dung được tạo, vì vậy chúng ta thêm một [`<span>`](/en-US/docs/Web/HTML/Reference/Elements/span) trống để treo nội dung được tạo:

```html
<div>
  <label for="fname">First name: </label>
  <input id="fname" name="fname" type="text" required />
  <span></span>
</div>
```

Vấn đề trước mắt với điều này là span đang đổ xuống dòng mới bên dưới trường nhập liệu vì trường nhập liệu và nhãn đều được đặt với `width: 100%`. Để khắc phục điều này, chúng ta tạo kiểu cho `<div>` cha để trở thành container flex, nhưng cũng nói với nó để bọc nội dung của nó xuống dòng mới nếu nội dung trở nên quá dài:

```css
fieldset > div {
  margin-bottom: 20px;
  display: flex;
  flex-flow: row wrap;
}
```

Hiệu ứng của điều này là nhãn và trường nhập liệu nằm trên các dòng riêng biệt vì chúng đều có `width: 100%`, nhưng `<span>` có chiều rộng `0` nên nó có thể nằm trên cùng dòng với trường nhập liệu.

Bây giờ đến nội dung được tạo. Chúng ta tạo nó bằng CSS này:

```css
input + span {
  position: relative;
}

input:required + span::after {
  font-size: 0.7rem;
  position: absolute;
  content: "required";
  color: white;
  background-color: black;
  padding: 5px 10px;
  top: -26px;
  left: -70px;
}
```

Chúng ta đặt `<span>` thành `position: relative` để chúng ta có thể đặt nội dung được tạo thành `position: absolute` và định vị nó tương đối với `<span>` thay vì `<body>` (Nội dung được tạo hoạt động như thể nó là một nút con của phần tử mà nó được tạo ra, cho mục đích định vị).

Sau đó chúng ta cho nội dung được tạo nội dung "required", là những gì chúng ta muốn nhãn của mình nói, và tạo kiểu và định vị nó như chúng ta muốn. Kết quả được nhìn thấy bên dưới (nhấn nút **Play** để chạy ví dụ trong MDN Playground và chỉnh sửa mã nguồn).

```html hidden live-sample___required-optional-generated
<form>
  <fieldset>
    <legend>Feedback form</legend>

    <p>Required fields are labelled with "required".</p>
    <div>
      <label for="fname">First name: </label>
      <input id="fname" name="fname" type="text" required />
      <span></span>
    </div>
    <div>
      <label for="lname">Last name: </label>
      <input id="lname" name="lname" type="text" required />
      <span></span>
    </div>
    <div>
      <label for="email"
        >Email address (include if you want a response):
      </label>
      <input id="email" name="email" type="email" />
      <span></span>
    </div>
    <div><button>Submit</button></div>
  </fieldset>
</form>
```

```css hidden live-sample___required-optional-generated
@import "https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&display=swap";

body {
  font-family: "Josefin Sans", sans-serif;
  margin: 20px auto;
  max-width: 460px;
}

fieldset {
  padding: 10px 30px 0;
}

legend {
  color: white;
  background: black;
  padding: 5px 10px;
}

fieldset > div {
  margin-bottom: 20px;
  display: flex;
  flex-flow: row wrap;
}

button,
label,
input {
  display: block;
  font-family: inherit;
  font-size: 100%;
  margin: 0;
  box-sizing: border-box;
  width: 100%;
  padding: 5px;
  height: 30px;
}

input {
  box-shadow: inset 1px 1px 3px #cccccc;
  border-radius: 5px;
}

input:hover,
input:focus {
  background-color: #eeeeee;
}

input + span {
  position: relative;
}

input:required + span::after {
  font-size: 0.7rem;
  position: absolute;
  content: "required";
  color: white;
  background-color: black;
  padding: 5px 10px;
  top: -26px;
  left: -70px;
}

button {
  width: 60%;
  margin: 0 auto;
}
```

```js hidden live-sample___required-optional-generated
const form = document.querySelector("form");
form.addEventListener("submit", (e) => {
  e.preventDefault();
});
```

{{EmbedLiveSample("required-optional-generated", "100%", 430, , , , , "allow-forms")}}

## Tạo kiểu điều khiển dựa trên việc dữ liệu của chúng có hợp lệ hay không

Khái niệm quan trọng khác, cơ bản trong kiểm tra hợp lệ biểu mẫu là liệu dữ liệu của điều khiển biểu mẫu có hợp lệ hay không (trong trường hợp dữ liệu số, chúng ta cũng có thể nói về dữ liệu trong phạm vi và ngoài phạm vi). Các điều khiển biểu mẫu với [giới hạn ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) có thể được nhắm mục tiêu dựa trên các trạng thái này.

### :valid và :invalid

Bạn có thể nhắm mục tiêu các điều khiển biểu mẫu bằng cách sử dụng lớp giả {{cssxref(":valid")}} và {{cssxref(":invalid")}}. Một số điểm cần lưu ý:

- Các điều khiển không có kiểm tra hợp lệ ràng buộc sẽ luôn hợp lệ, và do đó được khớp với `:valid`.
- Các điều khiển có `required` được đặt trên chúng mà không có giá trị được tính là không hợp lệ — chúng sẽ được khớp với `:invalid` và `:required`.
- Các điều khiển có kiểm tra hợp lệ tích hợp, chẳng hạn như `<input type="email">` hoặc `<input type="url">` là `:invalid` khi dữ liệu được nhập vào chúng không khớp với mẫu mà chúng đang tìm kiếm (nhưng chúng hợp lệ khi trống).
- Các điều khiển có giá trị hiện tại nằm ngoài giới hạn phạm vi được chỉ định bởi các thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) là `:invalid`, nhưng cũng được khớp bởi {{cssxref(":out-of-range")}}, như bạn sẽ thấy sau.
- Có một số cách khác để làm cho một phần tử được khớp bởi `:valid`/`:invalid`, như bạn sẽ thấy trong bài viết [Kiểm tra hợp lệ biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation). Nhưng chúng ta sẽ giữ mọi thứ đơn giản bây giờ.

Hãy xem xét một ví dụ về `:valid`/`:invalid`.

Như trong ví dụ trước, chúng ta có thêm `<span>` để tạo nội dung, mà chúng ta sẽ sử dụng để cung cấp chỉ báo dữ liệu hợp lệ/không hợp lệ:

```html
<div>
  <label for="fname">First name: </label>
  <input id="fname" name="fname" type="text" required />
  <span></span>
</div>
```

Để cung cấp các chỉ báo này, chúng ta sử dụng CSS sau:

```css
input + span {
  position: relative;
}

input + span::before {
  position: absolute;
  right: -20px;
  top: 5px;
}

input:invalid {
  border: 2px solid red;
}

input:invalid + span::before {
  content: "✖";
  color: red;
}

input:valid + span::before {
  content: "✓";
  color: green;
}
```

Như trước đây, chúng ta đặt `<span>` thành `position: relative` để chúng ta có thể định vị nội dung được tạo tương đối với chúng. Sau đó chúng ta định vị tuyệt đối nội dung được tạo khác nhau tùy thuộc vào dữ liệu của biểu mẫu có hợp lệ hay không hợp lệ — một dấu kiểm màu xanh lá hoặc một dấu chéo đỏ, tương ứng. Để thêm một chút cấp bách hơn cho dữ liệu không hợp lệ, chúng ta cũng đã cho trường nhập liệu một đường viền đỏ dày khi không hợp lệ.

> [!NOTE]
> Chúng ta đã sử dụng `::before` để thêm các nhãn này, vì chúng ta đã sử dụng `::after` cho các nhãn "required".

Bạn có thể thử nó bên dưới (nhấn nút **Play** để chạy ví dụ trong MDN Playground và chỉnh sửa mã nguồn):

```html hidden live-sample___valid-invalid
<form>
  <fieldset>
    <legend>Feedback form</legend>

    <p>Required fields are labelled with "required".</p>
    <div>
      <label for="fname">First name: </label>
      <input id="fname" name="fname" type="text" required />
      <span></span>
    </div>
    <div>
      <label for="lname">Last name: </label>
      <input id="lname" name="lname" type="text" required />
      <span></span>
    </div>
    <div>
      <label for="email"
        >Email address (include if you want a response):
      </label>
      <input id="email" name="email" type="email" />
      <span></span>
    </div>
    <div><button>Submit</button></div>
  </fieldset>
</form>
```

```css hidden live-sample___valid-invalid
@import "https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&display=swap";

body {
  font-family: "Josefin Sans", sans-serif;
  margin: 20px auto;
  max-width: 460px;
}

fieldset {
  padding: 10px 30px 0;
}

legend {
  color: white;
  background: black;
  padding: 5px 10px;
}

fieldset > div {
  margin-bottom: 20px;
  display: flex;
  flex-flow: row wrap;
}

button,
label,
input {
  display: block;
  font-family: inherit;
  font-size: 100%;
  margin: 0;
  box-sizing: border-box;
  width: 100%;
  padding: 5px;
  height: 30px;
}

input {
  box-shadow: inset 1px 1px 3px #cccccc;
  border-radius: 5px;
}

input:hover,
input:focus {
  background-color: #eeeeee;
}

input + span {
  position: relative;
}

input:required + span::after {
  font-size: 0.7rem;
  position: absolute;
  content: "required";
  color: white;
  background-color: black;
  padding: 5px 10px;
  top: -26px;
  left: -70px;
}

input + span::before {
  position: absolute;
  right: -20px;
  top: 5px;
}

input:invalid {
  border: 2px solid red;
}

input:invalid + span::before {
  content: "✖";
  color: red;
}

input:valid + span::before {
  content: "✓";
  color: green;
}

button {
  width: 60%;
  margin: 0 auto;
}
```

```js hidden live-sample___valid-invalid
const form = document.querySelector("form");
form.addEventListener("submit", (e) => {
  e.preventDefault();
});
```

{{EmbedLiveSample("valid-invalid", "100%", 430, , , , , "allow-forms")}}

Lưu ý cách các trường nhập liệu văn bản bắt buộc không hợp lệ khi trống, nhưng hợp lệ khi chúng có gì đó được điền vào. Mặt khác, trường nhập liệu email hợp lệ khi trống, vì nó không bắt buộc, nhưng không hợp lệ khi nó chứa thứ gì đó không phải là địa chỉ email đúng định dạng.

### Dữ liệu trong phạm vi và ngoài phạm vi

Như chúng ta đã ám chỉ ở trên, có hai lớp giả liên quan khác cần xem xét — {{cssxref(":in-range")}} và {{cssxref(":out-of-range")}}. Chúng khớp với các trường nhập liệu số nơi giới hạn phạm vi được chỉ định bởi [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max), khi dữ liệu của chúng ở trong hoặc ngoài phạm vi được chỉ định, tương ứng.

> [!NOTE]
> Các loại trường nhập liệu số là `date`, `month`, `week`, `time`, `datetime-local`, `number`, và `range`.

Đáng chú ý là các trường nhập liệu có dữ liệu trong phạm vi cũng sẽ được khớp bởi lớp giả `:valid` và các trường nhập liệu có dữ liệu ngoài phạm vi cũng sẽ được khớp bởi lớp giả `:invalid`. Vậy tại sao lại có cả hai? Vấn đề thực sự là về ngữ nghĩa — ngoài phạm vi là một loại thông báo không hợp lệ cụ thể hơn, vì vậy bạn có thể muốn cung cấp thông báo khác nhau cho các trường nhập liệu ngoài phạm vi, điều này sẽ hữu ích hơn cho người dùng so với chỉ nói "không hợp lệ". Bạn thậm chí có thể muốn cung cấp cả hai.

Hãy xem xét một ví dụ làm chính xác điều này, xây dựng dựa trên ví dụ trước để cung cấp thông báo ngoài phạm vi cho các trường nhập liệu số, cũng như nói liệu chúng có bắt buộc không.

Trường nhập liệu số trông như thế này:

```html
<div>
  <label for="age">Age (must be 12+): </label>
  <input id="age" name="age" type="number" min="12" max="120" required />
  <span></span>
</div>
```

Và CSS trông như thế này:

```css
input + span {
  position: relative;
}

input + span::after {
  font-size: 0.7rem;
  position: absolute;
  padding: 5px 10px;
  top: -26px;
}

input:required + span::after {
  color: white;
  background-color: black;
  content: "Required";
  left: -70px;
}

input:out-of-range + span::after {
  color: white;
  background-color: red;
  width: 155px;
  content: "Outside allowable value range";
  left: -182px;
}
```

Đây là câu chuyện tương tự như những gì chúng ta đã có trước đây trong ví dụ `:required`, ngoại trừ ở đây chúng ta đã tách ra các khai báo áp dụng cho bất kỳ nội dung `::after` nào vào một quy tắc riêng, và đã cho nội dung `::after` riêng cho trạng thái `:required` và `:out-of-range` nội dung và kiểu riêng của chúng. Bạn có thể thử nó ở đây (nhấn nút **Play** để chạy ví dụ trong MDN Playground và chỉnh sửa mã nguồn):

```html hidden live-sample___out-of-range
<form>
  <fieldset>
    <legend>Feedback form</legend>

    <p>Required fields are labelled with "required".</p>
    <div>
      <label for="name">Name: </label>
      <input id="name" name="name" type="text" required />
      <span></span>
    </div>
    <div>
      <label for="age">Age (must be 12+): </label>
      <input id="age" name="age" type="number" min="12" max="120" required />
      <span></span>
    </div>
    <div>
      <label for="email"
        >Email address (include if you want a response):
      </label>
      <input id="email" name="email" type="email" />
      <span></span>
    </div>
    <div><button>Submit</button></div>
  </fieldset>
</form>
```

```css hidden live-sample___out-of-range
@import "https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&display=swap";

body {
  font-family: "Josefin Sans", sans-serif;
  margin: 20px auto;
  max-width: 460px;
}

fieldset {
  padding: 10px 30px 0;
}

legend {
  color: white;
  background: black;
  padding: 5px 10px;
}

fieldset > div {
  margin-bottom: 20px;
  display: flex;
  flex-flow: row wrap;
}

button,
label,
input {
  display: block;
  font-family: inherit;
  font-size: 100%;
  margin: 0;
  box-sizing: border-box;
  width: 100%;
  padding: 5px;
  height: 30px;
}

input {
  box-shadow: inset 1px 1px 3px #cccccc;
  border-radius: 5px;
}

input:hover,
input:focus {
  background-color: #eeeeee;
}

input + span {
  position: relative;
}

input + span::after {
  font-size: 0.7rem;
  position: absolute;
  padding: 5px 10px;
  top: -26px;
}

input:required + span::after {
  color: white;
  background-color: black;
  content: "required";
  left: -70px;
}

input:out-of-range + span::after {
  color: white;
  background-color: red;
  width: 155px;
  content: "Outside allowable value range";
  left: -182px;
}

input + span::before {
  position: absolute;
  right: -20px;
  top: 5px;
}

input:invalid {
  border: 2px solid red;
}

input:invalid + span::before {
  content: "✖";
  color: red;
}

input:valid + span::before {
  content: "✓";
  color: green;
}

button {
  width: 60%;
  margin: 0 auto;
}
```

```js hidden live-sample___out-of-range
const form = document.querySelector("form");
form.addEventListener("submit", (e) => {
  e.preventDefault();
});
```

{{EmbedLiveSample("out-of-range", "100%", 430, , , , , "allow-forms")}}

Trường nhập liệu số có thể vừa bắt buộc vừa ngoài phạm vi cùng một lúc, vậy điều gì xảy ra? Bởi vì quy tắc `:out-of-range` xuất hiện sau trong mã nguồn so với quy tắc `:required`, [các quy tắc xếp tầng](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts#understanding_the_cascade) áp dụng, và thông báo ngoài phạm vi được hiển thị.

Điều này hoạt động khá tốt — khi trang tải lần đầu, "Required" được hiển thị, cùng với dấu chéo đỏ và đường viền. Khi bạn đã nhập tuổi hợp lệ (tức là, trong phạm vi 12-120), trường nhập liệu trở nên hợp lệ. Tuy nhiên, nếu bạn thay đổi mục nhập tuổi thành một giá trị ngoài phạm vi, thông báo "Outside allowable value range" sẽ xuất hiện thay thế cho "Required".

> [!NOTE]
> Để nhập giá trị không hợp lệ/ngoài phạm vi, bạn sẽ phải thực sự lấy focus vào biểu mẫu và nhập nó bằng bàn phím. Các nút spinner sẽ không cho phép bạn tăng/giảm giá trị ra ngoài phạm vi cho phép.

## Tạo kiểu trường nhập liệu được bật và bị vô hiệu hóa, và chỉ đọc và đọc-ghi

Phần tử được bật là phần tử có thể được kích hoạt; nó có thể được chọn, nhấp vào, gõ vào, v.v. Mặt khác, phần tử bị vô hiệu hóa không thể tương tác theo bất kỳ cách nào, và dữ liệu của nó thậm chí không được gửi đến máy chủ.

Hai trạng thái này có thể được nhắm mục tiêu bằng {{cssxref(":enabled")}} và {{cssxref(":disabled")}}. Tại sao các trường nhập liệu bị vô hiệu hóa hữu ích? Vâng, đôi khi nếu một số dữ liệu không áp dụng cho một người dùng nhất định, bạn thậm chí có thể không muốn gửi dữ liệu đó khi họ gửi biểu mẫu. Một ví dụ điển hình là biểu mẫu giao hàng — thường bạn sẽ được hỏi có muốn sử dụng cùng địa chỉ cho thanh toán và giao hàng không; nếu có, bạn có thể chỉ gửi một địa chỉ đến máy chủ, và cũng có thể vô hiệu hóa các trường địa chỉ thanh toán.

Hãy xem một ví dụ làm chính xác điều này. Trước tiên, HTML là một biểu mẫu đơn giản chứa các trường nhập liệu văn bản, cùng với hộp kiểm để bật tắt việc vô hiệu hóa địa chỉ thanh toán. Các trường địa chỉ thanh toán bị vô hiệu hóa theo mặc định.

```html
<form>
  <fieldset id="shipping">
    <legend>Shipping address</legend>
    <div>
      <label for="name1">Name: </label>
      <input id="name1" name="name1" type="text" required />
    </div>
    <div>
      <label for="address1">Address: </label>
      <input id="address1" name="address1" type="text" required />
    </div>
    <div>
      <label for="zip-code1">Zip/postal code: </label>
      <input id="zip-code1" name="zip-code1" type="text" required />
    </div>
  </fieldset>
  <fieldset id="billing">
    <legend>Billing address</legend>
    <div>
      <label for="billing-checkbox">Same as shipping address:</label>
      <input type="checkbox" id="billing-checkbox" checked />
    </div>
    <div>
      <label for="name" class="billing-label disabled-label">Name: </label>
      <input id="name" name="name" type="text" disabled required />
    </div>
    <div>
      <label for="address2" class="billing-label disabled-label">
        Address:
      </label>
      <input id="address2" name="address2" type="text" disabled required />
    </div>
    <div>
      <label for="zip-code2" class="billing-label disabled-label">
        Zip/postal code:
      </label>
      <input id="zip-code2" name="zip-code2" type="text" disabled required />
    </div>
  </fieldset>

  <div><button>Submit</button></div>
</form>
```

Bây giờ đến CSS. Các phần liên quan nhất của ví dụ này như sau:

```css
input[type="text"]:disabled {
  background: #eeeeee;
  border: 1px solid #cccccc;
}

label:has(+ :disabled) {
  color: #aaaaaa;
}
```

Chúng ta đã trực tiếp chọn các trường nhập liệu mà chúng ta muốn vô hiệu hóa bằng `input[type="text"]:disabled`, nhưng chúng ta cũng muốn làm mờ các nhãn văn bản tương ứng. Vì các nhãn nằm ngay trước các trường nhập liệu của chúng, chúng ta đã chọn những nhãn đó bằng lớp giả {{cssxref(":has")}}.

Cuối cùng, chúng ta đã sử dụng một số JavaScript để bật tắt việc vô hiệu hóa các trường địa chỉ thanh toán:

```js
function toggleBilling() {
  // Select the billing text fields
  const billingItems = document.querySelectorAll('#billing input[type="text"]');

  // Toggle the billing text fields
  for (const item of billingItems) {
    item.disabled = !item.disabled;
  }
}

// Attach `change` event listener to checkbox
document
  .getElementById("billing-checkbox")
  .addEventListener("change", toggleBilling);
```

Nó sử dụng [sự kiện `change`](/en-US/docs/Web/API/HTMLElement/change_event) để cho phép người dùng bật/tắt các trường thanh toán, và bật tắt kiểu của các nhãn liên quan.

Bạn có thể thấy ví dụ trong thực tế bên dưới (nhấn nút **Play** để chạy ví dụ trong MDN Playground và chỉnh sửa mã nguồn):

```html hidden live-sample___enabled-disabled-shipping
<form>
  <fieldset id="shipping">
    <legend>Shipping address</legend>
    <div>
      <label for="name1">Name: </label>
      <input id="name1" name="name1" type="text" required />
    </div>
    <div>
      <label for="address1">Address: </label>
      <input id="address1" name="address1" type="text" required />
    </div>
    <div>
      <label for="zip-code1">Zip/postal code: </label>
      <input id="zip-code1" name="zip-code1" type="text" required />
    </div>
  </fieldset>
  <fieldset id="billing">
    <legend>Billing address</legend>
    <div>
      <label for="billing-checkbox">Same as shipping address:</label>
      <input type="checkbox" id="billing-checkbox" checked />
    </div>
    <div>
      <label for="name" class="billing-label">Name: </label>
      <input id="name" name="name" type="text" disabled required />
    </div>
    <div>
      <label for="address2" class="billing-label">Address: </label>
      <input id="address2" name="address2" type="text" disabled required />
    </div>
    <div>
      <label for="zip-code2" class="billing-label">Zip/postal code: </label>
      <input id="zip-code2" name="zip-code2" type="text" disabled required />
    </div>
  </fieldset>

  <div><button>Submit</button></div>
</form>
```

```css hidden live-sample___enabled-disabled-shipping
@import "https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&display=swap";

body {
  font-family: "Josefin Sans", sans-serif;
  margin: 20px auto;
  max-width: 460px;
}

fieldset {
  padding: 10px 30px 0;
  margin-bottom: 20px;
}

legend {
  color: white;
  background: black;
  padding: 5px 10px;
}

fieldset > div {
  margin-bottom: 20px;
  display: flex;
}

button,
label,
input[type="text"] {
  display: block;
  font-family: inherit;
  font-size: 100%;
  margin: 0;
  box-sizing: border-box;
  width: 100%;
  padding: 5px;
  height: 30px;
}

input {
  box-shadow: inset 1px 1px 3px #cccccc;
  border-radius: 5px;
}

input:hover,
input:focus {
  background-color: #eeeeee;
}

input[type="text"]:disabled {
  background: #eeeeee;
  border: 1px solid #cccccc;
}

label:has(+ :disabled) {
  color: #aaaaaa;
}

button {
  width: 60%;
  margin: 0 auto;
}
```

```js hidden live-sample___enabled-disabled-shipping
function toggleBilling() {
  // Select the billing text fields
  const billingItems = document.querySelectorAll('#billing input[type="text"]');

  // Toggle the billing text fields
  for (const item of billingItems) {
    item.disabled = !item.disabled;
  }
}

// Attach `change` event listener to checkbox
document
  .getElementById("billing-checkbox")
  .addEventListener("change", toggleBilling);

const form = document.querySelector("form");
form.addEventListener("submit", (e) => {
  e.preventDefault();
});
```

{{EmbedLiveSample("enabled-disabled-shipping", "100%", 580, , , , , "allow-forms")}}

### Chỉ đọc và đọc-ghi

Theo cách tương tự như `:disabled` và `:enabled`, các lớp giả `:read-only` và `:read-write` nhắm mục tiêu hai trạng thái mà trường nhập liệu biểu mẫu chuyển đổi giữa. Như với trường nhập liệu bị vô hiệu hóa, người dùng không thể chỉnh sửa trường nhập liệu chỉ đọc. Tuy nhiên, không giống như trường nhập liệu bị vô hiệu hóa, giá trị trường nhập liệu chỉ đọc sẽ được gửi đến máy chủ. Đọc-ghi có nghĩa là chúng có thể được chỉnh sửa — trạng thái mặc định của chúng.

Trường nhập liệu được đặt thành chỉ đọc bằng thuộc tính `readonly`. Như một ví dụ, hãy tưởng tượng một trang xác nhận nơi nhà phát triển đã gửi thông tin điền ở các trang trước sang trang này, với mục đích để người dùng kiểm tra tất cả chúng ở một nơi, thêm bất kỳ dữ liệu cuối cùng cần thiết, và sau đó xác nhận đơn hàng bằng cách gửi. Tại thời điểm này, tất cả dữ liệu biểu mẫu cuối cùng có thể được gửi đến máy chủ trong một lần.

Hãy xem một biểu mẫu có thể trông như thế nào.

Một đoạn HTML như sau — lưu ý thuộc tính readonly:

```html
<div>
  <label for="name">Name: </label>
  <input id="name" name="name" type="text" value="Mr Soft" readonly />
</div>
```

Nếu bạn thử ví dụ trực tiếp, bạn sẽ thấy rằng bộ phần tử biểu mẫu trên cùng không thể chỉnh sửa, tuy nhiên, các giá trị được gửi khi biểu mẫu được gửi. Chúng ta đã tạo kiểu cho các điều khiển biểu mẫu bằng lớp giả `:read-only` và `:read-write`, như thế này:

```css
input:read-only,
textarea:read-only {
  border: 0;
  box-shadow: none;
  background-color: white;
}

textarea:read-write {
  box-shadow: inset 1px 1px 3px #cccccc;
  border-radius: 5px;
}
```

Ví dụ đầy đủ trông như thế này (nhấn nút **Play** để chạy ví dụ trong MDN Playground và chỉnh sửa mã nguồn):

```html hidden live-sample___readonly-confirmation
<form>
  <fieldset>
    <legend>Check shipping details</legend>
    <div>
      <label for="name">Name: </label>
      <input id="name" name="name" type="text" value="Mr Soft" readonly />
    </div>
    <div>
      <label for="address">Address: </label>
      <textarea id="address" name="address" readonly>
23 Elastic Way,
Viscous,
Bright Ridge,
CA
</textarea
      >
    </div>
    <div>
      <label for="zip-code">Zip/postal code: </label>
      <input id="zip-code" name="zip-code" type="text" value="94708" readonly />
    </div>
  </fieldset>

  <fieldset>
    <legend>Final instructions</legend>
    <div>
      <label for="sms-confirm">Send confirmation by SMS?</label>
      <input id="sms-confirm" name="sms-confirm" type="checkbox" />
    </div>
    <div>
      <label for="instructions">Any special instructions?</label>
      <textarea id="instructions" name="instructions"></textarea>
    </div>
  </fieldset>

  <div><button type="button">Amend details</button></div>
  <div><button type="submit">Submit</button></div>
</form>
```

```css hidden live-sample___readonly-confirmation
@import "https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&display=swap";

body {
  font-family: "Josefin Sans", sans-serif;
  margin: 20px auto;
  max-width: 460px;
}

fieldset {
  padding: 10px 30px 0;
  margin-bottom: 20px;
}

legend {
  color: white;
  background: black;
  padding: 5px 10px;
}

fieldset > div {
  margin-bottom: 20px;
  display: flex;
  justify-content: space-between;
}

button,
label,
input[type="text"],
textarea {
  display: block;
  font-family: inherit;
  font-size: 100%;
  margin: 0;
  box-sizing: border-box;
  padding: 5px;
  height: 30px;
}

input[type="text"],
textarea {
  width: 50%;
}

textarea {
  height: 110px;
  resize: none;
}

label {
  width: 40%;
}

input:read-only,
textarea:read-only {
  border: 0;
  box-shadow: none;
  background-color: white;
}

textarea:read-write {
  box-shadow: inset 1px 1px 3px #cccccc;
  border-radius: 5px;
}
```

{{EmbedLiveSample("readonly-confirmation", "100%", 660, , , , , "allow-forms")}}

## Kiểu radio được chọn theo mặc định và không xác định

Như đã đề cập ở trên, lớp giả {{cssxref(":checked")}} khớp với nút chọn và hộp kiểm khi chúng được chọn, điều này thực sự hữu ích để tạo kiểu.

Ngoài ra còn có lớp giả {{cssxref(":default")}} khớp với các nút chọn/hộp kiểm được chọn theo mặc định, khi trang tải, ngay cả khi chúng không được chọn. Điều này có thể hữu ích để thêm chỉ báo vào danh sách các tùy chọn nhắc nhở người dùng về các mặc định (hoặc tùy chọn bắt đầu) là gì, trong trường hợp họ muốn đặt lại các lựa chọn của mình.

Ngoài ra, các nút chọn/hộp kiểm đã đề cập ở trên sẽ được khớp bởi lớp giả {{cssxref(":indeterminate")}} khi chúng ở trạng thái không được chọn cũng không phải không được chọn. Nhưng điều này có nghĩa là gì? Các phần tử không xác định bao gồm:

- Các trường nhập liệu {{HTMLElement("input/radio")}}, khi tất cả các nút chọn trong một nhóm cùng tên không được chọn
- Các trường nhập liệu {{HTMLElement("input/checkbox")}} có thuộc tính `indeterminate` được đặt thành `true` qua JavaScript
- Các phần tử {{HTMLElement("progress")}} không có giá trị.

Đây không phải là thứ bạn sẽ thường xuyên sử dụng. Một trường hợp sử dụng có thể là chỉ báo để cho người dùng biết rằng họ thực sự cần chọn một nút chọn trước khi tiếp tục.

Hãy xem xét một số phiên bản đã sửa đổi của ví dụ trước nhắc nhở người dùng về tùy chọn mặc định là gì, và tạo kiểu cho các nhãn của nút chọn khi không xác định. Cả hai đều có cấu trúc HTML sau cho các trường nhập liệu:

```html
<p>
  <input type="radio" name="fruit" value="cherry" id="cherry" />
  <label for="cherry">Cherry</label>
  <span></span>
</p>
```

Đối với ví dụ `:default`, chúng ta đã thêm thuộc tính `checked` vào trường nhập liệu nút chọn banana giữa, vì vậy nó sẽ được chọn theo mặc định khi tải. Sau đó chúng ta tạo kiểu cho nó với CSS sau:

```css
input ~ span {
  position: relative;
}

input:default ~ span::after {
  font-size: 0.7rem;
  position: absolute;
  content: "Default";
  color: white;
  background-color: black;
  padding: 5px 10px;
  right: -65px;
  top: -3px;
}
```

{{EmbedLiveSample("radios-checked-default", "100%", 200, , , , , "allow-forms")}}

Đối với ví dụ `:indeterminate`, chúng ta không có nút chọn mặc định nào được chọn — điều này quan trọng — nếu có, thì sẽ không có trạng thái không xác định để tạo kiểu. Chúng ta tạo kiểu cho các nút chọn không xác định với CSS sau:

```css
input[type="radio"]:indeterminate {
  outline: 2px solid red;
  animation: 0.4s linear infinite alternate outline-pulse;
}

@keyframes outline-pulse {
  from {
    outline: 2px solid red;
  }

  to {
    outline: 6px solid red;
  }
}
```

Điều này tạo ra một đường viền hoạt ảnh thú vị trên các nút chọn, hy vọng chỉ ra rằng bạn cần chọn một trong số chúng!

Xem kết quả trực tiếp bên dưới (nhấn nút **Play** để chạy ví dụ trong MDN Playground và chỉnh sửa mã nguồn):

```html hidden live-sample___radios-checked-indeterminate
<form>
  <fieldset>
    <legend>Choose your favorite fruit</legend>
    <p>
      <input type="radio" name="fruit" value="cherry" id="cherry" />
      <label for="cherry">Cherry</label>
      <span></span>
    </p>
    <p>
      <input type="radio" name="fruit" value="banana" id="banana" />
      <label for="banana">Banana</label>
      <span></span>
    </p>
    <p>
      <input type="radio" name="fruit" value="strawberry" id="strawberry" />
      <label for="strawberry">Strawberry</label>
      <span></span>
    </p>
  </fieldset>
</form>
```

```css hidden live-sample___radios-checked-indeterminate
@import "https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&display=swap";

body {
  font-family: "Josefin Sans", sans-serif;
}

input[type="radio"] {
  -webkit-appearance: none;
  appearance: none;
}

input[type="radio"] {
  width: 20px;
  height: 20px;
  border-radius: 10px;
  border: 2px solid gray;
  /* Adjusts the position of the checkboxes on the text baseline */
  vertical-align: -2px;
  outline: none;
}

input[type="radio"]::before {
  display: block;
  content: " ";
  width: 10px;
  height: 10px;
  border-radius: 6px;
  background-color: red;
  font-size: 1.2em;
  transform: translate(3px, 3px) scale(0);
  transform-origin: center;
  transition: all 0.3s ease-in;
}

input[type="radio"]:checked::before {
  transform: translate(3px, 3px) scale(1);
  transition: all 0.3s cubic-bezier(0.25, 0.25, 0.56, 2);
}

input[type="radio"]:indeterminate {
  border: 2px solid red;
  animation: 0.4s linear infinite alternate border-pulse;
}

@keyframes border-pulse {
  from {
    border: 2px solid red;
  }

  to {
    border: 6px solid red;
  }
}
```

{{EmbedLiveSample("radios-checked-indeterminate", "100%", 200, , , , , "allow-forms")}}

> [!NOTE]
> Bạn có thể tìm thấy một [ví dụ thú vị liên quan đến trạng thái `indeterminate`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox#indeterminate_state_checkboxes) trên trang tham khảo [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox).

## Nhiều lớp giả hơn

Có một số lớp giả thú vị khác, và chúng ta không có không gian để viết về tất cả chúng chi tiết ở đây. Hãy nói về một vài lớp giả khác mà bạn nên dành thời gian điều tra.

- Lớp giả {{cssxref(":focus-within")}} khớp với phần tử đã nhận focus hoặc _chứa_ phần tử đã nhận focus. Điều này hữu ích nếu bạn muốn toàn bộ biểu mẫu làm nổi bật theo một cách nào đó khi một trường nhập liệu bên trong nó được lấy focus.
- Lớp giả {{cssxref(":focus-visible")}} khớp với các phần tử được lấy focus đã nhận focus qua tương tác bàn phím (thay vì chạm hoặc chuột) — hữu ích nếu bạn muốn hiển thị kiểu khác nhau cho focus bàn phím so với focus chuột (hoặc khác).
- Lớp giả {{cssxref(":placeholder-shown")}} khớp với các phần tử {{htmlelement('input')}} và {{htmlelement('textarea')}} có văn bản gợi ý hiển thị của chúng (tức là, nội dung của thuộc tính [`placeholder`](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder)) vì giá trị của phần tử trống.

Những lớp sau cũng thú vị, nhưng chưa được hỗ trợ tốt trong các trình duyệt:

- Lớp giả {{cssxref(":blank")}} chọn các điều khiển biểu mẫu trống. {{cssxref(":empty")}} cũng khớp với các phần tử không có con, như {{HTMLElement("input")}}, nhưng nó tổng quát hơn — nó cũng khớp với các [phần tử rỗng](/en-US/docs/Glossary/Void_element) khác như {{HTMLElement("br")}} và {{HTMLElement("hr")}}. `:empty` có hỗ trợ trình duyệt hợp lý; đặc tả của lớp giả `:blank` chưa hoàn thành, vì vậy nó chưa được hỗ trợ trong bất kỳ trình duyệt nào.
- Lớp giả {{cssxref(":user-invalid")}}, khi được hỗ trợ, sẽ tương tự như {{cssxref(":invalid")}}, nhưng với trải nghiệm người dùng tốt hơn. Nếu giá trị hợp lệ khi trường nhập liệu nhận focus, phần tử có thể khớp `:invalid` khi người dùng nhập dữ liệu nếu giá trị tạm thời không hợp lệ, nhưng sẽ chỉ khớp `:user-invalid` khi phần tử mất focus. Nếu giá trị ban đầu không hợp lệ, nó sẽ khớp cả `:invalid` và `:user-invalid` trong suốt thời gian focus. Tương tự như `:invalid`, nó sẽ ngừng khớp `:user-invalid` nếu giá trị trở nên hợp lệ.

## Tóm tắt

Điều này kết thúc cái nhìn của chúng ta về các lớp giả giao diện người dùng liên quan đến trường nhập liệu biểu mẫu. Hãy tiếp tục chơi với chúng, và tạo ra một số kiểu biểu mẫu thú vị! Tiếp theo, chúng ta sẽ chuyển sang điều gì đó khác — [kiểm tra hợp lệ biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation).

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Customizable_select_listboxes", "Learn_web_development/Extensions/Forms/Form_validation", "Learn_web_development/Extensions/Forms")}}
