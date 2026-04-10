---
title: "DocumentFragment: thuộc tính children"
short-title: children
slug: Web/API/DocumentFragment/children
page-type: web-api-instance-property
browser-compat: api.DocumentFragment.children
---

{{ APIRef("DOM") }}

Thuộc tính chỉ đọc **`children`** trả về một {{domxref("HTMLCollection")}} động
chứa tất cả {{domxref("Element", "phần tử")}} con của document fragment mà nó được gọi trên đó.

## Giá trị

Một {{domxref("HTMLCollection")}} là một tập hợp động, có thứ tự của các phần tử DOM là con của document fragment. Bạn có thể truy cập các nút con riêng lẻ trong tập hợp bằng phương thức {{domxref("HTMLCollection.item()", "item()")}} của tập hợp, hoặc bằng ký pháp kiểu mảng của JavaScript.

Nếu document fragment không có phần tử con nào, thì `children` là một danh sách rỗng với `length` bằng `0`.

## Ví dụ

```js
let fragment = new DocumentFragment();
fragment.children; // HTMLCollection []

let paragraph = document.createElement("p");
fragment.appendChild(paragraph);

fragment.children; // HTMLCollection [<p>]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Node.childNodes")}}
