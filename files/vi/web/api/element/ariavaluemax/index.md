---
title: "Element: thuộc tính ariaValueMax"
short-title: ariaValueMax
slug: Web/API/Element/ariaValueMax
page-type: web-api-instance-property
browser-compat: api.Element.ariaValueMax
---

{{APIRef("DOM")}}

Thuộc tính **`ariaValueMax`** của giao diện {{domxref("Element")}} phản ánh giá trị của thuộc tính [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax), định nghĩa giá trị tối đa cho phép cho một widget khoảng.

## Giá trị

Một chuỗi chứa một số.

## Ví dụ

Trong ví dụ này, thuộc tính [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax) trên phần tử có ID là `slider` được đặt là "7". Sử dụng `ariaValueMax`, chúng ta cập nhật giá trị thành "6".

```html
<div
  role="slider"
  aria-valuenow="1"
  aria-valuemin="1"
  aria-valuemax="7"
  aria-valuetext="Sunday"></div>
```

```js
let el = document.getElementById("slider");
console.log(el.ariaValueMax); // "7"
el.ariaValueMax = "6";
console.log(el.ariaValueMax); // "6"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- [ARIA: vai trò slider](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
