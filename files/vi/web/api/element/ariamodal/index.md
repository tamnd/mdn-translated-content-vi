---
title: "Element: thuộc tính ariaModal"
short-title: ariaModal
slug: Web/API/Element/ariaModal
page-type: web-api-instance-property
browser-compat: api.Element.ariaModal
---

{{APIRef("DOM")}}

Thuộc tính **`ariaModal`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính `aria-modal`, cho biết liệu một phần tử có ở chế độ modal khi được hiển thị. Việc áp dụng thuộc tính `aria-modal` cho một phần tử có `role="dialog"` thay thế kỹ thuật sử dụng aria-hidden trên nền để thông báo cho công nghệ hỗ trợ rằng nội dung bên ngoài dialog không hoạt động.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử ở chế độ modal.
- `"false"`
  - : Phần tử không ở chế độ modal.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-modal` trên phần tử có ID `address-modal` được đặt thành "true" cho biết đây là một dialog modal. Sử dụng `ariaModal` chúng ta cập nhật giá trị thành "false".

```html
<div
  role="dialog"
  id="address-modal"
  aria-labelledby="dialog1Title"
  aria-describedby="dialog1Desc"
  aria-modal="true"></div>
```

```js
let el = document.getElementById("address-modal");
console.log(el.ariaModal); // "true"
el.ariaModal = "false";
console.log(el.ariaModal); // "false"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò dialog](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role)
