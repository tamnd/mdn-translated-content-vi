---
title: "TreeWalker: phương thức nextNode()"
short-title: nextNode()
slug: Web/API/TreeWalker/nextNode
page-type: web-api-instance-method
browser-compat: api.TreeWalker.nextNode
---

{{ APIRef("DOM") }}

Phương thức **`TreeWalker.nextNode()`** di chuyển {{domxref("Node")}} hiện tại đến nút _có thể thấy_ tiếp theo theo thứ tự tài liệu, và trả về nút tìm được. Nếu không có nút như vậy, phương thức trả về `null` và nút hiện tại không thay đổi.

## Cú pháp

```js-nolint
nextNode()
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
const node = treeWalker.nextNode(); // trả về nút con đầu tiên của gốc, vì đó là nút tiếp theo theo thứ tự tài liệu
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("TreeWalker")}} mà nó thuộc về.
