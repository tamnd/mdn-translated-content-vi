---
title: "Element: thuộc tính ariaLevel"
short-title: ariaLevel
slug: Web/API/Element/ariaLevel
page-type: web-api-instance-property
browser-compat: api.Element.ariaLevel
---

{{APIRef("DOM")}}

Thuộc tính **`ariaLevel`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính `aria-level`, định nghĩa cấp bậc phân cấp của một phần tử trong cấu trúc.

> [!NOTE]
> Khi có thể, hãy sử dụng phần tử HTML {{htmlelement("Heading_Elements", "h1")}} hoặc các cấp tiêu đề đúng khác vì chúng có ngữ nghĩa tích hợp sẵn và không yêu cầu thuộc tính ARIA.

## Giá trị

Một chuỗi chứa một số nguyên.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-level` trên phần tử có ID `main-heading` được đặt thành "1". Sử dụng `ariaLevel` chúng ta cập nhật giá trị thành "2".

```html
<div role="heading" id="main-heading" aria-level="1">
  This is a main page heading
</div>
```

```js
let el = document.getElementById("main-heading");
console.log(el.ariaLevel); // "1"
el.ariaLevel = "2";
console.log(el.ariaLevel); // "2"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò heading](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/heading_role)
