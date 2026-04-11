---
title: "ValidityState: thuộc tính customError"
short-title: customError
slug: Web/API/ValidityState/customError
page-type: web-api-instance-property
browser-compat: api.ValidityState.customError
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`customError`** của giao diện [`ValidityState`](/en-US/docs/Web/API/ValidityState) trả về `true` nếu một phần tử không đáp ứng xác thực bắt buộc trong hợp lệ tùy chỉnh được đặt bởi phương thức {{domxref("HTMLInputElement.setCustomValidity", "setCustomValidity()")}} của phần tử.

## Giá trị

Một giá trị boolean là `true` nếu thông báo lỗi tùy chỉnh được đặt thành chuỗi không rỗng.

## Ví dụ

### Phát hiện lỗi tùy chỉnh

Trong ví dụ này, {{domxref("HTMLInputElement.setCustomValidity", "setCustomValidity()")}} đặt thông báo lỗi tùy chỉnh khi một lần gửi biểu mẫu chứa đầu vào người dùng được coi là không hợp lệ.
Nút "Validate input" gọi {{domxref("HTMLInputElement.reportValidity", "reportValidity()")}}, hiển thị thông báo xác thực dưới phần tử nếu người dùng nhập các giá trị không khớp với [ràng buộc của biểu mẫu](/en-US/docs/Web/HTML/Guides/Constraint_validation#constraint_validation_process).

Nếu bạn nhập văn bản "good" hoặc "fine" và cố gắng xác thực đầu vào, trường được đánh dấu là không hợp lệ cho đến khi thông báo lỗi tùy chỉnh được xóa (đặt thành chuỗi rỗng).
Để so sánh, có thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Attributes/minlength) trên phần tử đầu vào cho phép chúng ta minh họa [trạng thái hợp lệ `tooShort`](/en-US/docs/Web/API/ValidityState/tooShort) khi người dùng nhập ít hơn hai ký tự.
Khi giá trị trong điều khiển biểu mẫu không hợp lệ, ngay cả khi không có lỗi tùy chỉnh, đầu vào sẽ có đường viền đỏ.

#### HTML

```html
<pre id="log">Validation failures logged here...</pre>
<input
  type="text"
  id="userInput"
  placeholder="How do you feel?"
  minlength="2" />
<button id="checkButton">Validate input</button>
```

#### CSS

```css
input:invalid {
  border: red solid 3px;
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

#### JavaScript

```js
const userInput = document.getElementById("userInput");
const checkButton = document.getElementById("checkButton");
const logElement = document.getElementById("log");

function log(text) {
  logElement.innerText = text;
}

const check = (input) => {
  // Xử lý các trường hợp đầu vào quá mơ hồ
  if (input.value === "good" || input.value === "fine") {
    input.setCustomValidity(`"${input.value}" is not a feeling.`);
  } else {
    // Chuỗi rỗng đặt lại trạng thái hợp lệ tùy chỉnh
    input.setCustomValidity("");
  }
};

userInput.addEventListener("input", () => {
  check(userInput);
});

const validateInput = () => {
  userInput.reportValidity();
  if (userInput.validity.customError) {
    // Chúng ta có thể xử lý trạng thái hợp lệ tùy chỉnh ở đây
    log(`Custom validity error: ${userInput.validationMessage}`);
  } else {
    log(userInput.validationMessage);
  }
};

checkButton.addEventListener("click", validateInput);
```

#### Kết quả

{{EmbedLiveSample("detecting_a_custom_error", "100%", "140")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính ValidityState [badInput](/en-US/docs/Web/API/ValidityState/badInput), [valid](/en-US/docs/Web/API/ValidityState/valid).
- [Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- [Biểu mẫu: Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
