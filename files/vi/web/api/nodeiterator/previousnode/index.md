---
title: "NodeIterator: phương thức previousNode()"
short-title: previousNode()
slug: Web/API/NodeIterator/previousNode
page-type: web-api-instance-method
browser-compat: api.NodeIterator.previousNode
---

{{APIRef("DOM")}}

Phương thức **`NodeIterator.previousNode()`** trả về nút trước đó trong tập hợp được biểu diễn bởi {{domxref("NodeIterator")}} và di chuyển vị trí của bộ lặp lùi lại trong tập hợp đó.

Phương thức này trả về `null` khi nút hiện tại là nút đầu tiên trong tập hợp.

Trong các trình duyệt cũ, theo các bản đặc tả cũ, phương thức này có thể ném ngoại lệ `INVALID_STATE_ERR` {{domxref("DOMException")}} nếu được gọi sau phương thức {{domxref("NodeIterator.detach()")}}. Các trình duyệt hiện đại không bao giờ ném ngoại lệ này.

## Cú pháp

```js-nolint
previousNode()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("Node")}} đại diện cho nút trước nút hiện tại trong tập hợp được biểu diễn bởi `NodeIterator` này, hoặc `null` nếu nút hiện tại là nút đầu tiên trong tập hợp.

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
currentNode = nodeIterator.nextNode(); // trả về nút tiếp theo
previousNode = nodeIterator.previousNode(); // kết quả tương tự, vì đã quay lui về nút trước đó
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện mà nó thuộc về: {{domxref("NodeIterator")}}.
