---
title: "ValidityState: thuộc tính valid"
short-title: valid
slug: Web/API/ValidityState/valid
page-type: web-api-instance-property
browser-compat: api.ValidityState.valid
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`valid`** của giao diện [`ValidityState`](/en-US/docs/Web/API/ValidityState) chỉ ra liệu giá trị của phần tử {{HTMLElement("input")}} có đáp ứng tất cả các ràng buộc xác thực của nó hay không, và do đó được coi là hợp lệ.

Nếu `true`, phần tử khớp với lớp giả CSS {{cssxref(":valid")}}; ngược lại lớp giả CSS {{cssxref(":invalid")}} được áp dụng.

## Giá trị

Một giá trị boolean là `true` nếu `ValidityState` tuân theo tất cả các ràng buộc.

## Ví dụ

### Hiển thị trạng thái hợp lệ

Ví dụ sau kiểm tra tính hợp lệ của [phần tử nhập số](/en-US/docs/Web/HTML/Reference/Elements/input/number).
Một ràng buộc đã được thêm bằng cách sử dụng [thuộc tính `min`](/en-US/docs/Web/HTML/Reference/Elements/input/number#min) đặt giá trị tối thiểu là `18` cho đầu vào.
Nếu người dùng nhập bất kỳ giá trị nào không phải số lớn hơn 17, phần tử thất bại xác thực ràng buộc, và các kiểu khớp với `input:invalid` được áp dụng.

```css
input:invalid {
  outline: red solid 3px;
}
input:valid {
  outline: palegreen solid 3px;
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
  } else {
    log("Bad input detected…");
  }
});
```

{{EmbedLiveSample("displaying_validity_state", "100%", "140")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính ValidityState [badInput](/en-US/docs/Web/API/ValidityState/badInput), [customError](/en-US/docs/Web/API/ValidityState/customError).
- [Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- [Biểu mẫu: Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
