---
title: "Element: thuộc tính ariaRequired"
short-title: ariaRequired
slug: Web/API/Element/ariaRequired
page-type: web-api-instance-property
browser-compat: api.Element.ariaRequired
---

{{APIRef("DOM")}}

Thuộc tính **`ariaRequired`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính `aria-required`, cho biết người dùng cần nhập liệu vào phần tử trước khi biểu mẫu có thể được gửi.

> [!NOTE]
> Khi có thể, hãy sử dụng phần tử HTML {{htmlelement("input")}} với `type="text"` hoặc {{htmlelement("textarea")}} vì chúng có ngữ nghĩa tích hợp sẵn và không yêu cầu thuộc tính ARIA.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Người dùng cần cung cấp đầu vào trên một phần tử trước khi biểu mẫu được gửi.
- `"false"`
  - : Đầu vào của người dùng không cần thiết để gửi biểu mẫu.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-required` trên phần tử có ID `txtBoxInput` được đặt thành "true" cho biết đầu vào này phải được hoàn thành. Sử dụng `ariaRequired` chúng ta cập nhật giá trị thành "false".

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
console.log(el.ariaRequired); // "true"
el.ariaRequired = "false";
console.log(el.ariaRequired); // "false"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò textbox](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
