---
title: "Element: thuộc tính ariaHidden"
short-title: ariaHidden
slug: Web/API/Element/ariaHidden
page-type: web-api-instance-property
browser-compat: api.Element.ariaHidden
---

{{APIRef("DOM")}}

Thuộc tính **`ariaHidden`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-hidden`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden)), cho biết liệu phần tử có được hiển thị với API hỗ trợ tiếp cận hay không.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử bị ẩn khỏi API hỗ trợ tiếp cận.
- `"false"`
  - : Phần tử được hiển thị với API hỗ trợ tiếp cận như thể nó được kết xuất.
- `"undefined"`
  - : Trạng thái ẩn của phần tử được xác định bởi user agent dựa trên việc nó có được kết xuất hay không.

## Ví dụ

Trong ví dụ này, thuộc tính [`aria-hidden`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden) trên phần tử có ID `hidden` được đặt thành "true". Sử dụng `ariaHidden` chúng ta cập nhật giá trị thành "false".

```html
<div id="hidden" aria-hidden="true">Some things are better left unsaid.</div>
```

```js
let el = document.getElementById("hidden");
console.log(el.ariaHidden); // true
el.ariaHidden = "false";
console.log(el.ariaHidden); // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
