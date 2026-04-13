---
title: "DocumentFragment: thuộc tính lastElementChild"
short-title: lastElementChild
slug: Web/API/DocumentFragment/lastElementChild
page-type: web-api-instance-property
browser-compat: api.DocumentFragment.lastElementChild
---

{{ APIRef("DOM") }}

Thuộc tính chỉ đọc **`DocumentFragment.lastElementChild`** trả về phần tử {{domxref("Element")}} con cuối cùng của phân đoạn tài liệu, hoặc `null` nếu không có phần tử con nào.

## Giá trị

Một {{domxref("Element")}} là phần tử `Element` con cuối cùng của đối tượng, hoặc `null` nếu không có phần tử nào.

## Ví dụ

```js
let fragment = new DocumentFragment();
fragment.lastElementChild; // null

let paragraph = document.createElement("p");
fragment.appendChild(paragraph);

fragment.lastElementChild; // <p>
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.lastElementChild")}}
