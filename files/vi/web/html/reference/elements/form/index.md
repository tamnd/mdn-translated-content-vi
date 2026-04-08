---
title: "<form>: Phần tử Form"
slug: Web/HTML/Reference/Elements/form
page-type: html-element
browser-compat: html.elements.form
sidebar: htmlsidebar
---

Phần tử **`<form>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho một phần tài liệu chứa các điều khiển tương tác để gửi thông tin.

{{InteractiveExample("HTML Demo: &lt;form&gt;", "tabbed-standard")}}

```html interactive-example
<form action="" method="get" class="form-example">
  <div class="form-example">
    <label for="name">Enter your name: </label>
    <input type="text" name="name" id="name" required />
  </div>
  <div class="form-example">
    <label for="email">Enter your email: </label>
    <input type="email" name="email" id="email" required />
  </div>
  <div class="form-example">
    <input type="submit" value="Subscribe!" />
  </div>
</form>
```

```css interactive-example
form.form-example {
  display: table;
}

div.form-example {
  display: table-row;
}

label,
input {
  display: table-cell;
  margin-bottom: 10px;
}

label {
  padding-right: 10px;
}
```

Có thể sử dụng {{cssxref(':valid')}} và {{cssxref(':invalid')}} CSS [pseudo-classes](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) để tạo kiểu cho phần tử `<form>` dựa trên việc các {{domxref("HTMLFormElement.elements", "elements")}} bên trong form có hợp lệ hay không.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `accept` {{deprecated_inline}}
  - : Các [loại nội dung](/en-US/docs/Web/SVG/Guides/Content_type) được server chấp nhận, cách nhau bởi dấu phẩy.

    > [!NOTE]
    > **Thuộc tính này đã bị loại bỏ và không nên sử dụng.** Thay vào đó, hãy sử dụng thuộc tính [`accept`](/en-US/docs/Web/HTML/Reference/Elements/input#accept) trên các phần tử `<input type=file>`.

- `accept-charset`
  - : {{Glossary("character encoding")}} được server chấp nhận.
    Đặc tả cho phép một giá trị không phân biệt chữ hoa/thường là `"UTF-8"`, phản ánh sự phổ biến của bộ mã hóa này (trước đây có thể chỉ định nhiều bộ mã hóa ký tự dưới dạng danh sách cách nhau bởi dấu phẩy hoặc khoảng trắng).

- `autocapitalize`
  - : Kiểm soát việc văn bản được nhập có tự động viết hoa hay không và nếu có thì theo cách nào. Xem trang thuộc tính toàn cục [`autocapitalize`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocapitalize) để biết thêm thông tin.

- [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete)
  - : Cho biết các phần tử input có thể theo mặc định có giá trị được trình duyệt tự động điền hay không. Các thuộc tính `autocomplete` trên các phần tử form sẽ ghi đè nó trên `<form>`. Các giá trị có thể:
    - `off`: Trình duyệt không thể tự động hoàn thành các mục nhập. (Trình duyệt có xu hướng bỏ qua điều này cho các form đăng nhập được nhận dạng; xem [Quản lý tự động điền cho các trường đăng nhập](/en-US/docs/Web/Security/Practical_implementation_guides/Turning_off_form_autocompletion#managing_autofill_for_login_fields).)
    - `on`: Trình duyệt có thể tự động hoàn thành các mục nhập.

- `name`
  - : Tên của form. Giá trị không được là chuỗi rỗng, và phải là duy nhất trong số các phần tử `form` trong tập hợp form mà nó thuộc về, nếu có. Tên trở thành thuộc tính của các đối tượng {{domxref("Window")}}, {{domxref("Document")}}, và {{domxref("document.forms")}}, chứa tham chiếu đến phần tử form.

- [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel)
  - : Kiểm soát các chú thích và loại liên kết mà form tạo ra. Các chú thích bao gồm [`external`](/en-US/docs/Web/HTML/Reference/Attributes/rel#external), [`nofollow`](/en-US/docs/Web/HTML/Reference/Attributes/rel#nofollow), [`opener`](/en-US/docs/Web/HTML/Reference/Attributes/rel#opener), [`noopener`](/en-US/docs/Web/HTML/Reference/Attributes/rel#noopener), và [`noreferrer`](/en-US/docs/Web/HTML/Reference/Attributes/rel#noreferrer). Các loại liên kết bao gồm [`help`](/en-US/docs/Web/HTML/Reference/Attributes/rel#help), [`prev`](/en-US/docs/Web/HTML/Reference/Attributes/rel#prev), [`next`](/en-US/docs/Web/HTML/Reference/Attributes/rel#next), [`search`](/en-US/docs/Web/HTML/Reference/Attributes/rel#search), và [`license`](/en-US/docs/Web/HTML/Reference/Attributes/rel#license). Giá trị [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel) là danh sách cách nhau bởi khoảng trắng của các giá trị được liệt kê này.

### Thuộc tính để gửi form

Các thuộc tính sau kiểm soát hành vi trong quá trình gửi form.

- `action`
  - : URL xử lý việc gửi form. Giá trị này có thể được ghi đè bởi thuộc tính [`formaction`](/en-US/docs/Web/HTML/Reference/Elements/button#formaction) trên {{HTMLElement("button")}}, [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit), hoặc phần tử [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image). Thuộc tính này bị bỏ qua khi `method="dialog"` được đặt.
- `enctype`
  - : Nếu giá trị của thuộc tính `method` là `post`, `enctype` là [loại MIME](https://en.wikipedia.org/wiki/Mime_type) của việc gửi form. Các giá trị có thể:
    - `application/x-www-form-urlencoded`: Giá trị mặc định.
    - `multipart/form-data`: Sử dụng điều này nếu form chứa các phần tử {{HTMLElement("input")}} với `type=file`.
    - `text/plain`: Hữu ích cho mục đích gỡ lỗi.

    Giá trị này có thể được ghi đè bởi các thuộc tính [`formenctype`](/en-US/docs/Web/HTML/Reference/Elements/button#formenctype) trên {{HTMLElement("button")}}, [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit), hoặc các phần tử [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image).

- `method`
  - : Phương thức [HTTP](/en-US/docs/Web/HTTP) để gửi form.
    Các phương thức/giá trị được phép duy nhất (không phân biệt chữ hoa/thường):
    - `post`: Phương thức {{HTTPMethod("POST")}}; dữ liệu form được gửi dưới dạng [nội dung yêu cầu](/en-US/docs/Web/API/Request/body).
    - `get` (mặc định): {{HTTPMethod("GET")}}; dữ liệu form được nối vào URL `action` với dấu phân cách `?`. Sử dụng phương thức này khi form [không có tác dụng phụ](/en-US/docs/Glossary/Idempotent).
    - `dialog`: Khi form nằm trong {{HTMLElement("dialog")}}, đóng hộp thoại và kích hoạt sự kiện `submit` khi gửi, mà không gửi dữ liệu hay xóa form.

    Giá trị này bị ghi đè bởi các thuộc tính [`formmethod`](/en-US/docs/Web/HTML/Reference/Elements/button#formmethod) trên {{HTMLElement("button")}}, [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit), hoặc các phần tử [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image).

- `novalidate`
  - : Thuộc tính Boolean này cho biết form không nên được xác thực khi gửi. Nếu thuộc tính này không được đặt (và do đó form **_được_** xác thực), nó có thể bị ghi đè bởi thuộc tính [`formnovalidate`](/en-US/docs/Web/HTML/Reference/Elements/button#formnovalidate) trên {{HTMLElement("button")}}, [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit), hoặc phần tử [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image) thuộc form.
- `target`
  - : Cho biết nơi hiển thị phản hồi sau khi gửi form. Đây là tên/từ khóa cho một _browsing context_ (ví dụ: tab, cửa sổ, hoặc iframe). Các từ khóa sau có ý nghĩa đặc biệt:
    - `_self` (mặc định): Tải vào cùng browsing context hiện tại.
    - `_blank`: Tải vào một browsing context mới chưa được đặt tên. Điều này cung cấp hành vi tương tự như đặt [`rel="noopener"`](#rel) không đặt [`window.opener`](/en-US/docs/Web/API/Window/opener).
    - `_parent`: Tải vào browsing context cha của trang hiện tại. Nếu không có cha, hoạt động giống như `_self`.
    - `_top`: Tải vào browsing context cấp cao nhất (tức là browsing context là tổ tiên của trang hiện tại và không có cha). Nếu không có cha, hoạt động giống như `_self`.
    - `_unfencedTop`: Tải phản hồi từ một form bên trong [fenced frame](/en-US/docs/Web/API/Fenced_frame_API) được nhúng vào frame cấp cao nhất (tức là vượt qua gốc của fenced frame, không giống như các đích đến dành riêng khác). Chỉ khả dụng bên trong fenced frames.

    Giá trị này có thể bị ghi đè bởi thuộc tính [`formtarget`](/en-US/docs/Web/HTML/Reference/Elements/button#formtarget) trên {{HTMLElement("button")}}, [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit), hoặc phần tử [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image).

## Ví dụ

```html
<!-- Form sẽ gửi yêu cầu GET đến URL hiện tại -->
<form method="get">
  <label>
    Name:
    <input name="submitted-name" autocomplete="name" />
  </label>
  <button>Save</button>
