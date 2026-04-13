---
title: "Element: thuộc tính ariaValueNow"
short-title: ariaValueNow
slug: Web/API/Element/ariaValueNow
page-type: web-api-instance-property
browser-compat: api.Element.ariaValueNow
---

{{APIRef("DOM")}}

Thuộc tính **`ariaValueNow`** của giao diện {{domxref("Element")}} phản ánh giá trị của thuộc tính [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow), định nghĩa giá trị hiện tại cho một widget khoảng.

## Giá trị

Một chuỗi chứa một số.

## Ví dụ

Trong ví dụ này, thuộc tính [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow) trên phần tử có ID là `slider` được đặt là "1". Sử dụng `ariaValueNow`, chúng ta cập nhật giá trị thành "2".

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
console.log(el.ariaValueNow); // "1"
el.ariaValueNow = "2";
console.log(el.ariaValueNow); // "2"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- [ARIA: vai trò slider](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
