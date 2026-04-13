---
title: "Element: thuộc tính ariaReadOnly"
short-title: ariaReadOnly
slug: Web/API/Element/ariaReadOnly
page-type: web-api-instance-property
browser-compat: api.Element.ariaReadOnly
---

{{APIRef("DOM")}}

Thuộc tính **`ariaReadOnly`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-readonly`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly), cho biết phần tử không thể chỉnh sửa, nhưng vẫn có thể hoạt động khác.

> [!NOTE]
> Khi có thể, hãy sử dụng phần tử HTML {{htmlelement("input")}} với `type="text"` hoặc {{htmlelement("textarea")}} vì chúng có ngữ nghĩa tích hợp sẵn và không yêu cầu thuộc tính ARIA.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Người dùng không thể thay đổi giá trị của phần tử.
- `"false"`
  - : Người dùng có thể thiết lập giá trị của phần tử.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-readonly` trên phần tử có ID `txtBoxInput` được đặt thành "true" cho biết đầu vào này hiện chỉ ở chế độ đọc. Sử dụng `ariaReadOnly` chúng ta cập nhật giá trị thành "false".

```html
<div id="txtboxMultilineLabel">Enter the tags for the article</div>
<div
  role="textbox"
  id="txtBoxInput"
  contenteditable="true"
  aria-multiline="true"
  aria-labelledby="txtboxMultilineLabel"
  aria-readonly="true"></div>
```

```js
let el = document.getElementById("txtBoxInput");
console.log(el.ariaReadOnly); // "true"
el.ariaReadOnly = "false";
console.log(el.ariaReadOnly); // "false"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò textbox](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
