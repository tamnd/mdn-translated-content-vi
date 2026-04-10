---
title: "FormData: hàm khởi tạo FormData()"
short-title: FormData()
slug: Web/API/FormData/FormData
page-type: web-api-constructor
browser-compat: api.FormData.FormData
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers}}

Hàm khởi tạo **`FormData()`** tạo một đối tượng {{domxref("FormData")}} mới.

## Cú pháp

```js-nolint
new FormData()
new FormData(form)
new FormData(form, submitter)
```

### Tham số

- `form` {{optional_inline}}
  - : Một phần tử {{HTMLElement("form")}} HTML — khi được chỉ định, đối tượng {{domxref("FormData")}} sẽ được điền bằng các khóa/giá trị hiện tại của `form`, dùng thuộc tính name của từng phần tử làm khóa và giá trị đã gửi của chúng làm giá trị. Nó cũng sẽ mã hóa nội dung của trường nhập tệp. Một sự kiện {{domxref("HTMLFormElement/formdata_event", "formdata")}} được kích hoạt trên form khi đối tượng `FormData` được tạo, cho phép form sửa đổi formdata nếu cần.
- `submitter` {{optional_inline}}
  - : Một {{Glossary("submit button")}} là thành viên của `form`. Nếu `submitter` có thuộc tính `name` hoặc là một `{{HtmlElement('input/image', '&lt;input type="image"&gt;')}}`, dữ liệu của nó [sẽ được đưa vào](/en-US/docs/Glossary/Submit_button#form_data_entries) trong đối tượng {{domxref("FormData")}} (ví dụ, `btnName=btnValue`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Bị ném ra nếu `submitter` được chỉ định không phải là một {{Glossary("submit button")}}.
- `NotFoundError` {{domxref("DOMException")}}
  - : Bị ném ra nếu `submitter` được chỉ định không phải là thành viên của `form`. `submitter` phải là một phần tử con của phần tử form hoặc phải có thuộc tính [`form`](/en-US/docs/Web/HTML/Reference/Elements/input#form) tham chiếu đến form đó.

## Ví dụ

### Tạo một FormData rỗng

Dòng sau tạo một đối tượng {{domxref("FormData")}} rỗng:

```js
const formData = new FormData();
```

Bạn có thể thêm một cặp khóa/giá trị vào đối tượng này bằng {{domxref("FormData.append", "append()")}}:

```js
formData.append("username", "Chris");
```

### Điền sẵn từ một phần tử biểu mẫu HTML

Bạn có thể chỉ định các đối số tùy chọn `form` và `submitter` khi tạo đối tượng `FormData`, để điền sẵn cho nó bằng các giá trị từ form được chỉ định.

> [!NOTE]
> Chỉ những điều khiển biểu mẫu hợp lệ mới được đưa vào đối tượng FormData, tức là những điều khiển có tên và không ở trạng thái bị vô hiệu hóa.

#### HTML

```html
<form id="form">
  <input type="text" name="text1" value="foo" />
  <input type="text" name="text2" value="bar" />
  <input type="text" name="text3" value="baz" />
  <input type="checkbox" name="check" checked disabled />
  <button name="intent" value="save">Save</button>
  <button name="intent" value="saveAsCopy">Save As Copy</button>
</form>

<output id="output"></output>
```

```css hidden
form {
  display: none;
}

output {
  display: block;
  white-space: pre-wrap;
}
```

#### JavaScript

```js
const form = document.getElementById("form");
const submitter = document.querySelector("button[value=save]");
const formData = new FormData(form, submitter);

const output = document.getElementById("output");

for (const [key, value] of formData) {
  output.textContent += `${key}: ${value}\n`;
}
```

#### Kết quả

Để ngắn gọn, phần tử `<form>` được ẩn khỏi chế độ xem.

{{EmbedLiveSample("prepopulating_from_a_html_form_element", "", 150)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng các đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)
- {{HTMLElement("Form")}}
