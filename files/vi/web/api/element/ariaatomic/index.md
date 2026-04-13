---
title: "Element: thuộc tính ariaAtomic"
short-title: ariaAtomic
slug: Web/API/Element/ariaAtomic
page-type: web-api-instance-property
browser-compat: api.Element.ariaAtomic
---

{{APIRef("DOM")}}

Thuộc tính **`ariaAtomic`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic), cho biết liệu công nghệ hỗ trợ sẽ hiển thị toàn bộ hoặc chỉ các phần của vùng đã thay đổi dựa trên các thông báo thay đổi được định nghĩa bởi thuộc tính [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"false"`
  - : Công nghệ hỗ trợ sẽ chỉ trình bày nút hoặc các nút đã thay đổi.
- `"true"`
  - : Công nghệ hỗ trợ sẽ trình bày toàn bộ vùng đã thay đổi như một khối, bao gồm nhãn do tác giả định nghĩa nếu có.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-atomic` trên phần tử có ID `"clock"` được đặt thành "true". Sử dụng `ariaAtomic` chúng ta cập nhật giá trị thành "false".

```html
<div id="clock" role="timer" aria-live="polite" aria-atomic="true"></div>
```

```js
let el = document.getElementById("clock");
console.log(el.ariaAtomic); // true
el.ariaAtomic = "false";
console.log(el.ariaAtomic); // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
