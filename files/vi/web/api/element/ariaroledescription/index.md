---
title: "Element: thuộc tính ariaRoleDescription"
short-title: ariaRoleDescription
slug: Web/API/Element/ariaRoleDescription
page-type: web-api-instance-property
browser-compat: api.Element.ariaRoleDescription
---

{{APIRef("DOM")}}

Thuộc tính **`ariaRoleDescription`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-roledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-roledescription), định nghĩa một mô tả do tác giả bản địa hóa, dễ đọc cho con người về vai trò của một phần tử.

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-roledescription` trên phần tử có ID `myApplication` đã được thiết lập. Sử dụng `ariaRoleDescription` chúng ta có thể cập nhật giá trị.

```html
<div
  id="myApplication"
  role="application"
  aria-roledescription="a description of this widget">
  …
</div>
```

```js
let el = document.getElementById("myApplication");
console.log(el.ariaRoleDescription); // "a description of this widget"
el.ariaRoleDescription = "an updated description of this widget";
console.log(el.ariaRoleDescription); // "an updated description of this widget"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò application](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role)
