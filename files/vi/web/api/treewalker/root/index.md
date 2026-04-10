---
title: "TreeWalker: thuộc tính root"
short-title: root
slug: Web/API/TreeWalker/root
page-type: web-api-instance-property
browser-compat: api.TreeWalker.root
---

{{ APIRef("DOM") }}

Thuộc tính chỉ đọc **`TreeWalker.root`** trả về {{domxref("Node")}} gốc mà {{domxref("TreeWalker")}} duyệt qua.

## Giá trị

Một đối tượng {{domxref("Node")}}.

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
root = treeWalker.root; // trong trường hợp này là document.body
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("TreeWalker")}}.
