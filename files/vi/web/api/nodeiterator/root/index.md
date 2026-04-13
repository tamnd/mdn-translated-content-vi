---
title: "NodeIterator: thuộc tính root"
short-title: root
slug: Web/API/NodeIterator/root
page-type: web-api-instance-property
browser-compat: api.NodeIterator.root
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`NodeIterator.root`** đại diện cho {{domxref("Node")}} là gốc của phần mà {{domxref("NodeIterator")}} duyệt qua.

## Giá trị

Một {{domxref("Node")}}.

## Ví dụ

```js
const nodeIterator = document.createNodeIterator(
  document.body,
  NodeFilter.SHOW_ELEMENT,
  {
    acceptNode(node) {
      return NodeFilter.FILTER_ACCEPT;
    },
  },
);
root = nodeIterator.root; // trong trường hợp này là document.body
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện mà nó thuộc về: {{domxref("NodeIterator")}}.
