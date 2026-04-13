---
title: "ValidityState: thuộc tính valueMissing"
short-title: valueMissing
slug: Web/API/ValidityState/valueMissing
page-type: web-api-instance-property
browser-compat: api.ValidityState.valueMissing
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`valueMissing`** của giao diện [`ValidityState`](/en-US/docs/Web/API/ValidityState) chỉ ra liệu điều khiển [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required), chẳng hạn như {{HTMLElement("input")}}, {{HTMLElement("select")}}, hoặc {{HTMLElement("textarea")}}, có giá trị rỗng hay không.

Nếu thuộc tính `required` được đặt, và không có {{HTMLElement("option")}} nào được chọn hoặc `<textarea>` hoặc `<input>` có thể chỉnh sửa của người dùng là trống, thuộc tính `valueMissing` sẽ là `true`. Thuộc tính chỉ là `true` nếu trường là bắt buộc và không có giá trị; nếu trường không bắt buộc, hoặc nếu trường bắt buộc và có giá trị, giá trị là `false`.

## Giá trị

Một giá trị boolean là `true` nếu `ValidityState` không được đặt và thuộc tính `required` được đặt.

### Giá trị đầu vào bắt buộc bị thiếu

Ví dụ sau kiểm tra tính hợp lệ của [phần tử nhập số](/en-US/docs/Web/HTML/Reference/Elements/input/number).
Các ràng buộc đã được thêm bằng cách sử dụng [thuộc tính `min`](/en-US/docs/Web/HTML/Reference/Elements/input/number#min) đặt giá trị tối thiểu là `18` cho đầu vào, và [thuộc tính `required`](/en-US/docs/Web/HTML/Reference/Attributes/required) không cho phép giá trị rỗng.
Nếu người dùng nhập bất kỳ giá trị nào không phải số lớn hơn 17, phần tử thất bại xác thực ràng buộc, và các kiểu khớp với {{cssxref(":invalid")}} được áp dụng.

```css
input:invalid {
  outline: red solid 3px;
}
```

```css hidden
body {
  margin: 0.5rem;
}
pre {
  padding: 1rem;
  height: 2rem;
  background-color: lightgrey;
  outline: 1px solid grey;
}
```

```html
<pre id="log">Validation logged here...</pre>
<input type="number" id="age" min="18" required />
```

```js
const userInput = document.getElementById("age");
const logElement = document.getElementById("log");

function log(text) {
  logElement.innerText = text;
}

userInput.addEventListener("input", () => {
  userInput.reportValidity();
  if (userInput.validity.valid) {
    log("Input OK…");
  } else if (userInput.validity.valueMissing) {
    log("Required field cannot be empty.");
  } else {
    log(`Bad input detected: ${userInput.validationMessage}`);
  }
});
```

{{EmbedLiveSample("missing_required_input_value", "100%", "140")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính ValidityState [badInput](/en-US/docs/Web/API/ValidityState/badInput), [valid](/en-US/docs/Web/API/ValidityState/valid).
- [Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- [Biểu mẫu: Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
