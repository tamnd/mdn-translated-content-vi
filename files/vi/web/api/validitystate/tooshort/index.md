---
title: "ValidityState: thuộc tính tooShort"
short-title: tooShort
slug: Web/API/ValidityState/tooShort
page-type: web-api-instance-property
browser-compat: api.ValidityState.tooShort
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`tooShort`** của giao diện [`ValidityState`](/en-US/docs/Web/API/ValidityState) chỉ ra liệu giá trị của {{HTMLElement("input")}}, {{HTMLElement("button")}}, {{HTMLElement("select")}}, {{HTMLElement("output")}}, {{HTMLElement("fieldset")}} hoặc {{HTMLElement("textarea")}}, sau khi đã được người dùng chỉnh sửa, có nhỏ hơn độ dài đơn vị mã tối thiểu được thiết lập bởi thuộc tính `minlength` của phần tử hay không.

## Giá trị

Một giá trị boolean là `true` nếu `ValidityState` không tuân theo các ràng buộc.

## Ví dụ

### Đầu vào có chuỗi giá trị quá ngắn

Ví dụ sau kiểm tra tính hợp lệ của [phần tử nhập văn bản](/en-US/docs/Web/HTML/Reference/Elements/input/text).
Một ràng buộc đã được thêm bằng cách sử dụng [thuộc tính `minlength`](/en-US/docs/Web/HTML/Reference/Elements/input/text#minlength) để đầu vào kỳ vọng chuỗi có tối thiểu 4 ký tự.
Nếu người dùng nhập chuỗi quá ngắn, phần tử thất bại xác thực ràng buộc, và các kiểu khớp với lớp giả CSS {{cssxref(":invalid")}} được áp dụng.

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
<input type="text" id="userText" minlength="4" />
```

```js
const userInput = document.getElementById("userText");
const logElement = document.getElementById("log");

function log(text) {
  logElement.innerText = text;
}

userInput.addEventListener("input", () => {
  userInput.reportValidity();
  if (userInput.validity.tooShort) {
    log("Not enough characters entered.");
  } else {
    log("Input is valid…");
  }
});
```

{{EmbedLiveSample("input_with_too_short_string_value", "100%", "140")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- [Hướng dẫn: Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
