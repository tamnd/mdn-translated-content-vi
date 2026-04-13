---
title: "ValidityState: thuộc tính rangeUnderflow"
short-title: rangeUnderflow
slug: Web/API/ValidityState/rangeUnderflow
page-type: web-api-instance-property
browser-compat: api.ValidityState.rangeUnderflow
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`rangeUnderflow`** của giao diện [`ValidityState`](/en-US/docs/Web/API/ValidityState) chỉ ra liệu giá trị của {{HTMLElement("input")}}, sau khi đã được người dùng chỉnh sửa, có tuân theo các ràng buộc được đặt bởi thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Attributes/min) của phần tử hay không.

Nếu trường có tính chất số, bao gồm các kiểu {{HTMLElement("input/date", "date")}}, {{HTMLElement("input/month", "month")}}, {{HTMLElement("input/week", "week")}}, {{HTMLElement("input/time", "time")}}, {{HTMLElement("input/datetime-local", "datetime-local")}}, {{HTMLElement("input/number", "number")}} và {{HTMLElement("input/range", "range")}} và giá trị `min` được đặt, nếu giá trị không tuân theo các ràng buộc được đặt bởi giá trị [`min`](/en-US/docs/Web/HTML/Reference/Attributes/step), thuộc tính `rangeUnderflow` sẽ là true.

## Giá trị

Một giá trị boolean là `true` nếu `ValidityState` không tuân theo các ràng buộc.

## Ví dụ

### Đầu vào có thiếu hụt số

Ví dụ sau kiểm tra tính hợp lệ của [phần tử nhập số](/en-US/docs/Web/HTML/Reference/Elements/input/number).
Một ràng buộc đã được thêm bằng cách sử dụng [thuộc tính `min`](/en-US/docs/Web/HTML/Reference/Elements/input/number#min) đặt giá trị tối thiểu là `18` cho đầu vào.
Nếu người dùng nhập số nhỏ hơn 18, phần tử thất bại xác thực ràng buộc, và các kiểu khớp với {{cssxref(":invalid")}} và {{cssxref(":out-of-range")}} CSS pseudo-classes

```css
/* hoặc :invalid */
input:out-of-range {
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
<input type="number" id="age" min="18" />
```

```js
const userInput = document.getElementById("age");
const logElement = document.getElementById("log");

function log(text) {
  logElement.innerText = text;
}

userInput.addEventListener("input", () => {
  userInput.reportValidity();
  if (userInput.validity.rangeUnderflow) {
    log("Number is too low!");
  } else {
    log("Valid…");
  }
});
```

{{EmbedLiveSample("input_with_numeric_underflow", "100%", "140")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ValidityState.rangeOverflow")}}
- [Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- [Biểu mẫu: Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Thuộc tính `step`](/en-US/docs/Web/HTML/Reference/Attributes/step)
- [Thuộc tính `max`](/en-US/docs/Web/HTML/Reference/Attributes/max)
