---
title: "HTMLInputElement: thuộc tính minLength"
short-title: minLength
slug: Web/API/HTMLInputElement/minLength
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.minLength
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`minLength`** của giao diện {{domxref("HTMLInputElement")}} cho biết số ký tự tối thiểu (tính bằng {{glossary("UTF-16", "mã UTF-16")}}) cần thiết để giá trị của phần tử {{HTMLElement("input")}} hợp lệ. Nó phản ánh thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Elements/input#minlength) của phần tử. `-1` nghĩa là không có yêu cầu về độ dài tối thiểu.

> [!NOTE]
> Nếu đầu vào có giá trị, và giá trị đó có ít ký tự hơn thuộc tính `minlength` yêu cầu, phần tử được coi là không hợp lệ và thuộc tính {{domxref("ValidityState.tooShort", "tooShort")}} của đối tượng {{domxref("ValidityState")}} sẽ là `true`.

## Giá trị

Một số đại diện cho `minlength` của phần tử nếu có hoặc `-1`.

## Ví dụ

Cho đoạn HTML sau:

```html
<p>
  <label for="password">Mật khẩu của bạn</label>
  <input id="password" type="password" minlength="8" maxlength="20" />
</p>
```

Bạn có thể sử dụng thuộc tính `minLength` để lấy ra hoặc đặt giá trị thuộc tính `minlength` của `<input>`:

```js
const inputElement = document.querySelector("#password");
console.log(`minLength của phần tử: ${inputElement.minLength}`); // "minLength của phần tử: 8"
inputElement.minLength = 12; // cập nhật giá trị thuộc tính minlength của phần tử
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.value")}}
- {{domxref("HTMLInputElement.maxLength")}}
- {{domxref("ValidityState.tooShort")}}
