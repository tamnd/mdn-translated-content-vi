---
title: "Element: thuộc tính ariaDescription"
short-title: ariaDescription
slug: Web/API/Element/ariaDescription
page-type: web-api-instance-property
browser-compat: api.Element.ariaDescription
---

{{APIRef("DOM")}}

Thuộc tính **`ariaDescription`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-description`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-description), định nghĩa một giá trị chuỗi mô tả hoặc chú thích phần tử hiện tại.

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-description` trên phần tử có ID `close-button` được đặt thành chuỗi "A longer description of the function of this element". Sử dụng `ariaDescription` chúng ta có thể cập nhật giá trị.

```html
<button
  aria-label="Close"
  aria-description="A longer description of the function of this element"
  id="close-button">
  X
</button>
```

```js
let el = document.getElementById("close-button");
console.log(el.ariaDescription); // "A longer description of the function of this element"
el.ariaDescription = "A different description";
console.log(el.ariaDescription); // "A different description"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
