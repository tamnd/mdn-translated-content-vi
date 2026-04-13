---
title: "TreeWalker: phương thức previousSibling()"
short-title: previousSibling()
slug: Web/API/TreeWalker/previousSibling
page-type: web-api-instance-method
browser-compat: api.TreeWalker.previousSibling
---

{{ APIRef("DOM") }}

Phương thức **`TreeWalker.previousSibling()`** di chuyển {{domxref("Node")}} hiện tại đến nút anh em trước đó của nó, nếu có, và trả về nút anh em tìm được. Nếu không có nút như vậy, phương thức trả về `null` và nút hiện tại không thay đổi.

## Cú pháp

```js-nolint
previousSibling()
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
const node = treeWalker.previousSibling(); // trả về null nếu nút con đầu tiên của phần tử gốc không có anh em trước
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("TreeWalker")}} mà nó thuộc về.
