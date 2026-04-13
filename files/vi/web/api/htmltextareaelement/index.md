---
title: HTMLTextAreaElement
slug: Web/API/HTMLTextAreaElement
page-type: web-api-interface
browser-compat: api.HTMLTextAreaElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLTextAreaElement`** cung cấp các thuộc tính và phương thức để thao tác bố cục và cách trình bày của các phần tử {{HTMLElement("textarea")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Cũng kế thừa các thuộc tính từ giao diện cha, {{DOMxRef("HTMLElement")}}._

- {{domxref("HTMLTextAreaElement.autocomplete", "autocomplete")}}
  - : Một chuỗi đại diện cho thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/textarea#autocomplete) của phần tử.
- {{domxref("HTMLTextAreaElement.cols", "cols")}}
  - : Một số đại diện cho thuộc tính [`cols`](/en-US/docs/Web/HTML/Reference/Elements/textarea#cols) của phần tử, cho biết chiều rộng hiển thị của vùng văn bản.
- {{domxref("HTMLTextAreaElement.defaultValue", "defaultValue")}}
  - : Một chuỗi đại diện cho giá trị mặc định của điều khiển, hoạt động giống như thuộc tính {{domxref("Node.textContent")}}.
- {{domxref("HTMLTextAreaElement.dirName", "dirName")}}
  - : Một chuỗi đại diện cho hướng văn bản của phần tử.
- {{domxref("HTMLTextAreaElement.disabled", "disabled")}}
  - : Một giá trị logic đại diện cho thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/textarea#disabled) của phần tử, cho biết điều khiển không khả dụng để tương tác.
- {{domxref("HTMLTextAreaElement.form", "form")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến phần tử biểu mẫu cha. Nếu phần tử này không nằm trong phần tử biểu mẫu, nó có thể là thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của bất kỳ phần tử {{HTMLElement("form")}} nào trong cùng tài liệu hoặc giá trị `null`.
- {{domxref("HTMLTextAreaElement.labels", "labels")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("NodeList")}} gồm các phần tử {{HTMLElement("label")}} được liên kết với phần tử này.
- {{domxref("HTMLTextAreaElement.maxLength", "maxLength")}}
  - : Một số đại diện cho thuộc tính [`maxlength`](/en-US/docs/Web/HTML/Reference/Elements/textarea#maxlength) của phần tử, cho biết số ký tự tối đa người dùng có thể nhập. Ràng buộc này chỉ được đánh giá khi giá trị thay đổi.
- {{domxref("HTMLTextAreaElement.minLength", "minLength")}}
  - : Một số đại diện cho thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Elements/textarea#minlength) của phần tử, cho biết số ký tự tối thiểu người dùng có thể nhập. Ràng buộc này chỉ được đánh giá khi giá trị thay đổi.
- {{domxref("HTMLTextAreaElement.name", "name")}}
  - : Một chuỗi đại diện cho thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/textarea#name) của phần tử, chứa tên của điều khiển.
- {{domxref("HTMLTextAreaElement.placeholder", "placeholder")}}
  - : Một chuỗi đại diện cho thuộc tính [`placeholder`](/en-US/docs/Web/HTML/Reference/Elements/textarea#placeholder) của phần tử, chứa gợi ý cho người dùng về nội dung cần nhập vào điều khiển.
- {{domxref("HTMLTextAreaElement.readOnly", "readOnly")}}
  - : Một giá trị logic đại diện cho thuộc tính [`readonly`](/en-US/docs/Web/HTML/Reference/Elements/textarea#readonly) của phần tử, cho biết người dùng không thể sửa đổi giá trị của điều khiển.
- {{domxref("HTMLTextAreaElement.required", "required")}}
  - : Một giá trị logic đại diện cho thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/textarea#required) của phần tử, cho biết người dùng phải chỉ định một giá trị trước khi gửi biểu mẫu.
- {{domxref("HTMLTextAreaElement.rows", "rows")}}
  - : Một số đại diện cho thuộc tính [`rows`](/en-US/docs/Web/HTML/Reference/Elements/textarea#rows) của phần tử, cho biết số dòng văn bản hiển thị của điều khiển.
- {{domxref("HTMLTextAreaElement.selectionDirection", "selectionDirection")}}
  - : Một chuỗi đại diện cho hướng mà việc chọn đã diễn ra. Giá trị là `forward` nếu việc chọn được thực hiện theo hướng từ đầu đến cuối của ngôn ngữ hiện tại, hoặc `backward` cho hướng ngược lại. Giá trị này cũng có thể là `none` nếu hướng không xác định.
- {{domxref("HTMLTextAreaElement.selectionEnd", "selectionEnd")}}
  - : Một số đại diện cho chỉ mục cuối của văn bản được chọn. Nếu không có văn bản nào được chọn, nó chứa chỉ mục của ký tự ngay sau con trỏ nhập.
- {{domxref("HTMLTextAreaElement.selectionStart", "selectionStart")}}
  - : Một số đại diện cho chỉ mục bắt đầu của văn bản được chọn. Nếu không có văn bản nào được chọn, nó chứa chỉ mục của ký tự ngay sau con trỏ nhập.
- {{domxref("HTMLTextAreaElement.textLength", "textLength")}} {{ReadOnlyInline}}
  - : Trả về độ dài theo code point của `value` của điều khiển. Tương đương với việc đọc `value.length`.
- {{domxref("HTMLTextAreaElement.type", "type")}} {{ReadOnlyInline}}
  - : Trả về chuỗi `textarea`.
- {{domxref("HTMLTextAreaElement.validationMessage", "validationMessage")}} {{ReadOnlyInline}}
  - : Trả về một thông báo đã được bản địa hóa mô tả các ràng buộc xác thực mà điều khiển không thỏa mãn, nếu có. Đây là chuỗi rỗng nếu điều khiển không phải là ứng viên cho xác thực ràng buộc (`willValidate` là `false`), hoặc nếu nó thỏa mãn các ràng buộc của mình.
- {{domxref("HTMLTextAreaElement.validity", "validity")}} {{ReadOnlyInline}}
  - : Trả về trạng thái hợp lệ hiện tại của phần tử này.
- {{domxref("HTMLTextAreaElement.value", "value")}}
  - : Một chuỗi đại diện cho giá trị thô chứa trong điều khiển.
- {{domxref("HTMLTextAreaElement.willValidate", "willValidate")}} {{ReadOnlyInline}}
  - : Trả về việc phần tử có phải là ứng viên cho xác thực ràng buộc hay không. Giá trị là `false` nếu bất kỳ điều kiện nào ngăn nó bị xác thực ràng buộc, bao gồm khi thuộc tính `readOnly` hoặc `disabled` là `true`.
- {{domxref("HTMLTextAreaElement.wrap", "wrap")}}
  - : Một chuỗi đại diện cho thuộc tính [`wrap`](/en-US/docs/Web/HTML/Reference/Elements/textarea#wrap) của phần tử, cho biết cách điều khiển ngắt dòng văn bản.

## Phương thức thể hiện

_Cũng kế thừa các phương thức từ giao diện cha, {{DOMxRef("HTMLElement")}}._

- {{domxref("HTMLTextAreaElement.checkValidity", "checkValidity()")}}
  - : Trả về `false` nếu phần tử là ứng viên cho xác thực ràng buộc và không thỏa mãn các ràng buộc của nó. Trong trường hợp này, nó cũng kích hoạt sự kiện `invalid` có thể hủy tại điều khiển. Trả về `true` nếu điều khiển không phải là ứng viên cho xác thực ràng buộc, hoặc nếu nó thỏa mãn các ràng buộc của mình.
- {{domxref("HTMLTextAreaElement.reportValidity", "reportValidity()")}}
  - : Phương thức này báo cáo các vấn đề về ràng buộc trên phần tử, nếu có, cho người dùng. Nếu có vấn đề, nó kích hoạt sự kiện `invalid` có thể hủy tại phần tử và trả về `false`; nếu không có vấn đề nào, nó trả về `true`.
- {{domxref("HTMLTextAreaElement.select", "select()")}}
  - : Chọn toàn bộ nội dung của điều khiển.
- {{domxref("HTMLTextAreaElement.setCustomValidity", "setCustomValidity()")}}
  - : Đặt một thông báo hợp lệ tùy chỉnh cho phần tử. Nếu thông báo này không phải là chuỗi rỗng, phần tử đang gặp lỗi hợp lệ tùy chỉnh và không hợp lệ.
- {{domxref("HTMLTextAreaElement.setRangeText", "setRangeText()")}}
  - : Thay thế một phạm vi văn bản trong phần tử bằng văn bản mới.
- {{domxref("HTMLTextAreaElement.setSelectionRange", "setSelectionRange()")}}
  - : Chọn một phạm vi văn bản trong phần tử (nhưng không tập trung vào nó).

## Sự kiện

_Cũng kế thừa các sự kiện từ giao diện cha, {{DOMxRef("HTMLElement")}}._

Lắng nghe các sự kiện này bằng {{domxref("EventTarget/addEventListener", "addEventListener()")}} hoặc bằng cách gán trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này:

- {{domxref("HTMLTextAreaElement/select_event", "select")}} event
  - : Kích hoạt khi một phần văn bản đã được chọn.
- {{domxref("HTMLTextAreaElement/selectionchange_event", "selectionchange")}} event
  - : Kích hoạt khi vùng chọn văn bản trong phần tử {{HTMLElement("textarea")}} thay đổi.

## Ví dụ

### Ví dụ textarea tự tăng chiều cao

Tăng chiều cao của textarea tự động khi đang nhập:

#### JavaScript

```js
function autoGrow(field) {
  if (field.scrollHeight > field.clientHeight) {
    field.style.height = `${field.scrollHeight}px`;
  }
}

