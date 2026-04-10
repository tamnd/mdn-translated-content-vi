---
title: "Element: thuộc tính ariaPosInSet"
short-title: ariaPosInSet
slug: Web/API/Element/ariaPosInSet
page-type: web-api-instance-property
browser-compat: api.Element.ariaPosInSet
---

{{APIRef("DOM")}}

Thuộc tính **`ariaPosInSet`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset), định nghĩa số hoặc vị trí của phần tử trong tập hợp listitems hoặc treeitems hiện tại.

## Giá trị

Một chuỗi chứa một số nguyên.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-posinset` trên phần tử có ID `article2` được đặt thành "2". Sử dụng `ariaPosInSet` chúng ta cập nhật giá trị thành "3".

```html
<article id="article1" aria-posinset="1">…</article>
<article id="article2" aria-posinset="2">…</article>
```

```js
let el = document.getElementById("article2");
console.log(el.ariaPosInSet); // "2"
el.ariaPosInSet = "3";
console.log(el.ariaPosInSet); // "3"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
