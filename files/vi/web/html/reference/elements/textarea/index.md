---
title: "<textarea>: Phần tử Textarea"
slug: Web/HTML/Reference/Elements/textarea
page-type: html-element
browser-compat: html.elements.textarea
sidebar: htmlsidebar
---

Phần tử **`<textarea>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho điều khiển chỉnh sửa văn bản thuần nhiều dòng, hữu ích khi bạn muốn cho phép người dùng nhập lượng văn bản tự do đáng kể, ví dụ như nhận xét về bài đánh giá hoặc form phản hồi.

{{InteractiveExample("HTML Demo: &lt;textarea&gt;", "tabbed-standard")}}

```html interactive-example
<label for="story">Tell us your story:</label>

<textarea id="story" name="story" rows="5" cols="33">
It was a dark and stormy night...
</textarea>
```

```css interactive-example
label,
textarea {
  font-size: 0.8rem;
  letter-spacing: 1px;
}

textarea {
  padding: 10px;
  max-width: 100%;
  line-height: 1.5;
  border-radius: 5px;
  border: 1px solid #cccccc;
  box-shadow: 1px 1px 1px #999999;
}

label {
  display: block;
  margin-bottom: 10px;
}
```

Ví dụ trên minh họa một số tính năng của `<textarea>`:

- Thuộc tính `id` để cho phép `<textarea>` được liên kết với phần tử {{htmlelement("label")}} cho mục đích khả năng tiếp cận
- Thuộc tính `name` để đặt tên của điểm dữ liệu liên quan được gửi đến server khi form được gửi.
- Các thuộc tính `rows` và `cols` để cho phép bạn chỉ định kích thước chính xác cho `<textarea>`. Đặt các thuộc tính này là ý hay để đảm bảo tính nhất quán, vì giá trị mặc định của trình duyệt có thể khác nhau.
- Phần tử `<textarea>` chỉ định nội dung của nó theo cách khác nhau trong ngữ cảnh HTML và JavaScript:
  - Trong HTML, nội dung ban đầu của `<textarea>` được chỉ định giữa thẻ mở và thẻ đóng của nó, không phải như thuộc tính `value`.
  - Trong JavaScript, các phần tử `<textarea>` có thuộc tính [`value`](/en-US/docs/Web/API/HTMLTextAreaElement/value) có thể được dùng để lấy hoặc đặt nội dung hiện tại, và [`defaultValue`](/en-US/docs/Web/API/HTMLTextAreaElement/defaultValue) để lấy và đặt giá trị ban đầu (tương đương với truy cập nội dung văn bản của phần tử HTML).

Phần tử `<textarea>` cũng chấp nhận nhiều thuộc tính phổ biến cho `<input>` form, như `autocapitalize`, `autocomplete`, `autofocus`, `disabled`, `placeholder`, `readonly`, và `required`.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- [`autocapitalize`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocapitalize)
  - : Kiểm soát việc văn bản được nhập có tự động viết hoa hay không và nếu có thì theo cách nào.

- [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete)
  - : Kiểm soát việc văn bản đã nhập có thể được trình duyệt tự động hoàn thành hay không. Các giá trị có thể:
    - `off`: Người dùng phải nhập rõ ràng một giá trị vào trường này trong mỗi lần sử dụng, hoặc tài liệu cung cấp phương thức tự động hoàn thành của riêng nó; trình duyệt không tự động hoàn thành mục nhập.
    - `on`: Trình duyệt có thể tự động hoàn thành giá trị dựa trên các giá trị người dùng đã nhập trong các lần sử dụng trước.
    - [`<token-list>`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete#token_list_tokens): Tập hợp được sắp xếp của các token chi tiết tự động điền cách nhau bởi khoảng trắng, tùy chọn có tiền tố là token phân đoạn, token nhóm thanh toán hoặc giao hàng, và/hoặc token xác định loại người nhận.

    Các phần tử `<textarea>` không chỉ định thuộc tính `autocomplete` kế thừa trạng thái `on` hoặc `off` của `autocomplete` được đặt trên form sở hữu của `<textarea>`. Form sở hữu là phần tử {{HTMLElement("form")}} mà phần tử `<textarea>` này là hậu duệ, hoặc phần tử form có `id` được chỉ định bởi thuộc tính `form` của phần tử input. Để biết thêm thông tin, xem thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/form#autocomplete) trong {{HTMLElement("form")}}.

- [`autocorrect`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocorrect)
  - : Kiểm soát việc tự động sửa chính tả và xử lý văn bản có được bật khi người dùng chỉnh sửa `textarea` này hay không.
    Các giá trị được phép:
    - `on`
      - : Bật tự động sửa chính tả và thay thế văn bản.
    - `off`
      - : Tắt tự động sửa chính tả và thay thế văn bản.

- [`autofocus`](/en-US/docs/Web/HTML/Reference/Global_attributes/autofocus)
  - : Thuộc tính Boolean này cho phép bạn chỉ định rằng điều khiển form nên có tiêu điểm nhập liệu khi trang tải. Chỉ một phần tử liên kết form trong tài liệu có thể có thuộc tính này được chỉ định.
- `cols`
  - : Chiều rộng hiển thị của điều khiển văn bản, tính bằng độ rộng ký tự trung bình. Nếu được chỉ định, nó phải là số nguyên dương. Nếu không được chỉ định, giá trị mặc định là `20`.
- [`dirname`](/en-US/docs/Web/HTML/Reference/Attributes/dirname)
  - : Thuộc tính này được dùng để chỉ ra hướng văn bản của nội dung phần tử.
    Để biết thêm thông tin, xem [thuộc tính `dirname`](/en-US/docs/Web/HTML/Reference/Attributes/dirname).
- [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled)
  - : Thuộc tính Boolean này cho biết người dùng không thể tương tác với điều khiển. Nếu thuộc tính này không được chỉ định, điều khiển kế thừa cài đặt của nó từ phần tử chứa, ví dụ {{ HTMLElement("fieldset") }}; nếu không có phần tử chứa nào khi thuộc tính `disabled` được đặt, điều khiển được bật.
- [`form`](/en-US/docs/Web/HTML/Reference/Attributes/form)
  - : Phần tử form mà phần tử `<textarea>` được liên kết (form sở hữu của nó). Giá trị của thuộc tính phải là `id` của phần tử form trong cùng tài liệu. Nếu thuộc tính này không được chỉ định, phần tử `<textarea>` phải là hậu duệ của phần tử form. Thuộc tính này cho phép bạn đặt các phần tử `<textarea>` ở bất kỳ đâu trong tài liệu, không chỉ là hậu duệ của các phần tử form.
- [`maxlength`](/en-US/docs/Web/HTML/Reference/Attributes/maxlength)
  - : Độ dài chuỗi tối đa (đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập. Nếu giá trị này không được chỉ định, người dùng có thể nhập số lượng ký tự không giới hạn.
- [`minlength`](/en-US/docs/Web/HTML/Reference/Attributes/minlength)
  - : Độ dài chuỗi tối thiểu (đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) bắt buộc mà người dùng cần nhập.
- `name`
  - : Tên của điều khiển.
- [`placeholder`](/en-US/docs/Web/HTML/Reference/Attributes/placeholder)
  - : Gợi ý cho người dùng về những gì có thể được nhập vào điều khiển. Các ký tự xuống dòng hoặc ngắt dòng trong văn bản placeholder phải được xử lý như ngắt dòng khi hiển thị gợi ý.

    > [!NOTE]
    > Placeholders chỉ nên được dùng để hiển thị ví dụ về loại dữ liệu cần được nhập vào form; chúng _không_ phải là thay thế cho phần tử {{HTMLElement("label")}} thích hợp được liên kết với input. Xem [Nhãn `<input>`](/en-US/docs/Web/HTML/Reference/Elements/input#labels) để có giải thích đầy đủ.

- [`readonly`](/en-US/docs/Web/HTML/Reference/Attributes/readonly)
  - : Thuộc tính Boolean này cho biết người dùng không thể sửa đổi giá trị của điều khiển. Không giống thuộc tính `disabled`, thuộc tính `readonly` không ngăn người dùng nhấp hoặc chọn trong điều khiển. Giá trị của điều khiển chỉ đọc vẫn được gửi cùng form.
- [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required)
  - : Thuộc tính này chỉ định rằng người dùng phải điền giá trị trước khi gửi form.
- `rows`
  - : Số dòng văn bản hiển thị cho điều khiển. Nếu được chỉ định, nó phải là số nguyên dương. Nếu không được chỉ định, giá trị mặc định là 2.
- [`spellcheck`](/en-US/docs/Web/HTML/Reference/Global_attributes/spellcheck)
  - : Chỉ định xem `<textarea>` có phải kiểm tra chính tả bởi trình duyệt/OS nền hay không. Giá trị có thể là:
    - `true`: Cho biết phần tử cần được kiểm tra chính tả và ngữ pháp.
    - `default` : Cho biết phần tử cần hoạt động theo hành vi mặc định, có thể dựa trên giá trị `spellcheck` của phần tử cha.
    - `false` : Cho biết phần tử không cần kiểm tra chính tả.

- `wrap`
  - : Cho biết cách điều khiển nên bọc giá trị cho việc gửi form. Các giá trị có thể:
    - `hard`: Trình duyệt tự động chèn ngắt dòng (CR+LF) để mỗi dòng không dài hơn chiều rộng của điều khiển; thuộc tính [`cols`](#cols) phải được chỉ định để điều này có hiệu lực
    - `soft`: Trình duyệt đảm bảo tất cả các ngắt dòng trong giá trị được nhập là cặp `CR+LF`, nhưng không thêm ngắt dòng bổ sung vào giá trị.
    - `off` {{non-standard_inline}}: Giống `soft` nhưng thay đổi giao diện thành `white-space: pre` vì vậy các đoạn dòng vượt quá `cols` không được bọc và `<textarea>` trở nên cuộn ngang.

    Nếu thuộc tính này không được chỉ định, `soft` là giá trị mặc định của nó.

## Tạo kiểu với CSS

`<textarea>` là {{ glossary("replaced elements", "phần tử thay thế") }} — nó có kích thước nội tại, giống như hình ảnh raster. Theo mặc định, giá trị {{cssxref("display")}} của nó là `inline-block`. So với các phần tử form khác, nó tương đối dễ tạo kiểu, với mô hình hộp, font, bảng màu, v.v. có thể dễ dàng thao tác bằng CSS thông thường.

[Tạo kiểu HTML forms](/en-US/docs/Learn_web_development/Extensions/Forms/Styling_web_forms) cung cấp một số mẹo hữu ích về tạo kiểu `<textarea>`.

### Sự không nhất quán của đường cơ sở

Đặc tả HTML không xác định đường cơ sở của `<textarea>` ở đâu, vì vậy các trình duyệt khác nhau đặt nó ở các vị trí khác nhau. Đối với Gecko, đường cơ sở của `<textarea>` được đặt trên đường cơ sở của dòng đầu tiên của textarea, trên trình duyệt khác có thể được đặt ở đáy hộp `<textarea>`. Đừng sử dụng {{cssxref("vertical-align", "vertical-align: baseline")}} trên nó; hành vi không thể đoán trước.

### Kiểm soát liệu textarea có thể thay đổi kích thước không

Trong hầu hết trình duyệt, `<textarea>` có thể thay đổi kích thước — bạn sẽ nhận thấy tay nắm kéo ở góc dưới bên phải, có thể được dùng để thay đổi kích thước của phần tử trên trang. Điều này được kiểm soát bởi thuộc tính CSS {{ cssxref("resize") }} — thay đổi kích thước được bật theo mặc định, nhưng bạn có thể tắt nó rõ ràng bằng cách sử dụng giá trị `none` của `resize`:

```css
textarea {
  resize: none;
}
```

### Tạo kiểu giá trị hợp lệ và không hợp lệ

Các giá trị hợp lệ và không hợp lệ của phần tử `<textarea>` (ví dụ những giá trị trong và ngoài các giới hạn được đặt bởi `minlength`, `maxlength`, hoặc `required`) có thể được làm nổi bật bằng cách sử dụng các lớp pseudo {{cssxref(":valid")}} và {{cssxref(":invalid")}}. Ví dụ, để cung cấp cho textarea một viền khác tùy theo liệu nó có hợp lệ hay không:

```css
textarea:invalid {
  border: 2px dashed red;
}