</form>

<!-- Form sẽ gửi yêu cầu POST đến URL hiện tại -->
<form method="post">
  <label>
    Name:
    <input name="submitted-name" autocomplete="name" />
  </label>
  <button>Save</button>
</form>

<!-- Form với fieldset, legend, và label -->
<form method="post">
  <fieldset>
    <legend>Do you agree to the terms?</legend>
    <label><input type="radio" name="radio" value="yes" /> Yes</label>
    <label><input type="radio" name="radio" value="no" /> No</label>
  </fieldset>
</form>
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung luồng</a>,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#palpable_content">nội dung hữu hình</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung cho phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung luồng</a>, nhưng không chứa các phần tử <code>&#x3C;form></code>
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha cho phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">nội dung luồng</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/form_role">form</a></code>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA cho phép</th>
      <td>
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role">search</a></code>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>
         hoặc <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLFormElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hướng dẫn HTML forms](/en-US/docs/Learn_web_development/Extensions/Forms)
- Các phần tử khác được sử dụng khi tạo form: {{HTMLElement("button")}}, {{HTMLElement("datalist")}}, {{HTMLElement("fieldset")}}, {{HTMLElement("input")}}, {{HTMLElement("label")}}, {{HTMLElement("legend")}}, {{HTMLElement("meter")}}, {{HTMLElement("optgroup")}}, {{HTMLElement("option")}}, {{HTMLElement("output")}}, {{HTMLElement("progress")}}, {{HTMLElement("select")}}, {{HTMLElement("textarea")}}.
- Lấy danh sách các phần tử trong form: {{domxref("HTMLFormElement.elements")}}
- [ARIA: Vai trò Form](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/form_role)
- [ARIA: Vai trò Search](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role)
