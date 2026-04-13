---
title: "ValidityState: thuộc tính typeMismatch"
short-title: typeMismatch
slug: Web/API/ValidityState/typeMismatch
page-type: web-api-instance-property
browser-compat: api.ValidityState.typeMismatch
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`typeMismatch`** của giao diện [`ValidityState`](/en-US/docs/Web/API/ValidityState) chỉ ra liệu giá trị của {{HTMLElement("input")}}, sau khi đã được người dùng chỉnh sửa, có tuân theo các ràng buộc được đặt bởi thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#input_types) của phần tử hay không.

Nếu thuộc tính `type` kỳ vọng các chuỗi cụ thể, chẳng hạn như các kiểu {{HTMLElement("input/email", "email")}} và {{HTMLElement("input/url", "url")}} và giá trị không tuân theo các ràng buộc được đặt bởi kiểu, thuộc tính `typeMismatch` sẽ là true.

Kiểu đầu vào {{HTMLElement("input/email", "email")}} kỳ vọng một hoặc nhiều địa chỉ email hợp lệ, tùy thuộc vào việc thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple) có mặt hay không. Địa chỉ email hợp lệ bao gồm tiền tố email và domain, có hoặc không có domain cấp cao nhất. Nếu giá trị của đầu vào email không phải là chuỗi rỗng, một địa chỉ email hợp lệ duy nhất, hoặc một hoặc nhiều địa chỉ email được phân cách bởi dấu phẩy nếu thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple) có mặt, thì có `typeMismatch`.

Kiểu đầu vào {{HTMLElement("input/url", "url")}} kỳ vọng một hoặc nhiều URL hợp lệ, tùy thuộc vào việc thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple) có mặt hay không. URL hợp lệ bao gồm giao thức, tùy chọn với địa chỉ IP, hoặc kết hợp subdomain, domain, và domain cấp cao nhất tùy chọn. Nếu giá trị của đầu vào URL không phải là chuỗi rỗng, một URL hợp lệ duy nhất, hoặc một hoặc nhiều URL được phân cách bởi dấu phẩy nếu thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple) có mặt, thì có `typeMismatch`.

| Kiểu đầu vào                            | Giá trị             | Giá trị kỳ vọng                                                 |
| --------------------------------------- | ------------------- | --------------------------------------------------------------- |
| {{HTMLElement("input/email", "email")}} | `x@y` hoặc `x@y.z`  | địa chỉ email, có hoặc không có [TLD](/en-US/docs/Glossary/TLD) |
| {{HTMLElement("input/url", "url")}}     | `x:` hoặc `x://y.z` | giao thức hoặc URL đầy đủ với giao thức                         |

## Giá trị

Một giá trị boolean là `true` nếu `ValidityState` không tuân theo các ràng buộc.

## Ví dụ

### Không khớp kiểu trên phần tử đầu vào

`typeMismatch` xảy ra khi có sự không khớp giữa [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) kỳ vọng qua thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#input_types) và dữ liệu thực sự có mặt.
`typeMismatch` chỉ là một trong nhiều lỗi có thể xảy ra và chỉ liên quan đến các kiểu {{HTMLElement("input/email", "email")}} và {{HTMLElement("input/url", "url")}}.
Khi giá trị được cung cấp không khớp với giá trị kỳ vọng dựa trên kiểu cho các kiểu đầu vào khác, bạn sẽ nhận được các lỗi khác nhau.
Ví dụ, nếu giá trị đầu vào {{HTMLElement("input/number", "number")}} không phải là số dấu phẩy động, `badInput` là `true`.
Nếu email là [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required) nhưng trống, {{domxref('ValidityState.valueMissing','valueMissing')}} sẽ là `true`.

```html
<pre id="log">Validation logged here...</pre>
<p>
  <label>
    Enter an email address:
    <input id="emailInput" type="email" value="example.com" required />
  </label>
</p>
```

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

```js
const emailInput = document.getElementById("emailInput");
const logElement = document.getElementById("log");

function log(text) {
  logElement.innerText = text;
}

emailInput.addEventListener("input", () => {
  emailInput.reportValidity();
  if (emailInput.validity.valid) {
    log("Input OK…");
  } else if (emailInput.validity.typeMismatch) {
    log("Input is not an email.");
  } else {
    log(`Validation failed: ${emailInput.validationMessage}`);
  }
});
```

{{EmbedLiveSample("Examples", "100%", "160")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính ValidityState [badInput](/en-US/docs/Web/API/ValidityState/badInput), [valid](/en-US/docs/Web/API/ValidityState/valid), [customError](/en-US/docs/Web/API/ValidityState/customError).
- [Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- [Biểu mẫu: Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
