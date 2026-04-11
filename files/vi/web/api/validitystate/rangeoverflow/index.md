---
title: "ValidityState: thuộc tính rangeOverflow"
short-title: rangeOverflow
slug: Web/API/ValidityState/rangeOverflow
page-type: web-api-instance-property
browser-compat: api.ValidityState.rangeOverflow
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`rangeOverflow`** của giao diện [`ValidityState`](/en-US/docs/Web/API/ValidityState) chỉ ra liệu giá trị của {{HTMLElement("input")}}, sau khi đã được người dùng chỉnh sửa, có tuân theo các ràng buộc được đặt bởi thuộc tính [`max`](/en-US/docs/Web/HTML/Reference/Attributes/max) của phần tử hay không.

Nếu trường có tính chất số, bao gồm các kiểu {{HTMLElement("input/date", "date")}}, {{HTMLElement("input/month", "month")}}, {{HTMLElement("input/week", "week")}}, {{HTMLElement("input/time", "time")}}, {{HTMLElement("input/datetime-local", "datetime-local")}}, {{HTMLElement("input/number", "number")}} và {{HTMLElement("input/range", "range")}} và giá trị `max` được đặt, nếu giá trị không tuân theo các ràng buộc được đặt bởi giá trị [`max`](/en-US/docs/Web/HTML/Reference/Attributes/step), thuộc tính `rangeOverflow` sẽ là true.

## Giá trị

Một giá trị boolean là `true` nếu `ValidityState` không tuân theo các ràng buộc.

## Ví dụ

### Đầu vào có tràn số

Ví dụ sau kiểm tra tính hợp lệ của [phần tử nhập số](/en-US/docs/Web/HTML/Reference/Elements/input/number).
Một ràng buộc đã được thêm bằng cách sử dụng [thuộc tính `max`](/en-US/docs/Web/HTML/Reference/Elements/input/number#max) đặt giá trị tối đa là `18` cho đầu vào.
Nếu người dùng nhập số lớn hơn 18, phần tử thất bại xác thực ràng buộc, và các kiểu khớp với {{cssxref(":invalid")}} và {{cssxref(":out-of-range")}} CSS pseudo-classes

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
<input type="number" id="age" max="18" />
```

```js
const userInput = document.getElementById("age");
const logElement = document.getElementById("log");

function log(text) {
  logElement.innerText = text;
}

userInput.addEventListener("input", () => {
  userInput.reportValidity();
  if (userInput.validity.rangeOverflow) {
    log("Number is too high!");
  } else {
    log("Input is valid…");
  }
});
```

{{EmbedLiveSample("input_with_numeric_overflow", "100%", "140")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ValidityState.rangeUnderflow")}}
- [Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- [Biểu mẫu: Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Thuộc tính `step`](/en-US/docs/Web/HTML/Reference/Attributes/step)
- [Thuộc tính `min`](/en-US/docs/Web/HTML/Reference/Attributes/min)
