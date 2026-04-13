---
title: "ValidityState: thuộc tính stepMismatch"
short-title: stepMismatch
slug: Web/API/ValidityState/stepMismatch
page-type: web-api-instance-property
browser-compat: api.ValidityState.stepMismatch
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`stepMismatch`** của giao diện [`ValidityState`](/en-US/docs/Web/API/ValidityState) chỉ ra liệu giá trị của {{HTMLElement("input")}}, sau khi đã được người dùng chỉnh sửa, có tuân theo các ràng buộc được đặt bởi thuộc tính `step` của phần tử hay không.

Nếu trường có tính chất số, bao gồm các kiểu {{HTMLElement("input/date", "date")}}, {{HTMLElement("input/month", "month")}}, {{HTMLElement("input/week", "week")}}, {{HTMLElement("input/time", "time")}}, {{HTMLElement("input/datetime-local", "datetime-local")}}, {{HTMLElement("input/number", "number")}} và {{HTMLElement("input/range", "range")}} và giá trị step không phải là `any`, nếu giá trị không tuân theo các ràng buộc được đặt bởi các giá trị [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step) và [`min`](/en-US/docs/Web/HTML/Reference/Attributes/min), thì `stepMismatch` sẽ là true. Nếu phần dư của giá trị đi��u khiển biểu mẫu trừ đi giá trị [`min`](/en-US/docs/Web/HTML/Reference/Attributes/min), chia cho giá trị [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step) (mặc định là 1 nếu bị bỏ qua) không bằng không, thì có sự không khớp.

## Giá trị

Một giá trị boolean là `true` nếu `ValidityState` không tuân theo các ràng buộc.

## Ví dụ

### Đầu vào có không khớp step

Ví dụ sau kiểm tra tính hợp lệ của [phần tử nhập số](/en-US/docs/Web/HTML/Reference/Elements/input/number).
Một ràng buộc đã được thêm bằng cách sử dụng [thuộc tính `step`](/en-US/docs/Web/HTML/Reference/Elements/input/number#step) có nghĩa là đầu vào kỳ vọng các giá trị tăng theo bước 5.
Nếu người dùng nhập số không chia hết cho 5, phần tử thất bại xác thực ràng buộc, và các kiểu khớp với lớp giả CSS {{cssxref(":invalid")}} đ��ợc áp dụng.

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
<input type="number" id="degrees" step="5" />
```

```js
const userInput = document.getElementById("degrees");
const logElement = document.getElementById("log");

function log(text) {
  logElement.innerText = text;
}

userInput.addEventListener("input", () => {
  userInput.reportValidity();
  if (userInput.validity.stepMismatch) {
    log("Input must be divisible by 5");
  } else {
    log("Input is valid…");
  }
});
```

{{EmbedLiveSample("input_with_step_mismatch", "100%", "140")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- [Biểu mẫu: Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Thuộc tính `step`](/en-US/docs/Web/HTML/Reference/Attributes/step)