textarea:valid {
  border: 2px solid lime;
}
```

## Ví dụ

### Ví dụ cơ bản

Ví dụ sau hiển thị textarea với số hàng và cột được đặt, một số nội dung mặc định, và các kiểu CSS ngăn người dùng thay đổi kích thước phần tử hơn 500px rộng và 130px cao:

```html
<textarea name="textarea" rows="5" cols="15">Write something here</textarea>
```

```css
textarea {
  max-height: 130px;
  max-width: 500px;
}
```

#### Kết quả

{{EmbedLiveSample('Basic_example')}}

### Ví dụ sử dụng "minlength" và "maxlength"

Ví dụ này có số lượng ký tự tối thiểu và tối đa — lần lượt là 10 và 20. Hãy thử xem.

```html
<textarea name="textarea" rows="5" cols="30" minlength="10" maxlength="20">
Write something here…
</textarea>
```

```css
textarea {
  max-height: 130px;
  max-width: 500px;
}
```

#### Kết quả

{{EmbedLiveSample('Example using "minlength" and "maxlength"')}}

Lưu ý rằng `minlength` không ngăn người dùng xóa ký tự để số ký tự nhập vào vượt qua mức tối thiểu, nhưng nó làm cho giá trị đã nhập vào `<textarea>` không hợp lệ. Cũng lưu ý rằng ngay cả khi bạn đặt giá trị `minlength` (3, ví dụ), `<textarea>` rỗng vẫn được coi là hợp lệ trừ khi bạn cũng đặt thuộc tính `required`.

### Ví dụ sử dụng "placeholder"

Ví dụ này có placeholder được đặt. Chú ý cách nó biến mất khi bạn bắt đầu gõ vào hộp.

```html
<textarea
  name="textarea"
  rows="5"
  cols="30"
  placeholder="Comment text."></textarea>
