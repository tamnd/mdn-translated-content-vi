---
title: "Element: thuộc tính ariaValueText"
short-title: ariaValueText
slug: Web/API/Element/ariaValueText
page-type: web-api-instance-property
browser-compat: api.Element.ariaValueText
---

{{APIRef("DOM")}}

Thuộc tính **`ariaValueText`** của giao diện {{domxref("Element")}} phản ánh giá trị của thuộc tính [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext), định nghĩa văn bản thay thế dễ đọc cho con người của aria-valuenow cho một widget khoảng.

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-valuetext` trên phần tử có ID là `slider` được đặt là "Sunday" để cung cấp giá trị dễ đọc cho con người của khoảng. Sử dụng `ariaValueText`, chúng ta cập nhật giá trị thành "Monday".

```html
<div
  id="slider"
  role="slider"
  aria-valuenow="1"
  aria-valuemin="1"
  aria-valuemax="7"
  aria-valuetext="Sunday"></div>
```

```js
let el = document.getElementById("slider");
console.log(el.ariaValueText); // "Sunday"
el.ariaValueText = "Monday";
console.log(el.ariaValueText); // "Monday"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- [ARIA: vai trò slider](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
