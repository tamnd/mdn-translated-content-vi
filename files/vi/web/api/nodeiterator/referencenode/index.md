---
title: "NodeIterator: thuộc tính referenceNode"
short-title: referenceNode
slug: Web/API/NodeIterator/referenceNode
page-type: web-api-instance-property
browser-compat: api.NodeIterator.referenceNode
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`NodeIterator.referenceNode`** trả về {{domxref("Node")}} mà bộ lặp đang bám vào; khi các nút mới được chèn vào, bộ lặp vẫn tiếp tục bám vào nút tham chiếu như được chỉ định bởi thuộc tính này.

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
node = nodeIterator.referenceNode;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện mà nó thuộc về: {{domxref("NodeIterator")}}
