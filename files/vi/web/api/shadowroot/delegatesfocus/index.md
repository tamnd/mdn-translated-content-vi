---
title: "ShadowRoot: thuộc tính delegatesFocus"
short-title: delegatesFocus
slug: Web/API/ShadowRoot/delegatesFocus
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.delegatesFocus
---

{{APIRef("Shadow DOM")}}

Thuộc tính chỉ đọc **`delegatesFocus`** của giao diện {{domxref("ShadowRoot")}} trả về `true` nếu shadow root ủy quyền tiêu điểm, và `false` nếu không.

Nếu là `true`, khi một phần không thể nhận focus của shadow DOM được nhấp vào, hoặc khi `.focus()` được gọi trên phần tử host, phần đầu tiên có thể focus bên trong shadow DOM của host sẽ nhận focus, và shadow host sẽ nhận bất kỳ kiểu `:focus` khả dụng nào.

Tiêu điểm đặc biệt quan trọng đối với người dùng bàn phím, bao gồm cả người dùng trình đọc màn hình. Hành vi mặc định của `delegatesFocus` là focus vào phần tử đầu tiên có thể focus, điều này có thể không mong muốn nếu phần tử đó không nên nằm trong thứ tự tab (ví dụ, phần tử có `tabindex="-1"`), hoặc nếu một phần tử có thể focus "quan trọng hơn" nên nhận focus ban đầu (chẳng hạn trường nhập văn bản đầu tiên thay vì nút "close" đứng trước nó). Trong những trường hợp như vậy, thuộc tính `autofocus` có thể được chỉ định trên phần tử nên nhận focus ban đầu. Hãy dùng `autofocus` một cách thận trọng vì nó có thể gây ra các vấn đề về khả năng truy cập, chẳng hạn như bỏ qua nội dung quan trọng mà người dùng có thể không chú ý do focus được đặt vào một phần tử ở sau trong thứ tự DOM.

Giá trị của thuộc tính ban đầu được đặt bằng thuộc tính `delegatesFocus` của đối tượng được truyền vào {{domxref("Element.attachShadow()")}}, hoặc bằng thuộc tính [`shadowrootdelegatesfocus`](/en-US/docs/Web/HTML/Reference/Elements/template#shadowrootclonable) của phần tử [`<template>`](/en-US/docs/Web/HTML/Reference/Elements/template) khi shadow root được tạo theo kiểu khai báo.

## Giá trị

`true` nếu shadow root ủy quyền tiêu điểm, và `false` nếu không.

## Ví dụ

```js
const customElem = document.querySelector("my-shadow-dom-element");
const shadow = customElem.shadowRoot;

// …

// Nó có ủy quyền tiêu điểm không?
const hostElem = shadow.delegatesFocus;
```

Ví dụ [Declarative Shadow DOM with delegated focus](/en-US/docs/Web/HTML/Reference/Elements/template#declarative_shadow_dom_with_delegated_focus) trong tài liệu `<template>` minh họa tác động của việc ủy quyền tiêu điểm.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
