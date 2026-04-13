---
title: "DocumentFragment: thuộc tính firstElementChild"
short-title: firstElementChild
slug: Web/API/DocumentFragment/firstElementChild
page-type: web-api-instance-property
browser-compat: api.DocumentFragment.firstElementChild
---

{{ APIRef("DOM") }}

Thuộc tính chỉ đọc **`DocumentFragment.firstElementChild`** trả về {{domxref("Element")}} con đầu tiên của phân đoạn tài liệu, hoặc `null` nếu không có phần tử con nào.

## Giá trị

Một {{domxref("Element")}} là phần tử `Element` con đầu tiên của đối tượng, hoặc `null` nếu không có phần tử nào.

## Ví dụ

```js
let fragment = new DocumentFragment();
fragment.firstElementChild; // null

let paragraph = document.createElement("p");
fragment.appendChild(paragraph);

fragment.firstElementChild; // <p>
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.firstElementChild")}}
