---
title: "DocumentFragment: thuộc tính children"
short-title: children
slug: Web/API/DocumentFragment/children
page-type: web-api-instance-property
browser-compat: api.DocumentFragment.children
---

{{ APIRef("DOM") }}

Thuộc tính chỉ đọc **`children`** trả về một {{domxref("HTMLCollection")}} trực tiếp chứa tất cả các {{domxref("Element","phần tử")}} con của phân đoạn tài liệu mà nó được gọi.

## Giá trị

Một {{ domxref("HTMLCollection") }} là một tập hợp trực tiếp, có thứ tự của các phần tử DOM là con của phân đoạn tài liệu. Bạn có thể truy cập các phần tử con riêng lẻ trong tập hợp bằng cách sử dụng phương thức {{domxref("HTMLCollection.item()", "item()")}} trên tập hợp, hoặc bằng cách sử dụng ký hiệu kiểu mảng JavaScript.

Nếu phân đoạn tài liệu không có phần tử con nào, thì `children` là một danh sách rỗng với `length` bằng `0`.

## Ví dụ

```js
let fragment = new DocumentFragment();
fragment.children; // HTMLCollection []

let paragraph = document.createElement("p");
fragment.appendChild(paragraph);

fragment.children; // HTMLCollection [<p>]
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Node.childNodes")}}
