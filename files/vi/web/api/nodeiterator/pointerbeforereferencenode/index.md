---
title: "NodeIterator: thuộc tính pointerBeforeReferenceNode"
short-title: pointerBeforeReferenceNode
slug: Web/API/NodeIterator/pointerBeforeReferenceNode
page-type: web-api-instance-property
browser-compat: api.NodeIterator.pointerBeforeReferenceNode
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`NodeIterator.pointerBeforeReferenceNode`** trả về một cờ boolean cho biết `NodeIterator` đang bám trước (nếu giá trị này là `true`) hay sau (nếu giá trị này là `false`) nút neo được chỉ ra bởi thuộc tính {{domxref("NodeIterator.referenceNode")}}.

## Giá trị

Một giá trị boolean.

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
flag = nodeIterator.pointerBeforeReferenceNode;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện mà nó thuộc về: {{domxref("NodeIterator")}}
