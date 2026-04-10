---
title: "HTMLInputElement: thuộc tính maxLength"
short-title: maxLength
slug: Web/API/HTMLInputElement/maxLength
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.maxLength
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`maxLength`** của giao diện {{domxref("HTMLInputElement")}} cho biết số ký tự tối đa (tính bằng {{glossary("UTF-16", "mã UTF-16")}}) được phép nhập cho giá trị của phần tử {{HTMLElement("input")}}, và số ký tự tối đa được phép để giá trị hợp lệ. Nó phản ánh thuộc tính [`maxlength`](/en-US/docs/Web/HTML/Reference/Elements/input#maxlength) của phần tử. `-1` nghĩa là không có giới hạn về độ dài của giá trị.

> [!NOTE]
> Trình duyệt thường ngăn người dùng nhập nhiều ký tự hơn thuộc tính `maxlength` cho phép. Nếu độ dài lớn hơn, phần tử được coi là không hợp lệ và thuộc tính {{domxref("ValidityState.tooLong", "tooLong")}} của đối tượng {{domxref("ValidityState")}} sẽ là `true`.

## Giá trị

Một số đại diện cho `maxlength` của phần tử nếu có, hoặc `-1`.

## Ví dụ

Cho đoạn HTML sau:

```html
<p>
  <label for="password">Mật khẩu của bạn</label>
  <input id="password" type="password" minlength="8" maxlength="20" />
</p>
```

Bạn có thể sử dụng thuộc tính `maxLength` để lấy ra hoặc đặt giá trị thuộc tính `maxlength` của `<input>`:

```js
const inputElement = document.querySelector("#password");
console.log(`maxLength của phần tử: ${inputElement.maxLength}`); // "maxLength của phần tử: 20"
inputElement.maxLength = 18; // cập nhật giá trị thuộc tính maxlength của phần tử
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.value")}}
- {{domxref("HTMLInputElement.minLength")}}
- {{domxref("ValidityState.tooLong")}}
