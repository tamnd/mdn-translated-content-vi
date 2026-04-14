---
title: <input type="text">
slug: Web/HTML/Reference/Elements/input/text
page-type: html-attribute-value
browser-compat: html.elements.input.type_text
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} kiểu **`text`** tạo ra các trường nhập văn bản một dòng cơ bản.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;text&quot;&gt;", "tabbed-shorter")}}

```html interactive-example
<label for="name">Name (4 to 8 characters):</label>

<input
  type="text"
  id="name"
  name="name"
  required
  minlength="4"
  maxlength="8"
  size="10" />
```

```css interactive-example
label {
  display: block;
  font:
    1rem "Fira Sans",
    sans-serif;
}

input,
label {
  margin: 0.4rem 0;
}
```

## Giá trị

Thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) là chuỗi chứa giá trị hiện tại của văn bản được nhập vào trường văn bản. Bạn có thể lấy giá trị này bằng thuộc tính `value` của {{domxref("HTMLInputElement")}} trong JavaScript.

```js
let theText = myTextInput.value;
```

Nếu không có ràng buộc xác thực nào được áp dụng cho ô nhập (xem [Xác thực](#validation) để biết thêm chi tiết), giá trị có thể là chuỗi rỗng (`""`).

## Thuộc tính bổ sung

Ngoài các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) và các thuộc tính áp dụng cho tất cả các phần tử {{HTMLElement("input")}} bất kể kiểu, ô nhập văn bản hỗ trợ các thuộc tính sau.

### `list`

Giá trị của thuộc tính list là {{domxref("Element.id", "id")}} của một phần tử {{HTMLElement("datalist")}} nằm trong cùng tài liệu. {{HTMLElement("datalist")}} cung cấp danh sách các giá trị được xác định trước để gợi ý cho người dùng. Bất kỳ giá trị nào trong danh sách không tương thích với [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) sẽ không được đưa vào các tùy chọn gợi ý. Các giá trị được cung cấp là gợi ý, không phải yêu cầu: người dùng có thể chọn từ danh sách này hoặc cung cấp giá trị khác.

### `maxlength`

Độ dài chuỗi tối đa (đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập vào ô nhập `text`. Đây phải là giá trị nguyên từ 0 trở lên. Nếu không có `maxlength` được chỉ định, hoặc một giá trị không hợp lệ được chỉ định, ô nhập `text` không có độ dài tối đa. Giá trị này cũng phải lớn hơn hoặc bằng giá trị của `minlength`.

Ô nhập sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nếu độ dài giá trị văn bản của trường lớn hơn `maxlength` {{glossary("UTF-16", "đơn vị mã UTF-16")}}. Xác thực ràng buộc chỉ được áp dụng khi giá trị được thay đổi bởi người dùng.

### `minlength`

Độ dài chuỗi tối thiểu (đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập vào ô nhập `text`. Đây phải là giá trị nguyên không âm nhỏ hơn hoặc bằng giá trị được chỉ định bởi `maxlength`. Nếu không có `minlength` được chỉ định, hoặc một giá trị không hợp lệ được chỉ định, ô nhập `text` không có độ dài tối thiểu.

Ô nhập sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nếu độ dài văn bản nhập vào trường nhỏ hơn `minlength` {{glossary("UTF-16", "đơn vị mã UTF-16")}}. Xác thực ràng buộc chỉ được áp dụng khi giá trị được thay đổi bởi người dùng.

### `pattern`

Thuộc tính `pattern`, khi được chỉ định, là biểu thức chính quy mà [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của ô nhập phải khớp để vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nó phải là biểu thức chính quy JavaScript hợp lệ, như được dùng bởi kiểu {{jsxref("RegExp")}}, và được ghi lại trong [hướng dẫn biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) của chúng ta; cờ `'u'` được chỉ định khi biên dịch biểu thức chính quy để mẫu được coi là chuỗi các điểm mã Unicode, thay vì {{Glossary("ASCII")}}. Không nên chỉ định dấu gạch chéo xung quanh văn bản mẫu.

Nếu mẫu được chỉ định không hợp lệ, không có biểu thức chính quy nào được áp dụng và thuộc tính này bị bỏ qua hoàn toàn.

> [!NOTE]
> Dùng thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Elements/input#title) để chỉ định văn bản mà hầu hết các trình duyệt sẽ hiển thị dưới dạng tooltip để giải thích các yêu cầu để khớp mẫu. Bạn cũng nên bao gồm các văn bản giải thích khác ở gần đó.

Xem [Chỉ định mẫu](#specifying_a_pattern) để biết thêm chi tiết và ví dụ.

### `placeholder`

Thuộc tính `placeholder` là một chuỗi cung cấp gợi ý ngắn gọn cho người dùng về loại thông tin cần nhập vào trường. Nó phải là một từ hoặc cụm từ ngắn thể hiện kiểu dữ liệu mong đợi, thay vì một thông báo giải thích. Văn bản _không được_ chứa ký tự xuống dòng hay dòng mới.

Nếu nội dung của điều khiển có một hướng ({{Glossary("LTR")}} hoặc {{Glossary("RTL")}}) nhưng cần hiển thị placeholder theo hướng ngược lại, bạn có thể dùng ký tự định dạng thuật toán bidirectional Unicode để ghi đè hướng trong placeholder; xem [Cách sử dụng điều khiển Unicode cho văn bản bidi](https://www.w3.org/International/questions/qa-bidi-unicode-controls) để biết thêm.

> [!NOTE]
> Hãy tránh dùng thuộc tính `placeholder` nếu có thể. Nó không có giá trị ngữ nghĩa bằng các cách khác để giải thích biểu mẫu và có thể gây ra các sự cố kỹ thuật không mong muốn với nội dung của bạn. Xem [Vấn đề khả năng tiếp cận `<input>`](/en-US/docs/Web/HTML/Reference/Elements/input#accessibility) để biết thêm thông tin.

### `readonly`

Thuộc tính Boolean, khi có mặt, có nghĩa là trường này không thể được chỉnh sửa bởi người dùng. Tuy nhiên, `value` của nó vẫn có thể được thay đổi bằng mã JavaScript trực tiếp đặt thuộc tính `value` của {{domxref("HTMLInputElement")}}.

> [!NOTE]
> Vì trường chỉ đọc không thể có giá trị, `required` không có tác dụng trên các ô nhập cũng có thuộc tính `readonly`.

### `size`

Thuộc tính `size` là giá trị số chỉ định số ký tự rộng của trường ô nhập. Giá trị phải là số lớn hơn không, và giá trị mặc định là 20. Vì độ rộng ký tự thay đổi, điều này có thể chính xác hoặc không và không nên dựa vào nó; ô nhập kết quả có thể hẹp hơn hoặc rộng hơn số ký tự được chỉ định, tùy thuộc vào ký tự và font chữ (cài đặt {{cssxref("font")}} đang được sử dụng).

Điều này _không_ đặt giới hạn về số ký tự người dùng có thể nhập vào trường. Nó chỉ chỉ định xấp xỉ bao nhiêu ký tự có thể được nhìn thấy cùng một lúc. Để đặt giới hạn trên về độ dài dữ liệu nhập, hãy dùng thuộc tính [`maxlength`](#maxlength).

### `spellcheck`

Thuộc tính toàn cục [`spellcheck`](/en-US/docs/Web/HTML/Reference/Global_attributes/spellcheck) được dùng để chỉ định có bật kiểm tra chính tả cho phần tử hay không. Nó có thể được dùng trên bất kỳ nội dung có thể chỉnh sửa nào, nhưng ở đây chúng ta xem xét các đặc thù liên quan đến việc dùng `spellcheck` trên các phần tử {{HTMLElement("input")}}. Các giá trị được phép cho `spellcheck` là:

- `false`
  - : Tắt kiểm tra chính tả cho phần tử này.
- `true`
  - : Bật kiểm tra chính tả cho phần tử này.
- `""` (chuỗi rỗng) hoặc không có giá trị
  - : Theo hành vi mặc định của phần tử cho kiểm tra chính tả. Điều này có thể dựa trên cài đặt `spellcheck` của cha hoặc các yếu tố khác.

Trường ô nhập có thể được bật kiểm tra chính tả nếu nó không có thuộc tính [readonly](#readonly) được đặt và không bị vô hiệu hóa.

Giá trị được trả về khi đọc `spellcheck` có thể không phản ánh trạng thái thực tế của kiểm tra chính tả trong điều khiển, nếu tùy chọn của {{Glossary("user agent", "user agent")}} ghi đè cài đặt.

## Sử dụng ô nhập văn bản

Các phần tử `<input>` kiểu `text` tạo ra các ô nhập đơn giản, một dòng. Bạn nên dùng chúng bất cứ khi nào bạn muốn người dùng nhập giá trị một dòng và không có kiểu ô nhập cụ thể hơn để thu thập giá trị đó (ví dụ nếu đó là [ngày](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local), [URL](/en-US/docs/Web/HTML/Reference/Elements/input/url), [email](/en-US/docs/Web/HTML/Reference/Elements/input/email), hoặc [thuật ngữ tìm kiếm](/en-US/docs/Web/HTML/Reference/Elements/input/search), bạn có các tùy chọn tốt hơn).

### Ví dụ cơ bản

```html
<form>
  <div>
    <label for="uname">Choose a username: </label>
    <input type="text" id="uname" name="name" />
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>
```

Điều này hiển thị như sau:

{{EmbedLiveSample("Basic_example", 600, 80)}}

Khi được gửi, cặp tên/giá trị dữ liệu được gửi đến máy chủ sẽ là `name=Chris` (nếu "Chris" được nhập làm giá trị ô nhập trước khi gửi). Bạn phải nhớ bao gồm thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name) trên phần tử {{HTMLElement("input")}}, nếu không giá trị của trường văn bản sẽ không được bao gồm trong dữ liệu được gửi.

### Đặt placeholder

Bạn có thể cung cấp placeholder hữu ích bên trong ô nhập văn bản có thể cung cấp gợi ý về những gì cần nhập bằng thuộc tính [`placeholder`](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder). Hãy xem ví dụ sau:

```html
<form>
  <div>
    <label for="uname">Choose a username: </label>
    <input
      type="text"
      id="uname"
      name="name"
      placeholder="Lower case, all one word" />
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>
```

Bạn có thể thấy cách placeholder được hiển thị bên dưới:

{{EmbedLiveSample("Setting_placeholders", 600, 80)}}

Placeholder thường được hiển thị với màu nhạt hơn màu tiền cảnh của phần tử và tự động biến mất khi người dùng bắt đầu nhập văn bản vào trường (hoặc bất cứ khi nào trường có giá trị được đặt theo chương trình bằng cách đặt thuộc tính `value`).

### Kích thước vật lý của phần tử ô nhập

Kích thước vật lý của hộp ô nhập có thể được kiểm soát bằng thuộc tính [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size). Với nó, bạn có thể chỉ định số ký tự mà ô nhập văn bản có thể hiển thị cùng một lúc. Điều này ảnh hưởng đến chiều rộng của phần tử, cho phép bạn chỉ định chiều rộng theo số ký tự thay vì pixel. Trong ví dụ này, ô nhập rộng 30 ký tự:

```html
<form>
  <div>
    <label for="uname">Choose a username: </label>
    <input
      type="text"
      id="uname"
      name="name"
      placeholder="Lower case, all one word"
      size="30" />
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>
```

{{EmbedLiveSample('Physical_input_element_size', 600, 80)}}

## Xác thực

Các phần tử `<input>` kiểu `text` không có xác thực tự động nào được áp dụng (vì ô nhập văn bản cơ bản cần có khả năng chấp nhận bất kỳ chuỗi tùy ý nào), nhưng có một số tùy chọn xác thực phía máy khách có sẵn, mà chúng ta sẽ thảo luận bên dưới.

> [!NOTE]
> Xác thực biểu mẫu HTML _không_ phải là thay thế cho các script phía máy chủ đảm bảo dữ liệu nhập có định dạng phù hợp. Rất dễ dàng để ai đó điều chỉnh HTML để vượt qua xác thực hoặc xóa nó hoàn toàn. Cũng có thể ai đó bỏ qua HTML của bạn và gửi dữ liệu trực tiếp đến máy chủ của bạn. Nếu mã phía máy chủ của bạn không xác thực dữ liệu nhận được, sẽ xảy ra thảm họa khi dữ liệu định dạng sai (hoặc quá lớn, sai loại, v.v.) được nhập vào cơ sở dữ liệu của bạn.

### Ghi chú về tạo kiểu

Có các lớp giả hữu ích để tạo kiểu cho các phần tử biểu mẫu giúp người dùng biết khi nào giá trị của họ hợp lệ hay không hợp lệ. Đây là {{cssxref(":valid")}} và {{cssxref(":invalid")}}. Trong phần này, chúng ta sẽ dùng CSS sau, sẽ đặt dấu kiểm bên cạnh các ô nhập có giá trị hợp lệ và dấu chéo bên cạnh các ô nhập có giá trị không hợp lệ.

```css
div {
  margin-bottom: 10px;
  position: relative;
}

input + span {
  padding-right: 30px;
}

input:invalid + span::after {
  position: absolute;
  content: "✖";
  padding-left: 5px;
}

input:valid + span::after {
  position: absolute;
  content: "✓";
  padding-left: 5px;
}
```

Kỹ thuật này cũng yêu cầu phần tử {{htmlelement("span")}} được đặt sau phần tử biểu mẫu, đóng vai trò là nơi chứa các biểu tượng. Điều này là cần thiết vì một số loại ô nhập trên một số trình duyệt không hiển thị các biểu tượng được đặt trực tiếp sau chúng rất tốt.

### Yêu cầu nhập bắt buộc

Bạn có thể dùng thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) như một cách dễ dàng để yêu cầu nhập giá trị trước khi gửi biểu mẫu được phép:

```html
<form>
  <div>
    <label for="uname">Choose a username: </label>
    <input type="text" id="uname" name="name" required />
    <span class="validity"></span>
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>
```

```css hidden
div {
  margin-bottom: 10px;
  position: relative;
}
input + span {
  padding-right: 30px;
}
input:invalid + span::after {
  position: absolute;
  content: "✖";
  padding-left: 5px;
}
input:valid + span::after {
  position: absolute;
  content: "✓";
  padding-left: 5px;
}
```

Điều này hiển thị như sau:

{{EmbedLiveSample('Making_input_required', 600, 100)}}

Nếu bạn cố gửi biểu mẫu mà không nhập tên người dùng, trình duyệt sẽ hiển thị thông báo lỗi.

### Độ dài giá trị ô nhập

Bạn có thể chỉ định độ dài tối thiểu (tính bằng ký tự) cho giá trị nhập bằng thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Elements/input#minlength); tương tự, dùng [`maxlength`](/en-US/docs/Web/HTML/Reference/Elements/input#maxlength) để đặt độ dài tối đa của giá trị nhập, tính bằng ký tự.

Ví dụ dưới đây yêu cầu rằng giá trị nhập phải có độ dài từ 4–8 ký tự.

```html
<form>
  <div>
    <label for="uname">Choose a username: </label>
    <input
      type="text"
      id="uname"
      name="name"
      required
      size="10"
      placeholder="Username"
      minlength="4"
      maxlength="8" />
    <span class="validity"></span>
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>
```

```css hidden
div {
  margin-bottom: 10px;
  position: relative;
}
input + span {
  padding-right: 30px;
}
input:invalid + span::after {
  position: absolute;
  content: "✖";
  padding-left: 5px;
}
input:valid + span::after {
  position: absolute;
  content: "✓";
  padding-left: 5px;
}
```

Điều này hiển thị như sau:

{{EmbedLiveSample('Input_value_length', 600, 100)}}

Nếu bạn cố gửi biểu mẫu với ít hơn 4 ký tự, bạn sẽ nhận được thông báo lỗi phù hợp (khác nhau giữa các trình duyệt). Nếu bạn cố nhập nhiều hơn 8 ký tự, trình duyệt sẽ không cho phép bạn.

> [!NOTE]
> Nếu bạn chỉ định `minlength` nhưng không chỉ định `required`, ô nhập được coi là hợp lệ, vì người dùng không bắt buộc phải chỉ định giá trị.

### Chỉ định mẫu

Bạn có thể dùng thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) để chỉ định biểu thức chính quy mà giá trị nhập phải khớp để được coi là hợp lệ (xem [Xác thực theo biểu thức chính quy](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation#validating_against_a_regular_expression) để có khóa học cấp tốc về dùng biểu thức chính quy để xác thực ô nhập).

Ví dụ dưới đây giới hạn giá trị thành 4-8 ký tự và yêu cầu chúng chỉ chứa chữ thường.

```html
<form>
  <div>
    <label for="uname">Choose a username: </label>
    <input
      type="text"
      id="uname"
      name="name"
      required
      size="45"
      pattern="[a-z]{4,8}" />
    <span class="validity"></span>
    <p>Usernames must be lowercase and 4-8 characters in length.</p>
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>
```

```css hidden
div {
  margin-bottom: 10px;
  position: relative;
}

p {
  font-size: 80%;
  color: #999999;
}

input + span {
  padding-right: 30px;
}

input:invalid + span::after {
  position: absolute;
  content: "✖";
  padding-left: 5px;
}

input:valid + span::after {
  position: absolute;
  content: "✓";
  padding-left: 5px;
}
```

Điều này hiển thị như sau:

{{EmbedLiveSample('Specifying_a_pattern', 600, 130)}}

## Ví dụ

Bạn có thể xem các ví dụ tốt về ô nhập văn bản được dùng trong ngữ cảnh trong các bài viết [Biểu mẫu HTML đầu tiên của bạn](/en-US/docs/Learn_web_development/Extensions/Forms/Your_first_form) và [Cách cấu trúc biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_structure_a_web_form).

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Một chuỗi đại diện cho văn bản chứa trong trường văn bản.
      </td>
    </tr>
    <tr>
      <td><strong>Sự kiện</strong></td>
      <td>
        {{domxref("HTMLElement/change_event", "change")}} và
        {{domxref("Element/input_event", "input")}}
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính chung được hỗ trợ</strong></td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete"><code>autocomplete</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#list"><code>list</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#maxlength"><code>maxlength</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#minlength"><code>minlength</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#pattern"><code>pattern</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#placeholder"><code>placeholder</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#readonly"><code>readonly</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#required"><code>required</code></a> và
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#size"><code>size</code></a>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td><a href="/en-US/docs/Web/HTML/Reference/Elements/input#list"><code>list</code></a>, <code>value</code></td>
    </tr>
    <tr>
      <td><strong>Giao diện DOM</strong></td>
      <td><p>{{domxref("HTMLInputElement")}}</p></td>
    </tr>
    <tr>
      <td><strong>Phương thức</strong></td>
      <td>
        {{domxref("HTMLInputElement.select", "select()")}},
        {{domxref("HTMLInputElement.setRangeText", "setRangeText()")}}
        và
        {{domxref("HTMLInputElement.setSelectionRange", "setSelectionRange()")}}.
      </td>
    </tr>
    <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td>
        không có thuộc tính <code>list</code>:
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role">textbox</a></code><br />
        có thuộc tính <code>list</code>: <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role">combobox</a></code>
      </td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms)
- {{HTMLElement("input")}} và giao diện {{domxref("HTMLInputElement")}} nó dựa trên.
- [`<input type="search">`](/en-US/docs/Web/HTML/Reference/Elements/input/search)
- {{HTMLElement("textarea")}}: Ô nhập văn bản nhiều dòng
