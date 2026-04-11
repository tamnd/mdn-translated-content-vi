---
title: "ValidityState: thuộc tính tooLong"
short-title: tooLong
slug: Web/API/ValidityState/tooLong
page-type: web-api-instance-property
browser-compat: api.ValidityState.tooLong
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`tooLong`** của giao diện [`ValidityState`](/en-US/docs/Web/API/ValidityState) chỉ ra liệu giá trị của {{HTMLElement("input")}} hoặc {{HTMLElement("textarea")}}, sau khi đã được người dùng chỉnh sửa, có vượt quá độ dài đơn vị mã tối đa được thiết lập bởi thuộc tính [`maxlength`](/en-US/docs/Web/HTML/Reference/Attributes/maxlength) của phần tử hay không.

## Giá trị

Một giá trị boolean là `true` nếu `ValidityState` không tuân theo các ràng buộc.

## Ví dụ

### Textarea có số ký tự quá dài

Ví dụ sau kiểm tra tính hợp lệ của [phần tử textarea](/en-US/docs/Web/HTML/Reference/Elements/textarea).
Một ràng buộc đã được thêm bằng cách sử dụng [thuộc tính `maxlength`](/en-US/docs/Web/HTML/Reference/Elements/input/text#maxlength) để textarea kỳ vọng tối đa 10 ký tự.
Nếu có quá nhiều ký tự trong textarea (như bên dưới), phần tử thất bại xác thực ràng buộc, và các kiểu khớp với lớp giả CSS {{cssxref(":invalid")}} được áp dụng.

Khi chỉnh sửa textarea, trình duyệt sẽ không cho phép người dùng thêm các ký tự sẽ th��t bại xác thực ràng buộc về số ký tự tối đa, vì vậy ban đầu, chỉ được phép x��a ký tự.
Ký tự xu��ng dòng được chuẩn hóa và tính là một ký tự đơn trong tính toán ��ộ dài tối đa.

```css
textarea:invalid {
  outline: red solid 3px;
}
```

```css hidden
body {
  margin: 0.5rem;
}
textarea {
  width: 75%;
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
<textarea name="story" id="userText" maxlength="10" rows="5">
It was a dark and


stormy night...
</textarea>
```

```js
const userInput = document.getElementById("userText");
const logElement = document.getElementById("log");

function log(text) {
  logElement.innerText = text;
}

userInput.addEventListener("input", () => {
  userInput.reportValidity();
  if (userInput.validity.tooLong) {
    log("Too many characters in the textarea.");
  } else {
    log("Input is valid…");
  }
});
```

{{EmbedLiveSample("input_with_too_long_string_value", "100%", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- [Biểu mẫu: Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
