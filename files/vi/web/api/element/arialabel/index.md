---
title: "Element: thuộc tính ariaLabel"
short-title: ariaLabel
slug: Web/API/Element/ariaLabel
page-type: web-api-instance-property
browser-compat: api.Element.ariaLabel
---

{{APIRef("DOM")}}

Thuộc tính **`ariaLabel`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label), định nghĩa một giá trị chuỗi gắn nhãn cho phần tử hiện tại.

## Giá trị

Một chuỗi hoặc `null`.

## Ví dụ

Trong ví dụ này, thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) trên phần tử có ID `close-button` được đặt thành "Close". Sử dụng `ariaLabel` chúng ta cập nhật giá trị thành "Close dialog".

```html
<button aria-label="Close" id="close-button">X</button>
```

```js
let el = document.getElementById("close-button");
console.log(el.ariaLabel); // "Close"
el.ariaLabel = "Close dialog";
console.log(el.ariaLabel); // "Close dialog"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
