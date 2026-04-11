---
title: "HTMLFormElement: thuộc tính elements"
short-title: elements
slug: Web/API/HTMLFormElement/elements
page-type: web-api-instance-property
browser-compat: api.HTMLFormElement.elements
---

{{APIRef("HTML DOM")}}

Thuộc tính **`elements`** của giao diện {{domxref("HTMLFormElement")}} trả về một {{domxref("HTMLFormControlsCollection")}} liệt kê tất cả các điều khiển biểu mẫu được liên kết với phần tử {{HTMLElement("form")}}.

Bạn có thể truy cập một điều khiển biểu mẫu cụ thể trong collection trả về bằng chỉ mục hoặc bằng thuộc tính `name` hay `id` của phần tử.

Trước HTML 5, đối tượng trả về là {{domxref("HTMLCollection")}}, mà `HTMLFormControlsCollection` được xây dựng dựa trên.

Độc lập với đó, bạn có thể lấy riêng số lượng điều khiển biểu mẫu được liên kết bằng thuộc tính {{domxref("HTMLFormElement.length", "length")}}. Bạn cũng có thể lấy danh sách tất cả các biểu mẫu trong một tài liệu bằng thuộc tính {{domxref("Document.forms", "forms")}} của tài liệu.

## Giá trị

Một {{domxref("HTMLFormControlsCollection")}} chứa tất cả các điều khiển không phải ảnh được liên kết với biểu mẫu.
Đây là một collection động; nếu các điều khiển biểu mẫu được liên kết hoặc tách khỏi biểu mẫu, collection này sẽ cập nhật để phản ánh thay đổi đó.

Các điều khiển biểu mẫu trong collection trả về có cùng thứ tự mà chúng xuất hiện trong tài liệu theo cách duyệt cây theo thứ tự tiền tự, chiều sâu trước.
Điều này được gọi là **thứ tự cây**.

Chỉ các điều khiển biểu mẫu sau đây được trả về:

- {{HTMLElement("button")}}
- {{HTMLElement("fieldset")}}
- {{HTMLElement("input")}} (ngoại trừ những phần tử có [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là `"image"` vì lý do lịch sử)
- {{HTMLElement("object")}}
- {{HTMLElement("output")}}
- {{HTMLElement("select")}}
- {{HTMLElement("textarea")}}
- [phần tử tùy biến có liên kết với biểu mẫu](https://html.spec.whatwg.org/multipage/custom-elements.html#form-associated-custom-element)

## Ví dụ

### Ví dụ cú pháp nhanh

Trong ví dụ này, chúng ta xem cách lấy danh sách các điều khiển biểu mẫu cũng như cách truy cập các thành viên của nó bằng chỉ mục và bằng tên hoặc ID.

```html
<form id="my-form">
  <label>
    Username:
    <input type="text" name="username" />
  </label>
  <label>
    Full name:
    <input type="text" name="full-name" />
  </label>
  <label>
    Password:
    <input type="password" name="password" />
  </label>
</form>
```

```js
const inputs = document.getElementById("my-form").elements;
const inputByIndex = inputs[0];
const inputByName = inputs["username"];
```

### Các điều khiển biểu mẫu được liên kết

Ví dụ này minh họa rằng {{domxref("HTMLFormControlsCollection")}} chứa các điều khiển biểu mẫu được liên kết với biểu mẫu, chứ không phải các điều khiển chỉ đơn giản được lồng vật lý bên trong `<form>`.

Biểu mẫu đầu tiên đầy đủ, với bốn điều khiển biểu mẫu: một {{htmlelement("fieldset")}} và ba phần tử {{htmlelement("input")}}. Các phần tử {{htmlelement("legend")}} và {{htmlelement("label")}} không phải là điều khiển biểu mẫu được liệt kê. Biểu mẫu thứ hai thưa, chỉ có một điều khiển biểu mẫu lồng bên trong: một phần tử {{htmlelement("object")}} đơn lẻ. Tất cả các điều khiển biểu mẫu trong biểu mẫu đầy đủ đều được liên kết với biểu mẫu thưa thông qua thuộc tính `form` của chúng.

```html
<form id="fullForm">
  This form looks full, but it has no associated form controls
  <fieldset form="sparseForm">
    <legend>This is a legend</legend>
    <label>A form control: <input form="sparseForm" /></label>
    <label>Another form control: <input form="sparseForm" /></label>
    <label>Yet another form control: <input form="sparseForm" /></label>
  </fieldset>
</form>

<form id="sparseForm">
  <object data="lone-form-control.jpg">Lone form control</object>
</form>
```

Chúng ta dùng thuộc tính `elements` để lấy `HTMLFormControlsCollection` cho từng biểu mẫu.

```js
const sparse = document.getElementById("sparseForm").elements;
const full = document.getElementById("fullForm").elements;
```

Collection bao gồm các điều khiển biểu mẫu được liên kết với phần tử biểu mẫu, nghĩa là tất cả các {{HTMLElement("button")}}, {{HTMLElement("fieldset")}}, {{HTMLElement("input")}}, {{HTMLElement("object")}}, {{HTMLElement("output")}}, {{HTMLElement("select")}}, {{HTMLElement("textarea")}}, và các phần tử tùy biến có liên kết với biểu mẫu, kể cả khi chúng được lồng trong biểu mẫu khác hoặc không lồng trong biểu mẫu nào.

```js
console.log(`sparse form: ${sparse.length}`); // sparse form: 5
console.log(`full form: ${full.length}`); // full form: 0
```

Các điều khiển biểu mẫu trong collection có cùng thứ tự như khi chúng xuất hiện trong tài liệu.

```js
console.log(`first member: ${sparse[0].tagName}`); // first member: FIELDSET
console.log(`last member: ${sparse[sparse.length - 1].tagName}`); // last member: OBJECT
```

### Truy cập các điều khiển biểu mẫu

Ví dụ này lấy danh sách phần tử của biểu mẫu, rồi duyệt qua danh sách để tìm các phần tử {{HTMLElement("input")}} có kiểu [`"text"`](/en-US/docs/Web/HTML/Reference/Elements/input/text) để có thể xử lý chúng.

```js
const inputs = document.getElementById("my-form").elements;

// Iterate over the form controls
for (const input of inputs) {
  if (input.nodeName === "INPUT" && input.type === "text") {
    // Update text input
    input.value = input.value.toLocaleUpperCase();
  }
}
```

### Vô hiệu hóa các điều khiển biểu mẫu

```js
const inputs = document.getElementById("my-form").elements;

// Iterate over the form controls
for (const input of inputs) {
  // Disable all form controls
  input.setAttribute("disabled", "");
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
