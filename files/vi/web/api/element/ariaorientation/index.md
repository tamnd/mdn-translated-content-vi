---
title: "Element: thuộc tính ariaOrientation"
short-title: ariaOrientation
slug: Web/API/Element/ariaOrientation
page-type: web-api-instance-property
browser-compat: api.Element.ariaOrientation
---

{{APIRef("DOM")}}

Thuộc tính **`ariaOrientation`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation), cho biết liệu hướng của phần tử là ngang, dọc hay không rõ ràng/có thể gây nhầm lẫn.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"horizontal"`
  - : Phần tử có hướng ngang.
- `"vertical"`
  - : Phần tử có hướng dọc.
- `"undefined"`
  - : Hướng của phần tử không rõ.

## Ví dụ

Trong ví dụ này, thuộc tính [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation) trên phần tử có ID `handle_zoomSlider` được đặt thành `"vertical"`. Sử dụng `ariaOrientation` chúng ta cập nhật giá trị thành `"horizontal"`.

```html
<div
  id="handle_zoomSlider"
  role="slider"
  aria-orientation="vertical"
  aria-valuemin="0"
  aria-valuemax="17"
  aria-valuenow="14"
  tabindex="0">
  <span>11</span>
</div>
```

```js
let el = document.getElementById("handle_zoomSlider");
console.log(el.ariaOrientation); // "vertical"
el.ariaOrientation = "horizontal";
console.log(el.ariaOrientation); // "horizontal"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
