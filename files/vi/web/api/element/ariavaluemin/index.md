---
title: "Element: thuộc tính ariaValueMin"
short-title: ariaValueMin
slug: Web/API/Element/ariaValueMin
page-type: web-api-instance-property
browser-compat: api.Element.ariaValueMin
---

{{APIRef("DOM")}}

Thuộc tính **`ariaValueMin`** của giao diện {{domxref("Element")}} phản ánh giá trị của thuộc tính [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin), định nghĩa giá trị tối thiểu cho phép cho một widget khoảng.

## Giá trị

Một chuỗi chứa một số.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-valuemin` trên phần tử có ID là `slider` được đặt là "1". Sử dụng `ariaValueMin`, chúng ta cập nhật giá trị thành "2".

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
console.log(el.ariaValueMin); // "1"
el.ariaValueMin = "2";
console.log(el.ariaValueMin); // "2"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- [ARIA: vai trò slider](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