document.querySelector("textarea").addEventListener("keyup", (e) => {
  autoGrow(e.target);
});
```

#### CSS

```css
textarea.no-scrollbars {
  overflow: hidden;
  width: 300px;
  height: 100px;
}
```

#### HTML

```html
<form>
  <fieldset>
    <legend>Your comments</legend>
    <p><textarea class="no-scrollbars"></textarea></p>
    <p><input type="submit" value="Send" /></p>
  </fieldset>
</form>
```

{{EmbedLiveSample('Autogrowing_textarea_example', 600, 300)}}

### Ví dụ chèn thẻ HTML

Chèn một số thẻ HTML vào textarea:

```js live-sample___insert-html
function insert(startTag, endTag) {
  const textArea = document.myForm.myTextArea;
  const start = textArea.selectionStart;
  const end = textArea.selectionEnd;
  const oldText = textArea.value;

  const prefix = oldText.substring(0, start);
  const inserted = startTag + oldText.substring(start, end) + endTag;
  const suffix = oldText.substring(end);

  textArea.value = `${prefix}${inserted}${suffix}`;

  const newStart = start + startTag.length;
  const newEnd = end + startTag.length;

  textArea.setSelectionRange(newStart, newEnd);
  textArea.focus();
}

function insertURL() {
  const newURL = prompt("Enter the full URL for the link");
  if (newURL) {
    insert(`<a href="${newURL}">`, "</a>");
  } else {
    document.myForm.myTextArea.focus();
  }
}

