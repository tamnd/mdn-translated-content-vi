---
title: "Element: thuộc tính ariaMultiLine"
short-title: ariaMultiLine
slug: Web/API/Element/ariaMultiLine
page-type: web-api-instance-property
browser-compat: api.Element.ariaMultiLine
---

{{APIRef("DOM")}}

Thuộc tính **`ariaMultiLine`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-multiline`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiline), cho biết liệu một hộp văn bản có chấp nhận nhiều dòng đầu vào hay chỉ một dòng duy nhất.

> [!NOTE]
> Khi có thể, hãy sử dụng phần tử HTML {{htmlelement("input")}} với `type="text"` hoặc {{htmlelement("textarea")}} vì chúng có ngữ nghĩa tích hợp sẵn và không yêu cầu thuộc tính ARIA.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Đây là hộp văn bản nhiều dòng.
- `"false"`
  - : Đây là hộp văn bản một dòng.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-multiline` trên phần tử có ID `txtBoxInput` được đặt thành "true" cho biết hộp này cho phép nhập nhiều dòng. Sử dụng `ariaMultiLine` chúng ta cập nhật giá trị thành "false".

```html
<div id="txtboxMultilineLabel">Enter the tags for the article</div>
<div
  role="textbox"
  id="txtBoxInput"
  contenteditable="true"
  aria-multiline="true"
  aria-labelledby="txtboxMultilineLabel"
  aria-required="true"></div>
```

```js
let el = document.getElementById("txtBoxInput");
console.log(el.ariaMultiLine); // "true"
el.ariaMultiLine = "false";
console.log(el.ariaMultiLine); // "false"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò textbox](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