```

```css
textarea {
  max-height: 130px;
  max-width: 500px;
}
```

#### Kết quả

{{EmbedLiveSample('Example using "placeholder"')}}

> [!NOTE]
> Placeholders chỉ nên được dùng để hiển thị ví dụ về loại dữ liệu cần được nhập vào form; chúng _không_ phải là thay thế cho phần tử {{HTMLElement("label")}} thích hợp được liên kết với input. Xem [Nhãn `<input>`](/en-US/docs/Web/HTML/Reference/Elements/input#labels) để có giải thích đầy đủ.

### Các textarea bị vô hiệu hóa và chỉ đọc

Ví dụ này hiển thị hai `<textarea>` — một là [`readonly`](/en-US/docs/Web/HTML/Reference/Attributes/readonly) và một là [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled).
Bạn không thể chỉnh sửa nội dung của cả hai phần tử, nhưng phần tử `readonly` có thể lấy tiêu điểm và giá trị của nó được gửi trong form.
Giá trị của phần tử `disabled` không được gửi và không thể lấy tiêu điểm.

```html
<textarea name="textarea" rows="5" cols="30" readonly>
I am a read-only textarea.
</textarea>
<textarea name="textarea" rows="5" cols="30" disabled>
I am a disabled textarea.
</textarea>
```

```css
textarea {
  display: block;
  resize: horizontal;
  max-width: 500px;
}
```

#### Kết quả

{{EmbedLiveSample('disabled_and_readonly_text_areas', '', '230')}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >,
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#interactive_content"
          >Nội dung tương tác</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#listed"
          >được liệt kê</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#labelable"
          >có thể gắn nhãn</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#resettable"
          >có thể đặt lại</a
        >, và
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#submittable"
          >có thể gửi</a
        >
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#form-associated_content"
          >phần tử liên kết form</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung cho phép</th>
      <td>Văn bản</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha cho phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role"
            >textbox</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA cho phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLTextAreaElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử liên quan đến form khác:
  - {{ HTMLElement("form") }}
  - {{ HTMLElement("button") }}
  - {{ HTMLElement("datalist") }}
  - {{ HTMLElement("legend") }}
  - {{ HTMLElement("label") }}
  - {{ HTMLElement("select") }}
  - {{ HTMLElement("optgroup") }}
  - {{ HTMLElement("option") }}
  - {{ HTMLElement("input") }}
  - {{ HTMLElement("fieldset") }}
  - {{ HTMLElement("output") }}
  - {{ HTMLElement("progress") }}
  - {{ HTMLElement("meter") }}