const strong = document.querySelector("#format-strong");
const em = document.querySelector("#format-em");
const link = document.querySelector("#format-link");
const code = document.querySelector("#format-code");

strong.addEventListener("click", (e) => insert("<strong>", "</strong>"));
em.addEventListener("click", (e) => insert("<em>", "</em>"));
link.addEventListener("click", (e) => insertURL());
code.addEventListener("click", (e) => insert("<code>", "</code>"));
```

Trang trí span để hoạt động như một liên kết:

```css live-sample___insert-html
.intLink {
  cursor: pointer;
  text-decoration: underline;
  color: blue;
}
```

```html live-sample___insert-html
<form name="myForm">
  <p>
    [
    <span class="intLink" id="format-strong"><strong>Bold</strong></span> |
    <span class="intLink" id="format-em"><em>Italic</em></span> |
    <span class="intLink" id="format-link">URL</span> |
    <span class="intLink" id="format-code">code</span> ]
  </p>

  <p>
    <textarea name="myTextArea" rows="10" cols="50">
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut facilisis, arcu vitae adipiscing placerat, nisl lectus accumsan nisi, vitae iaculis sem neque vel lectus. Praesent tristique commodo lorem quis fringilla. Sed ac tellus eros.
    </textarea>
  </p>
</form>
```

{{EmbedLiveSample('insert-html', , '300', , , , , 'allow-modals')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
