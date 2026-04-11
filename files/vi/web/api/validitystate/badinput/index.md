---
title: "ValidityState: thuộc tính badInput"
short-title: badInput
slug: Web/API/ValidityState/badInput
page-type: web-api-instance-property
browser-compat: api.ValidityState.badInput
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`badInput`** của giao diện [ValidityState](/en-US/docs/Web/API/ValidityState) chỉ ra liệu người dùng có cung cấp đầu vào mà trình duyệt không thể chuyển đổi hay không. Ví dụ, nếu bạn có phần tử nhập số mà nội dung là một chuỗi.

## Giá trị

Một giá trị boolean là `true` nếu đối tượng `ValidityState` không tuân theo kiểu dự kiến.

## Ví dụ

### Phát hiện đầu vào xấu

Ví dụ sau kiểm tra tính hợp lệ của [phần tử nhập số](/en-US/docs/Web/HTML/Reference/Elements/input/number).
Nếu người dùng nhập văn bản thay vì số, phần tử thất bại xác thực ràng buộc, và các kiểu khớp với [`input:invalid`](/en-US/docs/Web/CSS/Reference/Selectors/:invalid) được áp dụng.
Phần tử [`<pre>`](/en-US/docs/Web/HTML/Reference/Elements/pre) ở trên đầu vào hiển thị thông báo xác thực khi `badInput` của phần tử đánh giá thành `true`:

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
<input type="number" id="age" />
```

```js
const userInput = document.getElementById("age");
const logElement = document.getElementById("log");

function log(text) {
  logElement.innerText = text;
}

userInput.addEventListener("input", () => {
  userInput.reportValidity();
  if (userInput.validity.badInput) {
    log(`Bad input detected: ${userInput.validationMessage}`);
  }
});
```

{{EmbedLiveSample("displaying_validity_state", "100%", "140")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính ValidityState [valid](/en-US/docs/Web/API/ValidityState/valid), [customError](/en-US/docs/Web/API/ValidityState/customError).
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- [Hướng dẫn: Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
