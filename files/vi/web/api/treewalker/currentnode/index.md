---
title: "TreeWalker: thuộc tính currentNode"
short-title: currentNode
slug: Web/API/TreeWalker/currentNode
page-type: web-api-instance-property
browser-compat: api.TreeWalker.currentNode
---

{{ APIRef("DOM") }}

Thuộc tính **`TreeWalker.currentNode`** đại diện cho {{domxref("Node")}} mà {{domxref("TreeWalker")}} hiện đang trỏ tới.

## Giá trị

Một {{domxref("Node")}}.

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
);
root = treeWalker.currentNode; // phần tử gốc, vì đó là phần tử đầu tiên!
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("TreeWalker")}}.
