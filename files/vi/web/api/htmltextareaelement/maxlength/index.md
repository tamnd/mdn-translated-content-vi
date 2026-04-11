---
title: "HTMLTextAreaElement: maxLength property"
short-title: maxLength
slug: Web/API/HTMLTextAreaElement/maxLength
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.maxLength
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`maxLength`** của giao diện {{domxref("HTMLTextAreaElement")}} cho biết số ký tự tối đa (tính theo {{glossary("UTF-16", "UTF-16 code units")}}) được phép nhập cho giá trị của phần tử {{HTMLElement("textarea")}}, và số ký tự tối đa để giá trị vẫn hợp lệ. Nó phản ánh thuộc tính [`maxlength`](/en-US/docs/Web/HTML/Reference/Elements/textarea#maxlength) của phần tử. `-1` có nghĩa là không có giới hạn về độ dài giá trị.

> [!NOTE]
> Trình duyệt thường ngăn người dùng nhập nhiều ký tự hơn mức thuộc tính `maxlength` cho phép. Nếu độ dài dài hơn, phần tử được coi là không hợp lệ và thuộc tính {{domxref("ValidityState")}} của {{domxref("ValidityState.tooLong", "tooLong")}} sẽ là `true`.

## Giá trị

Một số đại diện cho `maxlength` của phần tử nếu có, hoặc `-1`.

## Ví dụ

Với HTML sau:

```html
<p>
  <label for="comment">Comment</label>
  <textarea id="comment" minlength="10" maxlength="200"></textarea>
</p>
```

Bạn có thể dùng thuộc tính `maxLength` để lấy hoặc đặt giá trị thuộc tính `maxlength` của `<textarea>`:

```js
const textareaElement = document.querySelector("#comment");
console.log(`Element's maxLength: ${textareaElement.maxLength}`); // "Element's maxlength: 200"
textareaElement.maxLength = 220; // updates the element's maxlength attribute value
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTextAreaElement.value")}}
- {{domxref("HTMLTextAreaElement.minLength")}}
- {{domxref("ValidityState.tooLong")}}
