---
title: "TreeWalker: phương thức firstChild()"
short-title: firstChild()
slug: Web/API/TreeWalker/firstChild
page-type: web-api-instance-method
browser-compat: api.TreeWalker.firstChild
---

{{ APIRef("DOM") }}

Phương thức **`TreeWalker.firstChild()`** di chuyển {{domxref("Node")}} hiện tại đến nút con _có thể thấy_ đầu tiên của nút hiện tại, và trả về nút con tìm được. Nếu không có nút con như vậy, phương thức trả về `null` và nút hiện tại không thay đổi.

## Cú pháp

```js-nolint
firstChild()
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
const node = treeWalker.firstChild(); // trả về nút con đầu tiên của phần tử gốc, hoặc null nếu không có
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("TreeWalker")}} mà nó thuộc về.
