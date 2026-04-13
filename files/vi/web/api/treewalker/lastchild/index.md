---
title: "TreeWalker: phương thức lastChild()"
short-title: lastChild()
slug: Web/API/TreeWalker/lastChild
page-type: web-api-instance-method
browser-compat: api.TreeWalker.lastChild
---

{{ APIRef("DOM") }}

Phương thức **`TreeWalker.lastChild()`** di chuyển {{domxref("Node")}} hiện tại đến nút con _có thể thấy_ cuối cùng của nút hiện tại, và trả về nút con tìm được. Nếu không có nút con như vậy, phương thức trả về `null` và nút hiện tại không thay đổi.

## Cú pháp

```js-nolint
lastChild()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("Node")}} hoặc `null`.

## Ví dụ

```js
const treeWalker = document.createTreeWalker(
  document.body,
  NodeFilter.SHOW_ELEMENT,
  {
    acceptNode(node) {
      return NodeFilter.FILTER_ACCEPT;
    },
  },
  false,
);
const node = treeWalker.lastChild(); // trả về nút con có thể thấy cuối cùng của phần tử gốc
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("TreeWalker")}} mà nó thuộc về.
