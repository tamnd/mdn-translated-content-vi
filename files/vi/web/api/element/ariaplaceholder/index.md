---
title: "Element: thuộc tính ariaPlaceholder"
short-title: ariaPlaceholder
slug: Web/API/Element/ariaPlaceholder
page-type: web-api-instance-property
browser-compat: api.Element.ariaPlaceholder
---

{{APIRef("DOM")}}

Thuộc tính **`ariaPlaceholder`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính `aria-placeholder`, định nghĩa một gợi ý ngắn nhằm hỗ trợ người dùng nhập liệu khi điều khiển không có giá trị.

> [!NOTE]
> Khi có thể, hãy sử dụng phần tử HTML {{htmlelement("input")}} với `type="text"` hoặc {{htmlelement("textarea")}} vì chúng có ngữ nghĩa tích hợp sẵn và không yêu cầu thuộc tính ARIA.

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-placeholder` trên phần tử có ID `txtBoxInput` đã được đặt thành một chuỗi. Sử dụng `ariaPlaceholder` chúng ta cập nhật chuỗi thành một giá trị khác.

```html
<div id="txtboxLabel">Enter your five-digit zip code</div>
<div
  role="textbox"
  id="txtBoxInput"
  contenteditable="true"
  aria-placeholder="5-digit zip code"
  aria-labelledby="txtboxLabel"></div>
```

```js
let el = document.getElementById("txtBoxInput");
console.log(el.ariaPlaceholder); // "5-digit zip code"
el.ariaPlaceholder = "12345";
console.log(el.ariaPlaceholder); // "12345"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò textbox](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
