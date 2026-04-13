---
title: "HTMLTextAreaElement: minLength property"
short-title: minLength
slug: Web/API/HTMLTextAreaElement/minLength
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.minLength
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`minLength`** của giao diện {{domxref("HTMLTextAreaElement")}} cho biết số ký tự tối thiểu (tính theo {{glossary("UTF-16", "UTF-16 code units")}}) cần có để giá trị của phần tử {{HTMLElement("textarea")}} hợp lệ. Nó phản ánh thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Elements/textarea#minlength) của phần tử. `-1` có nghĩa là không có yêu cầu độ dài tối thiểu.

> [!NOTE]
> Nếu textarea có giá trị và giá trị đó có ít ký tự hơn mức thuộc tính `minlength` yêu cầu, phần tử được coi là không hợp lệ và thuộc tính {{domxref("ValidityState")}} của {{domxref("ValidityState.tooShort", "tooShort")}} sẽ là `true`.

## Giá trị

Một số đại diện cho `minlength` của phần tử nếu có, hoặc `-1`.

## Ví dụ

Với HTML sau:

```html
<p>
  <label for="comment">Comment</label>
  <textarea id="comment" minlength="10" maxlength="200"></textarea>
</p>
```

Bạn có thể dùng thuộc tính `minLength` để lấy hoặc đặt giá trị thuộc tính `minlength` của `<textarea>`:

```js
const textareaElement = document.querySelector("#comment");
console.log(`Element's minLength: ${textareaElement.minLength}`); // "Element's minlength: 10"
textareaElement.minLength = 5; // updates the element's minlength attribute value
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTextAreaElement.value")}}
- {{domxref("HTMLTextAreaElement.maxLength")}}
- {{domxref("ValidityState.tooShort")}}
